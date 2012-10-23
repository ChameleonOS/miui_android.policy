// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.drawable.AnimationDrawable;
import android.os.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.widget.*;
import com.android.internal.statusbar.IStatusBarService;
import java.util.HashSet;
import java.util.List;
import miui.app.ExtraStatusBarManager;
import miui.util.HapticFeedbackUtil;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneWindowManager, KeyguardViewMediator, MiuiScreenOnProximityLock, MagnifierPopupWindow

public class MiuiPhoneWindowManager extends PhoneWindowManager {
    class MiuiSettingsObserver extends ContentObserver {

        void observe() {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("trackball_wake_screen"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("camera_key_preferred_action_type"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("camera_key_preferred_action_shortcut_id"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("volumekey_wake_screen"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("screen_buttons_state"), false, this);
            onChange(false);
        }

        public void onChange(boolean flag) {
            boolean flag1 = true;
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            ContentResolver contentresolver = mContext.getContentResolver();
            MiuiPhoneWindowManager miuiphonewindowmanager = MiuiPhoneWindowManager.this;
            boolean flag2;
            MiuiPhoneWindowManager miuiphonewindowmanager1;
            boolean flag3;
            MiuiPhoneWindowManager miuiphonewindowmanager2;
            boolean flag4;
            if(android.provider.Settings.Secure.getInt(contentresolver, "screen_buttons_state", 0) != 0)
                flag2 = flag1;
            else
                flag2 = false;
            miuiphonewindowmanager.mScreenButtonsDisabled = flag2;
            miuiphonewindowmanager1 = MiuiPhoneWindowManager.this;
            if(android.provider.Settings.System.getInt(contentresolver, "trackball_wake_screen", 0) == flag1)
                flag3 = flag1;
            else
                flag3 = false;
            miuiphonewindowmanager1.mTrackballWakeScreen = flag3;
            miuiphonewindowmanager2 = MiuiPhoneWindowManager.this;
            if(android.provider.Settings.System.getInt(contentresolver, "volumekey_wake_screen", 0) == flag1)
                flag4 = flag1;
            else
                flag4 = false;
            miuiphonewindowmanager2.mVolumeKeyWakeScreen = flag4;
            if(flag1 == android.provider.Settings.System.getInt(contentresolver, "camera_key_preferred_action_type", 0)) {
                MiuiPhoneWindowManager miuiphonewindowmanager3 = MiuiPhoneWindowManager.this;
                if(4 != android.provider.Settings.System.getInt(contentresolver, "camera_key_preferred_action_shortcut_id", -1))
                    flag1 = false;
                miuiphonewindowmanager3.mCameraKeyWakeScreen = flag1;
            } else {
                mCameraKeyWakeScreen = false;
            }
            return;
        }

        final MiuiPhoneWindowManager this$0;

        MiuiSettingsObserver(Handler handler) {
            this$0 = MiuiPhoneWindowManager.this;
            super(handler);
        }
    }

    private class BackLongPressRunnable
        implements Runnable {

        private void showHint() {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
            builder.setMessage(0x60c016f);
            builder.setNegativeButton(0x1040009, null);
            builder.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                public void onClick(DialogInterface dialoginterface, int i) {
                    android.provider.Settings.System.putInt(mContext.getContentResolver(), "back_key_long_press_timeout", 1500);
                }

                final BackLongPressRunnable this$1;

                 {
                    this$1 = BackLongPressRunnable.this;
                    super();
                }
            });
            AlertDialog alertdialog = builder.create();
            alertdialog.getWindow().setType(2008);
            alertdialog.getWindow().setFlags(0x20000, 0x20000);
            alertdialog.show();
        }

        public void run() {
            mBackLongPressed = true;
            performHapticFeedbackLw(null, 0, false);
            if(mWin != null) goto _L2; else goto _L1
_L1:
            showHint();
_L4:
            return;
_L2:
            String s;
            String s1;
            ComponentName componentname;
            PackageManager packagemanager;
            s = mWin.getAttrs().packageName;
            s1 = null;
            String s2 = (String)mWin.getAttrs().getTitle();
            int i = s2.lastIndexOf('/');
            if(i < 0)
                break MISSING_BLOCK_LABEL_160;
            componentname = new ComponentName(s, (String)s2.subSequence(i + 1, s2.length()));
            packagemanager = mContext.getPackageManager();
            String s3;
            s1 = packagemanager.getActivityInfo(componentname, 0).loadLabel(packagemanager).toString();
            if(!TextUtils.isEmpty(s1))
                break MISSING_BLOCK_LABEL_160;
            s3 = packagemanager.getApplicationInfo(s, 0).loadLabel(packagemanager).toString();
            s1 = s3;
_L5:
            Context context;
            Context context1;
            Object aobj[];
            try {
                ActivityManagerNative.getDefault().finishActivity(mWin.getAttrs().token, 0, null);
            }
            catch(RemoteException remoteexception) {
                remoteexception.printStackTrace();
            }
            ((ActivityManager)mContext.getSystemService("activity")).forceStopPackage(s);
            context = mContext;
            context1 = mContext;
            aobj = new Object[1];
            if(TextUtils.isEmpty(s1))
                s1 = s;
            aobj[0] = s1;
            Toast.makeText(context, context1.getString(0x60c0170, aobj), 0).show();
            if(true) goto _L4; else goto _L3
_L3:
            android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
            namenotfoundexception;
              goto _L5
        }

        public void setTarget(android.view.WindowManagerPolicy.WindowState windowstate) {
            mWin = windowstate;
        }

        private android.view.WindowManagerPolicy.WindowState mWin;
        final MiuiPhoneWindowManager this$0;

        private BackLongPressRunnable() {
            this$0 = MiuiPhoneWindowManager.this;
            super();
            mWin = null;
        }

    }

    private final class MagnifierInputEventReceiver extends InputEventReceiver {

        public void onInputEvent(InputEvent inputevent) {
            if(inputevent instanceof MotionEvent) goto _L2; else goto _L1
_L1:
            finishInputEvent(inputevent, false);
_L4:
            return;
_L2:
            MotionEvent motionevent;
            boolean flag;
            motionevent = (MotionEvent)inputevent;
            flag = false;
            mDownX = (int)motionevent.getRawX();
            mDownY = (int)motionevent.getRawY();
            int i = motionevent.getSource();
label0:
            {
                if((i & 2) != 0)
                    break label0;
                finishInputEvent(inputevent, false);
            }
            if(true)
                continue; /* Loop/switch isn't completed */
            flag = true;
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            switch(motionevent.getActionMasked()) {
            default:
                break;

            case 0: // '\0'
            case 2: // '\002'
                break; /* Loop/switch isn't completed */

            case 1: // '\001'
            case 3: // '\003'
                break MISSING_BLOCK_LABEL_193;
            }
_L5:
            finishInputEvent(inputevent, flag);
            if(true) goto _L4; else goto _L3
_L3:
            mIsTouchDown = true;
            if(mShowMagnifier)
                getMagnifier().showMagnifier(mDownX, mDownY);
              goto _L5
            Exception exception1;
            exception1;
            throw exception1;
            Exception exception;
            exception;
            finishInputEvent(inputevent, flag);
            throw exception;
            getMagnifier().hide();
            mIsTouchDown = false;
            mShowMagnifier = false;
              goto _L5
        }

        final MiuiPhoneWindowManager this$0;

        public MagnifierInputEventReceiver(InputChannel inputchannel, Looper looper) {
            this$0 = MiuiPhoneWindowManager.this;
            super(inputchannel, looper);
        }
    }

    private final class StatusBarInputEventReceiver extends InputEventReceiver {

        public void onInputEvent(InputEvent inputevent) {
            if(inputevent instanceof MotionEvent) goto _L2; else goto _L1
_L1:
            finishInputEvent(inputevent, false);
_L3:
            return;
_L2:
            MotionEvent motionevent;
            boolean flag;
            motionevent = (MotionEvent)inputevent;
            flag = false;
            boolean flag1;
            if((2 & motionevent.getSource()) == 0 || mStatusBarService == null)
                break MISSING_BLOCK_LABEL_54;
            flag1 = mIsStatusBarVisibleInFullscreen;
            if(!flag1)
                break MISSING_BLOCK_LABEL_63;
            finishInputEvent(inputevent, false);
              goto _L3
            flag = true;
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            motionevent.getActionMasked();
            JVM INSTR tableswitch 0 3: default 112
        //                       0 124
        //                       1 162
        //                       2 162
        //                       3 162;
               goto _L4 _L5 _L6 _L6 _L6
_L4:
            finishInputEvent(inputevent, flag);
              goto _L3
_L5:
            mDownX = motionevent.getRawX();
            mDownY = motionevent.getRawY();
              goto _L4
            Exception exception1;
            exception1;
            throw exception1;
            Exception exception;
            exception;
            finishInputEvent(inputevent, flag);
            throw exception;
_L6:
            if(mContext.getResources().getFraction(0x6110000, mStatusBarHeight, mStatusBarHeight) < mDownY) goto _L4; else goto _L7
_L7:
            float f = Math.abs(mDownX - motionevent.getRawX());
            float f1 = Math.abs(mDownY - motionevent.getRawY());
            if(2.0F * f <= f1 && (float)(2 * mStatusBarHeight) <= f1) {
                setStatusBarInFullscreen(true);
                mDownY = mStatusBarHeight;
            }
              goto _L4
        }

        private float mDownX;
        private float mDownY;
        final MiuiPhoneWindowManager this$0;

        public StatusBarInputEventReceiver(InputChannel inputchannel, Looper looper) {
            this$0 = MiuiPhoneWindowManager.this;
            super(inputchannel, looper);
        }
    }


    public MiuiPhoneWindowManager() {
        mPowerLongPressOriginal = super.mPowerLongPress;
        mBinder = new Binder();
        mStatusBarExitFullscreenReceiver = new BroadcastReceiver() {

            public void onReceive(Context context, Intent intent) {
                setStatusBarInFullscreen(false);
            }

            final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
        };
        mScreenshotReceiver = new BroadcastReceiver() {

            public void onReceive(Context context, Intent intent) {
                mHandler.removeCallbacks(mScreenshotChordLongPress);
                mHandler.postDelayed(mScreenshotChordLongPress, intent.getLongExtra("capture_delay", 1000L));
            }

            final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
        };
        mShowMagnifierReceiver = new BroadcastReceiver() {

            public void onReceive(Context context, Intent intent) {
                mShowMagnifier = true;
                if(mIsTouchDown) {
                    getMagnifier().updateCache();
                    getMagnifier().showMagnifier(mDownX, mDownY);
                }
            }

            final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
        };
        mHasCameraFlash = false;
        mTorchEnabled = false;
        mBackLongPress = new BackLongPressRunnable();
    }

    static IStatusBarService getStatusBarManagerService() {
        IStatusBarService istatusbarservice = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.checkService("statusbar"));
        if(istatusbarservice == null)
            Log.w("WindowManager", "Unable to find IStatusBarService interface.");
        return istatusbarservice;
    }

    static IWindowManager getWindownManagerService() {
        IWindowManager iwindowmanager = android.view.IWindowManager.Stub.asInterface(ServiceManager.checkService("window"));
        if(iwindowmanager == null)
            Log.w("WindowManager", "Unable to find IPowerManager interface.");
        return iwindowmanager;
    }

    private boolean isEnableKeyguardTorch() {
        boolean flag;
        if(mHasCameraFlash && super.mKeyguardMediator.isShowingAndNotHidden())
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean releaseScreenOnProximitySensor() {
        boolean flag = false;
        if(super.mSystemReady) {
            mDisableProximitor = false;
            flag = mProximitySensor.release();
        }
        return flag;
    }

    private void setMaxBacklightBrightness() {
        IPowerManager ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        ipowermanager.setBacklightBrightness(255);
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    private void setStatusBarInFullscreen(boolean flag) {
        mIsStatusBarVisibleInFullscreen = flag;
        IStatusBarService istatusbarservice = super.mStatusBarService;
        if(!flag) goto _L2; else goto _L1
_L1:
        int i = 0x20000000;
_L3:
        istatusbarservice.disable(i, mBinder, "android");
_L4:
        RemoteException remoteexception;
        if(super.mStatusBar != null)
            if(flag)
                super.mStatusBar.showLw(false);
            else
                super.mStatusBar.hideLw(true);
        return;
_L2:
        i = 0;
          goto _L3
        remoteexception;
        remoteexception.printStackTrace();
          goto _L4
    }

    private void setTorch(boolean flag) {
        mTorchEnabled = flag;
        Intent intent = new Intent("miui.intent.action.TOGGLE_TORCH");
        intent.putExtra("miui.intent.extra.IS_ENABLE", flag);
        super.mContext.sendBroadcast(intent);
    }

    public boolean canBeForceHidden(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        boolean flag;
        if((0x40000000 & layoutparams.privateFlags) != 0)
            flag = false;
        else
            flag = super.canBeForceHidden(windowstate, layoutparams);
        return flag;
    }

    public boolean doesForceHide(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        boolean flag;
        if((0x40000000 & layoutparams.privateFlags) != 0)
            flag = false;
        else
            flag = super.doesForceHide(windowstate, layoutparams);
        return flag;
    }

    public int finishAnimationLw() {
        int i;
        android.view.WindowManagerPolicy.WindowState windowstate = super.mStatusBar;
        if(mIsStatusBarVisibleInFullscreen)
            super.mStatusBar = null;
        i = super.finishAnimationLw();
        super.mStatusBar = windowstate;
        if(!ExtraStatusBarManager.isExpandableUnderFullscreen(super.mContext) || super.mStatusBar == null || mIsStatusBarVisibleInFullscreen) goto _L2; else goto _L1
_L1:
        if(!super.mTopIsFullscreen || super.mKeyguardMediator.isShowing()) goto _L4; else goto _L3
_L3:
        if(mStatusBarInputChannel == null) {
            mStatusBarInputChannel = super.mWindowManagerFuncs.monitorInput("StatusBarView");
            mStatusBarInputEventReceiver = new StatusBarInputEventReceiver(mStatusBarInputChannel, super.mHandler.getLooper());
        }
_L2:
        return i;
_L4:
        if(mStatusBarInputChannel != null) {
            mStatusBarInputChannel.dispose();
            mStatusBarInputChannel = null;
        }
        if(mStatusBarInputEventReceiver != null) {
            mStatusBarInputEventReceiver.dispose();
            mStatusBarInputEventReceiver = null;
        }
        if(true) goto _L2; else goto _L5
_L5:
    }

    MagnifierPopupWindow getMagnifier() {
        this;
        JVM INSTR monitorenter ;
        if(mMagnifier == null) {
            int i = 1000 + 10000 * windowTypeToLayerLw(2000);
            mMagnifier = new MagnifierPopupWindow(super.mContext, i);
        }
        MagnifierPopupWindow magnifierpopupwindow = mMagnifier;
        return magnifierpopupwindow;
    }

    public void hideBootMessages() {
        super.mHandler.post(new Runnable() {

            public void run() {
                if(mMiuiBootMsgDialog != null) {
                    mAnimationDrawable.stop();
                    mMiuiBootMsgDialog.dismiss();
                    mMiuiBootMsgDialog = null;
                }
            }

            final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
        });
    }

    public void init(Context context, IWindowManager iwindowmanager, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs, LocalPowerManager localpowermanager) {
        super.init(context, iwindowmanager, windowmanagerfuncs, localpowermanager);
        android.provider.Settings.Secure.putInt(context.getContentResolver(), "device_provisioned", 1);
        (new MiuiSettingsObserver(super.mHandler)).observe();
        super.mPowerLongPress = new Runnable() {

            public void run() {
                if(!mKeyguardMediator.isShowing() || android.provider.Settings.System.getInt(mContext.getContentResolver(), "keyguard_disable_power_key_long_press", 0) == 0)
                    mPowerLongPressOriginal.run();
                else
                    mPowerKeyHandled = true;
            }

            final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
        };
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CAPTURE_SCREENSHOT");
        context.registerReceiver(mScreenshotReceiver, intentfilter);
        IntentFilter intentfilter1 = new IntentFilter();
        intentfilter1.addAction("com.miui.app.ExtraStatusBarManager.EXIT_FULLSCREEN");
        context.registerReceiver(mStatusBarExitFullscreenReceiver, intentfilter1);
        mHasCameraFlash = context.getPackageManager().hasSystemFeature("android.hardware.camera.flash");
        mHapticFeedbackUtil = new HapticFeedbackUtil(context, false);
        mMagnifierInputChannel = super.mWindowManagerFuncs.monitorInput("Magnifier");
        mMagnifierInputEventReceiver = new MagnifierInputEventReceiver(mMagnifierInputChannel, Looper.myLooper());
        IntentFilter intentfilter2 = new IntentFilter();
        intentfilter2.addAction("android.intent.action.SHOW_MAGNIFIER");
        context.registerReceiver(mShowMagnifierReceiver, intentfilter2);
    }

    public long interceptKeyBeforeDispatching(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i) {
        int j;
        int k;
        boolean flag;
        long l;
        j = keyevent.getKeyCode();
        k = keyevent.getRepeatCount();
        if(keyevent.getAction() == 0)
            flag = true;
        else
            flag = false;
        if(!mShortcutTriggered && (!super.mSystemReady || !mProximitySensor.isHeld())) goto _L2; else goto _L1
_L1:
        l = -1L;
_L10:
        return l;
_L2:
        if(!mScreenButtonsDisabled) goto _L4; else goto _L3
_L3:
        j;
        JVM INSTR lookupswitch 4: default 112
    //                   3: 156
    //                   4: 156
    //                   82: 156
    //                   84: 156;
           goto _L4 _L5 _L5 _L5 _L5
_L4:
        if(j != 3) goto _L7; else goto _L6
_L6:
        if(!flag || !isEnableKeyguardTorch()) goto _L9; else goto _L8
_L8:
        if(k == 0) {
            mTorchEnabled = false;
            mHomeDownWhileScreenOn = super.mScreenOnFully;
        } else
        if(mTorchEnabled) {
            if(k % 10 == 6)
                super.mKeyguardMediator.pokeWakelock();
        } else
        if(mHomeDownWhileScreenOn && keyevent.isLongPress())
            setTorch(true);
        l = -1L;
          goto _L10
_L5:
        l = -1L;
          goto _L10
_L9:
        if(mTorchEnabled)
            setTorch(false);
_L11:
        l = super.interceptKeyBeforeDispatching(windowstate, keyevent, i);
          goto _L10
_L7:
        if(j != 82)
            continue; /* Loop/switch isn't completed */
        if(!mShortcutTriggered && flag && keyevent.isLongPress() && (!super.mKeyguardMediator.isSecure() || !super.mKeyguardMediator.isShowing()) && android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "enable_assist_menu_key_long_press", 1) != 0) {
            mShortcutTriggered = true;
            try {
                Intent intent1 = new Intent("android.intent.action.MAIN");
                intent1.setAction("android.intent.action.ASSIST");
                intent1.setFlags(0x10000000);
                super.mContext.startActivity(intent1);
            }
            catch(ActivityNotFoundException activitynotfoundexception) { }
        }
          goto _L11
        if(j != 4) goto _L11; else goto _L12
_L12:
        if(!flag) goto _L14; else goto _L13
_L13:
        if(!super.mKeyguardMediator.isShowingAndNotHidden()) goto _L16; else goto _L15
_L15:
        int j1 = android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "enable_snapshot_screenlock", 0);
        if(!keyevent.isLongPress() || j1 == 0 || super.mKeyguardMediator.isSecure()) goto _L18; else goto _L17
_L17:
        PackageManager packagemanager = super.mContext.getPackageManager();
        Intent intent = new Intent();
        intent.addFlags(0x10000000);
        intent.addFlags(0x8000000);
        intent.setAction("android.media.action.STILL_IMAGE_CAMERA");
        intent.putExtra("captureAfterLaunch", true);
        intent.putExtra("android.intent.extras.CAMERA_FACING", 0);
        if(packagemanager.queryIntentActivities(intent, 0).size() > 0) {
            super.mKeyguardMediator.keyguardDone(true);
            super.mContext.startActivity(intent);
        }
        l = -1L;
          goto _L10
_L16:
        if(k == 0) {
            mBackLongPressed = false;
            android.view.WindowManager.LayoutParams layoutparams;
            if(windowstate != null)
                layoutparams = windowstate.getAttrs();
            else
                layoutparams = null;
            if(layoutparams != null && !sBackLongPressWhiteList.contains(layoutparams.packageName) && (layoutparams.type >= 1 && layoutparams.type <= 99 || layoutparams.type >= 1000 && layoutparams.type <= 1999)) {
                int i1;
                try {
                    i1 = android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "back_key_long_press_timeout");
                    mBackLongPress.setTarget(windowstate);
                }
                catch(android.provider.Settings.SettingNotFoundException settingnotfoundexception) {
                    i1 = ViewConfiguration.getLongPressTimeout();
                    android.provider.Settings.System.putInt(super.mContext.getContentResolver(), "back_key_long_press_timeout", 0);
                }
                if(i1 > 0)
                    super.mHandler.postDelayed(mBackLongPress, i1);
            }
        }
_L18:
        if(!mBackLongPressed) goto _L11; else goto _L19
_L19:
        l = -1L;
          goto _L10
_L14:
        super.mHandler.removeCallbacks(mBackLongPress);
          goto _L18
    }

    public int interceptKeyBeforeQueueing(KeyEvent keyevent, int i, boolean flag) {
        int j;
        boolean flag1;
        boolean flag2;
        int k;
        j = keyevent.getKeyCode();
        if(keyevent.getAction() == 0)
            flag1 = true;
        else
            flag1 = false;
        if((0x1000000 & i) != 0)
            flag2 = true;
        else
            flag2 = false;
        if(!mScreenButtonsDisabled) goto _L2; else goto _L1
_L1:
        j;
        JVM INSTR lookupswitch 5: default 88
    //                   3: 198
    //                   4: 204
    //                   26: 210
    //                   82: 204
    //                   84: 204;
           goto _L2 _L3 _L4 _L5 _L4 _L4
_L2:
        if(j == 82)
            mMenuPressed = flag1;
        else
        if(j == 4)
            mBackPressed = flag1;
        else
        if(j == 24)
            mVolumeUpPressed = flag1;
        else
        if(j == 25)
            mVolumeDownPressed = flag1;
        if(!mMenuPressed && !mBackPressed && !mVolumeUpPressed && !mVolumeDownPressed)
            mShortcutTriggered = false;
        if(!super.mSystemReady) goto _L7; else goto _L6
_L6:
        if(!mShortcutTriggered && mBackPressed && mVolumeUpPressed)
            mShortcutTriggered = releaseScreenOnProximitySensor();
        if(!mProximitySensor.isHeld()) goto _L7; else goto _L8
_L8:
        k = 0;
_L9:
        return k;
_L3:
        super.mHomePressed = flag1;
_L4:
        k = 0;
          goto _L9
_L5:
        if(!super.mHomePressed) goto _L2; else goto _L10
_L10:
        if(!flag1) {
            super.mHomePressed = false;
            interceptPowerKeyUp(false);
            super.mContext.sendBroadcast(new Intent("com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_SCREEN_BUTTONS"));
        }
        k = 0;
          goto _L9
_L7:
        boolean flag3;
        if(flag)
            flag3 = super.mKeyguardMediator.isShowingAndNotHidden();
        else
            flag3 = super.mKeyguardMediator.isShowing();
        if(!flag && !flag2) goto _L12; else goto _L11
_L11:
        if(!mCameraKeyWakeScreen || !flag3 || j != 27 || flag1)
            break MISSING_BLOCK_LABEL_511;
        k = 4;
          goto _L9
_L12:
        boolean flag5;
        boolean flag6;
        flag5 = true;
        flag6 = false;
        j;
        JVM INSTR lookupswitch 4: default 416
    //                   24: 458
    //                   25: 458
    //                   27: 449
    //                   272: 440;
           goto _L13 _L14 _L14 _L15 _L16
_L13:
        flag5 = false;
_L19:
        if(!flag5)
            break MISSING_BLOCK_LABEL_511;
        if(!flag6) goto _L18; else goto _L17
_L17:
        if(flag1)
            k = 0;
        else
        if(flag3) {
            super.mKeyguardMediator.onWakeKeyWhenKeyguardShowingTq(26, false);
            k = 0;
        } else {
            k = 2;
        }
          goto _L9
_L16:
        flag6 = mTrackballWakeScreen;
          goto _L19
_L15:
        flag6 = mCameraKeyWakeScreen;
          goto _L19
_L14:
        flag6 = mVolumeKeyWakeScreen;
        if(mScreenOffReason == 4)
            flag6 = false;
          goto _L19
_L18:
        i &= -4;
        boolean flag4;
        if(!mShortcutTriggered && mMenuPressed && mVolumeUpPressed) {
            mShortcutTriggered = true;
            setMaxBacklightBrightness();
        }
        if(!mShortcutTriggered && mMenuPressed && mVolumeDownPressed) {
            mShortcutTriggered = true;
            super.mHandler.removeCallbacks(super.mScreenshotChordLongPress);
            super.mHandler.postDelayed(super.mScreenshotChordLongPress, 0L);
        }
        if(!flag1)
            break MISSING_BLOCK_LABEL_678;
        IStatusBarService istatusbarservice;
        IWindowManager iwindowmanager;
        if(j == 26)
            flag4 = true;
        else
            flag4 = false;
        if(flag4) goto _L21; else goto _L20
_L20:
        iwindowmanager = getWindownManagerService();
        RemoteException remoteexception;
        if(iwindowmanager != null && iwindowmanager.isKeyguardLocked() && (j == 25 || j == 24 || j == 164))
            flag4 = true;
_L21:
        if(flag4) {
            istatusbarservice = getStatusBarManagerService();
            if(istatusbarservice != null)
                istatusbarservice.onPanelRevealed();
        }
_L22:
        k = super.interceptKeyBeforeQueueing(keyevent, i, flag);
          goto _L9
        remoteexception;
          goto _L22
    }

    public boolean performHapticFeedbackLw(android.view.WindowManagerPolicy.WindowState windowstate, int i, boolean flag) {
        boolean flag1;
        if(mHapticFeedbackUtil.isSupportedEffect(i))
            flag1 = mHapticFeedbackUtil.performHapticFeedback(i, flag);
        else
            flag1 = super.performHapticFeedbackLw(windowstate, i, flag);
        return flag1;
    }

    public void removeWindowLw(android.view.WindowManagerPolicy.WindowState windowstate) {
        if(super.mStatusBar == windowstate)
            super.mContext.sendBroadcast(new Intent("com.miui.app.ExtraStatusBarManager.UNLOADED"));
        super.removeWindowLw(windowstate);
    }

    public void screenTurnedOff(int i) {
        mVolumeUpPressed = false;
        mVolumeDownPressed = false;
        mMenuPressed = false;
        mScreenOffReason = i;
        releaseScreenOnProximitySensor();
        super.screenTurnedOff(i);
    }

    public void screenTurningOn(android.view.WindowManagerPolicy.ScreenOnListener screenonlistener) {
        super.screenTurningOn(screenonlistener);
        if(screenonlistener == null)
            super.mKeyguardMediator.onScreenTurnedOn(new KeyguardViewManager.ShowListener() {

                public void onShown(IBinder ibinder) {
                }

                final MiuiPhoneWindowManager this$0;

             {
                this$0 = MiuiPhoneWindowManager.this;
                super();
            }
            });
        if(super.mSystemReady && !mDisableProximitor && miui.provider.ExtraSettings.System.getBoolean(super.mContext.getContentResolver(), "enable_screen_on_proximity_sensor", true))
            mProximitySensor.aquire();
    }

    public void showBootMessage(final CharSequence msg, boolean flag) {
        super.mHandler.post(new Runnable() {

            public void run() {
                if(mMiuiBootMsgDialog == null) {
                    mMiuiBootMsgDialog = new Dialog(mContext, 0x10300f0) {

                        public boolean dispatchGenericMotionEvent(MotionEvent motionevent) {
                            return true;
                        }

                        public boolean dispatchKeyEvent(KeyEvent keyevent) {
                            return true;
                        }

                        public boolean dispatchKeyShortcutEvent(KeyEvent keyevent) {
                            return true;
                        }

                        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent) {
                            return true;
                        }

                        public boolean dispatchTouchEvent(MotionEvent motionevent) {
                            return true;
                        }

                        public boolean dispatchTrackballEvent(MotionEvent motionevent) {
                            return true;
                        }

                        final _cls6 this$1;

                     {
                        this$1 = _cls6.this;
                        super(context, i);
                    }
                    };
                    View view = LayoutInflater.from(mMiuiBootMsgDialog.getContext()).inflate(0x603002e, null);
                    mMsgText = (TextView)view.findViewById(0x60b0021);
                    ImageView imageview = (ImageView)view.findViewById(0x60b0022);
                    mMiuiBootMsgDialog.setContentView(view);
                    mMiuiBootMsgDialog.getWindow().setType(2021);
                    mMiuiBootMsgDialog.getWindow().addFlags(258);
                    mMiuiBootMsgDialog.getWindow().setDimAmount(1.0F);
                    android.view.WindowManager.LayoutParams layoutparams = mMiuiBootMsgDialog.getWindow().getAttributes();
                    layoutparams.screenOrientation = 5;
                    mMiuiBootMsgDialog.getWindow().setAttributes(layoutparams);
                    mMiuiBootMsgDialog.getWindow().setBackgroundDrawableResource(0x60201e4);
                    mMiuiBootMsgDialog.setCancelable(false);
                    mMiuiBootMsgDialog.show();
                    mAnimationDrawable = (AnimationDrawable)imageview.getDrawable();
                    mAnimationDrawable.start();
                }
                mMsgText.setText(msg);
            }

            final MiuiPhoneWindowManager this$0;
            final CharSequence val$msg;

             {
                this$0 = MiuiPhoneWindowManager.this;
                msg = charsequence;
                super();
            }
        });
    }

    public void systemReady() {
        super.systemReady();
        mProximitySensor = new MiuiScreenOnProximityLock(super.mContext);
    }

    private static final int BTN_MOUSE = 272;
    static final int TYPE_LAYER_MULTIPLIER = 10000;
    static final int TYPE_LAYER_OFFSET = 1000;
    private static HashSet sBackLongPressWhiteList;
    private AnimationDrawable mAnimationDrawable;
    private BackLongPressRunnable mBackLongPress;
    boolean mBackLongPressed;
    private boolean mBackPressed;
    private Binder mBinder;
    boolean mCameraKeyWakeScreen;
    private boolean mDisableProximitor;
    private int mDownX;
    private int mDownY;
    private HapticFeedbackUtil mHapticFeedbackUtil;
    private boolean mHasCameraFlash;
    private boolean mHomeDownWhileScreenOn;
    private boolean mIsStatusBarVisibleInFullscreen;
    private boolean mIsTouchDown;
    private MagnifierPopupWindow mMagnifier;
    private InputChannel mMagnifierInputChannel;
    private InputEventReceiver mMagnifierInputEventReceiver;
    private boolean mMenuPressed;
    private Dialog mMiuiBootMsgDialog;
    private TextView mMsgText;
    Runnable mPowerLongPressOriginal;
    private MiuiScreenOnProximityLock mProximitySensor;
    boolean mScreenButtonsDisabled;
    private int mScreenOffReason;
    BroadcastReceiver mScreenshotReceiver;
    private boolean mShortcutTriggered;
    private boolean mShowMagnifier;
    BroadcastReceiver mShowMagnifierReceiver;
    BroadcastReceiver mStatusBarExitFullscreenReceiver;
    private InputChannel mStatusBarInputChannel;
    private InputEventReceiver mStatusBarInputEventReceiver;
    private boolean mTorchEnabled;
    boolean mTrackballWakeScreen;
    private boolean mVolumeDownPressed;
    boolean mVolumeKeyWakeScreen;
    private boolean mVolumeUpPressed;

    static  {
        sBackLongPressWhiteList = new HashSet();
        sBackLongPressWhiteList.add("com.android.systemui");
        sBackLongPressWhiteList.add("com.android.phone");
        sBackLongPressWhiteList.add("com.android.mms");
        sBackLongPressWhiteList.add("com.android.contacts");
        sBackLongPressWhiteList.add("com.miui.home");
        sBackLongPressWhiteList.add("com.miui.fmradio");
    }





/*
    static int access$202(MiuiPhoneWindowManager miuiphonewindowmanager, int i) {
        miuiphonewindowmanager.mDownX = i;
        return i;
    }

*/



/*
    static int access$302(MiuiPhoneWindowManager miuiphonewindowmanager, int i) {
        miuiphonewindowmanager.mDownY = i;
        return i;
    }

*/



/*
    static boolean access$402(MiuiPhoneWindowManager miuiphonewindowmanager, boolean flag) {
        miuiphonewindowmanager.mIsTouchDown = flag;
        return flag;
    }

*/



/*
    static boolean access$502(MiuiPhoneWindowManager miuiphonewindowmanager, boolean flag) {
        miuiphonewindowmanager.mShowMagnifier = flag;
        return flag;
    }

*/



/*
    static Dialog access$702(MiuiPhoneWindowManager miuiphonewindowmanager, Dialog dialog) {
        miuiphonewindowmanager.mMiuiBootMsgDialog = dialog;
        return dialog;
    }

*/



/*
    static TextView access$802(MiuiPhoneWindowManager miuiphonewindowmanager, TextView textview) {
        miuiphonewindowmanager.mMsgText = textview;
        return textview;
    }

*/



/*
    static AnimationDrawable access$902(MiuiPhoneWindowManager miuiphonewindowmanager, AnimationDrawable animationdrawable) {
        miuiphonewindowmanager.mAnimationDrawable = animationdrawable;
        return animationdrawable;
    }

*/
}
