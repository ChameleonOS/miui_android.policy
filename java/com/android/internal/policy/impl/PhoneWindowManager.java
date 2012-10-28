// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.content.res.*;
import android.database.ContentObserver;
import android.graphics.Rect;
import android.media.AudioManager;
import android.media.IAudioService;
import android.os.*;
import android.service.dreams.IDreamManager;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.android.internal.policy.PolicyManager;
import com.android.internal.statusbar.IStatusBarService;
import com.android.internal.telephony.ITelephony;
import com.android.internal.widget.PointerLocationView;
import java.io.*;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewMediator, MiuiKeyguardViewMediator, ShortcutManager, MiuiGlobalActions, 
//            RecentApplicationsDialog

public class PhoneWindowManager
    implements WindowManagerPolicy {
    final class HideNavInputEventReceiver extends InputEventReceiver {

        public void onInputEvent(InputEvent inputevent) {
            boolean flag;
            if(!(inputevent instanceof MotionEvent) || (2 & inputevent.getSource()) == 0 || ((MotionEvent)inputevent).getAction() != 0)
                break MISSING_BLOCK_LABEL_153;
            flag = false;
            synchronized(mLock) {
                int i = 4 | (1 | (2 | mResettingSystemUiFlags));
                if(mResettingSystemUiFlags != i) {
                    mResettingSystemUiFlags = i;
                    flag = true;
                }
                int j = 2 | mForceClearedSystemUiFlags;
                if(mForceClearedSystemUiFlags != j) {
                    mForceClearedSystemUiFlags = j;
                    flag = true;
                    mHandler.postDelayed(new Runnable() {

                        public void run() {
                            synchronized(mLock) {
                                PhoneWindowManager phonewindowmanager = _fld0;
                                phonewindowmanager.mForceClearedSystemUiFlags = -3 & phonewindowmanager.mForceClearedSystemUiFlags;
                            }
                            mWindowManagerFuncs.reevaluateStatusBarVisibility();
                            return;
                            exception2;
                            obj1;
                            JVM INSTR monitorexit ;
                            throw exception2;
                        }

                        final HideNavInputEventReceiver this$1;

                 {
                    this$1 = HideNavInputEventReceiver.this;
                    super();
                }
                    }, 1000L);
                }
            }
            if(!flag)
                break MISSING_BLOCK_LABEL_153;
            mWindowManagerFuncs.reevaluateStatusBarVisibility();
            finishInputEvent(inputevent, false);
            return;
            exception1;
            obj;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            finishInputEvent(inputevent, false);
            throw exception;
        }

        final PhoneWindowManager this$0;

        public HideNavInputEventReceiver(InputChannel inputchannel, Looper looper) {
            this$0 = PhoneWindowManager.this;
            super(inputchannel, looper);
        }
    }

    class MyOrientationListener extends WindowOrientationListener {

        public void onProposedRotationChanged(int i) {
            updateRotation(false);
        }

        final PhoneWindowManager this$0;

        MyOrientationListener(Context context) {
            this$0 = PhoneWindowManager.this;
            super(context);
        }
    }

    class SettingsObserver extends ContentObserver {

        void observe() {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("end_button_behavior"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("incall_power_button_behavior"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("accelerometer_rotation"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("user_rotation"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_off_timeout"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("pointer_location"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("default_input_method"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("fancy_rotation_anim"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.Secure.getUriFor("screensaver_enabled"), false, this);
            updateSettings();
        }

        public void onChange(boolean flag) {
            updateSettings();
            updateRotation(false);
        }

        final PhoneWindowManager this$0;

        SettingsObserver(Handler handler) {
            this$0 = PhoneWindowManager.this;
            super(handler);
        }
    }

    private class PolicyHandler extends Handler {

        public void handleMessage(Message message) {
            message.what;
            JVM INSTR tableswitch 1 4: default 36
        //                       1 37
        //                       2 47
        //                       3 57
        //                       4 74;
               goto _L1 _L2 _L3 _L4 _L5
_L1:
            return;
_L2:
            enablePointerLocation();
            continue; /* Loop/switch isn't completed */
_L3:
            disablePointerLocation();
            continue; /* Loop/switch isn't completed */
_L4:
            dispatchMediaKeyWithWakeLock((KeyEvent)message.obj);
            continue; /* Loop/switch isn't completed */
_L5:
            dispatchMediaKeyRepeatWithWakeLock((KeyEvent)message.obj);
            if(true) goto _L1; else goto _L6
_L6:
        }

        final PhoneWindowManager this$0;

        private PolicyHandler() {
            this$0 = PhoneWindowManager.this;
            super();
        }

    }

    private static final class PointerLocationInputEventReceiver extends InputEventReceiver {

        public void onInputEvent(InputEvent inputevent) {
            boolean flag = false;
            if(!(inputevent instanceof MotionEvent) || (2 & inputevent.getSource()) == 0)
                break MISSING_BLOCK_LABEL_35;
            MotionEvent motionevent = (MotionEvent)inputevent;
            mView.addPointerEvent(motionevent);
            flag = true;
            finishInputEvent(inputevent, flag);
            return;
            Exception exception;
            exception;
            finishInputEvent(inputevent, false);
            throw exception;
        }

        private final PointerLocationView mView;

        public PointerLocationInputEventReceiver(InputChannel inputchannel, Looper looper, PointerLocationView pointerlocationview) {
            super(inputchannel, looper);
            mView = pointerlocationview;
        }
    }

    static class Injector {

        static boolean getNeedsMenuLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManagerPolicy.WindowState windowstate1) {
            return true;
        }

        static void performReleaseHapticFeedback(PhoneWindowManager phonewindowmanager, KeyEvent keyevent, int i) {
            boolean flag;
            if(keyevent.getAction() == 0)
                flag = true;
            else
                flag = false;
            if(!flag && (i & 0x100) != 0 && keyevent.getRepeatCount() == 0)
                phonewindowmanager.performHapticFeedbackLw(null, 2, false);
        }

        static void sendPowerUpBroadcast(PhoneWindowManager phonewindowmanager) {
            if(phonewindowmanager.getContext() != null)
                phonewindowmanager.getContext().sendBroadcast(new Intent("android.intent.action.KEYCODE_POWER_UP"));
        }

        Injector() {
        }
    }


    public PhoneWindowManager() {
        mEnableShiftMenuBugReports = false;
        mStatusBar = null;
        mNavigationBar = null;
        mHasNavigationBar = false;
        mCanHideNavigationBar = false;
        mNavigationBarCanMove = false;
        mNavigationBarOnBottom = true;
        mNavigationBarHeightForRotation = new int[4];
        mNavigationBarWidthForRotation = new int[4];
        mKeyguard = null;
        mLastInputMethodWindow = null;
        mLastInputMethodTargetWindow = null;
        mLidState = -1;
        mDockMode = 0;
        mUserRotationMode = 0;
        mUserRotation = 0;
        mAllowAllRotations = -1;
        mLongPressOnPowerBehavior = -1;
        mScreenOnEarly = false;
        mScreenOnFully = false;
        mOrientationSensorEnabled = false;
        mCurrentAppOrientation = -1;
        mHasSoftInput = false;
        mPointerLocationMode = 0;
        mResettingSystemUiFlags = 0;
        mForceClearedSystemUiFlags = 0;
        mLastFocusNeedsMenu = false;
        mHideNavFakeWindow = null;
        mScreenSaverTimeout = 0;
        mScreenSaverEnabledByUser = false;
        mScreenSaverMayRun = true;
        mLandscapeRotation = 0;
        mSeascapeRotation = 0;
        mPortraitRotation = 0;
        mUpsideDownRotation = 0;
        mLongPressOnHomeBehavior = -1;
        mHDMIObserver = new UEventObserver() {

            public void onUEvent(android.os.UEventObserver.UEvent uevent) {
                setHdmiPlugged("1".equals(uevent.get("SWITCH_STATE")));
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        };
        mPowerLongPress = new Runnable() {

            public void run() {
                if(mLongPressOnPowerBehavior < 0)
                    mLongPressOnPowerBehavior = mContext.getResources().getInteger(0x10e0016);
                mLongPressOnPowerBehavior;
                JVM INSTR tableswitch 0 2: default 64
            //                           0 64
            //                           1 65
            //                           2 103;
                   goto _L1 _L1 _L2 _L3
_L1:
                return;
_L2:
                mPowerKeyHandled = true;
                performHapticFeedbackLw(null, 0, false);
                sendCloseSystemWindows("globalactions");
                showGlobalActionsDialog();
                continue; /* Loop/switch isn't completed */
_L3:
                mPowerKeyHandled = true;
                performHapticFeedbackLw(null, 0, false);
                sendCloseSystemWindows("globalactions");
                mWindowManagerFuncs.shutdown();
                if(true) goto _L1; else goto _L4
_L4:
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        };
        mScreenshotConnection = null;
        mDockReceiver = new BroadcastReceiver() {

            public void onReceive(Context context, Intent intent) {
                if("android.intent.action.DOCK_EVENT".equals(intent.getAction()))
                    mDockMode = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
                else
                    try {
                        IUiModeManager iuimodemanager = android.app.IUiModeManager.Stub.asInterface(ServiceManager.getService("uimode"));
                        mUiMode = iuimodemanager.getCurrentModeType();
                    }
                    catch(RemoteException remoteexception) { }
                updateRotation(true);
                updateOrientationListenerLp();
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        };
        mPowerReceiver = new BroadcastReceiver() {

            public void onReceive(Context context, Intent intent) {
                boolean flag = false;
                if("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
                    PhoneWindowManager phonewindowmanager = PhoneWindowManager.this;
                    if(intent.getIntExtra("plugged", 0) != 0)
                        flag = true;
                    phonewindowmanager.mPluggedIn = flag;
                }
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        };
        mBootMsgDialog = null;
        mScreenLockTimeout = new Runnable() {

            public void run() {
                this;
                JVM INSTR monitorenter ;
                if(mKeyguardMediator != null)
                    mKeyguardMediator.doKeyguardTimeout();
                mLockScreenTimerActive = false;
                return;
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        };
    }

    private void applyLidSwitchState() {
        mPowerManager.setKeyboardVisibility(isBuiltInKeyboardVisible());
        if(mLidState == 0 && mLidControlsSleep)
            mPowerManager.goToSleep(SystemClock.uptimeMillis());
    }

    private void applyStableConstraints(int i, int j, Rect rect) {
        if((i & 0x100) == 0) goto _L2; else goto _L1
_L1:
        if((j & 0x400) == 0) goto _L4; else goto _L3
_L3:
        if(rect.left < mStableFullscreenLeft)
            rect.left = mStableFullscreenLeft;
        if(rect.top < mStableFullscreenTop)
            rect.top = mStableFullscreenTop;
        if(rect.right > mStableFullscreenRight)
            rect.right = mStableFullscreenRight;
        if(rect.bottom > mStableFullscreenBottom)
            rect.bottom = mStableFullscreenBottom;
_L2:
        return;
_L4:
        if(rect.left < mStableLeft)
            rect.left = mStableLeft;
        if(rect.top < mStableTop)
            rect.top = mStableTop;
        if(rect.right > mStableRight)
            rect.right = mStableRight;
        if(rect.bottom > mStableBottom)
            rect.bottom = mStableBottom;
        if(true) goto _L2; else goto _L5
_L5:
    }

    private void cancelPendingPowerKeyAction() {
        if(!mPowerKeyHandled)
            mHandler.removeCallbacks(mPowerLongPress);
        if(mPowerKeyTriggered)
            mPendingPowerKeyUpCanceled = true;
    }

    private void cancelPendingScreenshotChordAction() {
        mHandler.removeCallbacks(mScreenshotChordLongPress);
    }

    private void disablePointerLocation() {
        if(mPointerLocationInputEventReceiver != null) {
            mPointerLocationInputEventReceiver.dispose();
            mPointerLocationInputEventReceiver = null;
        }
        if(mPointerLocationInputChannel != null) {
            mPointerLocationInputChannel.dispose();
            mPointerLocationInputChannel = null;
        }
        if(mPointerLocationView != null) {
            ((WindowManager)mContext.getSystemService("window")).removeView(mPointerLocationView);
            mPointerLocationView = null;
        }
    }

    private void enablePointerLocation() {
        if(mPointerLocationView == null) {
            mPointerLocationView = new PointerLocationView(mContext);
            mPointerLocationView.setPrintCoords(false);
            android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -1);
            layoutparams.type = 2015;
            layoutparams.flags = 1304;
            layoutparams.format = -3;
            layoutparams.setTitle("PointerLocation");
            WindowManager windowmanager = (WindowManager)mContext.getSystemService("window");
            layoutparams.inputFeatures = 2 | layoutparams.inputFeatures;
            windowmanager.addView(mPointerLocationView, layoutparams);
            mPointerLocationInputChannel = mWindowManagerFuncs.monitorInput("PointerLocationView");
            mPointerLocationInputEventReceiver = new PointerLocationInputEventReceiver(mPointerLocationInputChannel, Looper.myLooper(), mPointerLocationView);
        }
    }

    static IAudioService getAudioService() {
        IAudioService iaudioservice = android.media.IAudioService.Stub.asInterface(ServiceManager.checkService("audio"));
        if(iaudioservice == null)
            Log.w("WindowManager", "Unable to find IAudioService interface.");
        return iaudioservice;
    }

    private IDreamManager getDreamManager() {
        if(mScreenSaverFeatureAvailable) goto _L2; else goto _L1
_L1:
        IDreamManager idreammanager = null;
_L4:
        return idreammanager;
_L2:
        idreammanager = android.service.dreams.IDreamManager.Stub.asInterface(ServiceManager.checkService("dreams"));
        if(idreammanager == null)
            Log.w("WindowManager", "Unable to find IDreamManager");
        if(true) goto _L4; else goto _L3
_L3:
    }

    static long[] getLongIntArray(Resources resources, int i) {
        int ai[] = resources.getIntArray(i);
        long al[];
        if(ai == null) {
            al = null;
        } else {
            al = new long[ai.length];
            int j = 0;
            while(j < ai.length)  {
                al[j] = ai[j];
                j++;
            }
        }
        return al;
    }

    private SearchManager getSearchManager() {
        if(mSearchManager == null)
            mSearchManager = (SearchManager)mContext.getSystemService("search");
        return mSearchManager;
    }

    static ITelephony getTelephonyService() {
        return com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
    }

    private void handleLongPressOnHome() {
        if(mLongPressOnHomeBehavior < 0) {
            mLongPressOnHomeBehavior = mContext.getResources().getInteger(0x10e0021);
            if(mLongPressOnHomeBehavior < 0 || mLongPressOnHomeBehavior > 2)
                mLongPressOnHomeBehavior = 0;
        }
        if(mLongPressOnHomeBehavior != 0) {
            performHapticFeedbackLw(null, 0, false);
            sendCloseSystemWindows("recentapps");
            mHomeLongPressed = true;
        }
        if(mLongPressOnHomeBehavior != 1) goto _L2; else goto _L1
_L1:
        showOrHideRecentAppsDialog(0);
_L4:
        return;
_L2:
        if(mLongPressOnHomeBehavior == 2)
            try {
                IStatusBarService istatusbarservice = getStatusBarService();
                if(istatusbarservice != null)
                    istatusbarservice.toggleRecentApps();
            }
            catch(RemoteException remoteexception) {
                Slog.e("WindowManager", "RemoteException when showing recent apps", remoteexception);
                mStatusBarService = null;
            }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private boolean interceptFallback(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i) {
        boolean flag = true;
        if((1 & interceptKeyBeforeQueueing(keyevent, i, flag)) == 0 || interceptKeyBeforeDispatching(windowstate, keyevent, i) != 0L)
            flag = false;
        return flag;
    }

    private void interceptPowerKeyDown(boolean flag) {
        mPowerKeyHandled = flag;
        if(!flag)
            mHandler.postDelayed(mPowerLongPress, ViewConfiguration.getGlobalActionKeyTimeout());
    }

    private boolean interceptPowerKeyUp(boolean flag) {
        boolean flag1 = false;
        if(!mPowerKeyHandled) {
            mHandler.removeCallbacks(mPowerLongPress);
            if(!flag)
                flag1 = true;
        }
        return flag1;
    }

    private void interceptScreenshotChord() {
        if(mScreenshotChordEnabled && mVolumeDownKeyTriggered && mPowerKeyTriggered && !mVolumeUpKeyTriggered) {
            long l = SystemClock.uptimeMillis();
            if(l <= 150L + mVolumeDownKeyTime && l <= 150L + mPowerKeyTime) {
                mVolumeDownKeyConsumedByScreenshotChord = true;
                cancelPendingPowerKeyAction();
                mHandler.postDelayed(mScreenshotChordLongPress, ViewConfiguration.getGlobalActionKeyTimeout());
            }
        }
    }

    private boolean isAnyPortrait(int i) {
        boolean flag;
        if(i == mPortraitRotation || i == mUpsideDownRotation)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean isBuiltInKeyboardVisible() {
        boolean flag;
        if(mHaveBuiltInKeyboard && !isHidden(mLidKeyboardAccessibility))
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean isHidden(int i) {
        boolean flag = true;
        i;
        JVM INSTR tableswitch 1 2: default 24
    //                   1 28
    //                   2 40;
           goto _L1 _L2 _L3
_L1:
        flag = false;
_L5:
        return flag;
_L2:
        if(mLidState != 0)
            flag = false;
        continue; /* Loop/switch isn't completed */
_L3:
        if(mLidState != flag)
            flag = false;
        if(true) goto _L5; else goto _L4
_L4:
    }

    private boolean isLandscapeOrSeascape(int i) {
        boolean flag;
        if(i == mLandscapeRotation || i == mSeascapeRotation)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean keyguardIsShowingTq() {
        boolean flag;
        if(mKeyguardMediator == null)
            flag = false;
        else
            flag = mKeyguardMediator.isShowingAndNotHidden();
        return flag;
    }

    private void launchAssistAction() {
        Intent intent;
        sendCloseSystemWindows("assist");
        intent = SearchManager.getAssistIntent(mContext);
        if(intent == null)
            break MISSING_BLOCK_LABEL_34;
        intent.setFlags(0x34000000);
        mContext.startActivity(intent);
_L1:
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Slog.w("WindowManager", "No activity to handle assist action.", activitynotfoundexception);
          goto _L1
    }

    private void launchAssistLongPressAction() {
        Intent intent;
        performHapticFeedbackLw(null, 0, false);
        sendCloseSystemWindows("assist");
        intent = new Intent("android.intent.action.SEARCH_LONG_PRESS");
        intent.setFlags(0x10000000);
        SearchManager searchmanager = getSearchManager();
        if(searchmanager != null)
            searchmanager.stopSearch();
        mContext.startActivity(intent);
_L1:
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Slog.w("WindowManager", "No activity to handle assist long press action.", activitynotfoundexception);
          goto _L1
    }

    private void offsetInputMethodWindowLw(android.view.WindowManagerPolicy.WindowState windowstate) {
        int i = windowstate.getContentFrameLw().top + windowstate.getGivenContentInsetsLw().top;
        if(mContentBottom > i)
            mContentBottom = i;
        int j = windowstate.getVisibleFrameLw().top + windowstate.getGivenVisibleInsetsLw().top;
        if(mCurBottom > j)
            mCurBottom = j;
    }

    private int readRotation(int i) {
        int j = mContext.getResources().getInteger(i);
        j;
        JVM INSTR lookupswitch 4: default 56
    //                   0: 61
    //                   90: 66
    //                   180: 71
    //                   270: 76;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        byte byte0 = -1;
_L7:
        return byte0;
_L2:
        byte0 = 0;
        continue; /* Loop/switch isn't completed */
_L3:
        byte0 = 1;
        continue; /* Loop/switch isn't completed */
_L4:
        byte0 = 2;
        continue; /* Loop/switch isn't completed */
_L5:
        byte0 = 3;
        if(true) goto _L7; else goto _L6
_L6:
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
        if(true) goto _L1; else goto _L8
_L8:
    }

    static void sendCloseSystemWindows(Context context, String s) {
        if(!ActivityManagerNative.isSystemReady())
            break MISSING_BLOCK_LABEL_15;
        ActivityManagerNative.getDefault().closeSystemDialogs(s);
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    private void takeScreenshot() {
        Object obj = mScreenshotLock;
        obj;
        JVM INSTR monitorenter ;
        if(mScreenshotConnection == null) {
            ComponentName componentname = new ComponentName("com.android.systemui", "com.android.systemui.screenshot.TakeScreenshotService");
            Intent intent = new Intent();
            intent.setComponent(componentname);
            ServiceConnection serviceconnection = new ServiceConnection() {

                public void onServiceConnected(ComponentName componentname1, IBinder ibinder) {
                    Object obj1 = mScreenshotLock;
                    obj1;
                    JVM INSTR monitorenter ;
                    Messenger messenger;
                    Message message;
                    if(mScreenshotConnection != this)
                        break MISSING_BLOCK_LABEL_172;
                    messenger = new Messenger(ibinder);
                    message = Message.obtain(null, 1);
                    message.replyTo = new Messenger(new Handler(this) {

                        public void handleMessage(Message message1) {
                            Object obj2 = mScreenshotLock;
                            obj2;
                            JVM INSTR monitorenter ;
                            if(mScreenshotConnection == myConn) {
                                mContext.unbindService(mScreenshotConnection);
                                mScreenshotConnection = null;
                                mHandler.removeCallbacks(mScreenshotTimeout);
                            }
                            return;
                        }

                        final _cls11 this$1;
                        final ServiceConnection val$myConn;

                     {
                        this$1 = _cls11.this;
                        myConn = serviceconnection;
                        super(final_looper);
                    }
                    });
                    message.arg2 = 0;
                    message.arg1 = 0;
                    if(mStatusBar != null && mStatusBar.isVisibleLw())
                        message.arg1 = 1;
                    if(mNavigationBar != null && mNavigationBar.isVisibleLw())
                        message.arg2 = 1;
                    Exception exception;
                    try {
                        messenger.send(message);
                    }
                    catch(RemoteException remoteexception) { }
                    obj1;
                    JVM INSTR monitorexit ;
                    break MISSING_BLOCK_LABEL_172;
                    exception;
                    throw exception;
                }

                public void onServiceDisconnected(ComponentName componentname1) {
                }

                final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
            };
            if(mContext.bindService(intent, serviceconnection, 1)) {
                mScreenshotConnection = serviceconnection;
                mHandler.postDelayed(mScreenshotTimeout, 10000L);
            }
        }
        return;
    }

    private void updateLockScreenTimeout() {
        Runnable runnable = mScreenLockTimeout;
        runnable;
        JVM INSTR monitorenter ;
        boolean flag;
        if(mAllowLockscreenWhenOn && mScreenOnEarly && mKeyguardMediator != null && mKeyguardMediator.isSecure())
            flag = true;
        else
            flag = false;
        if(mLockScreenTimerActive != flag) {
            if(flag)
                mHandler.postDelayed(mScreenLockTimeout, mLockScreenTimeout);
            else
                mHandler.removeCallbacks(mScreenLockTimeout);
            mLockScreenTimerActive = flag;
        }
        return;
    }

    private int updateSystemUiVisibilityLw() {
        int i;
        if(mFocusedWindow == null) {
            i = 0;
        } else {
            final int visibility = mFocusedWindow.getSystemUiVisibility() & (-1 ^ mResettingSystemUiFlags) & (-1 ^ mForceClearedSystemUiFlags);
            i = visibility ^ mLastSystemUiFlags;
            final boolean needsMenu = Injector.getNeedsMenuLw(mFocusedWindow, mTopFullscreenOpaqueWindowState);
            if(i == 0 && mLastFocusNeedsMenu == needsMenu && mFocusedApp == mFocusedWindow.getAppToken()) {
                i = 0;
            } else {
                mLastSystemUiFlags = visibility;
                mLastFocusNeedsMenu = needsMenu;
                mFocusedApp = mFocusedWindow.getAppToken();
                mHandler.post(new Runnable() {

                    public void run() {
                        IStatusBarService istatusbarservice = getStatusBarService();
                        if(istatusbarservice != null) {
                            istatusbarservice.setSystemUiVisibility(visibility, -1);
                            istatusbarservice.topAppWindowChanged(needsMenu);
                        }
_L1:
                        return;
                        RemoteException remoteexception;
                        remoteexception;
                        mStatusBarService = null;
                          goto _L1
                    }

                    final PhoneWindowManager this$0;
                    final boolean val$needsMenu;
                    final int val$visibility;

             {
                this$0 = PhoneWindowManager.this;
                visibility = i;
                needsMenu = flag;
                super();
            }
                });
            }
        }
        return i;
    }

    public View addStartingWindow(IBinder ibinder, String s, int i, CompatibilityInfo compatibilityinfo, CharSequence charsequence, int j, int k, 
            int l) {
        if(s != null) goto _L2; else goto _L1
_L1:
        View view = null;
_L7:
        return view;
_L2:
        Context context;
        int i1;
        context = mContext;
        i1 = context.getThemeResId();
        if(i == i1 && j == 0)
            break MISSING_BLOCK_LABEL_49;
        RuntimeException runtimeexception;
        android.view.WindowManager.BadTokenException badtokenexception;
        Window window;
        TypedArray typedarray;
        android.view.ViewParent viewparent;
        try {
            context = context.createPackageContext(s, 0);
            context.setTheme(i);
        }
        catch(android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) { }
        window = PolicyManager.makeNewWindow(context);
        typedarray = window.getWindowStyle();
        if(!typedarray.getBoolean(12, false) && !typedarray.getBoolean(14, false)) goto _L4; else goto _L3
_L4:
        window.setTitle(context.getResources().getText(j, charsequence));
        window.setType(3);
        window.setFlags(0x20000 | (8 | (l | 0x10)), 0x20000 | (8 | (l | 0x10)));
        if(!compatibilityinfo.supportsScreen())
            window.addFlags(0x20000000);
        window.setLayout(-1, -1);
        android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
        layoutparams.token = ibinder;
        layoutparams.packageName = s;
        layoutparams.windowAnimations = window.getWindowStyle().getResourceId(8, 0);
        layoutparams.privateFlags = 1 | layoutparams.privateFlags;
        layoutparams.setTitle((new StringBuilder()).append("Starting ").append(s).toString());
        WindowManager windowmanager = (WindowManager)context.getSystemService("window");
        view = window.getDecorView();
        if(window.isFloating()) {
            view = null;
            continue; /* Loop/switch isn't completed */
        }
        windowmanager.addView(view, layoutparams);
        viewparent = view.getParent();
        if(viewparent == null)
            view = null;
        continue; /* Loop/switch isn't completed */
        badtokenexception;
        Log.w("WindowManager", (new StringBuilder()).append(ibinder).append(" already running, starting window not displayed").toString());
_L5:
        view = null;
        continue; /* Loop/switch isn't completed */
        runtimeexception;
        Log.w("WindowManager", (new StringBuilder()).append(ibinder).append(" failed creating starting window").toString(), runtimeexception);
        if(true) goto _L5; else goto _L3
_L3:
        view = null;
        if(true) goto _L7; else goto _L6
_L6:
    }

    public void adjustConfigurationLw(Configuration configuration, int i, int j) {
        boolean flag;
        if((i & 1) != 0)
            flag = true;
        else
            flag = false;
        mHaveBuiltInKeyboard = flag;
        readLidState();
        applyLidSwitchState();
        if(configuration.keyboard == 1 || i == 1 && isHidden(mLidKeyboardAccessibility)) {
            configuration.hardKeyboardHidden = 2;
            if(!mHasSoftInput)
                configuration.keyboardHidden = 2;
        }
        if(configuration.navigation == 1 || j == 1 && isHidden(mLidNavigationAccessibility))
            configuration.navigationHidden = 2;
    }

    public int adjustSystemUiVisibilityLw(int i) {
        mResettingSystemUiFlags = i & mResettingSystemUiFlags;
        return i & (-1 ^ mResettingSystemUiFlags) & (-1 ^ mForceClearedSystemUiFlags);
    }

    public void adjustWindowParamsLw(android.view.WindowManager.LayoutParams layoutparams) {
        layoutparams.type;
        JVM INSTR lookupswitch 3: default 40
    //                   2005: 41
    //                   2006: 41
    //                   2015: 41;
           goto _L1 _L2 _L2 _L2
_L1:
        return;
_L2:
        layoutparams.flags = 0x18 | layoutparams.flags;
        layoutparams.flags = 0xfffbffff & layoutparams.flags;
        if(true) goto _L1; else goto _L3
_L3:
    }

    public boolean allowAppAnimationsLw() {
        boolean flag;
        if(mKeyguard != null && mKeyguard.isVisibleLw() && !mKeyguard.isAnimatingLw())
            flag = false;
        else
            flag = true;
        return flag;
    }

    public boolean allowKeyRepeat() {
        return mScreenOnEarly;
    }

    public void animatingWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        if(mTopFullscreenOpaqueWindowState == null && windowstate.isVisibleOrBehindKeyguardLw() && !windowstate.isGoneForLayoutLw()) {
            if((0x800 & layoutparams.flags) != 0)
                mForceStatusBar = true;
            if(layoutparams.type >= 1 && layoutparams.type <= 99 && layoutparams.x == 0 && layoutparams.y == 0 && ((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1 && layoutparams.height == -1) {
                mTopFullscreenOpaqueWindowState = windowstate;
                if((0x80000 & layoutparams.flags) != 0)
                    mHideLockScreen = true;
                if((0x400000 & layoutparams.flags) != 0)
                    mDismissKeyguard = true;
                if((1 & layoutparams.flags) != 0)
                    mAllowLockscreenWhenOn = true;
            }
        }
    }

    public void beginAnimationLw(int i, int j) {
        mTopFullscreenOpaqueWindowState = null;
        mForceStatusBar = false;
        mHideLockScreen = false;
        mAllowLockscreenWhenOn = false;
        mDismissKeyguard = false;
    }

    public void beginLayoutLw(int i, int j, int k) {
        boolean flag2;
        boolean flag4;
        mUnrestrictedScreenTop = 0;
        mUnrestrictedScreenLeft = 0;
        mUnrestrictedScreenWidth = i;
        mUnrestrictedScreenHeight = j;
        mRestrictedScreenTop = 0;
        mRestrictedScreenLeft = 0;
        mRestrictedScreenWidth = i;
        mRestrictedScreenHeight = j;
        mCurLeft = 0;
        mSystemLeft = 0;
        mStableFullscreenLeft = 0;
        mStableLeft = 0;
        mContentLeft = 0;
        mDockLeft = 0;
        mCurTop = 0;
        mSystemTop = 0;
        mStableFullscreenTop = 0;
        mStableTop = 0;
        mContentTop = 0;
        mDockTop = 0;
        mCurRight = i;
        mSystemRight = i;
        mStableFullscreenRight = i;
        mStableRight = i;
        mContentRight = i;
        mDockRight = i;
        mCurBottom = j;
        mSystemBottom = j;
        mStableFullscreenBottom = j;
        mStableBottom = j;
        mContentBottom = j;
        mDockBottom = j;
        mDockLayer = 0x10000000;
        mStatusBarLayer = -1;
        Rect rect = mTmpParentFrame;
        Rect rect1 = mTmpDisplayFrame;
        Rect rect2 = mTmpVisibleFrame;
        int l = mDockLeft;
        rect2.left = l;
        rect1.left = l;
        rect.left = l;
        int i1 = mDockTop;
        rect2.top = i1;
        rect1.top = i1;
        rect.top = i1;
        int j1 = mDockRight;
        rect2.right = j1;
        rect1.right = j1;
        rect.right = j1;
        int k1 = mDockBottom;
        rect2.bottom = k1;
        rect1.bottom = k1;
        rect.bottom = k1;
        boolean flag;
        boolean flag1;
        int l1;
        int i2;
        int j2;
        int k2;
        int l2;
        int i3;
        int j3;
        int k3;
        int j4;
        int k4;
        int l4;
        int i5;
        int j5;
        int k5;
        int l5;
        if((2 & mLastSystemUiFlags) == 0)
            flag = true;
        else
            flag = false;
        if(flag) {
            if(mHideNavFakeWindow != null) {
                mHideNavFakeWindow.dismiss();
                mHideNavFakeWindow = null;
            }
        } else
        if(mHideNavFakeWindow == null)
            mHideNavFakeWindow = mWindowManagerFuncs.addFakeWindow(mHandler.getLooper(), mHideNavInputEventReceiverFactory, "hidden nav", 2022, 0, false, false, true);
        if(!mCanHideNavigationBar)
            flag1 = true;
        else
            flag1 = false;
        flag2 = flag | flag1;
        if(mNavigationBar == null) goto _L2; else goto _L1
_L1:
        boolean flag3;
        if(!mNavigationBarCanMove || i < j)
            flag3 = true;
        else
            flag3 = false;
        mNavigationBarOnBottom = flag3;
        if(!mNavigationBarOnBottom)
            break MISSING_BLOCK_LABEL_1075;
        j5 = j - mNavigationBarHeightForRotation[k];
        if(!mHdmiPlugged) goto _L4; else goto _L3
_L3:
        if(mExternalDisplayHeight <= 0 || j <= 0) goto _L6; else goto _L5
_L5:
        boolean flag5;
        boolean flag6;
        if((float)mExternalDisplayWidth / (float)mExternalDisplayHeight > 1.0F)
            flag5 = true;
        else
            flag5 = false;
        if((float)i / (float)j > 1.0F)
            flag6 = true;
        else
            flag6 = false;
        if(flag5 != flag6) goto _L6; else goto _L7
_L7:
        flag4 = true;
_L8:
        if(flag4) {
            l5 = mExternalDisplayHeight;
            if(j5 > l5)
                j5 = mExternalDisplayHeight;
        }
_L4:
        mTmpNavigationFrame.set(0, j5, i, j);
        k5 = mTmpNavigationFrame.top;
        mStableFullscreenBottom = k5;
        mStableBottom = k5;
        if(flag2) {
            mNavigationBar.showLw(true);
            mDockBottom = mTmpNavigationFrame.top;
            mRestrictedScreenHeight = mDockBottom - mDockTop;
        } else {
            mNavigationBar.hideLw(true);
        }
        if(flag2 && !mNavigationBar.isAnimatingLw())
            mSystemBottom = mTmpNavigationFrame.top;
_L9:
        j4 = mDockTop;
        mCurTop = j4;
        mContentTop = j4;
        k4 = mDockBottom;
        mCurBottom = k4;
        mContentBottom = k4;
        l4 = mDockLeft;
        mCurLeft = l4;
        mContentLeft = l4;
        i5 = mDockRight;
        mCurRight = i5;
        mContentRight = i5;
        mStatusBarLayer = mNavigationBar.getSurfaceLayer();
        mNavigationBar.computeFrameLw(mTmpNavigationFrame, mTmpNavigationFrame, mTmpNavigationFrame, mTmpNavigationFrame);
_L2:
        if(mStatusBar != null) {
            l1 = mUnrestrictedScreenLeft;
            rect1.left = l1;
            rect.left = l1;
            i2 = mUnrestrictedScreenTop;
            rect1.top = i2;
            rect.top = i2;
            j2 = mUnrestrictedScreenWidth - mUnrestrictedScreenLeft;
            rect1.right = j2;
            rect.right = j2;
            k2 = mUnrestrictedScreenHeight - mUnrestrictedScreenTop;
            rect1.bottom = k2;
            rect.bottom = k2;
            rect2.left = mStableLeft;
            rect2.top = mStableTop;
            rect2.right = mStableRight;
            rect2.bottom = mStableBottom;
            mStatusBarLayer = mStatusBar.getSurfaceLayer();
            mStatusBar.computeFrameLw(rect, rect1, rect2, rect2);
            mStableTop = mUnrestrictedScreenTop + mStatusBarHeight;
            if(mStatusBar.isVisibleLw()) {
                mDockTop = mUnrestrictedScreenTop + mStatusBarHeight;
                l2 = mDockTop;
                mCurTop = l2;
                mContentTop = l2;
                i3 = mDockBottom;
                mCurBottom = i3;
                mContentBottom = i3;
                j3 = mDockLeft;
                mCurLeft = j3;
                mContentLeft = j3;
                k3 = mDockRight;
                mCurRight = k3;
                mContentRight = k3;
            }
            if(mStatusBar.isVisibleLw())
                if(mStatusBar.isAnimatingLw());
        }
        return;
_L6:
        flag4 = false;
          goto _L8
        int l3 = i - mNavigationBarWidthForRotation[k];
        if(mHdmiPlugged && l3 > mExternalDisplayWidth)
            l3 = mExternalDisplayWidth;
        mTmpNavigationFrame.set(l3, 0, i, j);
        int i4 = mTmpNavigationFrame.left;
        mStableFullscreenRight = i4;
        mStableRight = i4;
        if(flag2) {
            mNavigationBar.showLw(true);
            mDockRight = mTmpNavigationFrame.left;
            mRestrictedScreenWidth = mDockRight - mDockLeft;
        } else {
            mNavigationBar.hideLw(true);
        }
        if(flag2 && !mNavigationBar.isAnimatingLw())
            mSystemRight = mTmpNavigationFrame.left;
          goto _L9
    }

    void callInterceptPowerKeyUp(boolean flag) {
        interceptPowerKeyUp(flag);
    }

    public boolean canBeForceHidden(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        boolean flag;
        if(layoutparams.type != 2000 && layoutparams.type != 2019 && layoutparams.type != 2013)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public int checkAddPermission(android.view.WindowManager.LayoutParams layoutparams) {
        int i;
        int j;
        i = 0;
        j = layoutparams.type;
        if(j >= 2000 && j <= 2999) goto _L2; else goto _L1
_L1:
        return i;
_L2:
        String s = null;
        j;
        JVM INSTR lookupswitch 9: default 108
    //                   2002: 136
    //                   2003: 136
    //                   2005: 113
    //                   2006: 136
    //                   2007: 136
    //                   2010: 136
    //                   2011: 113
    //                   2013: 113
    //                   2023: 113;
           goto _L3 _L4 _L4 _L5 _L4 _L4 _L4 _L5 _L5 _L5
_L3:
        s = "android.permission.INTERNAL_SYSTEM_WINDOW";
_L5:
        if(s == null || mContext.checkCallingOrSelfPermission(s) == 0) goto _L1; else goto _L6
_L6:
        i = -8;
          goto _L1
_L4:
        s = "android.permission.SYSTEM_ALERT_WINDOW";
          goto _L5
    }

    public Animation createForceHideEnterAnimation(boolean flag) {
        Context context = mContext;
        int i;
        if(flag)
            i = 0x10a002a;
        else
            i = 0x10a0027;
        return AnimationUtils.loadAnimation(context, i);
    }

    Intent createHomeDockIntent() {
        Intent intent = null;
        Intent intent1;
        if(mUiMode == 3) {
            intent1 = mCarDockIntent;
        } else {
            if(mUiMode != 2);
            intent1 = null;
        }
        if(intent1 == null) {
            Intent _tmp = intent1;
        } else {
            ActivityInfo activityinfo = intent1.resolveActivityInfo(mContext.getPackageManager(), 128);
            if(activityinfo == null) {
                Intent _tmp1 = intent1;
            } else
            if(activityinfo.metaData != null && activityinfo.metaData.getBoolean("android.dock_home")) {
                Intent intent2 = new Intent(intent1);
                intent2.setClassName(activityinfo.packageName, activityinfo.name);
                intent = intent2;
            } else {
                Intent _tmp2 = intent1;
            }
        }
        return intent;
    }

    public void dismissKeyguardLw() {
        if(!mKeyguardMediator.isSecure() && mKeyguardMediator.isShowing())
            mHandler.post(new Runnable() {

                public void run() {
                    mKeyguardMediator.keyguardDone(false, true);
                }

                final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
            });
    }

    void dispatchMediaKeyRepeatWithWakeLock(KeyEvent keyevent) {
        mHavePendingMediaKeyRepeatWithWakeLock = false;
        dispatchMediaKeyWithWakeLockToAudioService(KeyEvent.changeTimeRepeat(keyevent, SystemClock.uptimeMillis(), 1, 0x80 | keyevent.getFlags()));
        mBroadcastWakeLock.release();
    }

    void dispatchMediaKeyWithWakeLock(KeyEvent keyevent) {
        if(mHavePendingMediaKeyRepeatWithWakeLock) {
            mHandler.removeMessages(4);
            mHavePendingMediaKeyRepeatWithWakeLock = false;
            mBroadcastWakeLock.release();
        }
        dispatchMediaKeyWithWakeLockToAudioService(keyevent);
        if(keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0) {
            mHavePendingMediaKeyRepeatWithWakeLock = true;
            Message message = mHandler.obtainMessage(4, keyevent);
            message.setAsynchronous(true);
            mHandler.sendMessageDelayed(message, ViewConfiguration.getKeyRepeatTimeout());
        } else {
            mBroadcastWakeLock.release();
        }
    }

    void dispatchMediaKeyWithWakeLockToAudioService(KeyEvent keyevent) {
        IAudioService iaudioservice;
        if(!ActivityManagerNative.isSystemReady())
            break MISSING_BLOCK_LABEL_21;
        iaudioservice = getAudioService();
        if(iaudioservice == null)
            break MISSING_BLOCK_LABEL_21;
        iaudioservice.dispatchMediaKeyEventUnderWakelock(keyevent);
_L1:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("WindowManager", (new StringBuilder()).append("dispatchMediaKeyEvent threw exception ").append(remoteexception).toString());
          goto _L1
    }

    public KeyEvent dispatchUnhandledKey(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i) {
        KeyEvent keyevent1 = null;
        if((0x400 & keyevent.getFlags()) != 0) goto _L2; else goto _L1
_L1:
        int j;
        android.view.KeyCharacterMap.FallbackAction fallbackaction;
        KeyCharacterMap keycharactermap = keyevent.getKeyCharacterMap();
        j = keyevent.getKeyCode();
        int k = keyevent.getMetaState();
        boolean flag;
        int l;
        if(keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
            flag = true;
        else
            flag = false;
        if(flag)
            fallbackaction = keycharactermap.getFallbackAction(j, k);
        else
            fallbackaction = (android.view.KeyCharacterMap.FallbackAction)mFallbackActions.get(j);
        if(fallbackaction == null) goto _L2; else goto _L3
_L3:
        l = 0x400 | keyevent.getFlags();
        keyevent1 = KeyEvent.obtain(keyevent.getDownTime(), keyevent.getEventTime(), keyevent.getAction(), fallbackaction.keyCode, keyevent.getRepeatCount(), fallbackaction.metaState, keyevent.getDeviceId(), keyevent.getScanCode(), l, keyevent.getSource(), null);
        if(!interceptFallback(windowstate, keyevent1, i)) {
            keyevent1.recycle();
            keyevent1 = null;
        }
        if(!flag) goto _L5; else goto _L4
_L4:
        mFallbackActions.put(j, fallbackaction);
_L2:
        return keyevent1;
_L5:
        if(keyevent.getAction() == 1) {
            mFallbackActions.remove(j);
            fallbackaction.recycle();
        }
        if(true) goto _L2; else goto _L6
_L6:
    }

    public boolean doesForceHide(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        boolean flag;
        if(layoutparams.type == 2004)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void dump(String s, PrintWriter printwriter, String as[]) {
        printwriter.print(s);
        printwriter.print("mSafeMode=");
        printwriter.print(mSafeMode);
        printwriter.print(" mSystemReady=");
        printwriter.print(mSystemReady);
        printwriter.print(" mSystemBooted=");
        printwriter.println(mSystemBooted);
        printwriter.print(s);
        printwriter.print("mLidState=");
        printwriter.print(mLidState);
        printwriter.print(" mLidOpenRotation=");
        printwriter.print(mLidOpenRotation);
        printwriter.print(" mHdmiPlugged=");
        printwriter.println(mHdmiPlugged);
        if(mLastSystemUiFlags != 0 || mResettingSystemUiFlags != 0 || mForceClearedSystemUiFlags != 0) {
            printwriter.print(s);
            printwriter.print("mLastSystemUiFlags=0x");
            printwriter.print(Integer.toHexString(mLastSystemUiFlags));
            printwriter.print(" mResettingSystemUiFlags=0x");
            printwriter.print(Integer.toHexString(mResettingSystemUiFlags));
            printwriter.print(" mForceClearedSystemUiFlags=0x");
            printwriter.println(Integer.toHexString(mForceClearedSystemUiFlags));
        }
        if(mLastFocusNeedsMenu) {
            printwriter.print(s);
            printwriter.print("mLastFocusNeedsMenu=");
            printwriter.println(mLastFocusNeedsMenu);
        }
        printwriter.print(s);
        printwriter.print("mUiMode=");
        printwriter.print(mUiMode);
        printwriter.print(" mDockMode=");
        printwriter.print(mDockMode);
        printwriter.print(" mCarDockRotation=");
        printwriter.print(mCarDockRotation);
        printwriter.print(" mDeskDockRotation=");
        printwriter.println(mDeskDockRotation);
        printwriter.print(s);
        printwriter.print("mUserRotationMode=");
        printwriter.print(mUserRotationMode);
        printwriter.print(" mUserRotation=");
        printwriter.print(mUserRotation);
        printwriter.print(" mAllowAllRotations=");
        printwriter.println(mAllowAllRotations);
        printwriter.print(s);
        printwriter.print("mCurrentAppOrientation=");
        printwriter.println(mCurrentAppOrientation);
        printwriter.print(s);
        printwriter.print("mCarDockEnablesAccelerometer=");
        printwriter.print(mCarDockEnablesAccelerometer);
        printwriter.print(" mDeskDockEnablesAccelerometer=");
        printwriter.println(mDeskDockEnablesAccelerometer);
        printwriter.print(s);
        printwriter.print("mLidKeyboardAccessibility=");
        printwriter.print(mLidKeyboardAccessibility);
        printwriter.print(" mLidNavigationAccessibility=");
        printwriter.print(mLidNavigationAccessibility);
        printwriter.print(" mLidControlsSleep=");
        printwriter.println(mLidControlsSleep);
        printwriter.print(s);
        printwriter.print("mLongPressOnPowerBehavior=");
        printwriter.print(mLongPressOnPowerBehavior);
        printwriter.print(" mHasSoftInput=");
        printwriter.println(mHasSoftInput);
        printwriter.print(s);
        printwriter.print("mScreenOnEarly=");
        printwriter.print(mScreenOnEarly);
        printwriter.print(" mScreenOnFully=");
        printwriter.print(mScreenOnFully);
        printwriter.print(" mOrientationSensorEnabled=");
        printwriter.println(mOrientationSensorEnabled);
        printwriter.print(s);
        printwriter.print("mUnrestrictedScreen=(");
        printwriter.print(mUnrestrictedScreenLeft);
        printwriter.print(",");
        printwriter.print(mUnrestrictedScreenTop);
        printwriter.print(") ");
        printwriter.print(mUnrestrictedScreenWidth);
        printwriter.print("x");
        printwriter.println(mUnrestrictedScreenHeight);
        printwriter.print(s);
        printwriter.print("mRestrictedScreen=(");
        printwriter.print(mRestrictedScreenLeft);
        printwriter.print(",");
        printwriter.print(mRestrictedScreenTop);
        printwriter.print(") ");
        printwriter.print(mRestrictedScreenWidth);
        printwriter.print("x");
        printwriter.println(mRestrictedScreenHeight);
        printwriter.print(s);
        printwriter.print("mStableFullscreen=(");
        printwriter.print(mStableFullscreenLeft);
        printwriter.print(",");
        printwriter.print(mStableFullscreenTop);
        printwriter.print(")-(");
        printwriter.print(mStableFullscreenRight);
        printwriter.print(",");
        printwriter.print(mStableFullscreenBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mStable=(");
        printwriter.print(mStableLeft);
        printwriter.print(",");
        printwriter.print(mStableTop);
        printwriter.print(")-(");
        printwriter.print(mStableRight);
        printwriter.print(",");
        printwriter.print(mStableBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mSystem=(");
        printwriter.print(mSystemLeft);
        printwriter.print(",");
        printwriter.print(mSystemTop);
        printwriter.print(")-(");
        printwriter.print(mSystemRight);
        printwriter.print(",");
        printwriter.print(mSystemBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mCur=(");
        printwriter.print(mCurLeft);
        printwriter.print(",");
        printwriter.print(mCurTop);
        printwriter.print(")-(");
        printwriter.print(mCurRight);
        printwriter.print(",");
        printwriter.print(mCurBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mContent=(");
        printwriter.print(mContentLeft);
        printwriter.print(",");
        printwriter.print(mContentTop);
        printwriter.print(")-(");
        printwriter.print(mContentRight);
        printwriter.print(",");
        printwriter.print(mContentBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mDock=(");
        printwriter.print(mDockLeft);
        printwriter.print(",");
        printwriter.print(mDockTop);
        printwriter.print(")-(");
        printwriter.print(mDockRight);
        printwriter.print(",");
        printwriter.print(mDockBottom);
        printwriter.println(")");
        printwriter.print(s);
        printwriter.print("mDockLayer=");
        printwriter.print(mDockLayer);
        printwriter.print(" mStatusBarLayer=");
        printwriter.println(mStatusBarLayer);
        printwriter.print(s);
        printwriter.print("mTopFullscreenOpaqueWindowState=");
        printwriter.println(mTopFullscreenOpaqueWindowState);
        printwriter.print(s);
        printwriter.print("mTopIsFullscreen=");
        printwriter.print(mTopIsFullscreen);
        printwriter.print(" mForceStatusBar=");
        printwriter.print(mForceStatusBar);
        printwriter.print(" mHideLockScreen=");
        printwriter.println(mHideLockScreen);
        printwriter.print(s);
        printwriter.print("mDismissKeyguard=");
        printwriter.print(mDismissKeyguard);
        printwriter.print(" mHomePressed=");
        printwriter.println(mHomePressed);
        printwriter.print(s);
        printwriter.print("mAllowLockscreenWhenOn=");
        printwriter.print(mAllowLockscreenWhenOn);
        printwriter.print(" mLockScreenTimeout=");
        printwriter.print(mLockScreenTimeout);
        printwriter.print(" mLockScreenTimerActive=");
        printwriter.println(mLockScreenTimerActive);
        printwriter.print(s);
        printwriter.print("mEndcallBehavior=");
        printwriter.print(mEndcallBehavior);
        printwriter.print(" mIncallPowerBehavior=");
        printwriter.print(mIncallPowerBehavior);
        printwriter.print(" mLongPressOnHomeBehavior=");
        printwriter.println(mLongPressOnHomeBehavior);
        printwriter.print(s);
        printwriter.print("mLandscapeRotation=");
        printwriter.print(mLandscapeRotation);
        printwriter.print(" mSeascapeRotation=");
        printwriter.println(mSeascapeRotation);
        printwriter.print(s);
        printwriter.print("mPortraitRotation=");
        printwriter.print(mPortraitRotation);
        printwriter.print(" mUpsideDownRotation=");
        printwriter.println(mUpsideDownRotation);
    }

    public void enableKeyguard(boolean flag) {
        if(mKeyguardMediator != null)
            mKeyguardMediator.setKeyguardEnabled(flag);
    }

    public void enableScreenAfterBoot() {
        readLidState();
        applyLidSwitchState();
        updateRotation(true);
    }

    public void exitKeyguardSecurely(android.view.WindowManagerPolicy.OnKeyguardExitResult onkeyguardexitresult) {
        if(mKeyguardMediator != null)
            mKeyguardMediator.verifyUnlock(onkeyguardexitresult);
    }

    public int finishAnimationLw() {
        int i = 0;
        boolean flag = false;
        android.view.WindowManager.LayoutParams layoutparams;
        if(mTopFullscreenOpaqueWindowState != null)
            layoutparams = mTopFullscreenOpaqueWindowState.getAttrs();
        else
            layoutparams = null;
        if(mStatusBar != null)
            if(mForceStatusBar) {
                if(mStatusBar.showLw(true))
                    i = false | true;
            } else
            if(mTopFullscreenOpaqueWindowState != null) {
                if((0x400 & layoutparams.flags) != 0 || (4 & mLastSystemUiFlags) != 0)
                    flag = true;
                else
                    flag = false;
                if(flag) {
                    if(mStatusBar.hideLw(true)) {
                        i = false | true;
                        mHandler.post(new Runnable() {

                            public void run() {
                                IStatusBarService istatusbarservice = getStatusBarService();
                                if(istatusbarservice != null)
                                    istatusbarservice.collapse();
_L1:
                                return;
                                RemoteException remoteexception;
                                remoteexception;
                                mStatusBarService = null;
                                  goto _L1
                            }

                            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
                        });
                    }
                } else
                if(mStatusBar.showLw(true))
                    i = false | true;
            }
        mTopIsFullscreen = flag;
        if(mKeyguard != null)
            if(mDismissKeyguard && !mKeyguardMediator.isSecure()) {
                if(mKeyguard.hideLw(true))
                    i |= 7;
                if(mKeyguardMediator.isShowing())
                    mHandler.post(new Runnable() {

                        public void run() {
                            mKeyguardMediator.keyguardDone(false, false);
                        }

                        final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
                    });
            } else
            if(mHideLockScreen) {
                if(mKeyguard.hideLw(true))
                    i |= 7;
                mKeyguardMediator.setHidden(true);
            } else {
                if(mKeyguard.showLw(true))
                    i |= 7;
                mKeyguardMediator.setHidden(false);
            }
        if((6 & updateSystemUiVisibilityLw()) != 0)
            i |= 1;
        updateLockScreenTimeout();
        return i;
    }

    public void finishLayoutLw() {
    }

    public int focusChangedLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManagerPolicy.WindowState windowstate1) {
        mFocusedWindow = windowstate1;
        int i;
        if((6 & updateSystemUiVisibilityLw()) != 0)
            i = 1;
        else
            i = 0;
        return i;
    }

    public int getConfigDisplayHeight(int i, int j, int k) {
        int l;
        if(!mHasSystemNavBar)
            l = getNonDecorDisplayHeight(i, j, k) - mStatusBarHeight;
        else
            l = getNonDecorDisplayHeight(i, j, k);
        return l;
    }

    public int getConfigDisplayWidth(int i, int j, int k) {
        return getNonDecorDisplayWidth(i, j, k);
    }

    public void getContentInsetHintLw(android.view.WindowManager.LayoutParams layoutparams, Rect rect) {
        int i = layoutparams.flags;
        int j = layoutparams.systemUiVisibility | layoutparams.subtreeSystemUiVisibility;
        if((i & 0x10100) == 0x10100) {
            int k;
            int l;
            if(mCanHideNavigationBar && (j & 0x200) != 0) {
                k = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                l = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
            } else {
                k = mRestrictedScreenLeft + mRestrictedScreenWidth;
                l = mRestrictedScreenTop + mRestrictedScreenHeight;
            }
            if((j & 0x100) != 0) {
                if((i & 0x400) != 0)
                    rect.set(mStableFullscreenLeft, mStableFullscreenTop, k - mStableFullscreenRight, l - mStableFullscreenBottom);
                else
                    rect.set(mStableLeft, mStableTop, k - mStableRight, l - mStableBottom);
            } else
            if((i & 0x400) != 0)
                rect.setEmpty();
            else
            if((j & 0x404) == 0)
                rect.set(mCurLeft, mCurTop, k - mCurRight, l - mCurBottom);
            else
                rect.set(mCurLeft, mCurTop, k - mCurRight, l - mCurBottom);
        } else {
            rect.setEmpty();
        }
    }

    Context getContext() {
        return mContext;
    }

    public int getMaxWallpaperLayer() {
        return 15;
    }

    public int getNonDecorDisplayHeight(int i, int j, int k) {
        if(!mHasSystemNavBar) goto _L2; else goto _L1
_L1:
        j -= mNavigationBarHeightForRotation[k];
_L4:
        return j;
_L2:
        if(mHasNavigationBar && (!mNavigationBarCanMove || i < j))
            j -= mNavigationBarHeightForRotation[k];
        if(true) goto _L4; else goto _L3
_L3:
    }

    public int getNonDecorDisplayWidth(int i, int j, int k) {
        if(mHasNavigationBar && mNavigationBarCanMove && i > j)
            i -= mNavigationBarWidthForRotation[k];
        return i;
    }

    Runnable getPowerLongPress() {
        return mPowerLongPress;
    }

    Runnable getScreenshotChordLongPress() {
        return mScreenshotChordLongPress;
    }

    IStatusBarService getStatusBarService() {
        Object obj = mServiceAquireLock;
        obj;
        JVM INSTR monitorenter ;
        if(mStatusBarService == null)
            mStatusBarService = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.getService("statusbar"));
        IStatusBarService istatusbarservice = mStatusBarService;
        return istatusbarservice;
    }

    public int getSystemDecorRectLw(Rect rect) {
        rect.left = mSystemLeft;
        rect.top = mSystemTop;
        rect.right = mSystemRight;
        rect.bottom = mSystemBottom;
        int i;
        if(mStatusBar != null)
            i = mStatusBar.getSurfaceLayer();
        else
        if(mNavigationBar != null)
            i = mNavigationBar.getSurfaceLayer();
        else
            i = 0;
        return i;
    }

    boolean goHome() {
        if(SystemProperties.getInt("persist.sys.uts-test-mode", 0) != 1) goto _L2; else goto _L1
_L1:
        Log.d("WindowManager", "UTS-TEST-MODE");
_L4:
        boolean flag;
        if(ActivityManagerNative.getDefault().startActivity(null, mHomeIntent, mHomeIntent.resolveTypeIfNeeded(mContext.getContentResolver()), null, null, 0, 1, null, null, null) == 1) {
            flag = false;
            break MISSING_BLOCK_LABEL_128;
        }
        break MISSING_BLOCK_LABEL_126;
_L2:
        Intent intent;
        ActivityManagerNative.getDefault().stopAppSwitches();
        sendCloseSystemWindows();
        intent = createHomeDockIntent();
        if(intent == null) goto _L4; else goto _L3
_L3:
        int i = ActivityManagerNative.getDefault().startActivity(null, intent, intent.resolveTypeIfNeeded(mContext.getContentResolver()), null, null, 0, 1, null, null, null);
        if(i != 1) goto _L4; else goto _L5
_L5:
        flag = false;
        break MISSING_BLOCK_LABEL_128;
        RemoteException remoteexception;
        remoteexception;
        flag = true;
        return flag;
    }

    void handleVolumeKey(int i, int j) {
        IAudioService iaudioservice = getAudioService();
        if(iaudioservice != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int k;
        mBroadcastWakeLock.acquire();
        if(j != 24)
            break MISSING_BLOCK_LABEL_45;
        k = 1;
_L3:
        iaudioservice.adjustStreamVolume(i, k, 0);
        mBroadcastWakeLock.release();
          goto _L1
        k = -1;
          goto _L3
        RemoteException remoteexception;
        remoteexception;
        Log.w("WindowManager", (new StringBuilder()).append("IAudioService.adjustStreamVolume() threw RemoteException ").append(remoteexception).toString());
        mBroadcastWakeLock.release();
          goto _L1
        Exception exception;
        exception;
        mBroadcastWakeLock.release();
        throw exception;
    }

    public boolean hasNavigationBar() {
        return mHasNavigationBar;
    }

    public boolean hasSystemNavBar() {
        return mHasSystemNavBar;
    }

    public void hideBootMessages() {
        mHandler.post(new Runnable() {

            public void run() {
                if(mBootMsgDialog != null) {
                    mBootMsgDialog.dismiss();
                    mBootMsgDialog = null;
                }
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        });
    }

    public boolean inKeyguardRestrictedKeyInputMode() {
        boolean flag;
        if(mKeyguardMediator == null)
            flag = false;
        else
            flag = mKeyguardMediator.isInputRestricted();
        return flag;
    }

    public void init(Context context, IWindowManager iwindowmanager, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs, LocalPowerManager localpowermanager) {
        boolean flag = true;
        mContext = context;
        mWindowManager = iwindowmanager;
        mWindowManagerFuncs = windowmanagerfuncs;
        mPowerManager = localpowermanager;
        mHeadless = "1".equals(SystemProperties.get("ro.config.headless", "0"));
        if(!mHeadless)
            mKeyguardMediator = new MiuiKeyguardViewMediator(context, this, localpowermanager);
        mHandler = new PolicyHandler();
        mOrientationListener = new MyOrientationListener(mContext);
        IntentFilter intentfilter;
        Intent intent;
        IntentFilter intentfilter1;
        Intent intent1;
        try {
            mOrientationListener.setCurrentRotation(iwindowmanager.getRotation());
        }
        catch(RemoteException remoteexception) { }
        (new SettingsObserver(mHandler)).observe();
        mShortcutManager = new ShortcutManager(context, mHandler);
        mShortcutManager.observe();
        mUiMode = context.getResources().getInteger(0x10e0011);
        mHomeIntent = new Intent("android.intent.action.MAIN", null);
        mHomeIntent.addCategory("android.intent.category.HOME");
        mHomeIntent.addFlags(0x10200000);
        mCarDockIntent = new Intent("android.intent.action.MAIN", null);
        mCarDockIntent.addCategory("android.intent.category.CAR_DOCK");
        mCarDockIntent.addFlags(0x10200000);
        mDeskDockIntent = new Intent("android.intent.action.MAIN", null);
        mDeskDockIntent.addCategory("android.intent.category.DESK_DOCK");
        mDeskDockIntent.addFlags(0x10200000);
        mBroadcastWakeLock = ((PowerManager)context.getSystemService("power")).newWakeLock(flag, "PhoneWindowManager.mBroadcastWakeLock");
        mEnableShiftMenuBugReports = "1".equals(SystemProperties.get("ro.debuggable"));
        mLidOpenRotation = readRotation(0x10e000e);
        mCarDockRotation = readRotation(0x10e0010);
        mDeskDockRotation = readRotation(0x10e000f);
        mCarDockEnablesAccelerometer = mContext.getResources().getBoolean(0x1110019);
        mDeskDockEnablesAccelerometer = mContext.getResources().getBoolean(0x1110018);
        mLidKeyboardAccessibility = mContext.getResources().getInteger(0x10e0014);
        mLidNavigationAccessibility = mContext.getResources().getInteger(0x10e0015);
        mLidControlsSleep = mContext.getResources().getBoolean(0x111001a);
        intentfilter = new IntentFilter();
        intentfilter.addAction(UiModeManager.ACTION_ENTER_CAR_MODE);
        intentfilter.addAction(UiModeManager.ACTION_EXIT_CAR_MODE);
        intentfilter.addAction(UiModeManager.ACTION_ENTER_DESK_MODE);
        intentfilter.addAction(UiModeManager.ACTION_EXIT_DESK_MODE);
        intentfilter.addAction("android.intent.action.DOCK_EVENT");
        intent = context.registerReceiver(mDockReceiver, intentfilter);
        if(intent != null)
            mDockMode = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
        intentfilter1 = new IntentFilter();
        intentfilter1.addAction("android.intent.action.BATTERY_CHANGED");
        intent1 = context.registerReceiver(mPowerReceiver, intentfilter1);
        if(intent1 != null) {
            if(intent1.getIntExtra("plugged", 0) == 0)
                flag = false;
            mPluggedIn = flag;
        }
        mVibrator = (Vibrator)context.getSystemService("vibrator");
        mLongPressVibePattern = getLongIntArray(mContext.getResources(), 0x1070021);
        mVirtualKeyVibePattern = getLongIntArray(mContext.getResources(), 0x1070022);
        mKeyboardTapVibePattern = getLongIntArray(mContext.getResources(), 0x1070023);
        mSafeModeDisabledVibePattern = getLongIntArray(mContext.getResources(), 0x1070024);
        mSafeModeEnabledVibePattern = getLongIntArray(mContext.getResources(), 0x1070025);
        mScreenshotChordEnabled = mContext.getResources().getBoolean(0x1110015);
        initializeHdmiState();
        if(mPowerManager.isScreenOn())
            screenTurningOn(null);
        else
            screenTurnedOff(2);
    }

    void initializeHdmiState() {
        boolean flag;
        int i;
        FileReader filereader;
        flag = true;
        i = 0;
        if(!(new File("/sys/devices/virtual/switch/hdmi/state")).exists())
            break MISSING_BLOCK_LABEL_103;
        mHDMIObserver.startObserving("DEVPATH=/devices/virtual/switch/hdmi");
        filereader = null;
        FileReader filereader1 = new FileReader("/sys/class/switch/hdmi/state");
        int k;
        char ac[] = new char[15];
        int j = filereader1.read(ac);
        if(j <= flag)
            break MISSING_BLOCK_LABEL_93;
        k = Integer.parseInt(new String(ac, 0, j + -1));
        boolean flag1;
        if(k != 0)
            i = ((flag) ? 1 : 0);
        else
            i = 0;
        IOException ioexception;
        Exception exception;
        NumberFormatException numberformatexception;
        if(filereader1 != null)
            try {
                filereader1.close();
            }
            catch(IOException ioexception4) { }
        if(i == 0)
            flag1 = flag;
        else
            flag1 = false;
        mHdmiPlugged = flag1;
        if(mHdmiPlugged)
            flag = false;
        setHdmiPlugged(flag);
        return;
        ioexception;
_L6:
        Slog.w("WindowManager", (new StringBuilder()).append("Couldn't read hdmi state from /sys/class/switch/hdmi/state: ").append(ioexception).toString());
        if(filereader != null)
            try {
                filereader.close();
            }
            catch(IOException ioexception2) { }
        break MISSING_BLOCK_LABEL_103;
        numberformatexception;
_L4:
        Slog.w("WindowManager", (new StringBuilder()).append("Couldn't read hdmi state from /sys/class/switch/hdmi/state: ").append(numberformatexception).toString());
        if(filereader != null)
            try {
                filereader.close();
            }
            catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_103;
        exception;
_L2:
        if(filereader != null)
            try {
                filereader.close();
            }
            catch(IOException ioexception1) { }
        throw exception;
        exception;
        filereader = filereader1;
        if(true) goto _L2; else goto _L1
_L1:
        numberformatexception;
        filereader = filereader1;
        if(true) goto _L4; else goto _L3
_L3:
        ioexception;
        filereader = filereader1;
        if(true) goto _L6; else goto _L5
_L5:
    }

    public long interceptKeyBeforeDispatching(android.view.WindowManagerPolicy.WindowState windowstate, KeyEvent keyevent, int i) {
        boolean flag;
        int j;
        int k;
        int l;
        boolean flag1;
        boolean flag2;
        long l1;
        flag = keyguardOn();
        j = keyevent.getKeyCode();
        k = keyevent.getRepeatCount();
        l = keyevent.getMetaState();
        int i1 = keyevent.getFlags();
        long l2;
        long l3;
        if(keyevent.getAction() == 0)
            flag1 = true;
        else
            flag1 = false;
        flag2 = keyevent.isCanceled();
        if(!mScreenshotChordEnabled || (i1 & 0x400) != 0) goto _L2; else goto _L1
_L1:
        if(!mVolumeDownKeyTriggered || mPowerKeyTriggered) goto _L4; else goto _L3
_L3:
        l2 = SystemClock.uptimeMillis();
        l3 = 150L + mVolumeDownKeyTime;
        if(l2 >= l3) goto _L4; else goto _L5
_L5:
        l1 = l3 - l2;
_L28:
        return l1;
_L4:
        if(j == 25 && mVolumeDownKeyConsumedByScreenshotChord) {
            if(!flag1)
                mVolumeDownKeyConsumedByScreenshotChord = false;
            l1 = -1L;
            continue; /* Loop/switch isn't completed */
        }
_L2:
        if(j != 3) goto _L7; else goto _L6
_L6:
        if(flag1)
            break MISSING_BLOCK_LABEL_311;
        boolean flag3 = mHomeLongPressed;
        mHomePressed = false;
        mHomeLongPressed = false;
        if(flag3)
            break MISSING_BLOCK_LABEL_311;
        boolean flag4;
        ITelephony itelephony;
        boolean flag5;
        try {
            IStatusBarService istatusbarservice1 = getStatusBarService();
            if(istatusbarservice1 != null)
                istatusbarservice1.cancelPreloadRecentApps();
        }
        catch(RemoteException remoteexception1) {
            Slog.e("WindowManager", "RemoteException when showing recent apps", remoteexception1);
            mStatusBarService = null;
        }
        mHomePressed = false;
        if(flag2)
            break MISSING_BLOCK_LABEL_299;
        flag4 = false;
        itelephony = getTelephonyService();
        if(itelephony == null)
            break MISSING_BLOCK_LABEL_233;
        flag5 = itelephony.isRinging();
        flag4 = flag5;
_L8:
        RemoteException remoteexception2;
        if(flag4)
            Log.i("WindowManager", "Ignoring HOME; there's a ringing incoming call.");
        else
            launchHomeFromHotKey();
_L9:
        l1 = -1L;
        continue; /* Loop/switch isn't completed */
        remoteexception2;
        Log.w("WindowManager", "RemoteException from getPhoneInterface()", remoteexception2);
          goto _L8
        Log.i("WindowManager", "Ignoring HOME; event canceled.");
          goto _L9
        android.view.WindowManager.LayoutParams layoutparams;
        if(windowstate != null)
            layoutparams = windowstate.getAttrs();
        else
            layoutparams = null;
        if(layoutparams != null) {
            int k1 = layoutparams.type;
            if(k1 == 2004 || k1 == 2009) {
                l1 = 0L;
                continue; /* Loop/switch isn't completed */
            }
            int i2 = WINDOW_TYPES_WHERE_HOME_DOESNT_WORK.length;
            int j2 = 0;
            do {
                if(j2 >= i2)
                    break;
                if(k1 == WINDOW_TYPES_WHERE_HOME_DOESNT_WORK[j2]) {
                    l1 = -1L;
                    continue; /* Loop/switch isn't completed */
                }
                j2++;
            } while(true);
        }
        if(!flag1) goto _L11; else goto _L10
_L10:
        if(!mHomePressed && mLongPressOnHomeBehavior == 2)
            try {
                IStatusBarService istatusbarservice = getStatusBarService();
                if(istatusbarservice != null)
                    istatusbarservice.preloadRecentApps();
            }
            catch(RemoteException remoteexception) {
                Slog.e("WindowManager", "RemoteException when preloading recent apps", remoteexception);
                mStatusBarService = null;
            }
        if(k != 0) goto _L13; else goto _L12
_L12:
        mHomePressed = true;
_L11:
        l1 = -1L;
        continue; /* Loop/switch isn't completed */
_L13:
        if((0x80 & keyevent.getFlags()) != 0 && !flag)
            handleLongPressOnHome();
        if(true) goto _L11; else goto _L7
_L7:
        if(j != 82) goto _L15; else goto _L14
_L14:
        if(flag1 && k == 0 && mEnableShiftMenuBugReports && (l & 1) == 1) {
            Intent intent3 = new Intent("android.intent.action.BUG_REPORT");
            mContext.sendOrderedBroadcast(intent3, null);
            l1 = -1L;
            continue; /* Loop/switch isn't completed */
        }
          goto _L16
_L15:
        if(j != 84)
            break MISSING_BLOCK_LABEL_624;
        if(!flag1) goto _L18; else goto _L17
_L17:
        if(k == 0) {
            mSearchKeyShortcutPending = true;
            mConsumeSearchKeyUp = false;
        }
_L20:
        l1 = 0L;
        continue; /* Loop/switch isn't completed */
_L18:
        mSearchKeyShortcutPending = false;
        if(!mConsumeSearchKeyUp) goto _L20; else goto _L19
_L19:
        mConsumeSearchKeyUp = false;
        l1 = -1L;
        continue; /* Loop/switch isn't completed */
        if(j == 187) {
            if(flag1 && k == 0 && !flag)
                showOrHideRecentAppsDialog(0);
            l1 = -1L;
            continue; /* Loop/switch isn't completed */
        }
        if(j != 219) goto _L16; else goto _L21
_L21:
        if(!flag1) goto _L23; else goto _L22
_L22:
        if(k != 0) goto _L25; else goto _L24
_L24:
        mAssistKeyLongPressed = false;
_L26:
        l1 = -1L;
        continue; /* Loop/switch isn't completed */
_L25:
        if(k == 1) {
            mAssistKeyLongPressed = true;
            if(!flag)
                launchAssistLongPressAction();
        }
        continue; /* Loop/switch isn't completed */
_L23:
        if(mAssistKeyLongPressed)
            mAssistKeyLongPressed = false;
        else
        if(!flag)
            launchAssistAction();
        if(true) goto _L26; else goto _L16
_L16:
        if(mSearchKeyShortcutPending) {
            KeyCharacterMap keycharactermap1 = keyevent.getKeyCharacterMap();
            if(keycharactermap1.isPrintingKey(j)) {
                mConsumeSearchKeyUp = true;
                mSearchKeyShortcutPending = false;
                if(flag1 && k == 0 && !flag) {
                    Intent intent2 = mShortcutManager.getIntent(keycharactermap1, j, l);
                    if(intent2 != null) {
                        intent2.addFlags(0x10000000);
                        try {
                            mContext.startActivity(intent2);
                        }
                        catch(ActivityNotFoundException activitynotfoundexception2) {
                            Slog.w("WindowManager", (new StringBuilder()).append("Dropping shortcut key combination because the activity to which it is registered was not found: SEARCH+").append(KeyEvent.keyCodeToString(j)).toString(), activitynotfoundexception2);
                        }
                    } else {
                        Slog.i("WindowManager", (new StringBuilder()).append("Dropping unregistered shortcut key combination: SEARCH+").append(KeyEvent.keyCodeToString(j)).toString());
                    }
                }
                l1 = -1L;
                continue; /* Loop/switch isn't completed */
            }
        }
        if(flag1 && k == 0 && !flag && (0x10000 & l) != 0) {
            KeyCharacterMap keycharactermap = keyevent.getKeyCharacterMap();
            if(keycharactermap.isPrintingKey(j)) {
                Intent intent1 = mShortcutManager.getIntent(keycharactermap, j, 0xfff8ffff & l);
                if(intent1 != null) {
                    intent1.addFlags(0x10000000);
                    try {
                        mContext.startActivity(intent1);
                    }
                    catch(ActivityNotFoundException activitynotfoundexception1) {
                        Slog.w("WindowManager", (new StringBuilder()).append("Dropping shortcut key combination because the activity to which it is registered was not found: META+").append(KeyEvent.keyCodeToString(j)).toString(), activitynotfoundexception1);
                    }
                    l1 = -1L;
                    continue; /* Loop/switch isn't completed */
                }
            }
        }
        if(flag1 && k == 0 && !flag) {
            String s = (String)sApplicationLaunchKeyCategories.get(j);
            if(s != null) {
                Intent intent = Intent.makeMainSelectorActivity("android.intent.action.MAIN", s);
                intent.setFlags(0x10000000);
                try {
                    mContext.startActivity(intent);
                }
                catch(ActivityNotFoundException activitynotfoundexception) {
                    Slog.w("WindowManager", (new StringBuilder()).append("Dropping application launch key because the activity to which it is registered was not found: keyCode=").append(j).append(", category=").append(s).toString(), activitynotfoundexception);
                }
                l1 = -1L;
                continue; /* Loop/switch isn't completed */
            }
        }
        if(flag1 && k == 0 && j == 61) {
            if(mRecentAppsDialogHeldModifiers == 0 && !flag) {
                int j1 = 0xffffff3e & keyevent.getModifiers();
                if(KeyEvent.metaStateHasModifiers(j1, 2) || KeyEvent.metaStateHasModifiers(j1, 0x10000)) {
                    mRecentAppsDialogHeldModifiers = j1;
                    showOrHideRecentAppsDialog(1);
                    l1 = -1L;
                    continue; /* Loop/switch isn't completed */
                }
            }
        } else
        if(!flag1 && mRecentAppsDialogHeldModifiers != 0 && (l & mRecentAppsDialogHeldModifiers) == 0) {
            mRecentAppsDialogHeldModifiers = 0;
            byte byte1;
            if(flag)
                byte1 = 2;
            else
                byte1 = 3;
            showOrHideRecentAppsDialog(byte1);
        }
        if(flag1 && k == 0 && (j == 204 || j == 62 && (l & 0x7000) != 0)) {
            byte byte0;
            if((l & 0xc1) != 0)
                byte0 = -1;
            else
                byte0 = 1;
            mWindowManagerFuncs.switchKeyboardLayout(keyevent.getDeviceId(), byte0);
            l1 = -1L;
        } else
        if(mLanguageSwitchKeyPressed && !flag1 && (j == 204 || j == 62)) {
            mLanguageSwitchKeyPressed = false;
            l1 = -1L;
        } else {
            l1 = 0L;
        }
        if(true) goto _L28; else goto _L27
_L27:
    }

    public int interceptKeyBeforeQueueing(KeyEvent keyevent, int i, boolean flag) {
        boolean flag1;
        boolean flag2;
        int j;
        boolean flag3;
        boolean flag4;
        int k;
        if(keyevent.getAction() == 0)
            flag1 = true;
        else
            flag1 = false;
        flag2 = keyevent.isCanceled();
        j = keyevent.getKeyCode();
        if((0x1000000 & i) != 0)
            flag3 = true;
        else
            flag3 = false;
        if(mKeyguardMediator == null)
            flag4 = false;
        else
        if(flag)
            flag4 = mKeyguardMediator.isShowingAndNotHidden();
        else
            flag4 = mKeyguardMediator.isShowing();
        if(mSystemBooted) goto _L2; else goto _L1
_L1:
        k = 0;
_L27:
        return k;
_L2:
        Injector.performReleaseHapticFeedback(this, keyevent, i);
        if(flag1 && (0x100 & i) != 0 && keyevent.getRepeatCount() == 0)
            performHapticFeedbackLw(null, 1, false);
        if(j == 26)
            i |= 1;
        boolean flag5;
        ITelephony itelephony4;
        if((i & 3) != 0)
            flag5 = true;
        else
            flag5 = false;
        if(flag && !mHeadless || flag3 && !flag5) {
            k = 1;
        } else {
            k = 0;
            if(flag1 && flag5)
                if(flag4) {
                    KeyguardViewMediator keyguardviewmediator = mKeyguardMediator;
                    boolean flag14;
                    if(mDockMode != 0)
                        flag14 = true;
                    else
                        flag14 = false;
                    keyguardviewmediator.onWakeKeyWhenKeyguardShowingTq(j, flag14);
                } else {
                    k = 0 | 2;
                }
        }
        j;
        JVM INSTR lookupswitch 17: default 324
    //                   5: 327
    //                   6: 694
    //                   24: 445
    //                   25: 445
    //                   26: 821
    //                   79: 1083
    //                   85: 1054
    //                   86: 1083
    //                   87: 1083
    //                   88: 1083
    //                   89: 1083
    //                   90: 1083
    //                   91: 1083
    //                   126: 1054
    //                   127: 1054
    //                   130: 1083
    //                   164: 445;
           goto _L3 _L4 _L5 _L6 _L6 _L7 _L8 _L9 _L8 _L8 _L8 _L8 _L8 _L8 _L9 _L9 _L8 _L6
_L8:
        break MISSING_BLOCK_LABEL_1083;
_L3:
        continue; /* Loop/switch isn't completed */
_L4:
        if(!flag1)
            continue; /* Loop/switch isn't completed */
        itelephony4 = getTelephonyService();
        if(itelephony4 == null)
            continue; /* Loop/switch isn't completed */
        if(!itelephony4.isRinging())
            continue; /* Loop/switch isn't completed */
        Log.i("WindowManager", "interceptKeyBeforeQueueing: CALL key-down while ringing: Answer the call!");
        itelephony4.answerRingingCall();
        k &= -2;
        continue; /* Loop/switch isn't completed */
_L6:
        ITelephony itelephony3;
        if(j == 25) {
            if(flag1) {
                if(flag && !mVolumeDownKeyTriggered && (0x400 & keyevent.getFlags()) == 0) {
                    mVolumeDownKeyTriggered = true;
                    mVolumeDownKeyTime = keyevent.getDownTime();
                    mVolumeDownKeyConsumedByScreenshotChord = false;
                    cancelPendingPowerKeyAction();
                    interceptScreenshotChord();
                }
            } else {
                mVolumeDownKeyTriggered = false;
                cancelPendingScreenshotChordAction();
            }
        } else
        if(j == 24)
            if(flag1) {
                if(flag && !mVolumeUpKeyTriggered && (0x400 & keyevent.getFlags()) == 0) {
                    mVolumeUpKeyTriggered = true;
                    cancelPendingPowerKeyAction();
                    cancelPendingScreenshotChordAction();
                }
            } else {
                mVolumeUpKeyTriggered = false;
                cancelPendingScreenshotChordAction();
            }
        if(!flag1)
            continue; /* Loop/switch isn't completed */
        itelephony3 = getTelephonyService();
        if(itelephony3 == null) goto _L11; else goto _L10
_L10:
        if(!itelephony3.isRinging()) goto _L13; else goto _L12
_L12:
        Log.i("WindowManager", "interceptKeyBeforeQueueing: VOLUME key-down while ringing: Silence ringer!");
        itelephony3.silenceRinger();
        k &= -2;
        continue; /* Loop/switch isn't completed */
_L13:
        try {
            if(itelephony3.isOffhook() && (k & 1) == 0) {
                handleVolumeKey(0, j);
                continue; /* Loop/switch isn't completed */
            }
        }
        catch(RemoteException remoteexception3) {
            Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception3);
        }
_L11:
        if(isMusicActive() && (k & 1) == 0)
            handleVolumeKey(3, j);
        continue; /* Loop/switch isn't completed */
_L5:
        k &= -2;
        if(!flag1) goto _L15; else goto _L14
_L14:
        ITelephony itelephony2;
        boolean flag11;
        itelephony2 = getTelephonyService();
        flag11 = false;
        if(itelephony2 == null)
            break MISSING_BLOCK_LABEL_732;
        boolean flag13 = itelephony2.endCall();
        flag11 = flag13;
_L16:
        boolean flag12;
        RemoteException remoteexception2;
        if(!flag || flag11)
            flag12 = true;
        else
            flag12 = false;
        interceptPowerKeyDown(flag12);
        continue; /* Loop/switch isn't completed */
        remoteexception2;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception2);
          goto _L16
_L15:
        if(interceptPowerKeyUp(flag2) && ((1 & mEndcallBehavior) == 0 || !goHome()) && (2 & mEndcallBehavior) != 0)
            k = 4 | k & -3;
        continue; /* Loop/switch isn't completed */
_L7:
        k &= -2;
        if(!flag1) goto _L18; else goto _L17
_L17:
        ITelephony itelephony1;
        boolean flag8;
        if(flag && !mPowerKeyTriggered && (0x400 & keyevent.getFlags()) == 0) {
            mPowerKeyTriggered = true;
            mPowerKeyTime = keyevent.getDownTime();
            interceptScreenshotChord();
        }
        itelephony1 = getTelephonyService();
        flag8 = false;
        if(itelephony1 == null) goto _L20; else goto _L19
_L19:
        if(!itelephony1.isRinging()) goto _L22; else goto _L21
_L21:
        itelephony1.silenceRinger();
_L20:
        boolean flag9;
        RemoteException remoteexception1;
        boolean flag10;
        if(!flag || flag8 || mVolumeDownKeyTriggered || mVolumeUpKeyTriggered)
            flag9 = true;
        else
            flag9 = false;
        interceptPowerKeyDown(flag9);
        continue; /* Loop/switch isn't completed */
_L22:
        if((2 & mIncallPowerBehavior) == 0 || !itelephony1.isOffhook()) goto _L20; else goto _L23
_L23:
        flag10 = itelephony1.endCall();
        flag8 = flag10;
          goto _L20
        remoteexception1;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception1);
          goto _L20
_L18:
        mPowerKeyTriggered = false;
        cancelPendingScreenshotChordAction();
        boolean flag7;
        if(flag2 || mPendingPowerKeyUpCanceled)
            flag7 = true;
        else
            flag7 = false;
        if(interceptPowerKeyUp(flag7))
            k = 4 | k & -3;
        mPendingPowerKeyUpCanceled = false;
        Injector.sendPowerUpBroadcast(this);
        continue; /* Loop/switch isn't completed */
_L9:
        ITelephony itelephony;
        if(!flag1)
            break MISSING_BLOCK_LABEL_1083;
        itelephony = getTelephonyService();
        if(itelephony == null)
            break MISSING_BLOCK_LABEL_1083;
        boolean flag6 = itelephony.isIdle();
        if(!flag6)
            continue; /* Loop/switch isn't completed */
_L25:
        if((k & 1) == 0) {
            mBroadcastWakeLock.acquire();
            Message message = mHandler.obtainMessage(3, new KeyEvent(keyevent));
            message.setAsynchronous(true);
            message.sendToTarget();
        }
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception);
        if(true) goto _L25; else goto _L24
_L24:
        RemoteException remoteexception4;
        remoteexception4;
        Log.w("WindowManager", "ITelephony threw RemoteException", remoteexception4);
        if(true) goto _L27; else goto _L26
_L26:
    }

    public int interceptMotionBeforeQueueingWhenScreenOff(int i) {
        int j = 0;
        boolean flag;
        if((i & 3) != 0)
            flag = true;
        else
            flag = false;
        if(flag)
            if(mKeyguardMediator != null && mKeyguardMediator.isShowing())
                mKeyguardMediator.onWakeMotionWhenKeyguardShowingTq();
            else
                j = 0 | 2;
        return j;
    }

    boolean isDeviceProvisioned() {
        boolean flag = false;
        if(android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0)
            flag = true;
        return flag;
    }

    public boolean isKeyguardLocked() {
        return keyguardOn();
    }

    public boolean isKeyguardSecure() {
        boolean flag;
        if(mKeyguardMediator == null)
            flag = false;
        else
            flag = mKeyguardMediator.isSecure();
        return flag;
    }

    boolean isMusicActive() {
        AudioManager audiomanager = (AudioManager)mContext.getSystemService("audio");
        boolean flag;
        if(audiomanager == null) {
            Log.w("WindowManager", "isMusicActive: couldn't get AudioManager reference");
            flag = false;
        } else {
            flag = audiomanager.isMusicActive();
        }
        return flag;
    }

    public boolean isScreenOnEarly() {
        return mScreenOnEarly;
    }

    public boolean isScreenOnFully() {
        return mScreenOnFully;
    }

    public boolean isScreenSaverEnabled() {
        boolean flag;
        if(mScreenSaverFeatureAvailable && mScreenSaverEnabledByUser && mScreenSaverMayRun && mScreenOnEarly && mPluggedIn)
            flag = true;
        else
            flag = false;
        return flag;
    }

    boolean keyguardOn() {
        boolean flag;
        if(keyguardIsShowingTq() || inKeyguardRestrictedKeyInputMode())
            flag = true;
        else
            flag = false;
        return flag;
    }

    void launchHomeFromHotKey() {
        if(mKeyguardMediator == null || !mKeyguardMediator.isShowingAndNotHidden())
            if(!mHideLockScreen && mKeyguardMediator.isInputRestricted()) {
                mKeyguardMediator.verifyUnlock(new android.view.WindowManagerPolicy.OnKeyguardExitResult() {

                    public void onKeyguardExitResult(boolean flag) {
                        if(flag) {
                            try {
                                ActivityManagerNative.getDefault().stopAppSwitches();
                            }
                            catch(RemoteException remoteexception1) { }
                            sendCloseSystemWindows("homekey");
                            startDockOrHome();
                        }
                    }

                    final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
                });
            } else {
                try {
                    ActivityManagerNative.getDefault().stopAppSwitches();
                }
                catch(RemoteException remoteexception) { }
                sendCloseSystemWindows("homekey");
                startDockOrHome();
            }
    }

    public void layoutWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams, android.view.WindowManagerPolicy.WindowState windowstate1) {
        if(windowstate != mStatusBar && windowstate != mNavigationBar) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag;
        int i;
        int j;
        int k;
        Rect rect;
        Rect rect1;
        Rect rect2;
        Rect rect3;
        boolean flag1;
        if(windowstate == mLastInputMethodTargetWindow && mLastInputMethodWindow != null)
            flag = true;
        else
            flag = false;
        if(flag)
            offsetInputMethodWindowLw(mLastInputMethodWindow);
        i = layoutparams.flags;
        j = layoutparams.softInputMode;
        k = windowstate.getSystemUiVisibility();
        rect = mTmpParentFrame;
        rect1 = mTmpDisplayFrame;
        rect2 = mTmpContentFrame;
        rect3 = mTmpVisibleFrame;
        if(mHasNavigationBar && mNavigationBar != null && mNavigationBar.isVisibleLw())
            flag1 = true;
        else
            flag1 = false;
        if(layoutparams.type == 2011) {
            int i13 = mDockLeft;
            rect3.left = i13;
            rect2.left = i13;
            rect1.left = i13;
            rect.left = i13;
            int j13 = mDockTop;
            rect3.top = j13;
            rect2.top = j13;
            rect1.top = j13;
            rect.top = j13;
            int k13 = mDockRight;
            rect3.right = k13;
            rect2.right = k13;
            rect1.right = k13;
            rect.right = k13;
            int l13 = mDockBottom;
            rect3.bottom = l13;
            rect2.bottom = l13;
            rect1.bottom = l13;
            rect.bottom = l13;
            layoutparams.gravity = 80;
            mDockLayer = windowstate.getSurfaceLayer();
        } else {
            int l = j & 0xf0;
            if((0x10500 & i) == 0x10100 && (k & 4) == 0) {
                if(windowstate1 != null) {
                    setAttachedWindowFrames(windowstate, i, j, windowstate1, true, rect, rect1, rect2, rect3);
                } else {
                    if(layoutparams.type == 2014 || layoutparams.type == 2017) {
                        int i10;
                        int j10;
                        int k10;
                        int l10;
                        if(flag1)
                            i10 = mDockLeft;
                        else
                            i10 = mUnrestrictedScreenLeft;
                        rect1.left = i10;
                        rect.left = i10;
                        j10 = mUnrestrictedScreenTop;
                        rect1.top = j10;
                        rect.top = j10;
                        if(flag1)
                            k10 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                        else
                            k10 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                        rect1.right = k10;
                        rect.right = k10;
                        if(flag1)
                            l10 = mRestrictedScreenTop + mRestrictedScreenHeight;
                        else
                            l10 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                        rect1.bottom = l10;
                        rect.bottom = l10;
                    } else
                    if(mCanHideNavigationBar && (k & 0x200) != 0 && layoutparams.type >= 1 && layoutparams.type <= 1999) {
                        int i12 = mUnrestrictedScreenLeft;
                        rect1.left = i12;
                        rect.left = i12;
                        int j12 = mUnrestrictedScreenTop;
                        rect1.top = j12;
                        rect.top = j12;
                        int k12 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                        rect1.right = k12;
                        rect.right = k12;
                        int l12 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                        rect1.bottom = l12;
                        rect.bottom = l12;
                    } else {
                        int i11 = mRestrictedScreenLeft;
                        rect1.left = i11;
                        rect.left = i11;
                        int j11 = mRestrictedScreenTop;
                        rect1.top = j11;
                        rect.top = j11;
                        int k11 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                        rect1.right = k11;
                        rect.right = k11;
                        int l11 = mRestrictedScreenTop + mRestrictedScreenHeight;
                        rect1.bottom = l11;
                        rect.bottom = l11;
                    }
                    if(l != 16) {
                        rect2.left = mDockLeft;
                        rect2.top = mDockTop;
                        rect2.right = mDockRight;
                        rect2.bottom = mDockBottom;
                    } else {
                        rect2.left = mContentLeft;
                        rect2.top = mContentTop;
                        rect2.right = mContentRight;
                        rect2.bottom = mContentBottom;
                    }
                    applyStableConstraints(k, i, rect2);
                    if(l != 48) {
                        rect3.left = mCurLeft;
                        rect3.top = mCurTop;
                        rect3.right = mCurRight;
                        rect3.bottom = mCurBottom;
                    } else {
                        rect3.set(rect2);
                    }
                }
            } else
            if((i & 0x100) != 0 || (k & 0x600) != 0) {
                if(layoutparams.type == 2014 || layoutparams.type == 2017) {
                    int i1;
                    int j1;
                    int k1;
                    int l1;
                    if(flag1)
                        i1 = mDockLeft;
                    else
                        i1 = mUnrestrictedScreenLeft;
                    rect2.left = i1;
                    rect1.left = i1;
                    rect.left = i1;
                    j1 = mUnrestrictedScreenTop;
                    rect2.top = j1;
                    rect1.top = j1;
                    rect.top = j1;
                    if(flag1)
                        k1 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                    else
                        k1 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect2.right = k1;
                    rect1.right = k1;
                    rect.right = k1;
                    if(flag1)
                        l1 = mRestrictedScreenTop + mRestrictedScreenHeight;
                    else
                        l1 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect2.bottom = l1;
                    rect1.bottom = l1;
                    rect.bottom = l1;
                } else
                if(layoutparams.type == 2019 || layoutparams.type == 2024) {
                    int i2 = mUnrestrictedScreenLeft;
                    rect1.left = i2;
                    rect.left = i2;
                    int j2 = mUnrestrictedScreenTop;
                    rect1.top = j2;
                    rect.top = j2;
                    int k2 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect1.right = k2;
                    rect.right = k2;
                    int l2 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect1.bottom = l2;
                    rect.bottom = l2;
                } else
                if((layoutparams.type == 2015 || layoutparams.type == 2021) && (i & 0x400) != 0) {
                    int i6 = mUnrestrictedScreenLeft;
                    rect1.left = i6;
                    rect.left = i6;
                    int j6 = mUnrestrictedScreenTop;
                    rect1.top = j6;
                    rect.top = j6;
                    int k6 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect1.right = k6;
                    rect.right = k6;
                    int l6 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect1.bottom = l6;
                    rect.bottom = l6;
                } else
                if(layoutparams.type == 2021) {
                    int i5 = mUnrestrictedScreenLeft;
                    rect2.left = i5;
                    rect1.left = i5;
                    rect.left = i5;
                    int j5 = mUnrestrictedScreenTop;
                    rect2.top = j5;
                    rect1.top = j5;
                    rect.top = j5;
                    int k5 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect2.right = k5;
                    rect1.right = k5;
                    rect.right = k5;
                    int l5 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect2.bottom = l5;
                    rect1.bottom = l5;
                    rect.bottom = l5;
                } else
                if(mCanHideNavigationBar && (k & 0x200) != 0 && layoutparams.type >= 1 && layoutparams.type <= 1999) {
                    int i4 = mUnrestrictedScreenLeft;
                    rect2.left = i4;
                    rect1.left = i4;
                    rect.left = i4;
                    int j4 = mUnrestrictedScreenTop;
                    rect2.top = j4;
                    rect1.top = j4;
                    rect.top = j4;
                    int k4 = mUnrestrictedScreenLeft + mUnrestrictedScreenWidth;
                    rect2.right = k4;
                    rect1.right = k4;
                    rect.right = k4;
                    int l4 = mUnrestrictedScreenTop + mUnrestrictedScreenHeight;
                    rect2.bottom = l4;
                    rect1.bottom = l4;
                    rect.bottom = l4;
                } else {
                    int i3 = mRestrictedScreenLeft;
                    rect2.left = i3;
                    rect1.left = i3;
                    rect.left = i3;
                    int j3 = mRestrictedScreenTop;
                    rect2.top = j3;
                    rect1.top = j3;
                    rect.top = j3;
                    int k3 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                    rect2.right = k3;
                    rect1.right = k3;
                    rect.right = k3;
                    int l3 = mRestrictedScreenTop + mRestrictedScreenHeight;
                    rect2.bottom = l3;
                    rect1.bottom = l3;
                    rect.bottom = l3;
                }
                applyStableConstraints(k, i, rect2);
                if(l != 48) {
                    rect3.left = mCurLeft;
                    rect3.top = mCurTop;
                    rect3.right = mCurRight;
                    rect3.bottom = mCurBottom;
                } else {
                    rect3.set(rect2);
                }
            } else
            if(windowstate1 != null)
                setAttachedWindowFrames(windowstate, i, l, windowstate1, false, rect, rect1, rect2, rect3);
            else
            if(layoutparams.type == 2014) {
                int i9 = mRestrictedScreenLeft;
                rect2.left = i9;
                rect1.left = i9;
                rect.left = i9;
                int j9 = mRestrictedScreenTop;
                rect2.top = j9;
                rect1.top = j9;
                rect.top = j9;
                int k9 = mRestrictedScreenLeft + mRestrictedScreenWidth;
                rect2.right = k9;
                rect1.right = k9;
                rect.right = k9;
                int l9 = mRestrictedScreenTop + mRestrictedScreenHeight;
                rect2.bottom = l9;
                rect1.bottom = l9;
                rect.bottom = l9;
            } else {
                rect.left = mContentLeft;
                rect.top = mContentTop;
                rect.right = mContentRight;
                rect.bottom = mContentBottom;
                if(l != 16) {
                    int i8 = mDockLeft;
                    rect2.left = i8;
                    rect1.left = i8;
                    int j8 = mDockTop;
                    rect2.top = j8;
                    rect1.top = j8;
                    int k8 = mDockRight;
                    rect2.right = k8;
                    rect1.right = k8;
                    int l8 = mDockBottom;
                    rect2.bottom = l8;
                    rect1.bottom = l8;
                } else {
                    int i7 = mContentLeft;
                    rect2.left = i7;
                    rect1.left = i7;
                    int j7 = mContentTop;
                    rect2.top = j7;
                    rect1.top = j7;
                    int k7 = mContentRight;
                    rect2.right = k7;
                    rect1.right = k7;
                    int l7 = mContentBottom;
                    rect2.bottom = l7;
                    rect1.bottom = l7;
                }
                if(l != 48) {
                    rect3.left = mCurLeft;
                    rect3.top = mCurTop;
                    rect3.right = mCurRight;
                    rect3.bottom = mCurBottom;
                } else {
                    rect3.set(rect2);
                }
            }
        }
        if((i & 0x200) != 0) {
            rect3.top = -10000;
            rect3.left = -10000;
            rect2.top = -10000;
            rect2.left = -10000;
            rect1.top = -10000;
            rect1.left = -10000;
            rect3.bottom = 10000;
            rect3.right = 10000;
            rect2.bottom = 10000;
            rect2.right = 10000;
            rect1.bottom = 10000;
            rect1.right = 10000;
        }
        windowstate.computeFrameLw(rect, rect1, rect2, rect3);
        if(layoutparams.type == 2011 && !windowstate.getGivenInsetsPendingLw()) {
            setLastInputMethodWindowLw(null, null);
            offsetInputMethodWindowLw(windowstate);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public void lockNow() {
        mContext.enforceCallingOrSelfPermission("android.permission.DEVICE_POWER", null);
        mHandler.removeCallbacks(mScreenLockTimeout);
        mHandler.post(mScreenLockTimeout);
    }

    boolean needSensorRunningLp() {
        boolean flag;
        flag = true;
        break MISSING_BLOCK_LABEL_2;
        if(mCurrentAppOrientation != 4 && mCurrentAppOrientation != 10 && mCurrentAppOrientation != 7 && mCurrentAppOrientation != 6 && (!mCarDockEnablesAccelerometer || mDockMode != 2) && (!mDeskDockEnablesAccelerometer || mDockMode != flag && mDockMode != 3 && mDockMode != 4) && mUserRotationMode == flag)
            flag = false;
        return flag;
    }

    public void notifyLidSwitchChanged(long l, boolean flag) {
        boolean flag1 = true;
        if(!mHeadless) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i;
        if(flag)
            i = ((flag1) ? 1 : 0);
        else
            i = 0;
        if(i != mLidState) {
            mLidState = i;
            applyLidSwitchState();
            updateRotation(flag1);
            if(flag) {
                if(keyguardIsShowingTq()) {
                    KeyguardViewMediator keyguardviewmediator = mKeyguardMediator;
                    if(mDockMode == 0)
                        flag1 = false;
                    keyguardviewmediator.onWakeKeyWhenKeyguardShowingTq(26, flag1);
                } else {
                    mPowerManager.userActivity(SystemClock.uptimeMillis(), false, flag1);
                }
            } else
            if(!mLidControlsSleep)
                mPowerManager.userActivity(SystemClock.uptimeMillis(), false, 0);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public boolean performHapticFeedbackLw(android.view.WindowManagerPolicy.WindowState windowstate, int i, boolean flag) {
        boolean flag1;
        flag1 = false;
        boolean flag2;
        if(android.provider.Settings.System.getInt(mContext.getContentResolver(), "haptic_feedback_enabled", 0) == 0)
            flag2 = true;
        else
            flag2 = false;
        if(flag || !flag2 && !mKeyguardMediator.isShowingAndNotHidden()) goto _L2; else goto _L1
_L1:
        return flag1;
_L2:
        i;
        JVM INSTR lookupswitch 5: default 104
    //                   0: 107
    //                   1: 137
    //                   3: 146
    //                   10000: 155
    //                   10001: 164;
           goto _L1 _L3 _L4 _L5 _L6 _L7
_L3:
        long al[] = mLongPressVibePattern;
_L8:
        if(al.length == 1)
            mVibrator.vibrate(al[0]);
        else
            mVibrator.vibrate(al, -1);
        flag1 = true;
          goto _L1
_L4:
        al = mVirtualKeyVibePattern;
          goto _L8
_L5:
        al = mKeyboardTapVibePattern;
          goto _L8
_L6:
        al = mSafeModeDisabledVibePattern;
          goto _L8
_L7:
        al = mSafeModeEnabledVibePattern;
          goto _L8
    }

    public int prepareAddWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManager.LayoutParams layoutparams) {
        byte byte0 = -7;
        layoutparams.type;
        JVM INSTR lookupswitch 6: default 64
    //                   2000: 68
    //                   2004: 196
    //                   2014: 164
    //                   2017: 180
    //                   2019: 108
    //                   2024: 148;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7
_L1:
        byte0 = 0;
_L9:
        return byte0;
_L2:
        mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
        if(mStatusBar != null && mStatusBar.isAlive()) goto _L9; else goto _L8
_L8:
        mStatusBar = windowstate;
        continue; /* Loop/switch isn't completed */
_L6:
        mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
        if(mNavigationBar != null && mNavigationBar.isAlive()) goto _L9; else goto _L10
_L10:
        mNavigationBar = windowstate;
        continue; /* Loop/switch isn't completed */
_L7:
        mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
        continue; /* Loop/switch isn't completed */
_L4:
        mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
        continue; /* Loop/switch isn't completed */
_L5:
        mContext.enforceCallingOrSelfPermission("android.permission.STATUS_BAR_SERVICE", "PhoneWindowManager");
        continue; /* Loop/switch isn't completed */
_L3:
        if(mKeyguard != null) goto _L9; else goto _L11
_L11:
        mKeyguard = windowstate;
        if(true) goto _L1; else goto _L12
_L12:
    }

    void readLidState() {
        mLidState = mWindowManagerFuncs.getLidState();
    }

    public void removeStartingWindow(IBinder ibinder, View view) {
        if(view != null)
            ((WindowManager)mContext.getSystemService("window")).removeView(view);
    }

    public void removeWindowLw(android.view.WindowManagerPolicy.WindowState windowstate) {
        if(mStatusBar != windowstate) goto _L2; else goto _L1
_L1:
        mStatusBar = null;
_L4:
        return;
_L2:
        if(mKeyguard == windowstate)
            mKeyguard = null;
        else
        if(mNavigationBar == windowstate)
            mNavigationBar = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public int rotationForOrientationLw(int i, int j) {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        int k = mOrientationListener.getProposedRotation();
        if(k < 0)
            k = j;
        int l;
        if(mLidState == 1 && mLidOpenRotation >= 0)
            l = mLidOpenRotation;
        else
        if(mDockMode == 2 && (mCarDockEnablesAccelerometer || mCarDockRotation >= 0)) {
            if(mCarDockEnablesAccelerometer)
                l = k;
            else
                l = mCarDockRotation;
        } else
        if((mDockMode == 1 || mDockMode == 3 || mDockMode == 4) && (mDeskDockEnablesAccelerometer || mDeskDockRotation >= 0)) {
            if(mDeskDockEnablesAccelerometer)
                l = k;
            else
                l = mDeskDockRotation;
        } else
        if(mHdmiPlugged)
            l = mHdmiRotation;
        else
        if(mUserRotationMode == 0 && (i == 2 || i == -1) || i == 4 || i == 10 || i == 6 || i == 7) {
            if(mAllowAllRotations < 0) {
                Exception exception;
                int i1;
                if(mContext.getResources().getBoolean(0x1110016))
                    i1 = 1;
                else
                    i1 = 0;
                mAllowAllRotations = i1;
            }
            if(k != 2 || mAllowAllRotations == 1 || i == 10)
                l = k;
            else
                l = j;
        } else
        if(mUserRotationMode == 1 && i != 5)
            l = mUserRotation;
        else
            l = -1;
          goto _L1
_L18:
        if(l < 0)
            l = 0;
          goto _L2
_L20:
        if(!isAnyPortrait(l)) goto _L3; else goto _L2
        exception;
        throw exception;
_L3:
        l = mPortraitRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L19:
        if(!isLandscapeOrSeascape(l)) goto _L5; else goto _L4
_L4:
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L5:
        l = mLandscapeRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L24:
        if(!isAnyPortrait(l)) goto _L7; else goto _L6
_L6:
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L7:
        l = mUpsideDownRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L23:
        if(!isLandscapeOrSeascape(l)) goto _L9; else goto _L8
_L8:
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L9:
        l = mSeascapeRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L21:
        if(!isLandscapeOrSeascape(l)) goto _L11; else goto _L10
_L10:
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L11:
        if(!isLandscapeOrSeascape(j)) goto _L13; else goto _L12
_L12:
        obj;
        JVM INSTR monitorexit ;
        l = j;
          goto _L2
_L13:
        l = mLandscapeRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L22:
        if(!isAnyPortrait(l)) goto _L15; else goto _L14
_L14:
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L15:
        if(!isAnyPortrait(j)) goto _L17; else goto _L16
_L16:
        obj;
        JVM INSTR monitorexit ;
        l = j;
          goto _L2
_L17:
        l = mPortraitRotation;
        obj;
        JVM INSTR monitorexit ;
          goto _L2
_L1:
        i;
        JVM INSTR tableswitch 0 9: default 48
    //                   0 310
    //                   1 278
    //                   2 48
    //                   3 48
    //                   4 48
    //                   5 48
    //                   6 385
    //                   7 426
    //                   8 360
    //                   9 335;
           goto _L18 _L19 _L20 _L18 _L18 _L18 _L18 _L21 _L22 _L23 _L24
_L2:
        return l;
    }

    public boolean rotationHasCompatibleMetricsLw(int i, int j) {
        i;
        JVM INSTR tableswitch 0 9: default 56
    //                   0 69
    //                   1 60
    //                   2 56
    //                   3 56
    //                   4 56
    //                   5 56
    //                   6 69
    //                   7 60
    //                   8 69
    //                   9 60;
           goto _L1 _L2 _L3 _L1 _L1 _L1 _L1 _L2 _L3 _L2 _L3
_L1:
        boolean flag = true;
_L5:
        return flag;
_L3:
        flag = isAnyPortrait(j);
        continue; /* Loop/switch isn't completed */
_L2:
        flag = isLandscapeOrSeascape(j);
        if(true) goto _L5; else goto _L4
_L4:
    }

    public void screenOnStartedLw() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mScreenSaverMayRun = false;
        return;
    }

    public void screenOnStoppedLw() {
        if(!mPowerManager.isScreenOn())
            break MISSING_BLOCK_LABEL_67;
        if(mKeyguardMediator != null && !mKeyguardMediator.isShowingAndNotHidden()) {
            long l = SystemClock.uptimeMillis();
            mPowerManager.userActivity(l, false, 0);
        }
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mScreenSaverMayRun = true;
    }

    public void screenTurnedOff(int i) {
        EventLog.writeEvent(0x11170, 0);
        synchronized(mLock) {
            mScreenOnEarly = false;
            mScreenOnFully = false;
        }
        if(mKeyguardMediator != null)
            mKeyguardMediator.onScreenTurnedOff(i);
        synchronized(mLock) {
            updateOrientationListenerLp();
            updateLockScreenTimeout();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public void screenTurningOn(final android.view.WindowManagerPolicy.ScreenOnListener screenOnListener) {
label0:
        {
            {
                EventLog.writeEvent(0x11170, 1);
                if(screenOnListener == null)
                    break label0;
                if(mKeyguardMediator != null) {
                    Object obj;
                    try {
                        mWindowManager.setEventDispatching(true);
                    }
                    catch(RemoteException remoteexception) { }
                    mKeyguardMediator.onScreenTurnedOn(new KeyguardViewManager.ShowListener() {

                        public void onShown(IBinder ibinder) {
                            if(ibinder == null) goto _L2; else goto _L1
_L1:
                            mWindowManager.waitForWindowDrawn(ibinder, new android.os.IRemoteCallback.Stub() {

                                public void sendResult(Bundle bundle) {
                                    Slog.i("WindowManager", "Lock screen displayed!");
                                    screenOnListener.onScreenOn();
                                    Object obj3 = mLock;
                                    obj3;
                                    JVM INSTR monitorenter ;
                                    mScreenOnFully = true;
                                    return;
                                }

                                final _cls14 this$1;

                     {
                        this$1 = _cls14.this;
                        super();
                    }
                            });
_L4:
                            return;
_L2:
                            Slog.i("WindowManager", "No lock screen!");
                            screenOnListener.onScreenOn();
                            Object obj2 = mLock;
                            obj2;
                            JVM INSTR monitorenter ;
                            mScreenOnFully = true;
                            continue; /* Loop/switch isn't completed */
                            RemoteException remoteexception1;
                            remoteexception1;
                            if(true) goto _L4; else goto _L3
_L3:
                        }

                        final PhoneWindowManager this$0;
                        final android.view.WindowManagerPolicy.ScreenOnListener val$screenOnListener;

             {
                this$0 = PhoneWindowManager.this;
                screenOnListener = screenonlistener;
                super();
            }
                    });
                }
            }
            synchronized(mLock) {
                mScreenOnEarly = true;
                updateOrientationListenerLp();
                updateLockScreenTimeout();
            }
            return;
        }
        if(mKeyguardMediator != null)
            mKeyguardMediator.onScreenTurnedOn(null);
        obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mScreenOnFully = true;
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_45;
        exception;
        obj1;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int selectAnimationLw(android.view.WindowManagerPolicy.WindowState windowstate, int i) {
        if(windowstate != mStatusBar) goto _L2; else goto _L1
_L1:
        if(i != 8194 && i != 8196) goto _L4; else goto _L3
_L3:
        int j = 0x10a001b;
_L7:
        return j;
_L4:
        if(i == 4097 || i == 4099) {
            j = 0x10a001a;
            continue; /* Loop/switch isn't completed */
        }
          goto _L5
_L2:
        if(windowstate == mNavigationBar)
            if(mNavigationBarOnBottom) {
                if(i == 8194 || i == 8196) {
                    j = 0x10a0015;
                    continue; /* Loop/switch isn't completed */
                }
                if(i == 4097 || i == 4099) {
                    j = 0x10a0014;
                    continue; /* Loop/switch isn't completed */
                }
            } else {
                if(i == 8194 || i == 8196) {
                    j = 0x10a0019;
                    continue; /* Loop/switch isn't completed */
                }
                if(i == 4097 || i == 4099) {
                    j = 0x10a0018;
                    continue; /* Loop/switch isn't completed */
                }
            }
_L5:
        if(i == 5 && windowstate.hasAppShownWindows())
            j = 0x10a0011;
        else
            j = 0;
        if(true) goto _L7; else goto _L6
_L6:
    }

    void sendCloseSystemWindows() {
        sendCloseSystemWindows(mContext, null);
    }

    void sendCloseSystemWindows(String s) {
        sendCloseSystemWindows(mContext, s);
    }

    void setAttachedWindowFrames(android.view.WindowManagerPolicy.WindowState windowstate, int i, int j, android.view.WindowManagerPolicy.WindowState windowstate1, boolean flag, Rect rect, Rect rect1, 
            Rect rect2, Rect rect3) {
        if(windowstate.getSurfaceLayer() <= mDockLayer || windowstate1.getSurfaceLayer() >= mDockLayer) goto _L2; else goto _L1
_L1:
        int k = mDockLeft;
        rect3.left = k;
        rect2.left = k;
        rect1.left = k;
        int l = mDockTop;
        rect3.top = l;
        rect2.top = l;
        rect1.top = l;
        int i1 = mDockRight;
        rect3.right = i1;
        rect2.right = i1;
        rect1.right = i1;
        int j1 = mDockBottom;
        rect3.bottom = j1;
        rect2.bottom = j1;
        rect1.bottom = j1;
_L4:
        if((i & 0x100) == 0)
            rect1 = windowstate1.getFrameLw();
        rect.set(rect1);
        return;
_L2:
        if(j == 16)
            break; /* Loop/switch isn't completed */
        rect2.set(windowstate1.getDisplayFrameLw());
_L5:
        if(flag)
            rect2 = windowstate1.getDisplayFrameLw();
        rect1.set(rect2);
        rect3.set(windowstate1.getVisibleFrameLw());
        if(true) goto _L4; else goto _L3
_L3:
        rect2.set(windowstate1.getContentFrameLw());
        if(windowstate1.getSurfaceLayer() < mDockLayer) {
            if(rect2.left < mContentLeft)
                rect2.left = mContentLeft;
            if(rect2.top < mContentTop)
                rect2.top = mContentTop;
            if(rect2.right > mContentRight)
                rect2.right = mContentRight;
            if(rect2.bottom > mContentBottom)
                rect2.bottom = mContentBottom;
        }
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }

    public void setCurrentOrientationLw(int i) {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if(i != mCurrentAppOrientation) {
            mCurrentAppOrientation = i;
            updateOrientationListenerLp();
        }
        return;
    }

    void setHdmiPlugged(boolean flag) {
        if(mHdmiPlugged != flag) {
            mHdmiPlugged = flag;
            if(flag && mDisplay != null) {
                mExternalDisplayWidth = mDisplay.getRawExternalWidth();
                mExternalDisplayHeight = mDisplay.getRawExternalHeight();
            }
            updateRotation(true, true);
            Intent intent = new Intent("android.intent.action.HDMI_PLUGGED");
            intent.addFlags(0x8000000);
            intent.putExtra("state", flag);
            mContext.sendStickyBroadcast(intent);
        }
    }

    public void setInitialDisplaySize(Display display, int i, int j) {
        mDisplay = display;
        int k;
        int l;
        int l3;
        if(i > j) {
            k = j;
            l = i;
            mLandscapeRotation = 0;
            mSeascapeRotation = 2;
            int ai[];
            int i1;
            int ai1[];
            int j1;
            int k1;
            int ai2[];
            int l1;
            int ai3[];
            int i2;
            int j2;
            int ai4[];
            int k2;
            int ai5[];
            int l2;
            int ai6[];
            int i3;
            int ai7[];
            int j3;
            int k3;
            int i4;
            if(mContext.getResources().getBoolean(0x1110017)) {
                mPortraitRotation = 1;
                mUpsideDownRotation = 3;
            } else {
                mPortraitRotation = 3;
                mUpsideDownRotation = 1;
            }
        } else {
            k = i;
            l = j;
            mPortraitRotation = 0;
            mUpsideDownRotation = 2;
            if(mContext.getResources().getBoolean(0x1110017)) {
                mLandscapeRotation = 3;
                mSeascapeRotation = 1;
            } else {
                mLandscapeRotation = 1;
                mSeascapeRotation = 3;
            }
        }
        mExternalDisplayWidth = mDisplay.getRawExternalWidth();
        mExternalDisplayHeight = mDisplay.getRawExternalHeight();
        mStatusBarHeight = mContext.getResources().getDimensionPixelSize(0x105000a);
        ai = mNavigationBarHeightForRotation;
        i1 = mPortraitRotation;
        ai1 = mNavigationBarHeightForRotation;
        j1 = mUpsideDownRotation;
        k1 = mContext.getResources().getDimensionPixelSize(0x105000b);
        ai1[j1] = k1;
        ai[i1] = k1;
        ai2 = mNavigationBarHeightForRotation;
        l1 = mLandscapeRotation;
        ai3 = mNavigationBarHeightForRotation;
        i2 = mSeascapeRotation;
        j2 = mContext.getResources().getDimensionPixelSize(0x105000c);
        ai3[i2] = j2;
        ai2[l1] = j2;
        ai4 = mNavigationBarWidthForRotation;
        k2 = mPortraitRotation;
        ai5 = mNavigationBarWidthForRotation;
        l2 = mUpsideDownRotation;
        ai6 = mNavigationBarWidthForRotation;
        i3 = mLandscapeRotation;
        ai7 = mNavigationBarWidthForRotation;
        j3 = mSeascapeRotation;
        k3 = mContext.getResources().getDimensionPixelSize(0x105000d);
        ai7[j3] = k3;
        ai6[i3] = k3;
        ai5[l2] = k3;
        ai4[k2] = k3;
        l3 = (k * 160) / DisplayMetrics.DENSITY_DEVICE;
        if(l3 < 600) {
            mHasSystemNavBar = false;
            mNavigationBarCanMove = true;
        } else
        if(l3 < 720) {
            mHasSystemNavBar = false;
            mNavigationBarCanMove = false;
        } else {
            mHasSystemNavBar = true;
            mNavigationBarCanMove = false;
        }
        if(!mHasSystemNavBar) {
            mHasNavigationBar = mContext.getResources().getBoolean(0x1110034);
            String s = SystemProperties.get("qemu.hw.mainkeys");
            if(!"".equals(s))
                if(s.equals("1"))
                    mHasNavigationBar = false;
                else
                if(s.equals("0"))
                    mHasNavigationBar = true;
        } else {
            mHasNavigationBar = false;
        }
        if(mHasSystemNavBar) {
            i4 = (l * 160) / DisplayMetrics.DENSITY_DEVICE;
            boolean flag;
            if((16 * (l3 - (160 * mNavigationBarHeightForRotation[mLandscapeRotation]) / DisplayMetrics.DENSITY_DEVICE)) / i4 < 9)
                flag = true;
            else
                flag = false;
            mCanHideNavigationBar = flag;
        } else
        if(mHasNavigationBar)
            mCanHideNavigationBar = true;
        else
            mCanHideNavigationBar = false;
        if("portrait".equals(SystemProperties.get("persist.demo.hdmirotation")))
            mHdmiRotation = mPortraitRotation;
        else
            mHdmiRotation = mLandscapeRotation;
    }

    public void setLastInputMethodWindowLw(android.view.WindowManagerPolicy.WindowState windowstate, android.view.WindowManagerPolicy.WindowState windowstate1) {
        mLastInputMethodWindow = windowstate;
        mLastInputMethodTargetWindow = windowstate1;
    }

    void setPowerLongPress(Runnable runnable) {
        mPowerLongPress = runnable;
    }

    public void setRotationLw(int i) {
        mOrientationListener.setCurrentRotation(i);
    }

    public void setSafeMode(boolean flag) {
        mSafeMode = flag;
        char c;
        if(flag)
            c = '\u2711';
        else
            c = '\u2710';
        performHapticFeedbackLw(null, c, true);
    }

    public void setUserRotationMode(int i, int j) {
        ContentResolver contentresolver = mContext.getContentResolver();
        if(i == 1) {
            android.provider.Settings.System.putInt(contentresolver, "user_rotation", j);
            android.provider.Settings.System.putInt(contentresolver, "accelerometer_rotation", 0);
        } else {
            android.provider.Settings.System.putInt(contentresolver, "accelerometer_rotation", 1);
        }
    }

    public void showBootMessage(final CharSequence msg, boolean flag) {
        if(!mHeadless)
            mHandler.post(new Runnable() {

                public void run() {
                    if(mBootMsgDialog == null) {
                        mBootMsgDialog = new ProgressDialog(mContext, 3) {

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

                            final _cls17 this$1;

                     {
                        this$1 = _cls17.this;
                        super(context, i);
                    }
                        };
                        mBootMsgDialog.setTitle(0x10403e3);
                        mBootMsgDialog.setProgressStyle(0);
                        mBootMsgDialog.setIndeterminate(true);
                        mBootMsgDialog.getWindow().setType(2021);
                        mBootMsgDialog.getWindow().addFlags(258);
                        mBootMsgDialog.getWindow().setDimAmount(1.0F);
                        android.view.WindowManager.LayoutParams layoutparams = mBootMsgDialog.getWindow().getAttributes();
                        layoutparams.screenOrientation = 5;
                        mBootMsgDialog.getWindow().setAttributes(layoutparams);
                        mBootMsgDialog.setCancelable(false);
                        mBootMsgDialog.show();
                    }
                    mBootMsgDialog.setMessage(msg);
                }

                final PhoneWindowManager this$0;
                final CharSequence val$msg;

             {
                this$0 = PhoneWindowManager.this;
                msg = charsequence;
                super();
            }
            });
    }

    void showGlobalActionsDialog() {
        if(mGlobalActions == null)
            mGlobalActions = new MiuiGlobalActions(mContext, mWindowManagerFuncs);
        boolean flag = keyguardIsShowingTq();
        mGlobalActions.showDialog(flag, isDeviceProvisioned());
        if(flag)
            mKeyguardMediator.pokeWakelock();
    }

    void showOrHideRecentAppsDialog(final int behavior) {
        mHandler.post(new Runnable() {

            public void run() {
                if(mRecentAppsDialog == null)
                    mRecentAppsDialog = new RecentApplicationsDialog(mContext);
                if(!mRecentAppsDialog.isShowing()) goto _L2; else goto _L1
_L1:
                behavior;
                JVM INSTR tableswitch 0 3: default 80
            //                           0 81
            //                           1 80
            //                           2 81
            //                           3 94;
                   goto _L3 _L4 _L3 _L4 _L5
_L3:
                return;
_L4:
                mRecentAppsDialog.dismiss();
                continue; /* Loop/switch isn't completed */
_L5:
                mRecentAppsDialog.dismissAndSwitch();
                continue; /* Loop/switch isn't completed */
_L2:
                switch(behavior) {
                case 0: // '\0'
                    mRecentAppsDialog.show();
                    // fall through

                default:
                    if(false)
                        ;
                    break;

                case 1: // '\001'
                    try {
                        mWindowManager.setInTouchMode(false);
                    }
                    catch(RemoteException remoteexception) { }
                    mRecentAppsDialog.show();
                    break;
                }
                if(true) goto _L3; else goto _L6
_L6:
            }

            final PhoneWindowManager this$0;
            final int val$behavior;

             {
                this$0 = PhoneWindowManager.this;
                behavior = i;
                super();
            }
        });
    }

    void startDockOrHome() {
        Intent intent;
        intent = createHomeDockIntent();
        if(intent == null)
            break MISSING_BLOCK_LABEL_19;
        mContext.startActivity(intent);
_L1:
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        mContext.startActivity(mHomeIntent);
          goto _L1
    }

    public boolean startScreenSaver() {
        boolean flag = false;
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if(!isScreenSaverEnabled()) goto _L2; else goto _L1
_L1:
        IDreamManager idreammanager = getDreamManager();
        if(idreammanager != null) goto _L4; else goto _L3
_L3:
        return flag;
_L4:
        idreammanager.dream();
        flag = true;
        obj;
        JVM INSTR monitorexit ;
          goto _L3
        Exception exception;
        exception;
        throw exception;
        RemoteException remoteexception;
        remoteexception;
_L2:
        obj;
        JVM INSTR monitorexit ;
          goto _L3
    }

    public void stopScreenSaver() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        IDreamManager idreammanager = getDreamManager();
        if(idreammanager != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Exception exception;
        try {
            idreammanager.awaken();
        }
        catch(RemoteException remoteexception) { }
        finally {
            obj;
        }
        obj;
        JVM INSTR monitorexit ;
        if(true) goto _L1; else goto _L3
_L3:
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int subWindowTypeToLayerLw(int i) {
        i;
        JVM INSTR tableswitch 1000 1004: default 36
    //                   1000 66
    //                   1001 71
    //                   1002 83
    //                   1003 66
    //                   1004 77;
           goto _L1 _L2 _L3 _L4 _L2 _L5
_L1:
        int j;
        Log.e("WindowManager", (new StringBuilder()).append("Unknown sub-window type: ").append(i).toString());
        j = 0;
_L7:
        return j;
_L2:
        j = 1;
        continue; /* Loop/switch isn't completed */
_L3:
        j = -2;
        continue; /* Loop/switch isn't completed */
_L5:
        j = -1;
        continue; /* Loop/switch isn't completed */
_L4:
        j = 2;
        if(true) goto _L7; else goto _L6
_L6:
    }

    public void systemBooted() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mSystemBooted = true;
        return;
    }

    public void systemReady() {
        if(mKeyguardMediator != null)
            mKeyguardMediator.onSystemReady();
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        updateOrientationListenerLp();
        mSystemReady = true;
        mHandler.post(new Runnable() {

            public void run() {
                updateSettings();
            }

            final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
        });
        return;
    }

    void updateOrientationListenerLp() {
        if(mOrientationListener.canDetectOrientation()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag = true;
        if(mScreenOnEarly && needSensorRunningLp()) {
            flag = false;
            if(!mOrientationSensorEnabled) {
                mOrientationListener.enable();
                mOrientationSensorEnabled = true;
            }
        }
        if(flag && mOrientationSensorEnabled) {
            mOrientationListener.disable();
            mOrientationSensorEnabled = false;
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    void updateRotation(boolean flag) {
        mWindowManager.updateRotation(flag, false);
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    void updateRotation(boolean flag, boolean flag1) {
        mWindowManager.updateRotation(flag, flag1);
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public void updateSettings() {
        byte byte0;
        boolean flag;
        ContentResolver contentresolver;
        boolean flag1;
        byte0 = 2;
        flag = false;
        contentresolver = mContext.getContentResolver();
        flag1 = false;
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mEndcallBehavior = android.provider.Settings.System.getInt(contentresolver, "end_button_behavior", 2);
        mIncallPowerBehavior = android.provider.Settings.Secure.getInt(contentresolver, "incall_power_button_behavior", 1);
        int i = android.provider.Settings.System.getInt(contentresolver, "user_rotation", 0);
        if(mUserRotation != i) {
            mUserRotation = i;
            flag1 = true;
        }
        if(android.provider.Settings.System.getInt(contentresolver, "accelerometer_rotation", 0) == 0) goto _L2; else goto _L1
_L1:
        int j = 0;
_L5:
        String s;
        if(mUserRotationMode != j) {
            mUserRotationMode = j;
            flag1 = true;
            updateOrientationListenerLp();
        }
        if(mSystemReady) {
            int k = android.provider.Settings.System.getInt(contentresolver, "pointer_location", 0);
            if(mPointerLocationMode != k) {
                mPointerLocationMode = k;
                Handler handler = mHandler;
                if(k != 0)
                    byte0 = 1;
                handler.sendEmptyMessage(byte0);
            }
        }
        mLockScreenTimeout = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 0);
        s = android.provider.Settings.Secure.getString(contentresolver, "default_input_method");
        if(s == null || s.length() <= 0) goto _L4; else goto _L3
_L3:
        boolean flag2 = true;
_L6:
        if(mHasSoftInput != flag2) {
            mHasSoftInput = flag2;
            flag1 = true;
        }
        mScreenSaverFeatureAvailable = mContext.getResources().getBoolean(0x1110038);
        if(android.provider.Settings.Secure.getInt(contentresolver, "screensaver_enabled", 1) != 0)
            flag = true;
        mScreenSaverEnabledByUser = flag;
        mScreenSaverTimeout = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 0);
        if(mScreenSaverTimeout > 0)
            mScreenSaverTimeout = -5000 + mScreenSaverTimeout;
        if(flag1)
            updateRotation(true);
        return;
_L2:
        j = 1;
          goto _L5
_L4:
        flag2 = false;
          goto _L6
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
          goto _L5
    }

    public void userActivity() {
        Runnable runnable = mScreenLockTimeout;
        runnable;
        JVM INSTR monitorenter ;
        if(mLockScreenTimerActive) {
            mHandler.removeCallbacks(mScreenLockTimeout);
            mHandler.postDelayed(mScreenLockTimeout, mLockScreenTimeout);
        }
        return;
    }

    public int windowTypeToLayerLw(int i) {
        byte byte0 = 2;
        if(i < 1 || i > 99) goto _L2; else goto _L1
_L1:
        return byte0;
_L2:
        switch(i) {
        default:
            Log.e("WindowManager", (new StringBuilder()).append("Unknown window type: ").append(i).toString());
            break;

        case 2000: 
            byte0 = 15;
            break;

        case 2014: 
            byte0 = 16;
            break;

        case 2017: 
            byte0 = 14;
            break;

        case 2008: 
            byte0 = 5;
            break;

        case 2001: 
            byte0 = 4;
            break;

        case 2002: 
            byte0 = 3;
            break;

        case 2004: 
            byte0 = 11;
            break;

        case 2009: 
            byte0 = 12;
            break;

        case 2003: 
            byte0 = 8;
            break;

        case 2010: 
            byte0 = 21;
            break;

        case 2011: 
            byte0 = 9;
            break;

        case 2012: 
            byte0 = 10;
            break;

        case 2020: 
            byte0 = 17;
            break;

        case 2006: 
            byte0 = 18;
            break;

        case 2015: 
            byte0 = 23;
            break;

        case 2007: 
            byte0 = 7;
            break;

        case 2005: 
            byte0 = 6;
            break;

        case 2016: 
            byte0 = 22;
            break;

        case 2018: 
            byte0 = 25;
            break;

        case 2019: 
            byte0 = 19;
            break;

        case 2024: 
            byte0 = 20;
            break;

        case 2021: 
            byte0 = 24;
            break;

        case 2022: 
            byte0 = 26;
            break;

        case 2023: 
            byte0 = 13;
            break;

        case 2013: 
            break;
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    static final int APPLICATION_LAYER = 2;
    static final int APPLICATION_MEDIA_OVERLAY_SUBLAYER = -1;
    static final int APPLICATION_MEDIA_SUBLAYER = -2;
    static final int APPLICATION_PANEL_SUBLAYER = 1;
    static final int APPLICATION_SUB_PANEL_SUBLAYER = 2;
    static final int BOOT_PROGRESS_LAYER = 24;
    static final boolean DEBUG = false;
    static final boolean DEBUG_INPUT = false;
    static final boolean DEBUG_LAYOUT = false;
    static final boolean DEBUG_STARTING_WINDOW = false;
    static final int DRAG_LAYER = 22;
    static final boolean ENABLE_CAR_DOCK_HOME_CAPTURE = true;
    static final boolean ENABLE_DESK_DOCK_HOME_CAPTURE = false;
    static final int HIDDEN_NAV_CONSUMER_LAYER = 26;
    static final int INPUT_METHOD_DIALOG_LAYER = 10;
    static final int INPUT_METHOD_LAYER = 9;
    static final int KEYGUARD_DIALOG_LAYER = 12;
    static final int KEYGUARD_LAYER = 11;
    static final int LONG_PRESS_HOME_NOTHING = 0;
    static final int LONG_PRESS_HOME_RECENT_DIALOG = 1;
    static final int LONG_PRESS_HOME_RECENT_SYSTEM_UI = 2;
    static final int LONG_PRESS_POWER_GLOBAL_ACTIONS = 1;
    static final int LONG_PRESS_POWER_NOTHING = 0;
    static final int LONG_PRESS_POWER_SHUT_OFF = 2;
    private static final int MSG_DISABLE_POINTER_LOCATION = 2;
    private static final int MSG_DISPATCH_MEDIA_KEY_REPEAT_WITH_WAKE_LOCK = 4;
    private static final int MSG_DISPATCH_MEDIA_KEY_WITH_WAKE_LOCK = 3;
    private static final int MSG_ENABLE_POINTER_LOCATION = 1;
    static final int NAVIGATION_BAR_LAYER = 19;
    static final int NAVIGATION_BAR_PANEL_LAYER = 20;
    static final int PHONE_LAYER = 3;
    static final int POINTER_LAYER = 25;
    static final boolean PRINT_ANIM = false;
    static final int PRIORITY_PHONE_LAYER = 7;
    static final int RECENT_APPS_BEHAVIOR_DISMISS = 2;
    static final int RECENT_APPS_BEHAVIOR_DISMISS_AND_SWITCH = 3;
    static final int RECENT_APPS_BEHAVIOR_EXIT_TOUCH_MODE_AND_SHOW = 1;
    static final int RECENT_APPS_BEHAVIOR_SHOW_OR_DISMISS = 0;
    static final int SCREENSAVER_LAYER = 13;
    private static final long SCREENSHOT_CHORD_DEBOUNCE_DELAY_MILLIS = 150L;
    static final int SEARCH_BAR_LAYER = 4;
    static final int SECURE_SYSTEM_OVERLAY_LAYER = 23;
    static final boolean SEPARATE_TIMEOUT_FOR_SCREEN_SAVER = false;
    static final boolean SHOW_PROCESSES_ON_ALT_MENU = false;
    static final boolean SHOW_STARTING_ANIMATIONS = true;
    static final int STATUS_BAR_LAYER = 15;
    static final int STATUS_BAR_PANEL_LAYER = 16;
    static final int STATUS_BAR_SUB_PANEL_LAYER = 14;
    static final int SYSTEM_ALERT_LAYER = 8;
    static final int SYSTEM_DIALOG_LAYER = 5;
    public static final String SYSTEM_DIALOG_REASON_ASSIST = "assist";
    public static final String SYSTEM_DIALOG_REASON_GLOBAL_ACTIONS = "globalactions";
    public static final String SYSTEM_DIALOG_REASON_HOME_KEY = "homekey";
    public static final String SYSTEM_DIALOG_REASON_KEY = "reason";
    public static final String SYSTEM_DIALOG_REASON_RECENT_APPS = "recentapps";
    static final int SYSTEM_ERROR_LAYER = 21;
    static final int SYSTEM_OVERLAY_LAYER = 18;
    static final int SYSTEM_UI_CHANGING_LAYOUT = 6;
    static final String TAG = "WindowManager";
    static final int TOAST_LAYER = 6;
    static final int VOLUME_OVERLAY_LAYER = 17;
    static final int WALLPAPER_LAYER = 2;
    private static final int WINDOW_TYPES_WHERE_HOME_DOESNT_WORK[];
    static final boolean localLOGV;
    static final Rect mTmpContentFrame = new Rect();
    static final Rect mTmpDisplayFrame = new Rect();
    static final Rect mTmpNavigationFrame = new Rect();
    static final Rect mTmpParentFrame = new Rect();
    static final Rect mTmpVisibleFrame = new Rect();
    static SparseArray sApplicationLaunchKeyCategories;
    boolean mAccelerometerDefault;
    int mAllowAllRotations;
    boolean mAllowLockscreenWhenOn;
    final Runnable mAllowSystemUiDelay = new Runnable() {

        public void run() {
        }

        final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
    };
    boolean mAssistKeyLongPressed;
    ProgressDialog mBootMsgDialog;
    android.os.PowerManager.WakeLock mBroadcastWakeLock;
    boolean mCanHideNavigationBar;
    boolean mCarDockEnablesAccelerometer;
    Intent mCarDockIntent;
    int mCarDockRotation;
    boolean mConsumeSearchKeyUp;
    int mContentBottom;
    int mContentLeft;
    int mContentRight;
    int mContentTop;
    Context mContext;
    int mCurBottom;
    int mCurLeft;
    int mCurRight;
    int mCurTop;
    int mCurrentAppOrientation;
    boolean mDeskDockEnablesAccelerometer;
    Intent mDeskDockIntent;
    int mDeskDockRotation;
    boolean mDismissKeyguard;
    Display mDisplay;
    int mDockBottom;
    int mDockLayer;
    int mDockLeft;
    int mDockMode;
    BroadcastReceiver mDockReceiver;
    int mDockRight;
    int mDockTop;
    boolean mEnableShiftMenuBugReports;
    int mEndcallBehavior;
    int mExternalDisplayHeight;
    int mExternalDisplayWidth;
    private final SparseArray mFallbackActions = new SparseArray();
    IApplicationToken mFocusedApp;
    android.view.WindowManagerPolicy.WindowState mFocusedWindow;
    int mForceClearedSystemUiFlags;
    boolean mForceStatusBar;
    MiuiGlobalActions mGlobalActions;
    private UEventObserver mHDMIObserver;
    Handler mHandler;
    boolean mHasNavigationBar;
    boolean mHasSoftInput;
    boolean mHasSystemNavBar;
    boolean mHaveBuiltInKeyboard;
    boolean mHavePendingMediaKeyRepeatWithWakeLock;
    boolean mHdmiPlugged;
    int mHdmiRotation;
    boolean mHeadless;
    boolean mHideLockScreen;
    android.view.WindowManagerPolicy.FakeWindow mHideNavFakeWindow;
    final android.view.InputEventReceiver.Factory mHideNavInputEventReceiverFactory = new android.view.InputEventReceiver.Factory() {

        public InputEventReceiver createInputEventReceiver(InputChannel inputchannel, Looper looper) {
            return new HideNavInputEventReceiver(inputchannel, looper);
        }

        final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
    };
    Intent mHomeIntent;
    boolean mHomeLongPressed;
    boolean mHomePressed;
    int mIncallPowerBehavior;
    long mKeyboardTapVibePattern[];
    android.view.WindowManagerPolicy.WindowState mKeyguard;
    KeyguardViewMediator mKeyguardMediator;
    int mLandscapeRotation;
    boolean mLanguageSwitchKeyPressed;
    boolean mLastFocusNeedsMenu;
    android.view.WindowManagerPolicy.WindowState mLastInputMethodTargetWindow;
    android.view.WindowManagerPolicy.WindowState mLastInputMethodWindow;
    int mLastSystemUiFlags;
    boolean mLidControlsSleep;
    int mLidKeyboardAccessibility;
    int mLidNavigationAccessibility;
    int mLidOpenRotation;
    int mLidState;
    final Object mLock = new Object();
    int mLockScreenTimeout;
    boolean mLockScreenTimerActive;
    private int mLongPressOnHomeBehavior;
    int mLongPressOnPowerBehavior;
    long mLongPressVibePattern[];
    android.view.WindowManagerPolicy.WindowState mNavigationBar;
    boolean mNavigationBarCanMove;
    int mNavigationBarHeightForRotation[];
    boolean mNavigationBarOnBottom;
    int mNavigationBarWidthForRotation[];
    MyOrientationListener mOrientationListener;
    boolean mOrientationSensorEnabled;
    boolean mPendingPowerKeyUpCanceled;
    boolean mPluggedIn;
    InputChannel mPointerLocationInputChannel;
    PointerLocationInputEventReceiver mPointerLocationInputEventReceiver;
    int mPointerLocationMode;
    PointerLocationView mPointerLocationView;
    int mPortraitRotation;
    volatile boolean mPowerKeyHandled;
    private long mPowerKeyTime;
    private boolean mPowerKeyTriggered;
    private Runnable mPowerLongPress;
    LocalPowerManager mPowerManager;
    BroadcastReceiver mPowerReceiver;
    RecentApplicationsDialog mRecentAppsDialog;
    int mRecentAppsDialogHeldModifiers;
    int mResettingSystemUiFlags;
    int mRestrictedScreenHeight;
    int mRestrictedScreenLeft;
    int mRestrictedScreenTop;
    int mRestrictedScreenWidth;
    boolean mSafeMode;
    long mSafeModeDisabledVibePattern[];
    long mSafeModeEnabledVibePattern[];
    Runnable mScreenLockTimeout;
    boolean mScreenOnEarly;
    boolean mScreenOnFully;
    boolean mScreenSaverEnabledByUser;
    boolean mScreenSaverFeatureAvailable;
    boolean mScreenSaverMayRun;
    int mScreenSaverTimeout;
    private boolean mScreenshotChordEnabled;
    private final Runnable mScreenshotChordLongPress = new Runnable() {

        public void run() {
            takeScreenshot();
        }

        final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
    };
    ServiceConnection mScreenshotConnection;
    final Object mScreenshotLock = new Object();
    final Runnable mScreenshotTimeout = new Runnable() {

        public void run() {
            Object obj = mScreenshotLock;
            obj;
            JVM INSTR monitorenter ;
            if(mScreenshotConnection != null) {
                mContext.unbindService(mScreenshotConnection);
                mScreenshotConnection = null;
            }
            return;
        }

        final PhoneWindowManager this$0;

             {
                this$0 = PhoneWindowManager.this;
                super();
            }
    };
    boolean mSearchKeyShortcutPending;
    SearchManager mSearchManager;
    int mSeascapeRotation;
    final Object mServiceAquireLock = new Object();
    ShortcutManager mShortcutManager;
    int mStableBottom;
    int mStableFullscreenBottom;
    int mStableFullscreenLeft;
    int mStableFullscreenRight;
    int mStableFullscreenTop;
    int mStableLeft;
    int mStableRight;
    int mStableTop;
    android.view.WindowManagerPolicy.WindowState mStatusBar;
    int mStatusBarHeight;
    int mStatusBarLayer;
    IStatusBarService mStatusBarService;
    boolean mSystemBooted;
    int mSystemBottom;
    int mSystemLeft;
    boolean mSystemReady;
    int mSystemRight;
    int mSystemTop;
    android.view.WindowManagerPolicy.WindowState mTopFullscreenOpaqueWindowState;
    boolean mTopIsFullscreen;
    int mUiMode;
    int mUnrestrictedScreenHeight;
    int mUnrestrictedScreenLeft;
    int mUnrestrictedScreenTop;
    int mUnrestrictedScreenWidth;
    int mUpsideDownRotation;
    int mUserRotation;
    int mUserRotationMode;
    Vibrator mVibrator;
    long mVirtualKeyVibePattern[];
    private boolean mVolumeDownKeyConsumedByScreenshotChord;
    private long mVolumeDownKeyTime;
    private boolean mVolumeDownKeyTriggered;
    private boolean mVolumeUpKeyTriggered;
    IWindowManager mWindowManager;
    android.view.WindowManagerPolicy.WindowManagerFuncs mWindowManagerFuncs;

    static  {
        sApplicationLaunchKeyCategories = new SparseArray();
        sApplicationLaunchKeyCategories.append(64, "android.intent.category.APP_BROWSER");
        sApplicationLaunchKeyCategories.append(65, "android.intent.category.APP_EMAIL");
        sApplicationLaunchKeyCategories.append(207, "android.intent.category.APP_CONTACTS");
        sApplicationLaunchKeyCategories.append(208, "android.intent.category.APP_CALENDAR");
        sApplicationLaunchKeyCategories.append(209, "android.intent.category.APP_MUSIC");
        sApplicationLaunchKeyCategories.append(210, "android.intent.category.APP_CALCULATOR");
        int ai[] = new int[2];
        ai[0] = 2003;
        ai[1] = 2010;
        WINDOW_TYPES_WHERE_HOME_DOESNT_WORK = ai;
    }



}
