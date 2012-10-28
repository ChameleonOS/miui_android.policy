// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.accounts.*;
import android.app.AlertDialog;
import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.util.Slog;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import com.android.internal.widget.*;
import java.io.IOException;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewBase, KeyguardUpdateMonitor, BiometricSensorUnlock, FaceUnlock, 
//            KeyguardScreen, KeyguardWindowController, LockScreen, PatternUnlockScreen, 
//            SimPukUnlockScreen, SimUnlockScreen, MiuiAccountUnlockScreen, PasswordUnlockScreen, 
//            KeyguardViewCallback, KeyguardScreenCallback, AwesomeLockScreen

public class LockPatternKeyguardView extends KeyguardViewBase {
    private static class FastBitmapDrawable extends Drawable {

        public void draw(Canvas canvas) {
            canvas.drawBitmap(mBitmap, (getBounds().width() - mBitmap.getWidth()) / 2, getBounds().height() - mBitmap.getHeight(), null);
        }

        public int getIntrinsicHeight() {
            return mBitmap.getHeight();
        }

        public int getIntrinsicWidth() {
            return mBitmap.getWidth();
        }

        public int getMinimumHeight() {
            return mBitmap.getHeight();
        }

        public int getMinimumWidth() {
            return mBitmap.getWidth();
        }

        public int getOpacity() {
            return mOpacity;
        }

        public void setAlpha(int i) {
        }

        public void setColorFilter(ColorFilter colorfilter) {
        }

        private Bitmap mBitmap;
        private int mOpacity;

        private FastBitmapDrawable(Bitmap bitmap) {
            mBitmap = bitmap;
            int i;
            if(mBitmap.hasAlpha())
                i = -3;
            else
                i = -1;
            mOpacity = i;
        }
    }

    private class AccountAnalyzer
        implements AccountManagerCallback {

        private void next() {
            if(mEnableFallback || mAccountIndex >= mAccounts.length) {
                if(mUnlockScreen != null && (mUnlockScreen instanceof PatternUnlockScreen))
                    ((PatternUnlockScreen)mUnlockScreen).setEnableFallback(mEnableFallback);
            } else {
                mAccountManager.confirmCredentials(mAccounts[mAccountIndex], null, null, this, null);
            }
        }

        public void run(AccountManagerFuture accountmanagerfuture) {
            if(((Bundle)accountmanagerfuture.getResult()).getParcelable("intent") != null)
                mEnableFallback = true;
            mAccountIndex = 1 + mAccountIndex;
            next();
_L2:
            return;
            OperationCanceledException operationcanceledexception;
            operationcanceledexception;
            mAccountIndex = 1 + mAccountIndex;
            next();
            continue; /* Loop/switch isn't completed */
            IOException ioexception;
            ioexception;
            mAccountIndex = 1 + mAccountIndex;
            next();
            continue; /* Loop/switch isn't completed */
            AuthenticatorException authenticatorexception;
            authenticatorexception;
            mAccountIndex = 1 + mAccountIndex;
            next();
            if(true) goto _L2; else goto _L1
_L1:
            Exception exception;
            exception;
            mAccountIndex = 1 + mAccountIndex;
            next();
            throw exception;
        }

        public void start() {
            mEnableFallback = false;
            mAccountIndex = 0;
            next();
        }

        private int mAccountIndex;
        private final AccountManager mAccountManager;
        private final Account mAccounts[];
        final LockPatternKeyguardView this$0;

        private AccountAnalyzer(AccountManager accountmanager) {
            this$0 = LockPatternKeyguardView.this;
            super();
            mAccountManager = accountmanager;
            mAccounts = accountmanager.getAccountsByType("com.google");
        }

    }

    static final class UnlockMode extends Enum {

        public static UnlockMode valueOf(String s) {
            return (UnlockMode)Enum.valueOf(com/android/internal/policy/impl/LockPatternKeyguardView$UnlockMode, s);
        }

        public static UnlockMode[] values() {
            return (UnlockMode[])$VALUES.clone();
        }

        private static final UnlockMode $VALUES[];
        public static final UnlockMode Account;
        public static final UnlockMode Password;
        public static final UnlockMode Pattern;
        public static final UnlockMode SimPin;
        public static final UnlockMode SimPuk;
        public static final UnlockMode Unknown;

        static  {
            Pattern = new UnlockMode("Pattern", 0);
            SimPin = new UnlockMode("SimPin", 1);
            SimPuk = new UnlockMode("SimPuk", 2);
            Account = new UnlockMode("Account", 3);
            Password = new UnlockMode("Password", 4);
            Unknown = new UnlockMode("Unknown", 5);
            UnlockMode aunlockmode[] = new UnlockMode[6];
            aunlockmode[0] = Pattern;
            aunlockmode[1] = SimPin;
            aunlockmode[2] = SimPuk;
            aunlockmode[3] = Account;
            aunlockmode[4] = Password;
            aunlockmode[5] = Unknown;
            $VALUES = aunlockmode;
        }

        private UnlockMode(String s, int i) {
            super(s, i);
        }
    }

    static final class Mode extends Enum {

        public static Mode valueOf(String s) {
            return (Mode)Enum.valueOf(com/android/internal/policy/impl/LockPatternKeyguardView$Mode, s);
        }

        public static Mode[] values() {
            return (Mode[])$VALUES.clone();
        }

        private static final Mode $VALUES[];
        public static final Mode LockScreen;
        public static final Mode UnlockScreen;

        static  {
            LockScreen = new Mode("LockScreen", 0);
            UnlockScreen = new Mode("UnlockScreen", 1);
            Mode amode[] = new Mode[2];
            amode[0] = LockScreen;
            amode[1] = UnlockScreen;
            $VALUES = amode;
        }

        private Mode(String s, int i) {
            super(s, i);
        }
    }

    static class Injector {

        static boolean needRecreateLockScreen(LockPatternKeyguardView lockpatternkeyguardview) {
            boolean flag;
            if(lockpatternkeyguardview.getMode() == Mode.LockScreen && lockpatternkeyguardview.getLockScreen() != null && (lockpatternkeyguardview.getLockScreen() instanceof AwesomeLockScreen))
                flag = false;
            else
                flag = true;
            return flag;
        }

        public static void startBiometricUnlock(LockPatternKeyguardView lockpatternkeyguardview) {
            if(lockpatternkeyguardview.getScreenOn())
                lockpatternkeyguardview.callMaybeStartBiometricUnlock();
        }

        static void updateShowLockBeforeUnlock(LockPatternKeyguardView lockpatternkeyguardview) {
            lockpatternkeyguardview.setShowLockBeforeUnlock(miui.provider.ExtraSettings.System.getBoolean(lockpatternkeyguardview.getContext().getContentResolver(), "show_lock_before_unlock", true));
        }

        Injector() {
        }
    }


    public LockPatternKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardWindowController keyguardwindowcontroller) {
        super(context, keyguardviewcallback);
        mWindowFocused = false;
        mEnableFallback = false;
        mShowLockBeforeUnlock = true;
        mHasDialog = false;
        mMode = Mode.LockScreen;
        mUnlockScreenMode = UnlockMode.Unknown;
        mIsVerifyUnlockOnly = false;
        mRecreateRunnable = new Runnable() {

            public void run() {
                Mode mode = mMode;
                boolean flag = false;
                if(mode == Mode.UnlockScreen && getUnlockMode() == UnlockMode.Unknown) {
                    mode = Mode.LockScreen;
                    flag = true;
                }
                updateScreen(mode, true);
                restoreWidgetState();
                if(flag)
                    mKeyguardScreenCallback.keyguardDone(false);
            }

            final LockPatternKeyguardView this$0;

             {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        };
        mWidgetCallback = new LockScreenWidgetCallback() {

            public boolean isVisible(View view) {
                boolean flag;
                if(view.getVisibility() == 0)
                    flag = true;
                else
                    flag = false;
                return flag;
            }

            public void requestHide(View view) {
                view.setVisibility(8);
                mUpdateMonitor.reportClockVisible(true);
                resetBackground();
            }

            public void requestShow(View view) {
                view.setVisibility(0);
                mUpdateMonitor.reportClockVisible(false);
                if(findViewById(0x10202b5) == null)
                    setBackgroundColor(0xff000000);
                else
                    resetBackground();
            }

            public void userActivity(View view) {
                mKeyguardScreenCallback.pokeWakelock(10000);
            }

            final LockPatternKeyguardView this$0;

             {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        };
        mKeyguardScreenCallback = createKeyguardScreenCallback();
        mInfoCallback = new KeyguardUpdateMonitor.InfoCallbackImpl() {

            public void onClockVisibilityChanged() {
                int i = 0xff7fffff & getSystemUiVisibility();
                int j;
                int k;
                if(mUpdateMonitor.isClockVisible())
                    j = 0x800000;
                else
                    j = 0;
                k = i | j;
                Log.v("LockPatternKeyguardView", (new StringBuilder()).append("Set visibility on ").append(this).append(" to ").append(k).toString());
                setSystemUiVisibility(k);
            }

            public void onPhoneStateChanged(int i) {
                if(mBiometricUnlock != null && i == 1) {
                    mSuppressBiometricUnlock = true;
                    mBiometricUnlock.stop();
                    mBiometricUnlock.hide();
                }
            }

            public void onRefreshBatteryInfo(boolean flag, boolean flag1, int i) {
                if(mBiometricUnlock != null && mPluggedIn != flag1 && !mBiometricUnlock.isRunning()) {
                    mBiometricUnlock.stop();
                    mBiometricUnlock.hide();
                    mSuppressBiometricUnlock = true;
                }
                mPluggedIn = flag1;
            }

            public void onUserChanged(int i) {
                if(mBiometricUnlock != null)
                    mBiometricUnlock.stop();
                mLockPatternUtils.setCurrentUser(i);
                updateScreen(getInitialMode(), true);
            }

            final LockPatternKeyguardView this$0;

             {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        };
        mConfiguration = context.getResources().getConfiguration();
        mEnableFallback = false;
        mRequiresSim = TextUtils.isEmpty(SystemProperties.get("keyguard.no_require_sim"));
        mUpdateMonitor = keyguardupdatemonitor;
        mLockPatternUtils = lockpatternutils;
        mWindowController = keyguardwindowcontroller;
        mSuppressBiometricUnlock = sIsFirstAppearanceAfterBoot;
        sIsFirstAppearanceAfterBoot = false;
        mPluggedIn = mUpdateMonitor.isDevicePluggedIn();
        mScreenOn = ((PowerManager)context.getSystemService("power")).isScreenOn();
        mUpdateMonitor.registerInfoCallback(mInfoCallback);
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x40000);
        updateScreen(getInitialMode(), false);
        maybeEnableFallback(context);
    }

    private Mode getInitialMode() {
        Injector.updateShowLockBeforeUnlock(this);
        com.android.internal.telephony.IccCard.State state = mUpdateMonitor.getSimState();
        Mode mode;
        if(stuckOnLockScreenBecauseSimMissing() || state == com.android.internal.telephony.IccCard.State.PUK_REQUIRED && !mLockPatternUtils.isPukUnlockScreenEnable())
            mode = Mode.LockScreen;
        else
        if(!isSecure() || mShowLockBeforeUnlock)
            mode = Mode.LockScreen;
        else
            mode = Mode.UnlockScreen;
        return mode;
    }

    private UnlockMode getUnlockMode() {
        com.android.internal.telephony.IccCard.State state = mUpdateMonitor.getSimState();
        if(state != com.android.internal.telephony.IccCard.State.PIN_REQUIRED) goto _L2; else goto _L1
_L1:
        UnlockMode unlockmode = UnlockMode.SimPin;
_L4:
        return unlockmode;
_L2:
        if(state != com.android.internal.telephony.IccCard.State.PUK_REQUIRED)
            break; /* Loop/switch isn't completed */
        unlockmode = UnlockMode.SimPuk;
        if(true) goto _L4; else goto _L3
_L3:
        int i = mLockPatternUtils.getKeyguardStoredPasswordQuality();
        switch(i) {
        default:
            throw new IllegalStateException((new StringBuilder()).append("Unknown unlock mode:").append(i).toString());

        case 131072: 
        case 262144: 
        case 327680: 
        case 393216: 
            unlockmode = UnlockMode.Password;
            break;

        case 0: // '\0'
        case 65536: 
            if(mLockPatternUtils.isLockPatternEnabled()) {
                if(mForgotPattern || mLockPatternUtils.isPermanentlyLocked())
                    unlockmode = com.android.internal.policy.impl.UnlockMode.Account;
                else
                    unlockmode = UnlockMode.Pattern;
            } else {
                unlockmode = UnlockMode.Unknown;
            }
            break;
        }
        if(true) goto _L4; else goto _L5
_L5:
    }

    private void initializeBiometricUnlockView(View view) {
        boolean flag = false;
        if(mBiometricUnlock != null)
            flag = mBiometricUnlock.stop();
        if(!mScreenOn) {
            View view1;
            boolean flag1;
            if(mUpdateMonitor.getPhoneState() != 0 || mHasDialog)
                flag1 = true;
            else
                flag1 = false;
            mSuppressBiometricUnlock = flag1;
        }
        mBiometricUnlock = null;
        if(useBiometricUnlock()) {
            view1 = view.findViewById(0x10202b2);
            if(view1 != null) {
                mBiometricUnlock = new FaceUnlock(mContext, mUpdateMonitor, mLockPatternUtils, mKeyguardScreenCallback);
                mBiometricUnlock.initializeView(view1);
                if(!mScreenOn)
                    mBiometricUnlock.show(0L);
            } else {
                Log.w("LockPatternKeyguardView", "Couldn't find biometric unlock view");
            }
        }
        if(mBiometricUnlock != null && flag)
            maybeStartBiometricUnlock();
    }

    private void initializeTransportControlView(View view) {
        mTransportControlView = (TransportControlView)view.findViewById(0x10202b1);
        if(mTransportControlView != null) {
            mUpdateMonitor.reportClockVisible(true);
            mTransportControlView.setVisibility(8);
            mTransportControlView.setCallback(mWidgetCallback);
        }
    }

    private boolean isSecure() {
        UnlockMode unlockmode;
        boolean flag;
        unlockmode = getUnlockMode();
        flag = false;
        class _cls5 {

            static final int $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[];

            static  {
                $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode = new int[UnlockMode.values().length];
                NoSuchFieldError nosuchfielderror5;
                try {
                    $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[UnlockMode.Pattern.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[UnlockMode.SimPin.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[UnlockMode.SimPuk.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[com.android.internal.policy.impl.UnlockMode.Account.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror3) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[UnlockMode.Password.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror4) { }
                $SwitchMap$com$android$internal$policy$impl$LockPatternKeyguardView$UnlockMode[UnlockMode.Unknown.ordinal()] = 6;
_L2:
                return;
                nosuchfielderror5;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls5..SwitchMap.com.android.internal.policy.impl.LockPatternKeyguardView.UnlockMode[unlockmode.ordinal()];
        JVM INSTR tableswitch 1 6: default 52
    //                   1 80
    //                   2 90
    //                   3 113
    //                   4 136
    //                   5 141
    //                   6 88;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7
_L7:
        break; /* Loop/switch isn't completed */
_L1:
        throw new IllegalStateException((new StringBuilder()).append("unknown unlock mode ").append(unlockmode).toString());
_L2:
        flag = mLockPatternUtils.isLockPatternEnabled();
_L9:
        return flag;
_L3:
        if(mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCard.State.PIN_REQUIRED)
            flag = true;
        else
            flag = false;
        continue; /* Loop/switch isn't completed */
_L4:
        if(mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCard.State.PUK_REQUIRED)
            flag = true;
        else
            flag = false;
        continue; /* Loop/switch isn't completed */
_L5:
        flag = true;
        continue; /* Loop/switch isn't completed */
_L6:
        flag = mLockPatternUtils.isLockPasswordEnabled();
        if(true) goto _L9; else goto _L8
_L8:
    }

    private void maybeEnableFallback(Context context) {
        (new AccountAnalyzer(AccountManager.get(context))).start();
    }

    private void maybeStartBiometricUnlock() {
        if(getMode() != Mode.LockScreen && mBiometricUnlock != null) {
            boolean flag;
            if(mUpdateMonitor.getFailedAttempts() >= 5)
                flag = true;
            else
                flag = false;
            if(!mSuppressBiometricUnlock && mUpdateMonitor.getPhoneState() == 0 && !mUpdateMonitor.getMaxBiometricUnlockAttemptsReached() && !flag)
                mBiometricUnlock.start();
            else
                mBiometricUnlock.hide();
        }
    }

    private void recreateLockScreen() {
        if(Injector.needRecreateLockScreen(this)) {
            if(mLockScreen != null) {
                ((KeyguardScreen)mLockScreen).onPause();
                ((KeyguardScreen)mLockScreen).cleanUp();
                removeView(mLockScreen);
            }
            mLockScreen = createLockScreen();
            mLockScreen.setVisibility(4);
            addView(mLockScreen);
        }
    }

    private void recreateUnlockScreen(UnlockMode unlockmode) {
        if(mUnlockScreen != null) {
            ((KeyguardScreen)mUnlockScreen).onPause();
            ((KeyguardScreen)mUnlockScreen).cleanUp();
            removeView(mUnlockScreen);
        }
        mUnlockScreen = createUnlockScreenFor(unlockmode);
        mUnlockScreen.setVisibility(4);
        addView(mUnlockScreen);
    }

    private void restoreWidgetState() {
        if(mTransportControlView != null && mSavedState != null)
            mTransportControlView.onRestoreInstanceState(mSavedState);
    }

    private void saveWidgetState() {
        if(mTransportControlView != null)
            mSavedState = mTransportControlView.onSaveInstanceState();
    }

    private void showAlmostAtAccountLoginDialog() {
        Context context = mContext;
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(15);
        aobj[1] = Integer.valueOf(5);
        aobj[2] = Integer.valueOf(30);
        showDialog(null, context.getString(0x1040319, aobj));
    }

    private void showAlmostAtWipeDialog(int i, int j) {
        Context context = mContext;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        showDialog(null, context.getString(0x104031a, aobj));
    }

    private void showDialog(String s, String s1) {
        mHasDialog = true;
        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(s).setMessage(s1).setNeutralButton(0x104000a, null).create();
        alertdialog.getWindow().setType(2009);
        alertdialog.show();
    }

    private void showTimeoutDialog() {
        int i = 0x1040316;
        Context context;
        Object aobj[];
        if(getUnlockMode() == UnlockMode.Password)
            if(mLockPatternUtils.getKeyguardStoredPasswordQuality() == 0x20000)
                i = 0x1040318;
            else
                i = 0x1040317;
        context = mContext;
        aobj = new Object[2];
        aobj[0] = Integer.valueOf(mUpdateMonitor.getFailedAttempts());
        aobj[1] = Integer.valueOf(30);
        showDialog(null, context.getString(i, aobj));
    }

    private void showWipeDialog(int i) {
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        showDialog(null, context.getString(0x104031b, aobj));
    }

    private boolean stuckOnLockScreenBecauseSimMissing() {
        boolean flag;
        if(mRequiresSim && !mUpdateMonitor.isDeviceProvisioned() && (mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCard.State.ABSENT || mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCard.State.PERM_DISABLED))
            flag = true;
        else
            flag = false;
        return flag;
    }

    private void updateScreen(Mode mode, boolean flag) {
        mMode = mode;
        if((mode == Mode.LockScreen || mShowLockBeforeUnlock) && (flag || mLockScreen == null))
            recreateLockScreen();
        UnlockMode unlockmode = getUnlockMode();
        if(mode == Mode.UnlockScreen && unlockmode != UnlockMode.Unknown && (flag || mUnlockScreen == null || unlockmode != mUnlockScreenMode))
            recreateUnlockScreen(unlockmode);
        View view;
        View view1;
        if(mode == Mode.LockScreen)
            view = mUnlockScreen;
        else
            view = mLockScreen;
        if(mode == Mode.LockScreen)
            view1 = mLockScreen;
        else
            view1 = mUnlockScreen;
        mWindowController.setNeedsInput(((KeyguardScreen)view1).needsInput());
        if(mScreenOn) {
            if(view != null && view.getVisibility() == 0)
                ((KeyguardScreen)view).onPause();
            if(view1.getVisibility() != 0)
                ((KeyguardScreen)view1).onResume();
        }
        if(view != null)
            view.setVisibility(8);
        view1.setVisibility(0);
        requestLayout();
        if(!view1.requestFocus()) {
            throw new IllegalStateException((new StringBuilder()).append("keyguard screen must be able to take focus when shown ").append(view1.getClass().getCanonicalName()).toString());
        } else {
            Injector.startBiometricUnlock(this);
            return;
        }
    }

    private boolean useBiometricUnlock() {
        boolean flag = true;
        UnlockMode unlockmode = getUnlockMode();
        boolean flag1;
        if(mUpdateMonitor.getFailedAttempts() >= 5)
            flag1 = flag;
        else
            flag1 = false;
        if(!mLockPatternUtils.usingBiometricWeak() || !mLockPatternUtils.isBiometricWeakInstalled() || mUpdateMonitor.getMaxBiometricUnlockAttemptsReached() || flag1 || unlockmode != UnlockMode.Pattern && unlockmode != UnlockMode.Password)
            flag = false;
        return flag;
    }

    Mode callGetInitialMode() {
        return getInitialMode();
    }

    void callMaybeStartBiometricUnlock() {
        maybeStartBiometricUnlock();
    }

    boolean callStuckOnLockScreenBecauseSimMissing() {
        return stuckOnLockScreenBecauseSimMissing();
    }

    public void cleanUp() {
        if(mLockScreen != null) {
            ((KeyguardScreen)mLockScreen).onPause();
            ((KeyguardScreen)mLockScreen).cleanUp();
            removeView(mLockScreen);
            mLockScreen = null;
        }
        if(mUnlockScreen != null) {
            ((KeyguardScreen)mUnlockScreen).onPause();
            ((KeyguardScreen)mUnlockScreen).cleanUp();
            removeView(mUnlockScreen);
            mUnlockScreen = null;
        }
        mUpdateMonitor.removeCallback(this);
        if(mBiometricUnlock != null)
            mBiometricUnlock.cleanUp();
    }

    protected KeyguardScreenCallback createKeyguardScreenCallback() {
        return new KeyguardScreenCallback() {

            public boolean doesFallbackUnlockScreenExist() {
                return mEnableFallback;
            }

            public void forgotPattern(boolean flag) {
                if(mEnableFallback) {
                    mForgotPattern = flag;
                    updateScreen(Mode.UnlockScreen, false);
                }
            }

            public void goToLockScreen() {
                mForgotPattern = false;
                if(mIsVerifyUnlockOnly) {
                    mIsVerifyUnlockOnly = false;
                    getCallback().keyguardDone(false);
                } else {
                    updateScreen(Mode.LockScreen, false);
                }
            }

            public void goToUnlockScreen() {
                com.android.internal.telephony.IccCard.State state = mUpdateMonitor.getSimState();
                if(!stuckOnLockScreenBecauseSimMissing() && (state != com.android.internal.telephony.IccCard.State.PUK_REQUIRED || mLockPatternUtils.isPukUnlockScreenEnable()))
                    if(!isSecure())
                        getCallback().keyguardDone(true);
                    else
                        updateScreen(Mode.UnlockScreen, false);
            }

            public boolean isSecure() {
                return LockPatternKeyguardView.this.isSecure();
            }

            public boolean isVerifyUnlockOnly() {
                return mIsVerifyUnlockOnly;
            }

            public void keyguardDone(boolean flag) {
                getCallback().keyguardDone(flag);
                mSavedState = null;
            }

            public void keyguardDoneDrawing() {
            }

            public void pokeWakelock() {
                getCallback().pokeWakelock();
            }

            public void pokeWakelock(int i) {
                getCallback().pokeWakelock(i);
            }

            public void recreateMe(Configuration configuration) {
                removeCallbacks(mRecreateRunnable);
                post(mRecreateRunnable);
            }

            public void reportFailedUnlockAttempt() {
                int i;
                boolean flag;
                mUpdateMonitor.reportFailedAttempt();
                i = mUpdateMonitor.getFailedAttempts();
                int j;
                int k;
                if(mLockPatternUtils.getKeyguardStoredPasswordQuality() == 0x10000)
                    flag = true;
                else
                    flag = false;
                j = mLockPatternUtils.getDevicePolicyManager().getMaximumFailedPasswordsForWipe(null);
                if(j > 0)
                    k = j - i;
                else
                    k = 0x7fffffff;
                if(k >= 5) goto _L2; else goto _L1
_L1:
                if(k > 0) {
                    showAlmostAtWipeDialog(i, k);
                } else {
                    Slog.i("LockPatternKeyguardView", "Too many unlock attempts; device will be wiped!");
                    showWipeDialog(i);
                }
_L4:
                mLockPatternUtils.reportFailedPasswordAttempt();
                return;
_L2:
                boolean flag1;
                if(i % 5 == 0)
                    flag1 = true;
                else
                    flag1 = false;
                if(flag && mEnableFallback) {
                    if(i != 15)
                        break; /* Loop/switch isn't completed */
                    showAlmostAtAccountLoginDialog();
                    flag1 = false;
                }
_L6:
                if(flag1)
                    showTimeoutDialog();
                if(true) goto _L4; else goto _L3
_L3:
                if(i < 20) goto _L6; else goto _L5
_L5:
                mLockPatternUtils.setPermanentlyLocked(true);
                updateScreen(mMode, false);
                flag1 = false;
                  goto _L6
            }

            public void reportSuccessfulUnlockAttempt() {
                mLockPatternUtils.reportSuccessfulPasswordAttempt();
            }

            public void takeEmergencyCallAction() {
                mSuppressBiometricUnlock = true;
                if(mBiometricUnlock != null) {
                    if(mBiometricUnlock.isRunning())
                        mBiometricUnlock.show(1000L);
                    mBiometricUnlock.stop();
                }
                pokeWakelock(10000);
                if(TelephonyManager.getDefault().getCallState() == 2) {
                    mLockPatternUtils.resumeCall();
                } else {
                    Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
                    intent.setFlags(0x10800000);
                    getContext().startActivity(intent);
                }
            }

            final LockPatternKeyguardView this$0;

             {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        };
    }

    View createLockScreen() {
        LockScreen lockscreen = new LockScreen(mContext, mConfiguration, mLockPatternUtils, mUpdateMonitor, mKeyguardScreenCallback);
        initializeTransportControlView(lockscreen);
        return lockscreen;
    }

    View createUnlockScreenFor(UnlockMode unlockmode) {
        if(unlockmode != UnlockMode.Pattern) goto _L2; else goto _L1
_L1:
        Object obj;
        PatternUnlockScreen patternunlockscreen = new PatternUnlockScreen(mContext, mConfiguration, mLockPatternUtils, mUpdateMonitor, mKeyguardScreenCallback, mUpdateMonitor.getFailedAttempts());
        patternunlockscreen.setEnableFallback(mEnableFallback);
        obj = patternunlockscreen;
_L6:
        Object obj1;
        initializeTransportControlView(((View) (obj)));
        initializeBiometricUnlockView(((View) (obj)));
        mUnlockScreenMode = unlockmode;
        obj1 = obj;
_L4:
        return ((View) (obj1));
_L2:
        if(unlockmode == UnlockMode.SimPuk) {
            obj = new SimPukUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
            continue; /* Loop/switch isn't completed */
        }
        if(unlockmode == UnlockMode.SimPin) {
            obj = new SimUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
            continue; /* Loop/switch isn't completed */
        }
        if(unlockmode != com.android.internal.policy.impl.UnlockMode.Account)
            break; /* Loop/switch isn't completed */
        MiuiAccountUnlockScreen miuiaccountunlockscreen = new MiuiAccountUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
        obj = miuiaccountunlockscreen;
        continue; /* Loop/switch isn't completed */
        IllegalStateException illegalstateexception;
        illegalstateexception;
        Log.i("LockPatternKeyguardView", "Couldn't instantiate AccountUnlockScreen (IAccountsService isn't available)");
        obj1 = createUnlockScreenFor(UnlockMode.Pattern);
        if(true) goto _L4; else goto _L3
_L3:
        if(unlockmode == UnlockMode.Password) {
            Context context = mContext;
            Configuration configuration = mConfiguration;
            LockPatternUtils lockpatternutils = mLockPatternUtils;
            KeyguardUpdateMonitor keyguardupdatemonitor = mUpdateMonitor;
            KeyguardScreenCallback keyguardscreencallback = mKeyguardScreenCallback;
            obj = new PasswordUnlockScreen(context, configuration, lockpatternutils, keyguardupdatemonitor, keyguardscreencallback);
        } else {
            throw new IllegalArgumentException((new StringBuilder()).append("unknown unlock mode ").append(unlockmode).toString());
        }
        if(true) goto _L6; else goto _L5
_L5:
    }

    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
    }

    protected boolean dispatchHoverEvent(MotionEvent motionevent) {
        AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(mContext);
        if(accessibilitymanager.isEnabled() && accessibilitymanager.isTouchExplorationEnabled())
            getCallback().pokeWakelock();
        return super.dispatchHoverEvent(motionevent);
    }

    Configuration getConfiguration() {
        return mConfiguration;
    }

    LockPatternUtils getLockPatternUtils() {
        return mLockPatternUtils;
    }

    View getLockScreen() {
        return mLockScreen;
    }

    Mode getMode() {
        return mMode;
    }

    boolean getScreenOn() {
        return mScreenOn;
    }

    boolean getShowLockBeforeUnlock() {
        return mShowLockBeforeUnlock;
    }

    KeyguardUpdateMonitor getUpdateMonitor() {
        return mUpdateMonitor;
    }

    protected void onConfigurationChanged(Configuration configuration) {
        mShowLockBeforeUnlock = getResources().getBoolean(0x111001f);
        mConfiguration = configuration;
        saveWidgetState();
        removeCallbacks(mRecreateRunnable);
        post(mRecreateRunnable);
    }

    protected void onDetachedFromWindow() {
        mUpdateMonitor.removeCallback(mInfoCallback);
        removeCallbacks(mRecreateRunnable);
        if(mBiometricUnlock != null)
            mBiometricUnlock.stop();
        super.onDetachedFromWindow();
    }

    public void onScreenTurnedOff() {
        mScreenOn = false;
        mForgotPattern = false;
        if(mLockScreen != null)
            ((KeyguardScreen)mLockScreen).onPause();
        if(mUnlockScreen != null)
            ((KeyguardScreen)mUnlockScreen).onPause();
        saveWidgetState();
        if(mBiometricUnlock != null)
            mBiometricUnlock.stop();
    }

    public void onScreenTurnedOn() {
        boolean flag;
        synchronized(mBiometricUnlockStartupLock) {
            mScreenOn = true;
            flag = mWindowFocused;
        }
        show();
        restoreWidgetState();
        if(mBiometricUnlock != null && flag)
            maybeStartBiometricUnlock();
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onWindowFocusChanged(boolean flag) {
        boolean flag1;
        flag1 = false;
        synchronized(mBiometricUnlockStartupLock) {
            if(mScreenOn && !mWindowFocused)
                flag1 = flag;
            mWindowFocused = flag;
        }
        if(flag) goto _L2; else goto _L1
_L1:
        if(mBiometricUnlock != null) {
            mSuppressBiometricUnlock = true;
            mBiometricUnlock.stop();
            mBiometricUnlock.hide();
        }
_L4:
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        mHasDialog = false;
        if(mBiometricUnlock != null && flag1)
            maybeStartBiometricUnlock();
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void reset() {
        mIsVerifyUnlockOnly = false;
        mForgotPattern = false;
        post(mRecreateRunnable);
    }

    void setMode(Mode mode) {
        mMode = mode;
    }

    void setScreenOn(boolean flag) {
        mScreenOn = flag;
    }

    void setShowLockBeforeUnlock(boolean flag) {
        mShowLockBeforeUnlock = flag;
    }

    public void show() {
        if(mLockScreen != null)
            ((KeyguardScreen)mLockScreen).onResume();
        if(mUnlockScreen != null)
            ((KeyguardScreen)mUnlockScreen).onResume();
        if(mBiometricUnlock != null && mSuppressBiometricUnlock)
            mBiometricUnlock.hide();
    }

    public void verifyUnlock() {
        if(!isSecure())
            getCallback().keyguardDone(true);
        else
        if(mUnlockScreenMode != UnlockMode.Pattern && mUnlockScreenMode != UnlockMode.Password) {
            getCallback().keyguardDone(false);
        } else {
            mIsVerifyUnlockOnly = true;
            updateScreen(Mode.UnlockScreen, false);
        }
    }

    public void wakeWhenReadyTq(int i) {
        if(i == 82 && isSecure() && mMode == Mode.LockScreen && mUpdateMonitor.getSimState() != com.android.internal.telephony.IccCard.State.PUK_REQUIRED) {
            updateScreen(Mode.UnlockScreen, false);
            getCallback().pokeWakelock();
        } else {
            getCallback().pokeWakelock();
        }
    }

    static final String ACTION_EMERGENCY_DIAL = "com.android.phone.EmergencyDialer.DIAL";
    private static final boolean DEBUG = false;
    static final boolean DEBUG_CONFIGURATION = false;
    private static final int EMERGENCY_CALL_TIMEOUT = 10000;
    private static final String TAG = "LockPatternKeyguardView";
    private static final int TRANSPORT_USERACTIVITY_TIMEOUT = 10000;
    private static boolean sIsFirstAppearanceAfterBoot = true;
    private final int BIOMETRIC_AREA_EMERGENCY_DIALER_TIMEOUT = 1000;
    private BiometricSensorUnlock mBiometricUnlock;
    private final Object mBiometricUnlockStartupLock = new Object();
    private Configuration mConfiguration;
    private boolean mEnableFallback;
    private boolean mForgotPattern;
    private boolean mHasDialog;
    KeyguardUpdateMonitor.InfoCallbackImpl mInfoCallback;
    private boolean mIsVerifyUnlockOnly;
    KeyguardScreenCallback mKeyguardScreenCallback;
    private final LockPatternUtils mLockPatternUtils;
    private View mLockScreen;
    private Mode mMode;
    private boolean mPluggedIn;
    private Runnable mRecreateRunnable;
    private boolean mRequiresSim;
    private Parcelable mSavedState;
    private boolean mScreenOn;
    private boolean mShowLockBeforeUnlock;
    private boolean mSuppressBiometricUnlock;
    private TransportControlView mTransportControlView;
    private View mUnlockScreen;
    private UnlockMode mUnlockScreenMode;
    private final KeyguardUpdateMonitor mUpdateMonitor;
    private LockScreenWidgetCallback mWidgetCallback;
    private final KeyguardWindowController mWindowController;
    private boolean mWindowFocused;







/*
    static boolean access$1202(LockPatternKeyguardView lockpatternkeyguardview, boolean flag) {
        lockpatternkeyguardview.mSuppressBiometricUnlock = flag;
        return flag;
    }

*/



/*
    static Parcelable access$1402(LockPatternKeyguardView lockpatternkeyguardview, Parcelable parcelable) {
        lockpatternkeyguardview.mSavedState = parcelable;
        return parcelable;
    }

*/









/*
    static boolean access$2102(LockPatternKeyguardView lockpatternkeyguardview, boolean flag) {
        lockpatternkeyguardview.mPluggedIn = flag;
        return flag;
    }

*/





/*
    static boolean access$502(LockPatternKeyguardView lockpatternkeyguardview, boolean flag) {
        lockpatternkeyguardview.mForgotPattern = flag;
        return flag;
    }

*/



/*
    static boolean access$602(LockPatternKeyguardView lockpatternkeyguardview, boolean flag) {
        lockpatternkeyguardview.mIsVerifyUnlockOnly = flag;
        return flag;
    }

*/





/*
    static boolean access$902(LockPatternKeyguardView lockpatternkeyguardview, boolean flag) {
        lockpatternkeyguardview.mEnableFallback = flag;
        return flag;
    }

*/
}
