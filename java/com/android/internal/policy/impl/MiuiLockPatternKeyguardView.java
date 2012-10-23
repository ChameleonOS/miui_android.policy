// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import com.android.internal.widget.LockPatternUtils;
import com.miui.internal.policy.impl.KeyguardScreenCallback;
import miui.content.res.ThemeResources;
import miui.content.res.ThemeResourcesSystem;

// Referenced classes of package com.android.internal.policy.impl:
//            LockPatternKeyguardView, AwesomeLockScreen, MiuiLockScreen, KeyguardViewCallback, 
//            KeyguardUpdateMonitor, KeyguardWindowController, KeyguardScreenCallback, KeyguardScreenCallbackProxy

public class MiuiLockPatternKeyguardView extends LockPatternKeyguardView {
    class KeyguardScreenCallbackImpl extends KeyguardScreenCallbackProxy
        implements KeyguardScreenCallback {

        public void goToUnlockScreen() {
            if(!stuckOnLockScreenBecauseSimMissing())
                if(!isSecure())
                    keyguardDone(true);
                else
                    super.goToUnlockScreen();
        }

        public void keyguardDone(boolean flag) {
            super.keyguardDone(flag);
            if(!flag || mPendingIntent == null)
                break MISSING_BLOCK_LABEL_30;
            
// JavaClassFileOutputException: get_constant: invalid tag

        public void setPendingIntent(Intent intent) {
            mPendingIntent = intent;
        }

        private Intent mPendingIntent;
        final MiuiLockPatternKeyguardView this$0;

        public KeyguardScreenCallbackImpl(com.android.internal.policy.impl.KeyguardScreenCallback keyguardscreencallback) {
            this$0 = MiuiLockPatternKeyguardView.this;
            super(keyguardscreencallback);
            mPendingIntent = null;
        }
    }


    public MiuiLockPatternKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardWindowController keyguardwindowcontroller) {
        LockPatternKeyguardView(context, keyguardviewcallback, keyguardupdatemonitor, lockpatternutils, keyguardwindowcontroller);
        mTorchStateReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                final boolean enabled = intent.getBooleanExtra("miui.intent.extra.IS_ENABLE", false);
                post(new Runnable() {

                    public void run() {
                        updateTorchCover(enabled);
                    }

                    final _cls1 this$1;
                    final boolean val$enabled;

                     {
                        this$1 = _cls1.this;
                        enabled = flag;
                        super();
                    }
                });
            }

            final MiuiLockPatternKeyguardView this$0;

             {
                this$0 = MiuiLockPatternKeyguardView.this;
                super();
            }
        };
    }

    private void updateShowLockBeforeUnlock() {
        super.mShowLockBeforeUnlock = miui.provider.ExtraSettings.System.getBoolean(super.mContext.getContentResolver(), "show_lock_before_unlock", true);
    }

    private void updateTorchCover(boolean flag) {
        if(mTorchCover == null) {
            mTorchCover = new ImageView(super.mContext);
            mTorchCover.setClickable(true);
            mTorchCover.setImageResource(0x60200be);
            mTorchCover.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
            mTorchCover.setLayoutParams(new android.widget.FrameLayout.LayoutParams(-1, -1));
        }
        if(flag)
            addView(mTorchCover);
        else
            removeView(mTorchCover);
    }

    protected volatile com.android.internal.policy.impl.KeyguardScreenCallback createKeyguardScreenCallback() {
        return createKeyguardScreenCallback();
    }

    protected KeyguardScreenCallback createKeyguardScreenCallback() {
        mKeyguardScreenCallback = new KeyguardScreenCallbackImpl(super.createKeyguardScreenCallback());
        return mKeyguardScreenCallback;
    }

    protected View createLockScreen() {
        Object obj;
        if(ThemeResources.getSystem().hasAwesomeLockscreen()) {
            obj = new AwesomeLockScreen(super.mContext, getConfiguration(), getLockPatternUtils(), getUpdateMonitor(), mKeyguardScreenCallback);
        } else {
            obj = new MiuiLockScreen(super.mContext, getConfiguration(), getLockPatternUtils(), getUpdateMonitor(), mKeyguardScreenCallback);
            ((View) (obj)).setBackground(ThemeResources.getLockWallpaperCache(super.mContext));
        }
        return ((View) (obj));
    }

    View createUnlockScreenFor(LockPatternKeyguardView.UnlockMode unlockmode) {
        View view = super.createUnlockScreenFor(unlockmode);
        view.setPadding(0, super.mContext.getResources().getDimensionPixelSize(0x60a0000), 0, 0);
        view.setBackground(ThemeResources.getLockWallpaperCache(super.mContext));
        return view;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent) {
        boolean flag;
        int i;
        flag = true;
        i = keyevent.getKeyCode();
        if(keyevent.getAction() != 0) goto _L2; else goto _L1
_L1:
        if(i != 4) goto _L4; else goto _L3
_L3:
        mBackDown = flag;
_L8:
        flag = super.dispatchKeyEvent(keyevent);
_L6:
        return flag;
_L4:
        if(i != 24)
            mBackDown = false;
        continue; /* Loop/switch isn't completed */
_L2:
        if(keyevent.getAction() != flag)
            continue; /* Loop/switch isn't completed */
        if(i != 24 || !mBackDown)
            break; /* Loop/switch isn't completed */
        mBackDown = false;
        mKeyguardScreenCallback.goToUnlockScreen();
        Log.d("MiuiLockPatternKeyguardView", "Unlock Screen by pressing back + volume_up");
        if(true) goto _L6; else goto _L5
_L5:
        mBackDown = false;
        if(true) goto _L8; else goto _L7
_L7:
    }

    LockPatternKeyguardView.Mode getInitialMode() {
        updateShowLockBeforeUnlock();
        return super.getInitialMode();
    }

    public boolean isDisplayDesktop() {
        boolean flag;
        if(super.mLockScreen instanceof AwesomeLockScreen)
            flag = ((AwesomeLockScreen)super.mLockScreen).isDisplayDesktop();
        else
            flag = false;
        return flag;
    }

    void maybeStartBiometricUnlock() {
        if(super.mMode != LockPatternKeyguardView.Mode.LockScreen)
            super.maybeStartBiometricUnlock();
    }

    protected void onAttachedToWindow() {
        IntentFilter intentfilter = new IntentFilter("miui.intent.action.TOGGLE_TORCH");
        intentfilter.setPriority(1000);
        super.mContext.registerReceiver(mTorchStateReceiver, intentfilter);
        super.onAttachedToWindow();
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        updateShowLockBeforeUnlock();
    }

    protected void onDetachedFromWindow() {
        super.mContext.unregisterReceiver(mTorchStateReceiver);
        super.onDetachedFromWindow();
    }

    public void onScreenTurnedOff() {
        super.onScreenTurnedOff();
        super.mMode = getInitialMode();
    }

    protected void recreateLockScreen() {
        if(super.mMode != LockPatternKeyguardView.Mode.LockScreen || super.mLockScreen == null || !(super.mLockScreen instanceof AwesomeLockScreen))
            super.recreateLockScreen();
    }

    public void show() {
        super.mScreenOn = true;
        updateTorchCover(false);
        super.show();
    }

    protected void updateScreen(LockPatternKeyguardView.Mode mode, boolean flag) {
        super.updateScreen(mode, flag);
        if(super.mScreenOn)
            maybeStartBiometricUnlock();
    }

    private boolean mBackDown;
    private KeyguardScreenCallback mKeyguardScreenCallback;
    private ImageView mTorchCover;
    private BroadcastReceiver mTorchStateReceiver;


}
