// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.hardware.*;
import android.media.AudioManager;
import android.os.*;
import android.util.Log;
import android.util.SparseArray;
import android.view.*;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewMediator

public class MiuiScreenOnProximityLock {
    private class MySensorEventListener
        implements SensorEventListener {

        public void handleChanges() {
            StringBuilder stringbuilder = (new StringBuilder()).append("handle change = ");
            String s;
            Handler handler1;
            if(mIsTooClose)
                s = "too close";
            else
                s = "far away";
            Log.d("MiuiScreenOnProximityLock", stringbuilder.append(s).toString());
            if(mIsFirstChange)
                mHandler.removeMessages(3);
            if(!mIsTooClose) goto _L2; else goto _L1
_L1:
            mHandler.removeMessages(2);
            mHandler.removeMessages(3);
            handler1 = mHandler;
            long l1;
            if(mIsFirstChange)
                l1 = MiuiScreenOnProximityLock.sValidChangeDelay;
            else
                l1 = 0L;
            handler1.sendEmptyMessageDelayed(1, l1);
_L4:
            mIsFirstChange = false;
            return;
_L2:
            if(!mHandler.hasMessages(3)) {
                mHandler.removeMessages(1);
                mHandler.removeMessages(4);
                Handler handler = mHandler;
                long l;
                if(mIsFirstChange)
                    l = MiuiScreenOnProximityLock.sValidChangeDelay;
                else
                    l = 300L;
                handler.sendEmptyMessageDelayed(3, l);
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorevent) {
            boolean flag = false;
            float f = sensorevent.values[0];
            if((double)f >= 0.0D && f < 4F && f < mSensor.getMaximumRange())
                flag = true;
            mIsTooClose = flag;
            handleChanges();
        }

        boolean mIsTooClose;
        final MiuiScreenOnProximityLock this$0;

        private MySensorEventListener() {
            this$0 = MiuiScreenOnProximityLock.this;
            super();
        }

    }


    public MiuiScreenOnProximityLock(Context context, KeyguardViewMediator keyguardviewmediator) {
        mDownRecieved = new SparseArray();
        mSensorEventListener = new MySensorEventListener();
        mContext = context;
        sValidChangeDelay = mContext.getResources().getInteger(0x608000c);
        mKeyguardMediator = keyguardviewmediator;
        mSensorManager = (SensorManager)mContext.getSystemService("sensor");
        mSensor = mSensorManager.getDefaultSensor(8);
        mHandler = new Handler(mContext.getMainLooper()) {

            public void handleMessage(Message message) {
                MiuiScreenOnProximityLock miuiscreenonproximitylock = MiuiScreenOnProximityLock.this;
                miuiscreenonproximitylock;
                JVM INSTR monitorenter ;
                message.what;
                JVM INSTR tableswitch 1 3: default 36
            //                           1 39
            //                           2 108
            //                           3 177;
                   goto _L1 _L2 _L3 _L4
_L1:
                miuiscreenonproximitylock;
                JVM INSTR monitorexit ;
                return;
_L2:
                if(isHeld()) {
                    Log.d("MiuiScreenOnProximityLock", "too close screen, show hint...");
                    if(mDialog == null) {
                        prepareHintDialog();
                        mDialog.show();
                    }
                    mKeyguardMediator.mRealPowerManager.enableUserActivity(false);
                }
                  goto _L1
                Exception exception;
                exception;
                throw exception;
_L3:
                Log.d("MiuiScreenOnProximityLock", "far from the screen, hide hint...");
                if(mDialog != null) {
                    mDialog.dismiss();
                    mDialog = null;
                }
                if(!mKeyguardMediator.isShowingAndNotHidden())
                    mKeyguardMediator.mRealPowerManager.enableUserActivity(true);
                  goto _L1
_L4:
                Log.d("MiuiScreenOnProximityLock", "far from the screen for a certain time, release proximity sensor...");
                release();
                  goto _L1
            }

            final MiuiScreenOnProximityLock this$0;

             {
                this$0 = MiuiScreenOnProximityLock.this;
                super(looper);
            }
        };
    }

    private void prepareHintDialog() {
        mDialog = new Dialog(mContext, 0x103006b);
        android.view.WindowManager.LayoutParams layoutparams = mDialog.getWindow().getAttributes();
        layoutparams.type = 2016;
        layoutparams.flags = 4352;
        layoutparams.format = -3;
        layoutparams.gravity = 17;
        mDialog.getWindow().setAttributes(layoutparams);
        mDialog.getWindow().setBackgroundDrawable(new ColorDrawable(0xcc000000));
        mDialog.getWindow().requestFeature(1);
        mDialog.setCancelable(false);
        mDialog.setContentView(View.inflate(mDialog.getContext(), 0x603002a, null), new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    /**
     * @deprecated Method aquire is deprecated
     */

    public void aquire() {
        this;
        JVM INSTR monitorenter ;
        Log.d("MiuiScreenOnProximityLock", "try to aquire");
        if(mHeld) goto _L2; else goto _L1
_L1:
        Log.d("MiuiScreenOnProximityLock", "aquire");
        mHeld = true;
        mIsFirstChange = true;
        mHandler.sendEmptyMessageDelayed(3, 1000L);
        mSensorManager.registerListener(mSensorEventListener, mSensor, 1);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        mSensorEventListener.handleChanges();
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method isHeld is deprecated
     */

    public boolean isHeld() {
        this;
        JVM INSTR monitorenter ;
        boolean flag = mHeld;
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method release is deprecated
     */

    public boolean release() {
        boolean flag = true;
        this;
        JVM INSTR monitorenter ;
        Log.d("MiuiScreenOnProximityLock", "try to release");
        if(!mHeld) goto _L2; else goto _L1
_L1:
        Log.d("MiuiScreenOnProximityLock", "release");
        mHeld = false;
        mDownRecieved.clear();
        mSensorManager.unregisterListener(mSensorEventListener);
        mHandler.removeMessages(1);
        mHandler.removeMessages(4);
        mHandler.removeMessages(3);
        mHandler.sendEmptyMessage(2);
_L4:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        flag = false;
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    public boolean shouldBeBlocked(KeyEvent keyevent) {
        boolean flag = true;
        if(keyevent != null && mHeld) goto _L2; else goto _L1
_L1:
        flag = false;
_L4:
        return flag;
_L2:
        switch(keyevent.getKeyCode()) {
        default:
            int i = keyevent.getKeyCode();
            if(keyevent.getRepeatCount() == 0 && keyevent.getAction() == 0)
                mDownRecieved.put(i, Boolean.valueOf(flag));
            if(mDownRecieved.get(i) == null)
                flag = false;
            break;

        case 24: // '\030'
        case 25: // '\031'
            if(((AudioManager)mContext.getSystemService("audio")).isMusicActive())
                flag = false;
            break;

        case 79: // 'O'
        case 85: // 'U'
        case 86: // 'V'
        case 87: // 'W'
        case 126: // '~'
        case 127: // '\177'
            flag = false;
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private static final boolean DEBUG = true;
    private static final int EVENT_FAR_AWAY = 2;
    private static final int EVENT_NO_USER_ACTIVITY = 4;
    private static final int EVENT_RELEASE = 3;
    private static final int EVENT_TOO_CLOSE = 1;
    private static final int FIRST_CHANGE_TIMEOUT = 1000;
    private static final String LOG_TAG = "MiuiScreenOnProximityLock";
    private static final float PROXIMITY_THRESHOLD = 4F;
    private static final int RELEASE_DELAY = 300;
    private static int sValidChangeDelay;
    private Context mContext;
    private Dialog mDialog;
    private SparseArray mDownRecieved;
    private Handler mHandler;
    private boolean mHeld;
    private boolean mIsFirstChange;
    private KeyguardViewMediator mKeyguardMediator;
    private Sensor mSensor;
    private MySensorEventListener mSensorEventListener;
    private SensorManager mSensorManager;



/*
    static boolean access$102(MiuiScreenOnProximityLock miuiscreenonproximitylock, boolean flag) {
        miuiscreenonproximitylock.mIsFirstChange = flag;
        return flag;
    }

*/






/*
    static Dialog access$502(MiuiScreenOnProximityLock miuiscreenonproximitylock, Dialog dialog) {
        miuiscreenonproximitylock.mDialog = dialog;
        return dialog;
    }

*/


}
