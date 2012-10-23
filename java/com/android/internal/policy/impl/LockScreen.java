// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.os.RemoteException;
import android.os.Vibrator;
import android.util.Log;
import android.util.Slog;
import android.view.*;
import android.widget.LinearLayout;
import com.android.internal.widget.*;
import com.android.internal.widget.multiwaveview.GlowPadView;
import java.io.File;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardUpdateMonitor, KeyguardScreenCallback

class LockScreen extends LinearLayout
    implements KeyguardScreen {
    class GlowPadViewMethods
        implements com.android.internal.widget.multiwaveview.GlowPadView.OnTriggerListener, UnlockWidgetCommonMethods {

        private void launchActivity(Intent intent) {
            intent.setFlags(0x34000000);
            try {
                ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
            }
            catch(RemoteException remoteexception) {
                Log.w("LockScreen", "can't dismiss keyguard on launch");
            }
            
// JavaClassFileOutputException: get_constant: invalid tag

        public void cleanUp() {
            mGlowPadView.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i) {
            return mGlowPadView.getTargetPosition(i);
        }

        public View getView() {
            return mGlowPadView;
        }

        public boolean isTargetPresent(int i) {
            boolean flag;
            if(mGlowPadView.getTargetPosition(i) != -1)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public void onFinishFinalAnimation() {
        }

        public void onGrabbed(View view, int i) {
        }

        public void onGrabbedStateChange(View view, int i) {
            if(i != 0)
                mCallback.pokeWakelock();
        }

        public void onReleased(View view, int i) {
        }

        public void onTrigger(View view, int i) {
            mGlowPadView.getResourceIdForTarget(i);
            JVM INSTR lookupswitch 5: default 60
        //                       17302167: 61
        //                       17302240: 107
        //                       17302265: 135
        //                       17302273: 157
        //                       17302276: 157;
               goto _L1 _L2 _L3 _L4 _L5 _L5
_L1:
            return;
_L2:
            Intent intent = SearchManager.getAssistIntent(
// JavaClassFileOutputException: get_constant: invalid tag

        public void ping() {
            mGlowPadView.ping();
        }

        public void reset(boolean flag) {
            mGlowPadView.reset(flag);
        }

        public void setEnabled(int i, boolean flag) {
            mGlowPadView.setEnableTarget(i, flag);
        }

        public void updateResources() {
            boolean flag = true;
            int i;
            boolean flag1;
            if(mCameraDisabled && mEnableRingSilenceFallback) {
                if(mSilentMode)
                    i = 0x1070009;
                else
                    i = 0x107000c;
            } else {
                i = 0x107000e;
            }
            if(mGlowPadView.getTargetResourceId() != i)
                mGlowPadView.setTargetResources(i);
            if(!mSearchDisabled) {
                Intent intent = SearchManager.getAssistIntent(
// JavaClassFileOutputException: get_constant: invalid tag

        private final GlowPadView mGlowPadView;
        final LockScreen this$0;

        GlowPadViewMethods(GlowPadView glowpadview) {
            this$0 = LockScreen.this;
            super();
            mGlowPadView = glowpadview;
        }
    }

    class WaveViewMethods
        implements com.android.internal.widget.WaveView.OnTriggerListener, UnlockWidgetCommonMethods {

        public void cleanUp() {
            mWaveView.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i) {
            return -1;
        }

        public View getView() {
            return mWaveView;
        }

        public void onGrabbedStateChange(View view, int i) {
            if(i == 10)
                mCallback.pokeWakelock(30000);
        }

        public void onTrigger(View view, int i) {
            if(i == 10)
                requestUnlockScreen();
        }

        public void ping() {
        }

        public void reset(boolean flag) {
            mWaveView.reset();
        }

        public void setEnabled(int i, boolean flag) {
        }

        public void updateResources() {
        }

        private final WaveView mWaveView;
        final LockScreen this$0;

        WaveViewMethods(WaveView waveview) {
            this$0 = LockScreen.this;
            super();
            mWaveView = waveview;
        }
    }

    class SlidingTabMethods
        implements com.android.internal.widget.SlidingTab.OnTriggerListener, UnlockWidgetCommonMethods {

        public void cleanUp() {
            mSlidingTab.setOnTriggerListener(null);
        }

        public int getTargetPosition(int i) {
            return -1;
        }

        public View getView() {
            return mSlidingTab;
        }

        public void onGrabbedStateChange(View view, int i) {
            if(i == 2) {
                mSilentMode = isSilentMode();
                SlidingTab slidingtab = mSlidingTab;
                int j;
                if(mSilentMode)
                    j = 0x1040328;
                else
                    j = 0x1040329;
                slidingtab.setRightHintText(j);
            }
            if(i != 0)
                mCallback.pokeWakelock();
        }

        public void onTrigger(View view, int i) {
            if(i != 1) goto _L2; else goto _L1
_L1:
            mCallback.goToUnlockScreen();
_L4:
            return;
_L2:
            if(i == 2) {
                toggleRingMode();
                mCallback.pokeWakelock();
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void ping() {
        }

        public void reset(boolean flag) {
            mSlidingTab.reset(flag);
        }

        public void setEnabled(int i, boolean flag) {
        }

        public void updateResources() {
            int i = 1;
            SlidingTab slidingtab;
            int j;
            int k;
            int l;
            int i1;
            if(!mSilentMode || mAudioManager.getRingerMode() != i)
                i = 0;
            slidingtab = mSlidingTab;
            if(mSilentMode) {
                if(i != 0)
                    j = 0x10802d9;
                else
                    j = 0x10802d6;
            } else {
                j = 0x10802d7;
            }
            if(mSilentMode)
                k = 0x10803ad;
            else
                k = 0x10803aa;
            if(mSilentMode)
                l = 0x1080396;
            else
                l = 0x1080395;
            if(mSilentMode)
                i1 = 0x10803a9;
            else
                i1 = 0x10803a8;
            slidingtab.setRightTabResources(j, k, l, i1);
        }

        private final SlidingTab mSlidingTab;
        final LockScreen this$0;

        SlidingTabMethods(SlidingTab slidingtab) {
            this$0 = LockScreen.this;
            super();
            mSlidingTab = slidingtab;
        }
    }

    private static interface UnlockWidgetCommonMethods {

        public abstract void cleanUp();

        public abstract int getTargetPosition(int i);

        public abstract View getView();

        public abstract void ping();

        public abstract void reset(boolean flag);

        public abstract void setEnabled(int i, boolean flag);

        public abstract void updateResources();
    }


    LockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback) {
        boolean flag = false;
        super(context);
        mEnableRingSilenceFallback = false;
        mInfoCallback = new KeyguardUpdateMonitor.InfoCallbackImpl() {

            public void onDevicePolicyManagerStateChanged() {
                updateTargets();
            }

            public void onRingerModeChanged(int i) {
                boolean flag1;
                if(2 != i)
                    flag1 = true;
                else
                    flag1 = false;
                if(flag1 != mSilentMode) {
                    mSilentMode = flag1;
                    mUnlockWidgetMethods.updateResources();
                }
            }

            final LockScreen this$0;

             {
                this$0 = LockScreen.this;
                super();
            }
        };
        mSimStateCallback = new KeyguardUpdateMonitor.SimStateCallback() {

            public void onSimStateChanged(com.android.internal.telephony.IccCard.State state) {
                updateTargets();
            }

            final LockScreen this$0;

             {
                this$0 = LockScreen.this;
                super();
            }
        };
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mEnableMenuKeyInLockScreen = shouldEnableMenuKey();
        mCreationOrientation = configuration.orientation;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        Vibrator vibrator;
        if(mCreationOrientation != 2)
            layoutinflater.inflate(0x1090058, this, true);
        else
            layoutinflater.inflate(0x1090059, this, true);
        mStatusViewManager = new KeyguardStatusViewManager(this, mUpdateMonitor, mLockPatternUtils, mCallback, false);
        setFocusable(true);
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x60000);
        vibrator = (Vibrator)context.getSystemService("vibrator");
        if(vibrator != null)
            flag = vibrator.hasVibrator();
        mHasVibrator = flag;
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        mSilentMode = isSilentMode();
        mUnlockWidget = findViewById(0x10202c2);
        mUnlockWidgetMethods = createUnlockMethods(mUnlockWidget);
    }

    private UnlockWidgetCommonMethods createUnlockMethods(View view) {
        Object obj;
        if(view instanceof SlidingTab) {
            SlidingTab slidingtab = (SlidingTab)view;
            slidingtab.setHoldAfterTrigger(true, false);
            slidingtab.setLeftHintText(0x1040327);
            slidingtab.setLeftTabResources(0x10802d8, 0x10803ab, 0x108038c, 0x108039f);
            obj = new SlidingTabMethods(slidingtab);
            slidingtab.setOnTriggerListener(((com.android.internal.widget.SlidingTab.OnTriggerListener) (obj)));
        } else
        if(view instanceof WaveView) {
            WaveView waveview = (WaveView)view;
            WaveViewMethods waveviewmethods = new WaveViewMethods(waveview);
            waveview.setOnTriggerListener(waveviewmethods);
            obj = waveviewmethods;
        } else
        if(view instanceof GlowPadView) {
            GlowPadView glowpadview = (GlowPadView)view;
            GlowPadViewMethods glowpadviewmethods = new GlowPadViewMethods(glowpadview);
            glowpadview.setOnTriggerListener(glowpadviewmethods);
            obj = glowpadviewmethods;
        } else {
            throw new IllegalStateException((new StringBuilder()).append("Unrecognized unlock widget: ").append(view).toString());
        }
        return ((UnlockWidgetCommonMethods) (obj));
    }

    private boolean isSilentMode() {
        boolean flag;
        if(mAudioManager.getRingerMode() != 2)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private void requestUnlockScreen() {
        postDelayed(new Runnable() {

            public void run() {
                mCallback.goToUnlockScreen();
            }

            final LockScreen this$0;

             {
                this$0 = LockScreen.this;
                super();
            }
        }, 0L);
    }

    private boolean shouldEnableMenuKey() {
        boolean flag = getResources().getBoolean(0x111001e);
        boolean flag1 = ActivityManager.isRunningInTestHarness();
        boolean flag2 = (new File("/data/local/enable_menu_key")).exists();
        boolean flag3;
        if(!flag || flag1 || flag2)
            flag3 = true;
        else
            flag3 = false;
        return flag3;
    }

    private void toggleRingMode() {
        int i = 1;
        boolean flag;
        if(!mSilentMode)
            flag = i;
        else
            flag = false;
        mSilentMode = flag;
        if(mSilentMode) {
            AudioManager audiomanager = mAudioManager;
            if(!mHasVibrator)
                i = 0;
            audiomanager.setRingerMode(i);
        } else {
            mAudioManager.setRingerMode(2);
        }
    }

    private void updateTargets() {
        boolean flag = false;
        boolean flag1 = mLockPatternUtils.getDevicePolicyManager().getCameraDisabled(null);
        boolean flag2 = mUpdateMonitor.isSimLocked();
        boolean flag3;
        boolean flag4;
        boolean flag5;
        boolean flag6;
        if(mUnlockWidgetMethods instanceof GlowPadViewMethods)
            flag3 = ((GlowPadViewMethods)mUnlockWidgetMethods).isTargetPresent(0x10802e0);
        else
            flag3 = false;
        if(mUnlockWidgetMethods instanceof GlowPadViewMethods)
            flag4 = ((GlowPadViewMethods)mUnlockWidgetMethods).isTargetPresent(0x1080297);
        else
            flag4 = false;
        if(flag1)
            Log.v("LockScreen", "Camera disabled by Device Policy");
        else
        if(flag2)
            Log.v("LockScreen", "Camera disabled by Sim State");
        if(SearchManager.getAssistIntent(mContext) != null)
            flag5 = true;
        else
            flag5 = false;
        if(flag1 || flag2 || !flag3)
            flag6 = true;
        else
            flag6 = false;
        mCameraDisabled = flag6;
        if(flag2 || !flag5 || !flag4)
            flag = true;
        mSearchDisabled = flag;
        mUnlockWidgetMethods.updateResources();
    }

    public void cleanUp() {
        mUpdateMonitor.removeCallback(mInfoCallback);
        mUpdateMonitor.removeCallback(mSimStateCallback);
        mUnlockWidgetMethods.cleanUp();
        mLockPatternUtils = null;
        mUpdateMonitor = null;
        mCallback = null;
    }

    public boolean needsInput() {
        return false;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent) {
        if(i == 82 && mEnableMenuKeyInLockScreen)
            mCallback.goToUnlockScreen();
        return false;
    }

    public void onPause() {
        mUpdateMonitor.removeCallback(mInfoCallback);
        mUpdateMonitor.removeCallback(mSimStateCallback);
        mStatusViewManager.onPause();
        mUnlockWidgetMethods.reset(false);
    }

    public void onResume() {
        mUpdateMonitor.registerSimStateCallback(mSimStateCallback);
        mUpdateMonitor.registerInfoCallback(mInfoCallback);
        mStatusViewManager.onResume();
        postDelayed(mOnResumePing, 500L);
    }

    void updateConfiguration() {
        Configuration configuration = getResources().getConfiguration();
        if(configuration.orientation != mCreationOrientation)
            mCallback.recreateMe(configuration);
    }

    private static final String ASSIST_ICON_METADATA_NAME = "com.android.systemui.action_assist_icon";
    private static final boolean DBG = false;
    private static final String ENABLE_MENU_KEY_FILE = "/data/local/enable_menu_key";
    private static final int ON_RESUME_PING_DELAY = 500;
    private static final int STAY_ON_WHILE_GRABBED_TIMEOUT = 30000;
    private static final String TAG = "LockScreen";
    private static final int WAIT_FOR_ANIMATION_TIMEOUT;
    private AudioManager mAudioManager;
    private KeyguardScreenCallback mCallback;
    private boolean mCameraDisabled;
    private int mCreationOrientation;
    private boolean mEnableMenuKeyInLockScreen;
    private boolean mEnableRingSilenceFallback;
    private final boolean mHasVibrator;
    KeyguardUpdateMonitor.InfoCallbackImpl mInfoCallback;
    private LockPatternUtils mLockPatternUtils;
    private final Runnable mOnResumePing = new Runnable() {

        public void run() {
            mUnlockWidgetMethods.ping();
        }

        final LockScreen this$0;

             {
                this$0 = LockScreen.this;
                super();
            }
    };
    private boolean mSearchDisabled;
    private boolean mSilentMode;
    KeyguardUpdateMonitor.SimStateCallback mSimStateCallback;
    private KeyguardStatusViewManager mStatusViewManager;
    private View mUnlockWidget;
    private UnlockWidgetCommonMethods mUnlockWidgetMethods;
    private KeyguardUpdateMonitor mUpdateMonitor;



/*
    static boolean access$002(LockScreen lockscreen, boolean flag) {
        lockscreen.mSilentMode = flag;
        return flag;
    }

*/













}
