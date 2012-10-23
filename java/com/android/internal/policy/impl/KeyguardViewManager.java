// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.ActivityManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.os.IBinder;
import android.os.SystemProperties;
import android.util.Log;
import android.view.*;
import android.widget.FrameLayout;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardWindowController, KeyguardViewBase, KeyguardViewProperties, KeyguardViewCallback, 
//            KeyguardUpdateMonitor

public class KeyguardViewManager
    implements KeyguardWindowController {
    private static class KeyguardViewHost extends FrameLayout {

        protected void dispatchDraw(Canvas canvas) {
            super.dispatchDraw(canvas);
            mCallback.keyguardDoneDrawing();
        }

        private final KeyguardViewCallback mCallback;

        private KeyguardViewHost(Context context, KeyguardViewCallback keyguardviewcallback) {
            super(context);
            mCallback = keyguardviewcallback;
        }

    }

    public static interface ShowListener {

        public abstract void onShown(IBinder ibinder);
    }


    public KeyguardViewManager(Context context, ViewManager viewmanager, KeyguardViewCallback keyguardviewcallback, KeyguardViewProperties keyguardviewproperties, KeyguardUpdateMonitor keyguardupdatemonitor) {
        mNeedsInput = false;
        mScreenOn = false;
        mContext = new ContextThemeWrapper(context, 0x103006b);
        mViewManager = viewmanager;
        mCallback = keyguardviewcallback;
        mKeyguardViewProperties = keyguardviewproperties;
        mUpdateMonitor = keyguardupdatemonitor;
    }

    private void updateDisplayDesktopFlag() {
        if(mKeyguardView.isDisplayDesktop() && !mKeyguardViewProperties.isSecure()) {
            android.view.WindowManager.LayoutParams layoutparams2 = mWindowLayoutParams;
            layoutparams2.flags = 0xffefffff & layoutparams2.flags;
            android.view.WindowManager.LayoutParams layoutparams3 = mWindowLayoutParams;
            layoutparams3.privateFlags = 0x40000000 | layoutparams3.privateFlags;
        } else {
            android.view.WindowManager.LayoutParams layoutparams = mWindowLayoutParams;
            layoutparams.flags = 0x100000 | layoutparams.flags;
            android.view.WindowManager.LayoutParams layoutparams1 = mWindowLayoutParams;
            layoutparams1.privateFlags = 0xbfffffff & layoutparams1.privateFlags;
        }
    }

    /**
     * @deprecated Method hide is deprecated
     */

    public void hide() {
        this;
        JVM INSTR monitorenter ;
        if(mKeyguardHost != null) {
            mKeyguardHost.setVisibility(8);
            if(mKeyguardView != null) {
                final KeyguardViewBase lastView = mKeyguardView;
                mKeyguardView = null;
                mKeyguardHost.postDelayed(new Runnable() {

                    public void run() {
                        KeyguardViewManager keyguardviewmanager = KeyguardViewManager.this;
                        keyguardviewmanager;
                        JVM INSTR monitorenter ;
                        lastView.cleanUp();
                        mKeyguardHost.removeView(lastView);
                        return;
                    }

                    final KeyguardViewManager this$0;
                    final KeyguardViewBase val$lastView;

             {
                this$0 = KeyguardViewManager.this;
                lastView = keyguardviewbase;
                super();
            }
                }, 500L);
            }
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method isShowing is deprecated
     */

    public boolean isShowing() {
        this;
        JVM INSTR monitorenter ;
        if(mKeyguardHost == null) goto _L2; else goto _L1
_L1:
        int i = mKeyguardHost.getVisibility();
        if(i != 0) goto _L2; else goto _L3
_L3:
        boolean flag = true;
_L5:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        flag = false;
        if(true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method onScreenTurnedOff is deprecated
     */

    public void onScreenTurnedOff() {
        this;
        JVM INSTR monitorenter ;
        mScreenOn = false;
        if(mKeyguardView != null)
            mKeyguardView.onScreenTurnedOff();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method onScreenTurnedOn is deprecated
     */

    public void onScreenTurnedOn(final ShowListener showListener) {
        this;
        JVM INSTR monitorenter ;
        mScreenOn = true;
        if(mKeyguardView == null)
            break MISSING_BLOCK_LABEL_66;
        mKeyguardView.onScreenTurnedOn();
        if(mKeyguardHost.getVisibility() != 0) goto _L2; else goto _L1
_L1:
        mKeyguardHost.post(new Runnable() {

            public void run() {
                if(mKeyguardHost.getVisibility() == 0)
                    showListener.onShown(mKeyguardHost.getWindowToken());
                else
                    showListener.onShown(null);
            }

            final KeyguardViewManager this$0;
            final ShowListener val$showListener;

             {
                this$0 = KeyguardViewManager.this;
                showListener = showlistener;
                super();
            }
        });
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        showListener.onShown(null);
          goto _L3
        Exception exception;
        exception;
        throw exception;
        showListener.onShown(null);
          goto _L3
    }

    /**
     * @deprecated Method reset is deprecated
     */

    public void reset() {
        this;
        JVM INSTR monitorenter ;
        if(mKeyguardView != null)
            mKeyguardView.reset();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setNeedsInput(boolean flag) {
        mNeedsInput = flag;
        if(mWindowLayoutParams != null) {
            if(flag) {
                android.view.WindowManager.LayoutParams layoutparams1 = mWindowLayoutParams;
                layoutparams1.flags = 0xfffdffff & layoutparams1.flags;
            } else {
                android.view.WindowManager.LayoutParams layoutparams = mWindowLayoutParams;
                layoutparams.flags = 0x20000 | layoutparams.flags;
            }
            mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        }
    }

    /**
     * @deprecated Method show is deprecated
     */

    public void show() {
        boolean flag = false;
        this;
        JVM INSTR monitorenter ;
        Resources resources = mContext.getResources();
        Exception exception;
        if(SystemProperties.getBoolean("lockscreen.rot_override", false) || resources.getBoolean(0x1110020))
            flag = true;
        if(mKeyguardHost == null) {
            mKeyguardHost = new KeyguardViewHost(mContext, mCallback);
            int i = 0x4100900;
            if(!mNeedsInput)
                i |= 0x20000;
            if(ActivityManager.isHighEndGfx(((WindowManager)mContext.getSystemService("window")).getDefaultDisplay()))
                i |= 0x1000000;
            android.view.WindowManager.LayoutParams layoutparams1 = new android.view.WindowManager.LayoutParams(-1, -1, 2004, i, -3);
            layoutparams1.softInputMode = 16;
            layoutparams1.windowAnimations = 0x10301de;
            if(ActivityManager.isHighEndGfx(((WindowManager)mContext.getSystemService("window")).getDefaultDisplay())) {
                layoutparams1.flags = 0x1000000 | layoutparams1.flags;
                layoutparams1.privateFlags = 2 | layoutparams1.privateFlags;
            }
            layoutparams1.screenOrientation = 1;
            layoutparams1.privateFlags = 8 | layoutparams1.privateFlags;
            layoutparams1.setTitle("Keyguard");
            mWindowLayoutParams = layoutparams1;
            mViewManager.addView(mKeyguardHost, layoutparams1);
        }
        if(!flag)
            break MISSING_BLOCK_LABEL_436;
        mWindowLayoutParams.screenOrientation = 4;
_L1:
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        if(mKeyguardView == null) {
            mKeyguardView = mKeyguardViewProperties.createKeyguardView(mContext, mCallback, mUpdateMonitor, this);
            mKeyguardView.setId(0x1020236);
            android.widget.FrameLayout.LayoutParams layoutparams = new android.widget.FrameLayout.LayoutParams(-1, -1);
            mKeyguardHost.addView(mKeyguardView, layoutparams);
            if(mScreenOn)
                mKeyguardView.show();
        }
        Log.v(TAG, (new StringBuilder()).append("KGVM: Set visibility on ").append(mKeyguardHost).append(" to ").append(0x600000).toString());
        mKeyguardHost.setSystemUiVisibility(0x600000);
        updateDisplayDesktopFlag();
        mViewManager.updateViewLayout(mKeyguardHost, mWindowLayoutParams);
        mKeyguardHost.setVisibility(0);
        mKeyguardView.requestFocus();
        this;
        JVM INSTR monitorexit ;
        return;
        mWindowLayoutParams.screenOrientation = 1;
          goto _L1
        exception;
        throw exception;
    }

    /**
     * @deprecated Method verifyUnlock is deprecated
     */

    public void verifyUnlock() {
        this;
        JVM INSTR monitorenter ;
        show();
        mKeyguardView.verifyUnlock();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public boolean wakeWhenReadyTq(int i) {
        boolean flag;
        if(mKeyguardView != null) {
            mKeyguardView.wakeWhenReadyTq(i);
            flag = true;
        } else {
            Log.w(TAG, "mKeyguardView is null in wakeWhenReadyTq");
            flag = false;
        }
        return flag;
    }

    private static final boolean DEBUG;
    private static String TAG = "KeyguardViewManager";
    private final KeyguardViewCallback mCallback;
    private final Context mContext;
    private FrameLayout mKeyguardHost;
    private KeyguardViewBase mKeyguardView;
    private final KeyguardViewProperties mKeyguardViewProperties;
    private boolean mNeedsInput;
    private boolean mScreenOn;
    private final KeyguardUpdateMonitor mUpdateMonitor;
    private final ViewManager mViewManager;
    private android.view.WindowManager.LayoutParams mWindowLayoutParams;


}
