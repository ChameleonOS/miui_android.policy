// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.security.KeyStore;
import android.util.Log;
import android.view.*;
import android.widget.Button;
import com.android.internal.widget.*;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardUpdateMonitor, KeyguardScreenCallback

class PatternUnlockScreen extends LinearLayoutWithDefaultTouchRecepient
    implements KeyguardScreen {
    private class UnlockPatternListener
        implements com.android.internal.widget.LockPatternView.OnPatternListener {

        public void onPatternCellAdded(List list) {
            if(list.size() > 2)
                mCallback.pokeWakelock(7000);
            else
                mCallback.pokeWakelock(2000);
        }

        public void onPatternCleared() {
        }

        public void onPatternDetected(List list) {
            if(!mLockPatternUtils.checkPattern(list)) goto _L2; else goto _L1
_L1:
            mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Correct);
            mKeyguardStatusViewManager.setInstructionText("");
            mKeyguardStatusViewManager.updateStatusLines(true);
            mCallback.keyguardDone(true);
            mCallback.reportSuccessfulUnlockAttempt();
            KeyStore.getInstance().password(LockPatternUtils.patternToString(list));
_L4:
            return;
_L2:
            boolean flag = false;
            if(list.size() > 2)
                mCallback.pokeWakelock(7000);
            mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Wrong);
            if(list.size() >= 4) {
                int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        public void onPatternStart() {
            mLockPatternView.removeCallbacks(mCancelPatternRunnable);
        }

        final PatternUnlockScreen this$0;

        private UnlockPatternListener() {
            this$0 = PatternUnlockScreen.this;
            super();
        }

    }

    static final class FooterMode extends Enum {

        public static FooterMode valueOf(String s) {
            return (FooterMode)Enum.valueOf(com/android/internal/policy/impl/PatternUnlockScreen$FooterMode, s);
        }

        public static FooterMode[] values() {
            return (FooterMode[])$VALUES.clone();
        }

        private static final FooterMode $VALUES[];
        public static final FooterMode ForgotLockPattern;
        public static final FooterMode Normal;
        public static final FooterMode VerifyUnlocked;

        static  {
            Normal = new FooterMode("Normal", 0);
            ForgotLockPattern = new FooterMode("ForgotLockPattern", 1);
            VerifyUnlocked = new FooterMode("VerifyUnlocked", 2);
            FooterMode afootermode[] = new FooterMode[3];
            afootermode[0] = Normal;
            afootermode[1] = ForgotLockPattern;
            afootermode[2] = VerifyUnlocked;
            $VALUES = afootermode;
        }

        private FooterMode(String s, int i) {
            super(s, i);
        }
    }


    PatternUnlockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, int i) {
        LinearLayoutWithDefaultTouchRecepient(context);
        mFailedPatternAttemptsSinceLastTimeout = 0;
        mTotalFailedPatternAttempts = 0;
        mCountdownTimer = null;
        mLastPokeTime = -7000L;
        mCancelPatternRunnable = new Runnable() {

            public void run() {
                mLockPatternView.clearPattern();
            }

            final PatternUnlockScreen this$0;

             {
                this$0 = PatternUnlockScreen.this;
                super();
            }
        };
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mTotalFailedPatternAttempts = i;
        mFailedPatternAttemptsSinceLastTimeout = i % 5;
        mCreationOrientation = configuration.orientation;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        LockPatternView lockpatternview;
        boolean flag;
        if(mCreationOrientation != 2) {
            Log.d("UnlockScreen", "portrait mode");
            layoutinflater.inflate(0x109005b, this, true);
        } else {
            Log.d("UnlockScreen", "landscape mode");
            layoutinflater.inflate(0x109005a, this, true);
        }
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, mUpdateMonitor, mLockPatternUtils, mCallback, true);
        mLockPatternView = (LockPatternView)findViewById(0x10202c5);
        mForgotPatternButton = (Button)findViewById(0x10202c4);
        mForgotPatternButton.setText(0x104031d);
        mForgotPatternButton.setOnClickListener(mForgotPatternClick);
        setDefaultTouchRecepient(mLockPatternView);
        mLockPatternView.setSaveEnabled(false);
        mLockPatternView.setFocusable(false);
        mLockPatternView.setOnPatternListener(new UnlockPatternListener());
        lockpatternview = mLockPatternView;
        if(!mLockPatternUtils.isVisiblePatternEnabled())
            flag = true;
        else
            flag = false;
        lockpatternview.setInStealthMode(flag);
        mLockPatternView.setTactileFeedbackEnabled(mLockPatternUtils.isTactileFeedbackEnabled());
        updateFooter(FooterMode.Normal);
        setFocusableInTouchMode(true);
    }

    private void handleAttemptLockout(long l) {
        mLockPatternView.clearPattern();
        mLockPatternView.setEnabled(false);
        mCountdownTimer = (new CountDownTimer(l - SystemClock.elapsedRealtime(), 1000L) {

            public void onFinish() {
                mLockPatternView.setEnabled(true);
                mKeyguardStatusViewManager.setInstructionText(getContext().getString(0x10402fa));
                mKeyguardStatusViewManager.updateStatusLines(true);
                mFailedPatternAttemptsSinceLastTimeout = 0;
                if(mEnableFallback)
                    updateFooter(FooterMode.ForgotLockPattern);
                else
                    updateFooter(FooterMode.Normal);
            }

            public void onTick(long l1) {
                int i = (int)(l1 / 1000L);
                KeyguardStatusViewManager keyguardstatusviewmanager = mKeyguardStatusViewManager;
                Context context = getContext();
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                keyguardstatusviewmanager.setInstructionText(context.getString(0x104031c, aobj));
                mKeyguardStatusViewManager.updateStatusLines(true);
            }

            final PatternUnlockScreen this$0;

             {
                this$0 = PatternUnlockScreen.this;
                super(l, l1);
            }
        }).start();
    }

    private void hideForgotPatternButton() {
        mForgotPatternButton.setVisibility(8);
    }

    private void showForgotPatternButton() {
        mForgotPatternButton.setVisibility(0);
    }

    private void updateFooter(FooterMode footermode) {
        class _cls4 {

            static final int $SwitchMap$com$android$internal$policy$impl$PatternUnlockScreen$FooterMode[];

            static  {
                $SwitchMap$com$android$internal$policy$impl$PatternUnlockScreen$FooterMode = new int[FooterMode.values().length];
                NoSuchFieldError nosuchfielderror2;
                try {
                    $SwitchMap$com$android$internal$policy$impl$PatternUnlockScreen$FooterMode[FooterMode.Normal.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$PatternUnlockScreen$FooterMode[FooterMode.ForgotLockPattern.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                $SwitchMap$com$android$internal$policy$impl$PatternUnlockScreen$FooterMode[FooterMode.VerifyUnlocked.ordinal()] = 3;
_L2:
                return;
                nosuchfielderror2;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls4..SwitchMap.com.android.internal.policy.impl.PatternUnlockScreen.FooterMode[footermode.ordinal()];
        JVM INSTR tableswitch 1 3: default 36
    //                   1 37
    //                   2 44
    //                   3 51;
           goto _L1 _L2 _L3 _L4
_L1:
        return;
_L2:
        hideForgotPatternButton();
        continue; /* Loop/switch isn't completed */
_L3:
        showForgotPatternButton();
        continue; /* Loop/switch isn't completed */
_L4:
        hideForgotPatternButton();
        if(true) goto _L1; else goto _L5
_L5:
    }

    public void cleanUp() {
        mUpdateMonitor.removeCallback(this);
        mLockPatternUtils = null;
        mUpdateMonitor = null;
        mCallback = null;
        mLockPatternView.setOnPatternListener(null);
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent) {
        boolean flag = super.dispatchTouchEvent(motionevent);
        if(flag && SystemClock.elapsedRealtime() - mLastPokeTime > 6900L)
            mLastPokeTime = SystemClock.elapsedRealtime();
        return flag;
    }

    public boolean needsInput() {
        return false;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if(getResources().getConfiguration().orientation != mCreationOrientation)
            mCallback.recreateMe(getResources().getConfiguration());
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if(configuration.orientation != mCreationOrientation)
            mCallback.recreateMe(configuration);
    }

    public void onKeyboardChange(boolean flag) {
    }

    public void onPause() {
        if(mCountdownTimer != null) {
            mCountdownTimer.cancel();
            mCountdownTimer = null;
        }
        mKeyguardStatusViewManager.onPause();
    }

    public void onResume() {
        mKeyguardStatusViewManager.onResume();
        mLockPatternView.enableInput();
        mLockPatternView.setEnabled(true);
        mLockPatternView.clearPattern();
        long l;
        if(mCallback.doesFallbackUnlockScreenExist())
            showForgotPatternButton();
        else
            hideForgotPatternButton();
        l = mLockPatternUtils.getLockoutAttemptDeadline();
        if(l != 0L)
            handleAttemptLockout(l);
        if(mCallback.isVerifyUnlockOnly())
            updateFooter(FooterMode.VerifyUnlocked);
        else
        if(mEnableFallback && mTotalFailedPatternAttempts >= 5)
            updateFooter(FooterMode.ForgotLockPattern);
        else
            updateFooter(FooterMode.Normal);
    }

    public void onWindowFocusChanged(boolean flag) {
        super.onWindowFocusChanged(flag);
        if(flag)
            onResume();
    }

    public void setEnableFallback(boolean flag) {
        mEnableFallback = flag;
    }

    private static final boolean DEBUG = false;
    private static final int MIN_PATTERN_BEFORE_POKE_WAKELOCK = 2;
    private static final int PATTERN_CLEAR_TIMEOUT_MS = 2000;
    private static final String TAG = "UnlockScreen";
    private static final int UNLOCK_PATTERN_WAKE_INTERVAL_FIRST_DOTS_MS = 2000;
    private static final int UNLOCK_PATTERN_WAKE_INTERVAL_MS = 7000;
    private KeyguardScreenCallback mCallback;
    private Runnable mCancelPatternRunnable;
    private CountDownTimer mCountdownTimer;
    private int mCreationOrientation;
    private boolean mEnableFallback;
    private int mFailedPatternAttemptsSinceLastTimeout;
    private Button mForgotPatternButton;
    private final android.view.View.OnClickListener mForgotPatternClick = new android.view.View.OnClickListener() {

        public void onClick(View view) {
            mCallback.forgotPattern(true);
        }

        final PatternUnlockScreen this$0;

             {
                this$0 = PatternUnlockScreen.this;
                super();
            }
    };
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private long mLastPokeTime;
    private LockPatternUtils mLockPatternUtils;
    private LockPatternView mLockPatternView;
    private int mTotalFailedPatternAttempts;
    private KeyguardUpdateMonitor mUpdateMonitor;








/*
    static int access$608(PatternUnlockScreen patternunlockscreen) {
        int i = patternunlockscreen.mTotalFailedPatternAttempts;
        patternunlockscreen.mTotalFailedPatternAttempts = i + 1;
        return i;
    }

*/



/*
    static int access$702(PatternUnlockScreen patternunlockscreen, int i) {
        patternunlockscreen.mFailedPatternAttemptsSinceLastTimeout = i;
        return i;
    }

*/


/*
    static int access$708(PatternUnlockScreen patternunlockscreen) {
        int i = patternunlockscreen.mFailedPatternAttemptsSinceLastTimeout;
        patternunlockscreen.mFailedPatternAttemptsSinceLastTimeout = i + 1;
        return i;
    }

*/


}
