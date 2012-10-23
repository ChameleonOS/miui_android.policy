// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.EventLog;
import android.util.Log;
import android.view.WindowManagerImpl;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewCallback, KeyguardUpdateMonitor, MiuiClassFactory, KeyguardViewManager, 
//            KeyguardViewProperties, PhoneWindowManager

public class KeyguardViewMediator
    implements KeyguardViewCallback, KeyguardUpdateMonitor.SimStateCallback {

    public KeyguardViewMediator(Context context, PhoneWindowManager phonewindowmanager, LocalPowerManager localpowermanager) {
        mSuppressNextLockSound = true;
        mExternallyEnabled = true;
        mNeedToReshowWhenReenabled = false;
        mShowing = false;
        mHidden = false;
        mScreenOn = false;
        mPhoneState = TelephonyManager.EXTRA_STATE_IDLE;
        mWaitingUntilKeyguardVisible = false;
        mInfoCallback = new KeyguardUpdateMonitor.InfoCallbackImpl() {

            public void onClockVisibilityChanged() {
                adjustStatusBarLocked();
            }

            public void onDeviceProvisioned() {
                mContext.sendBroadcast(mUserPresentIntent);
            }

            final KeyguardViewMediator this$0;

             {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        };
        mUserChangeReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                String s2 = intent.getAction();
                if(!"android.intent.action.USER_SWITCHED".equals(s2)) goto _L2; else goto _L1
_L1:
                onUserSwitched(intent.getIntExtra("android.intent.extra.user_id", 0));
_L4:
                return;
_L2:
                if("android.intent.action.USER_REMOVED".equals(s2))
                    onUserRemoved(intent.getIntExtra("android.intent.extra.user_id", 0));
                if(true) goto _L4; else goto _L3
_L3:
            }

            final KeyguardViewMediator this$0;

             {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        };
        mBroadCastReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                String s2;
                int i;
                s2 = intent.getAction();
                if(!s2.equals("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD"))
                    break MISSING_BLOCK_LABEL_74;
                i = intent.getIntExtra("seq", 0);
                KeyguardViewMediator keyguardviewmediator1 = KeyguardViewMediator.this;
                keyguardviewmediator1;
                JVM INSTR monitorenter ;
                if(mDelayedShowingSequence == i) {
                    mSuppressNextLockSound = true;
                    doKeyguardLocked();
                }
                break MISSING_BLOCK_LABEL_163;
                if(!"android.intent.action.PHONE_STATE".equals(s2))
                    break MISSING_BLOCK_LABEL_163;
                mPhoneState = intent.getStringExtra("state");
                KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                keyguardviewmediator;
                JVM INSTR monitorenter ;
                if(TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState) && !mScreenOn && mExternallyEnabled)
                    doKeyguardLocked();
            }

            final KeyguardViewMediator this$0;

             {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        };
        mHandler = new Handler() {

            public void handleMessage(Message message) {
                boolean flag1 = true;
                message.what;
                JVM INSTR tableswitch 1 13: default 72
            //                           1 73
            //                           2 87
            //                           3 97
            //                           4 107
            //                           5 117
            //                           6 127
            //                           7 137
            //                           8 154
            //                           9 168
            //                           10 195
            //                           11 205
            //                           12 216
            //                           13 243;
                   goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14
_L1:
                return;
_L2:
                handleTimeout(message.arg1);
                continue; /* Loop/switch isn't completed */
_L3:
                handleShow();
                continue; /* Loop/switch isn't completed */
_L4:
                handleHide();
                continue; /* Loop/switch isn't completed */
_L5:
                handleReset();
                continue; /* Loop/switch isn't completed */
_L6:
                handleVerifyUnlock();
                continue; /* Loop/switch isn't completed */
_L7:
                handleNotifyScreenOff();
                continue; /* Loop/switch isn't completed */
_L8:
                handleNotifyScreenOn((KeyguardViewManager.ShowListener)message.obj);
                continue; /* Loop/switch isn't completed */
_L9:
                handleWakeWhenReady(message.arg1);
                continue; /* Loop/switch isn't completed */
_L10:
                KeyguardViewMediator keyguardviewmediator2 = KeyguardViewMediator.this;
                if(message.arg1 == 0)
                    flag1 = false;
                keyguardviewmediator2.handleKeyguardDone(flag1);
                continue; /* Loop/switch isn't completed */
_L11:
                handleKeyguardDoneDrawing();
                continue; /* Loop/switch isn't completed */
_L12:
                keyguardDone(flag1);
                continue; /* Loop/switch isn't completed */
_L13:
                KeyguardViewMediator keyguardviewmediator1 = KeyguardViewMediator.this;
                if(message.arg1 == 0)
                    flag1 = false;
                keyguardviewmediator1.handleSetHidden(flag1);
                continue; /* Loop/switch isn't completed */
_L14:
                KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                keyguardviewmediator;
                JVM INSTR monitorenter ;
                doKeyguardLocked();
                if(true) goto _L1; else goto _L15
_L15:
            }

            final KeyguardViewMediator this$0;

             {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        };
        mContext = context;
        mRealPowerManager = localpowermanager;
        mPM = (PowerManager)context.getSystemService("power");
        mWakeLock = mPM.newWakeLock(0x1000001a, "keyguard");
        mWakeLock.setReferenceCounted(false);
        mShowKeyguardWakeLock = mPM.newWakeLock(1, "show keyguard");
        mShowKeyguardWakeLock.setReferenceCounted(false);
        mWakeAndHandOff = mPM.newWakeLock(1, "keyguardWakeAndHandOff");
        mWakeAndHandOff.setReferenceCounted(false);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD");
        intentfilter.addAction("android.intent.action.PHONE_STATE");
        context.registerReceiver(mBroadCastReceiver, intentfilter);
        mAlarmManager = (AlarmManager)context.getSystemService("alarm");
        mCallback = phonewindowmanager;
        mUpdateMonitor = new KeyguardUpdateMonitor(context);
        mUpdateMonitor.registerInfoCallback(mInfoCallback);
        mUpdateMonitor.registerSimStateCallback(this);
        mLockPatternUtils = new LockPatternUtils(mContext);
        mKeyguardViewProperties = MiuiClassFactory.createKeyguardViewProperties(mLockPatternUtils, mUpdateMonitor);
        mKeyguardViewManager = new KeyguardViewManager(context, WindowManagerImpl.getDefault(), this, mKeyguardViewProperties, mUpdateMonitor);
        mUserPresentIntent = new Intent("android.intent.action.USER_PRESENT");
        mUserPresentIntent.addFlags(0x28000000);
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        boolean flag;
        String s;
        String s1;
        IntentFilter intentfilter1;
        if(android.provider.Settings.System.getInt(contentresolver, "show_status_bar_lock", 0) == 1)
            flag = true;
        else
            flag = false;
        mShowLockIcon = flag;
        mLockSounds = new SoundPool(1, 1, 0);
        s = android.provider.Settings.System.getString(contentresolver, "lock_sound");
        if(s != null)
            mLockSoundId = mLockSounds.load(s, 1);
        if(s != null)
            if(mLockSoundId != 0);
        s1 = android.provider.Settings.System.getString(contentresolver, "unlock_sound");
        if(s1 != null)
            mUnlockSoundId = mLockSounds.load(s1, 1);
        if(s1 != null)
            if(mUnlockSoundId != 0);
        mLockSoundVolume = (float)Math.pow(10D, context.getResources().getInteger(0x10e0005) / 20);
        intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.intent.action.USER_SWITCHED");
        intentfilter1.addAction("android.intent.action.USER_REMOVED");
        mContext.registerReceiver(mUserChangeReceiver, intentfilter1);
    }

    private void adjustUserActivityLocked() {
        boolean flag;
        if(!mShowing || mHidden)
            flag = true;
        else
            flag = false;
        mRealPowerManager.enableUserActivity(flag);
        if(!flag && mScreenOn)
            pokeWakelock();
    }

    private void doKeyguardLocked() {
_L2:
        return;
        if(!mExternallyEnabled || mKeyguardViewManager.isShowing()) goto _L2; else goto _L1
_L1:
        boolean flag;
        boolean flag1;
        com.android.internal.telephony.IccCard.State state;
        boolean flag2;
        if(!SystemProperties.getBoolean("keyguard.no_require_sim", false))
            flag = true;
        else
            flag = false;
        flag1 = mUpdateMonitor.isDeviceProvisioned();
        state = mUpdateMonitor.getSimState();
        if(state.isPinLocked() || (state == com.android.internal.telephony.IccCard.State.ABSENT || state == com.android.internal.telephony.IccCard.State.PERM_DISABLED) && flag)
            flag2 = true;
        else
            flag2 = false;
        if((flag2 || flag1) && (!mLockPatternUtils.isLockScreenDisabled() || flag2))
            showLocked();
        if(true) goto _L2; else goto _L3
_L3:
    }

    private void handleHide() {
        this;
        JVM INSTR monitorenter ;
        if(mWakeAndHandOff.isHeld()) {
            Log.w("KeyguardViewMediator", "attempt to hide the keyguard while waking, ignored");
        } else {
            if(TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState))
                playSounds(false);
            mKeyguardViewManager.hide();
            mShowing = false;
            updateActivityLockScreenState();
            adjustUserActivityLocked();
            adjustStatusBarLocked();
        }
        return;
    }

    private void handleKeyguardDone(boolean flag) {
        handleHide();
        if(flag)
            mPM.userActivity(SystemClock.uptimeMillis(), true);
        mWakeLock.release();
        mContext.sendBroadcast(mUserPresentIntent);
    }

    private void handleKeyguardDoneDrawing() {
        this;
        JVM INSTR monitorenter ;
        if(mWaitingUntilKeyguardVisible) {
            mWaitingUntilKeyguardVisible = false;
            notifyAll();
            mHandler.removeMessages(10);
        }
        return;
    }

    private void handleNotifyScreenOff() {
        this;
        JVM INSTR monitorenter ;
        mKeyguardViewManager.onScreenTurnedOff();
        return;
    }

    private void handleNotifyScreenOn(KeyguardViewManager.ShowListener showlistener) {
        this;
        JVM INSTR monitorenter ;
        mKeyguardViewManager.onScreenTurnedOn(showlistener);
        return;
    }

    private void handleReset() {
        this;
        JVM INSTR monitorenter ;
        mKeyguardViewManager.reset();
        return;
    }

    private void handleSetHidden(boolean flag) {
        this;
        JVM INSTR monitorenter ;
        if(mHidden != flag) {
            mHidden = flag;
            updateActivityLockScreenState();
            adjustUserActivityLocked();
            adjustStatusBarLocked();
        }
        return;
    }

    private void handleShow() {
        this;
        JVM INSTR monitorenter ;
        if(mSystemReady)
            break MISSING_BLOCK_LABEL_14;
        this;
        JVM INSTR monitorexit ;
        break MISSING_BLOCK_LABEL_75;
        mKeyguardViewManager.show();
        mShowing = true;
        updateActivityLockScreenState();
        adjustUserActivityLocked();
        adjustStatusBarLocked();
        Exception exception;
        try {
            ActivityManagerNative.getDefault().closeSystemDialogs("lock");
        }
        catch(RemoteException remoteexception) { }
        playSounds(true);
        mShowKeyguardWakeLock.release();
        this;
        JVM INSTR monitorexit ;
        break MISSING_BLOCK_LABEL_75;
        exception;
        throw exception;
    }

    private void handleTimeout(int i) {
        this;
        JVM INSTR monitorenter ;
        if(i == mWakelockSequence)
            mWakeLock.release();
        return;
    }

    private void handleVerifyUnlock() {
        this;
        JVM INSTR monitorenter ;
        mKeyguardViewManager.verifyUnlock();
        mShowing = true;
        updateActivityLockScreenState();
        return;
    }

    private void handleWakeWhenReady(int i) {
        this;
        JVM INSTR monitorenter ;
        if(!mKeyguardViewManager.wakeWhenReadyTq(i)) {
            Log.w("KeyguardViewMediator", "mKeyguardViewManager.wakeWhenReadyTq did not poke wake lock, so poke it ourselves");
            pokeWakelock();
        }
        mWakeAndHandOff.release();
        if(!mWakeLock.isHeld())
            Log.w("KeyguardViewMediator", "mWakeLock not held in mKeyguardViewManager.wakeWhenReadyTq");
        return;
    }

    private void hideLocked() {
        Message message = mHandler.obtainMessage(3);
        mHandler.sendMessage(message);
    }

    private void notifyScreenOnLocked(KeyguardViewManager.ShowListener showlistener) {
        Message message = mHandler.obtainMessage(7, showlistener);
        mHandler.sendMessage(message);
    }

    private void onUserRemoved(int i) {
        mLockPatternUtils.removeUser(i);
    }

    private void onUserSwitched(int i) {
        mLockPatternUtils.setCurrentUser(i);
        this;
        JVM INSTR monitorenter ;
        resetStateLocked();
        return;
    }

    private void playSounds(boolean flag) {
        if(!mSuppressNextLockSound) goto _L2; else goto _L1
_L1:
        mSuppressNextLockSound = false;
_L4:
        return;
_L2:
        if(android.provider.Settings.System.getInt(mContext.getContentResolver(), "lockscreen_sounds_enabled", 1) != 1)
            continue; /* Loop/switch isn't completed */
        int i;
        if(flag)
            i = mLockSoundId;
        else
            i = mUnlockSoundId;
        mLockSounds.stop(mLockSoundStreamId);
        if(mAudioManager == null) {
            mAudioManager = (AudioManager)mContext.getSystemService("audio");
            if(mAudioManager == null)
                continue; /* Loop/switch isn't completed */
            mMasterStreamType = mAudioManager.getMasterStreamType();
        }
        if(!mAudioManager.isStreamMute(mMasterStreamType))
            mLockSoundStreamId = mLockSounds.play(i, mLockSoundVolume, mLockSoundVolume, 1, 0, 1.0F);
        if(true) goto _L4; else goto _L3
_L3:
    }

    private void resetStateLocked() {
        Message message = mHandler.obtainMessage(4);
        mHandler.sendMessage(message);
    }

    private void showLocked() {
        mShowKeyguardWakeLock.acquire();
        Message message = mHandler.obtainMessage(2);
        mHandler.sendMessage(message);
    }

    private void updateActivityLockScreenState() {
        IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
        if(!mShowing || mHidden) goto _L2; else goto _L1
_L1:
        boolean flag = true;
_L3:
        iactivitymanager.setLockScreenShown(flag);
_L4:
        return;
_L2:
        flag = false;
          goto _L3
        RemoteException remoteexception;
        remoteexception;
          goto _L4
    }

    private void verifyUnlockLocked() {
        mHandler.sendEmptyMessage(5);
    }

    private void wakeWhenReadyLocked(int i) {
        mWakeAndHandOff.acquire();
        Message message = mHandler.obtainMessage(8, i, 0);
        mHandler.sendMessage(message);
    }

    void adjustStatusBarLocked() {
        if(mStatusBarManager == null)
            mStatusBarManager = (StatusBarManager)mContext.getSystemService("statusbar");
        if(mStatusBarManager != null) goto _L2; else goto _L1
_L1:
        Log.w("KeyguardViewMediator", "Could not get status bar manager");
_L7:
        return;
_L2:
        if(!mShowLockIcon) goto _L4; else goto _L3
_L3:
        if(!mShowing || !isSecure()) goto _L6; else goto _L5
_L5:
        if(!mShowingLockIcon) {
            String s = mContext.getString(0x10404f6);
            mStatusBarManager.setIcon("secure", 0x108054a, 0, s);
            mShowingLockIcon = true;
        }
_L4:
        int i = 0;
        if(mShowing) {
            i = 0 | 0x1000000;
            if(isSecure())
                i |= 0x10000;
            if(isSecure())
                i |= 0x80000;
        }
        mStatusBarManager.disable(i);
        if(true) goto _L7; else goto _L6
_L6:
        if(mShowingLockIcon) {
            mStatusBarManager.removeIcon("secure");
            mShowingLockIcon = false;
        }
          goto _L4
    }

    public void doKeyguardTimeout() {
        mHandler.removeMessages(13);
        Message message = mHandler.obtainMessage(13);
        mHandler.sendMessage(message);
    }

    public boolean isInputRestricted() {
        boolean flag;
        if(mShowing || mNeedToReshowWhenReenabled || !mUpdateMonitor.isDeviceProvisioned())
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean isSecure() {
        return mKeyguardViewProperties.isSecure();
    }

    public boolean isShowing() {
        return mShowing;
    }

    public boolean isShowingAndNotHidden() {
        boolean flag;
        if(mShowing && !mHidden)
            flag = true;
        else
            flag = false;
        return flag;
    }

    boolean isWakeKeyWhenKeyguardShowing(int i, boolean flag) {
        i;
        JVM INSTR lookupswitch 15: default 132
    //                   24: 134
    //                   25: 134
    //                   27: 136
    //                   79: 136
    //                   85: 136
    //                   86: 136
    //                   87: 136
    //                   88: 136
    //                   89: 136
    //                   90: 136
    //                   91: 136
    //                   126: 136
    //                   127: 136
    //                   130: 136
    //                   164: 134;
           goto _L1 _L2 _L2 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L3 _L2
_L2:
        break; /* Loop/switch isn't completed */
_L1:
        flag = true;
_L5:
        return flag;
_L3:
        flag = false;
        if(true) goto _L5; else goto _L4
_L4:
    }

    public void keyguardDone(boolean flag) {
        keyguardDone(flag, true);
    }

    public void keyguardDone(boolean flag, boolean flag1) {
        int i = 1;
        this;
        JVM INSTR monitorenter ;
        EventLog.writeEvent(0x11170, 2);
        Message message = mHandler.obtainMessage(9);
        if(!flag1)
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
        if(flag)
            mUpdateMonitor.clearFailedAttempts();
        if(mExitSecureCallback != null) {
            mExitSecureCallback.onKeyguardExitResult(flag);
            mExitSecureCallback = null;
            if(flag) {
                mExternallyEnabled = true;
                mNeedToReshowWhenReenabled = false;
            }
        }
        return;
    }

    public void keyguardDoneDrawing() {
        mHandler.sendEmptyMessage(10);
    }

    void notifyScreenOffLocked() {
        mHandler.sendEmptyMessage(6);
    }

    public void onScreenTurnedOff(int i) {
        this;
        JVM INSTR monitorenter ;
        long l1;
        long l3;
        mScreenOn = false;
        Exception exception;
        boolean flag;
        android.content.ContentResolver contentresolver;
        long l;
        long l2;
        long l4;
        Intent intent;
        PendingIntent pendingintent;
        if(mLockPatternUtils.getPowerButtonInstantlyLocks() || !mLockPatternUtils.isSecure())
            flag = true;
        else
            flag = false;
        if(mExitSecureCallback != null) {
            mExitSecureCallback.onKeyguardExitResult(false);
            mExitSecureCallback = null;
            if(!mExternallyEnabled)
                hideLocked();
        } else {
            if(!mShowing)
                break MISSING_BLOCK_LABEL_89;
            notifyScreenOffLocked();
            resetStateLocked();
        }
        return;
        exception;
        throw exception;
        if(i != 3 && (i != 2 || flag)) goto _L2; else goto _L1
_L1:
        contentresolver = mContext.getContentResolver();
        l = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 30000);
        l1 = android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_lock_after_timeout", 5000);
        l2 = mLockPatternUtils.getDevicePolicyManager().getMaximumTimeToLock(null);
        if(l2 <= 0L)
            break MISSING_BLOCK_LABEL_279;
        l3 = Math.min(l2 - Math.max(l, 0L), l1);
_L3:
        if(l3 <= 0L) {
            mSuppressNextLockSound = true;
            doKeyguardLocked();
        } else {
            l4 = l3 + SystemClock.elapsedRealtime();
            intent = new Intent("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD");
            intent.putExtra("seq", mDelayedShowingSequence);
            pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0x10000000);
            mAlarmManager.set(2, l4, pendingintent);
        }
        break MISSING_BLOCK_LABEL_63;
_L2:
        if(i != 4)
            doKeyguardLocked();
        break MISSING_BLOCK_LABEL_63;
        l3 = l1;
          goto _L3
    }

    public void onScreenTurnedOn(KeyguardViewManager.ShowListener showlistener) {
        this;
        JVM INSTR monitorenter ;
        mScreenOn = true;
        mDelayedShowingSequence = 1 + mDelayedShowingSequence;
        if(showlistener != null)
            notifyScreenOnLocked(showlistener);
        return;
    }

    public void onSimStateChanged(com.android.internal.telephony.IccCard.State state) {
        class _cls5 {

            static final int $SwitchMap$com$android$internal$telephony$IccCard$State[];

            static  {
                $SwitchMap$com$android$internal$telephony$IccCard$State = new int[com.android.internal.telephony.IccCard.State.values().length];
                NoSuchFieldError nosuchfielderror4;
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.ABSENT.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PIN_REQUIRED.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PUK_REQUIRED.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PERM_DISABLED.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror3) { }
                $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.READY.ordinal()] = 5;
_L2:
                return;
                nosuchfielderror4;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls5..SwitchMap.com.android.internal.telephony.IccCard.State[state.ordinal()];
        JVM INSTR tableswitch 1 5: default 44
    //                   1 45
    //                   2 87
    //                   3 87
    //                   4 119
    //                   5 149;
           goto _L1 _L2 _L3 _L3 _L4 _L5
_L1:
        return;
_L2:
        this;
        JVM INSTR monitorenter ;
        if(mUpdateMonitor.isDeviceProvisioned()) goto _L7; else goto _L6
_L6:
        if(isShowing()) goto _L9; else goto _L8
_L8:
        doKeyguardLocked();
_L7:
        this;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        Exception exception2;
        exception2;
        throw exception2;
_L9:
        resetStateLocked();
          goto _L7
_L3:
        this;
        JVM INSTR monitorenter ;
        if(isShowing()) goto _L11; else goto _L10
_L10:
        doKeyguardLocked();
_L12:
        this;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        Exception exception1;
        exception1;
        throw exception1;
_L11:
        resetStateLocked();
          goto _L12
_L4:
        this;
        JVM INSTR monitorenter ;
        if(isShowing()) goto _L14; else goto _L13
_L13:
        doKeyguardLocked();
_L15:
        this;
        JVM INSTR monitorexit ;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        throw exception;
_L14:
        resetStateLocked();
          goto _L15
_L5:
        this;
        JVM INSTR monitorenter ;
        if(isShowing())
            resetStateLocked();
        if(true) goto _L1; else goto _L16
_L16:
    }

    public void onSystemReady() {
        this;
        JVM INSTR monitorenter ;
        mSystemReady = true;
        doKeyguardLocked();
        return;
    }

    public boolean onWakeKeyWhenKeyguardShowingTq(int i, boolean flag) {
        boolean flag1;
        if(isWakeKeyWhenKeyguardShowing(i, flag)) {
            wakeWhenReadyLocked(i);
            flag1 = true;
        } else {
            flag1 = false;
        }
        return flag1;
    }

    public boolean onWakeMotionWhenKeyguardShowingTq() {
        wakeWhenReadyLocked(0);
        return true;
    }

    public void pokeWakelock() {
        pokeWakelock(10000);
    }

    public void pokeWakelock(int i) {
        this;
        JVM INSTR monitorenter ;
        mWakeLock.acquire();
        mHandler.removeMessages(1);
        mWakelockSequence = 1 + mWakelockSequence;
        Message message = mHandler.obtainMessage(1, mWakelockSequence, 0);
        mHandler.sendMessageDelayed(message, i);
        return;
    }

    public void setHidden(boolean flag) {
        mHandler.removeMessages(12);
        Handler handler = mHandler;
        int i;
        Message message;
        if(flag)
            i = 1;
        else
            i = 0;
        message = handler.obtainMessage(12, i, 0);
        mHandler.sendMessage(message);
    }

    public void setKeyguardEnabled(boolean flag) {
        this;
        JVM INSTR monitorenter ;
        mExternallyEnabled = flag;
        if(flag || !mShowing) goto _L2; else goto _L1
_L1:
        if(mExitSecureCallback != null)
            break MISSING_BLOCK_LABEL_145;
        mNeedToReshowWhenReenabled = true;
        hideLocked();
_L4:
        this;
        JVM INSTR monitorexit ;
        break MISSING_BLOCK_LABEL_145;
        Exception exception;
        exception;
        throw exception;
_L2:
        if(!flag) goto _L4; else goto _L3
_L3:
        if(!mNeedToReshowWhenReenabled) goto _L4; else goto _L5
_L5:
        mNeedToReshowWhenReenabled = false;
        if(mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_94;
        mExitSecureCallback.onKeyguardExitResult(false);
        mExitSecureCallback = null;
        resetStateLocked();
          goto _L4
        showLocked();
        mWaitingUntilKeyguardVisible = true;
        mHandler.sendEmptyMessageDelayed(10, 2000L);
_L7:
        boolean flag1 = mWaitingUntilKeyguardVisible;
        if(!flag1) goto _L4; else goto _L6
_L6:
        wait();
          goto _L7
        InterruptedException interruptedexception;
        interruptedexception;
        Thread.currentThread().interrupt();
          goto _L7
    }

    public void verifyUnlock(android.view.WindowManagerPolicy.OnKeyguardExitResult onkeyguardexitresult) {
        this;
        JVM INSTR monitorenter ;
        if(!mUpdateMonitor.isDeviceProvisioned()) {
            onkeyguardexitresult.onKeyguardExitResult(false);
        } else {
            if(!mExternallyEnabled)
                break MISSING_BLOCK_LABEL_53;
            Log.w("KeyguardViewMediator", "verifyUnlock called when not externally disabled");
            onkeyguardexitresult.onKeyguardExitResult(false);
        }
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
        if(mExitSecureCallback != null) {
            onkeyguardexitresult.onKeyguardExitResult(false);
        } else {
            mExitSecureCallback = onkeyguardexitresult;
            verifyUnlockLocked();
        }
          goto _L1
    }

    protected static final int AWAKE_INTERVAL_DEFAULT_MS = 10000;
    private static final boolean DBG_WAKE = false;
    private static final boolean DEBUG = false;
    private static final String DELAYED_KEYGUARD_ACTION = "com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD";
    private static final boolean ENABLE_INSECURE_STATUS_BAR_EXPAND = true;
    private static final int HIDE = 3;
    private static final int KEYGUARD_DISPLAY_TIMEOUT_DELAY_DEFAULT = 30000;
    private static final int KEYGUARD_DONE = 9;
    private static final int KEYGUARD_DONE_AUTHENTICATING = 11;
    private static final int KEYGUARD_DONE_DRAWING = 10;
    private static final int KEYGUARD_DONE_DRAWING_TIMEOUT_MS = 2000;
    private static final int KEYGUARD_LOCK_AFTER_DELAY_DEFAULT = 5000;
    private static final int KEYGUARD_TIMEOUT = 13;
    private static final int NOTIFY_SCREEN_OFF = 6;
    private static final int NOTIFY_SCREEN_ON = 7;
    private static final int RESET = 4;
    private static final int SET_HIDDEN = 12;
    private static final int SHOW = 2;
    private static final String TAG = "KeyguardViewMediator";
    private static final int TIMEOUT = 1;
    private static final int VERIFY_UNLOCK = 5;
    private static final int WAKE_WHEN_READY = 8;
    private AlarmManager mAlarmManager;
    private AudioManager mAudioManager;
    private BroadcastReceiver mBroadCastReceiver;
    private PhoneWindowManager mCallback;
    Context mContext;
    private int mDelayedShowingSequence;
    private android.view.WindowManagerPolicy.OnKeyguardExitResult mExitSecureCallback;
    private boolean mExternallyEnabled;
    private Handler mHandler;
    private boolean mHidden;
    KeyguardUpdateMonitor.InfoCallbackImpl mInfoCallback;
    private KeyguardViewManager mKeyguardViewManager;
    private KeyguardViewProperties mKeyguardViewProperties;
    private LockPatternUtils mLockPatternUtils;
    private int mLockSoundId;
    private int mLockSoundStreamId;
    private final float mLockSoundVolume;
    private SoundPool mLockSounds;
    private int mMasterStreamType;
    private boolean mNeedToReshowWhenReenabled;
    private PowerManager mPM;
    private String mPhoneState;
    LocalPowerManager mRealPowerManager;
    private boolean mScreenOn;
    private android.os.PowerManager.WakeLock mShowKeyguardWakeLock;
    private boolean mShowLockIcon;
    private boolean mShowing;
    private boolean mShowingLockIcon;
    StatusBarManager mStatusBarManager;
    private boolean mSuppressNextLockSound;
    private boolean mSystemReady;
    private int mUnlockSoundId;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private BroadcastReceiver mUserChangeReceiver;
    private Intent mUserPresentIntent;
    private boolean mWaitingUntilKeyguardVisible;
    private android.os.PowerManager.WakeLock mWakeAndHandOff;
    private android.os.PowerManager.WakeLock mWakeLock;
    private int mWakelockSequence;
















/*
    static boolean access$402(KeyguardViewMediator keyguardviewmediator, boolean flag) {
        keyguardviewmediator.mSuppressNextLockSound = flag;
        return flag;
    }

*/




/*
    static String access$602(KeyguardViewMediator keyguardviewmediator, String s) {
        keyguardviewmediator.mPhoneState = s;
        return s;
    }

*/



}
