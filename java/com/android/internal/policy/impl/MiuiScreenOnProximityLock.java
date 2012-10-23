// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.Intent;
import android.hardware.*;
import android.os.*;

public class MiuiScreenOnProximityLock {
    private class MySensorEventListener
        implements SensorEventListener {

        public void handleChanges() {
            if(!mIsTooClose) goto _L2; else goto _L1
_L1:
            mHandler.sendEmptyMessage(1);
            mHandler.removeMessages(2);
_L4:
            return;
_L2:
            if(!mHandler.hasMessages(2))
                mHandler.sendEmptyMessageDelayed(2, 1000L);
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public void onSensorChanged(SensorEvent sensorevent) {
            boolean flag = false;
            float f = sensorevent.values[0];
            if((double)f >= 0.0D && f < 5F && f < mSensor.getMaximumRange())
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
        mPowerManager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        mHandler = new Handler(mContext.getMainLooper()) {

            public void handleMessage(Message message) {
                switch(message.what) {
                case 1: // '\001'
                    mPowerManager.goToSleepWithReason(SystemClock.uptimeMillis(), 4);
                    break;

                case 2: // '\002'
                    mPowerManager.userActivityWithForce(SystemClock.uptimeMillis(), false, true);
                    Intent intent = new Intent("miui.intent.action.RELEASE_PROXIMITY_SENSOR");
                    intent.putExtra("miui.intent.extra.DISABLE_PROXIMITY_SENSOR", true);
                    mContext.sendBroadcast(intent);
                    break;
                }
_L2:
                return;
                RemoteException remoteexception;
                remoteexception;
                if(true) goto _L2; else goto _L1
_L1:
            }

            final MiuiScreenOnProximityLock this$0;

             {
                this$0 = MiuiScreenOnProximityLock.this;
                super(looper);
            }
        };
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
        mSensorEventListener.mIsTooClose = false;
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

    public void release() {
        this;
        JVM INSTR monitorenter ;
        mHandler.removeMessages(1);
        mHandler.removeMessages(2);
        if(mHeld) {
            mHeld = false;
            mSensorManager.unregisterListener(mSensorEventListener);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private static final boolean DEBUG = false;
    private static final int EVENT_FAR_AWAY = 2;
    private static final int EVENT_TOO_CLOSE = 1;
    private static final String LOG_TAG = "MiuiDelayedProximitySensorLock";
    private static final float PROXIMITY_THRESHOLD = 5F;
    private static final int RELEASE_FAR_AWAR_DELAY = 1000;
    private Context mContext;
    private Handler mHandler;
    private boolean mHeld;
    private IPowerManager mPowerManager;
    private Sensor mSensor;
    private MySensorEventListener mSensorEventListener;
    private SensorManager mSensorManager;




}
