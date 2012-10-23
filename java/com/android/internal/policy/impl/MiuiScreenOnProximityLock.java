// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.hardware.*;
import android.os.*;
import android.view.View;
import android.view.Window;

public class MiuiScreenOnProximityLock {
    private class MySensorEventListener
        implements SensorEventListener {

        public void handleChanges() {
            if(!mIsTooClose) goto _L2; else goto _L1
_L1:
            mHandler.sendEmptyMessage(1);
            mHandler.removeMessages(2);
            mHandler.removeMessages(3);
_L4:
            return;
_L2:
            if(!mHandler.hasMessages(3)) {
                mHandler.sendEmptyMessageDelayed(2, 300L);
                mHandler.sendEmptyMessageDelayed(3, 300L);
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorevent) {
            boolean flag = false;
            float f = sensorevent.values[0];
            if((double)f >= 0.0D && f < 2.0F && f < mSensor.getMaximumRange())
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


    public MiuiScreenOnProximityLock(Context context) {
        mSensorEventListener = new MySensorEventListener();
        mContext = context;
        mSensorManager = (SensorManager)mContext.getSystemService("sensor");
        mSensor = mSensorManager.getDefaultSensor(8);
        prepareHintDialog();
        mHandler = new Handler(mContext.getMainLooper()) {

            public void handleMessage(Message message) {
                message.what;
                JVM INSTR tableswitch 1 3: default 32
            //                           1 33
            //                           2 46
            //                           3 59;
                   goto _L1 _L2 _L3 _L4
_L1:
                return;
_L2:
                mDialog.show();
                continue; /* Loop/switch isn't completed */
_L3:
                mDialog.hide();
                continue; /* Loop/switch isn't completed */
_L4:
                release();
                if(true) goto _L1; else goto _L5
_L5:
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
        mDialog.setContentView(View.inflate(mDialog.getContext(), 0x6030042, null), new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    /**
     * @deprecated Method aquire is deprecated
     */

    public void aquire() {
        this;
        JVM INSTR monitorenter ;
        if(mHeld) goto _L2; else goto _L1
_L1:
        mHeld = true;
        mHandler.sendEmptyMessageDelayed(3, 1000L);
        mSensorManager.registerListener(mSensorEventListener, mSensor, 3);
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
        if(!mHeld) goto _L2; else goto _L1
_L1:
        mHeld = false;
        mHandler.removeMessages(1);
        mHandler.removeMessages(3);
        mHandler.sendEmptyMessage(2);
        mSensorManager.unregisterListener(mSensorEventListener);
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

    private static final boolean DEBUG = false;
    private static final int EVENT_FAR_AWAY = 2;
    private static final int EVENT_RELEASE = 3;
    private static final int EVENT_TOO_CLOSE = 1;
    private static final int FAR_AWAR_DELAY = 300;
    private static final int FIRST_CHANGE_TIMEOUT = 1000;
    private static final String LOG_TAG = "MiuiDelayedProximitySensorLock";
    private static final float PROXIMITY_THRESHOLD = 2F;
    private static final int RELEASE_DELAY = 300;
    private Context mContext;
    private Dialog mDialog;
    private Handler mHandler;
    private boolean mHeld;
    private Sensor mSensor;
    private MySensorEventListener mSensorEventListener;
    private SensorManager mSensorManager;



}
