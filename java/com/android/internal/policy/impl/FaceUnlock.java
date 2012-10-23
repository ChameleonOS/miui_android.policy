// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.*;
import android.os.*;
import android.util.Log;
import android.view.View;
import com.android.internal.policy.IFaceLockCallback;
import com.android.internal.policy.IFaceLockInterface;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl:
//            BiometricSensorUnlock, KeyguardScreenCallback, KeyguardUpdateMonitor

public class FaceUnlock
    implements BiometricSensorUnlock, android.os.Handler.Callback {

    public FaceUnlock(Context context, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardScreenCallback keyguardscreencallback) {
        mServiceRunning = false;
        mBoundToService = false;
        mIsRunning = false;
        mConnection = new ServiceConnection() {

            public void onServiceConnected(ComponentName componentname, IBinder ibinder) {
                Log.d("FULLockscreen", "Connected to Face Unlock service");
                mService = com.android.internal.policy.IFaceLockInterface.Stub.asInterface(ibinder);
                mHandler.sendEmptyMessage(2);
            }

            public void onServiceDisconnected(ComponentName componentname) {
                Log.e("FULLockscreen", "Unexpected disconnect from Face Unlock service");
                mHandler.sendEmptyMessage(3);
            }

            final FaceUnlock this$0;

             {
                this$0 = FaceUnlock.this;
                super();
            }
        };
        mContext = context;
        mUpdateMonitor = keyguardupdatemonitor;
        mLockPatternUtils = lockpatternutils;
        mKeyguardScreenCallback = keyguardscreencallback;
        mHandler = new Handler(this);
    }

    private void removeDisplayMessages() {
        mHandler.removeMessages(0);
        mHandler.removeMessages(1);
    }

    private void startUi(IBinder ibinder, int i, int j, int k, int l) {
        Object obj = mServiceRunningLock;
        obj;
        JVM INSTR monitorenter ;
        if(mServiceRunning) goto _L2; else goto _L1
_L1:
        Log.d("FULLockscreen", "Starting Face Unlock");
        try {
            mService.startUi(ibinder, i, j, k, l, mLockPatternUtils.isBiometricWeakLivelinessEnabled());
        }
        catch(RemoteException remoteexception) {
            Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception starting Face Unlock: ").append(remoteexception.toString()).toString());
            break; /* Loop/switch isn't completed */
        }
        mServiceRunning = true;
_L4:
        obj;
        JVM INSTR monitorexit ;
        break; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        throw exception;
_L2:
        Log.w("FULLockscreen", "startUi() attempted while running");
        if(true) goto _L4; else goto _L3
_L3:
    }

    private void stopUi() {
        Object obj = mServiceRunningLock;
        obj;
        JVM INSTR monitorenter ;
        if(!mServiceRunning)
            break MISSING_BLOCK_LABEL_36;
        Log.d("FULLockscreen", "Stopping Face Unlock");
        try {
            mService.stopUi();
        }
        catch(RemoteException remoteexception) {
            Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception stopping Face Unlock: ").append(remoteexception.toString()).toString());
        }
        mServiceRunning = false;
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void cleanUp() {
        if(mService != null) {
            try {
                mService.unregisterCallback(mFaceUnlockCallback);
            }
            catch(RemoteException remoteexception) { }
            stopUi();
            mService = null;
        }
    }

    public int getQuality() {
        return 32768;
    }

    void handleCancel() {
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(4);
        else
            Log.e("FULLockscreen", "mFaceUnlockView is null in handleCancel()");
        stop();
        mKeyguardScreenCallback.pokeWakelock(5000);
    }

    void handleExposeFallback() {
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(4);
        else
            Log.e("FULLockscreen", "mFaceUnlockView is null in handleExposeFallback()");
    }

    void handleHideFaceUnlockView() {
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(4);
        else
            Log.e("FULLockscreen", "mFaceUnlockView is null in handleHideFaceUnlockView()");
    }

    public boolean handleMessage(Message message) {
        message.what;
        JVM INSTR tableswitch 0 8: default 56
    //                   0 68
    //                   1 77
    //                   2 84
    //                   3 91
    //                   4 98
    //                   5 105
    //                   6 112
    //                   7 119
    //                   8 126;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10
_L10:
        break MISSING_BLOCK_LABEL_126;
_L1:
        boolean flag;
        Log.e("FULLockscreen", "Unhandled message");
        flag = false;
_L11:
        return flag;
_L2:
        handleShowFaceUnlockView();
_L12:
        flag = true;
        if(true) goto _L11; else goto _L3
_L3:
        handleHideFaceUnlockView();
          goto _L12
_L4:
        handleServiceConnected();
          goto _L12
_L5:
        handleServiceDisconnected();
          goto _L12
_L6:
        handleUnlock();
          goto _L12
_L7:
        handleCancel();
          goto _L12
_L8:
        handleReportFailedAttempt();
          goto _L12
_L9:
        handleExposeFallback();
          goto _L12
        handlePokeWakelock(message.arg1);
          goto _L12
    }

    void handlePokeWakelock(int i) {
        mKeyguardScreenCallback.pokeWakelock(i);
    }

    void handleReportFailedAttempt() {
        mUpdateMonitor.reportFailedBiometricUnlockAttempt();
    }

    void handleServiceConnected() {
        Log.d("FULLockscreen", "handleServiceConnected()");
        if(mBoundToService) goto _L2; else goto _L1
_L1:
        Log.d("FULLockscreen", "Dropping startUi() in handleServiceConnected() because no longer bound");
_L4:
        return;
_L2:
        mService.registerCallback(mFaceUnlockCallback);
        if(mFaceUnlockView != null) {
            IBinder ibinder = mFaceUnlockView.getWindowToken();
            RemoteException remoteexception;
            if(ibinder != null) {
                mKeyguardScreenCallback.pokeWakelock();
                int ai[] = new int[2];
                mFaceUnlockView.getLocationInWindow(ai);
                startUi(ibinder, ai[0], ai[1], mFaceUnlockView.getWidth(), mFaceUnlockView.getHeight());
            } else {
                Log.e("FULLockscreen", "windowToken is null in handleServiceConnected()");
            }
        }
        continue; /* Loop/switch isn't completed */
        remoteexception;
        Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception connecting to Face Unlock: ").append(remoteexception.toString()).toString());
        mService = null;
        mBoundToService = false;
        mIsRunning = false;
        if(true) goto _L4; else goto _L3
_L3:
    }

    void handleServiceDisconnected() {
        Log.e("FULLockscreen", "handleServiceDisconnected()");
        synchronized(mServiceRunningLock) {
            mService = null;
            mServiceRunning = false;
        }
        mBoundToService = false;
        mIsRunning = false;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void handleShowFaceUnlockView() {
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(0);
        else
            Log.e("FULLockscreen", "mFaceUnlockView is null in handleShowFaceUnlockView()");
    }

    void handleUnlock() {
        removeDisplayMessages();
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(0);
        else
            Log.e("FULLockscreen", "mFaceUnlockView is null in handleUnlock()");
        stop();
        mKeyguardScreenCallback.keyguardDone(true);
        mKeyguardScreenCallback.reportSuccessfulUnlockAttempt();
    }

    public void hide() {
        removeDisplayMessages();
        mHandler.sendEmptyMessage(1);
    }

    public void initializeView(View view) {
        Log.d("FULLockscreen", "initializeView()");
        mFaceUnlockView = view;
    }

    public boolean isRunning() {
        return mIsRunning;
    }

    public void show(long l) {
        if(mHandler.getLooper() != Looper.myLooper())
            Log.e("FULLockscreen", "show() called off of the UI thread");
        removeDisplayMessages();
        if(mFaceUnlockView != null)
            mFaceUnlockView.setVisibility(0);
        if(l > 0L)
            mHandler.sendEmptyMessageDelayed(1, l);
    }

    public boolean start() {
        if(mHandler.getLooper() != Looper.myLooper())
            Log.e("FULLockscreen", "start() called off of the UI thread");
        if(mIsRunning)
            Log.w("FULLockscreen", "start() called when already running");
        show(3000L);
        if(!mBoundToService) {
            Log.d("FULLockscreen", "Binding to Face Unlock service");
            mContext.bindService(new Intent(com/android/internal/policy/IFaceLockInterface.getName()), mConnection, 1, mLockPatternUtils.getCurrentUser());
            mBoundToService = true;
        } else {
            Log.w("FULLockscreen", "Attempt to bind to Face Unlock when already bound");
        }
        mIsRunning = true;
        return true;
    }

    public boolean stop() {
        if(mHandler.getLooper() != Looper.myLooper())
            Log.e("FULLockscreen", "stop() called off of the UI thread");
        boolean flag = mIsRunning;
        stopUi();
        if(mBoundToService) {
            if(mService != null)
                try {
                    mService.unregisterCallback(mFaceUnlockCallback);
                }
                catch(RemoteException remoteexception) { }
            Log.d("FULLockscreen", "Unbinding from Face Unlock service");
            mContext.unbindService(mConnection);
            mBoundToService = false;
        }
        mIsRunning = false;
        return flag;
    }

    private static final boolean DEBUG = false;
    private static final String TAG = "FULLockscreen";
    private final int BACKUP_LOCK_TIMEOUT = 5000;
    private final int MSG_CANCEL = 5;
    private final int MSG_EXPOSE_FALLBACK = 7;
    private final int MSG_HIDE_FACE_UNLOCK_VIEW = 1;
    private final int MSG_POKE_WAKELOCK = 8;
    private final int MSG_REPORT_FAILED_ATTEMPT = 6;
    private final int MSG_SERVICE_CONNECTED = 2;
    private final int MSG_SERVICE_DISCONNECTED = 3;
    private final int MSG_SHOW_FACE_UNLOCK_VIEW = 0;
    private final int MSG_UNLOCK = 4;
    private final int SERVICE_STARTUP_VIEW_TIMEOUT = 3000;
    private boolean mBoundToService;
    private ServiceConnection mConnection;
    private final Context mContext;
    private final IFaceLockCallback mFaceUnlockCallback = new com.android.internal.policy.IFaceLockCallback.Stub() {

        public void cancel() {
            mHandler.sendEmptyMessage(5);
        }

        public void exposeFallback() {
            mHandler.sendEmptyMessage(7);
        }

        public void pokeWakelock(int i) {
            Message message = mHandler.obtainMessage(8, i, -1);
            mHandler.sendMessage(message);
        }

        public void reportFailedAttempt() {
            mHandler.sendEmptyMessage(6);
        }

        public void unlock() {
            mHandler.sendEmptyMessage(4);
        }

        final FaceUnlock this$0;

             {
                this$0 = FaceUnlock.this;
                super();
            }
    };
    private View mFaceUnlockView;
    private Handler mHandler;
    private volatile boolean mIsRunning;
    KeyguardScreenCallback mKeyguardScreenCallback;
    private final LockPatternUtils mLockPatternUtils;
    private IFaceLockInterface mService;
    private boolean mServiceRunning;
    private final Object mServiceRunningLock = new Object();
    private final KeyguardUpdateMonitor mUpdateMonitor;


/*
    static IFaceLockInterface access$002(FaceUnlock faceunlock, IFaceLockInterface ifacelockinterface) {
        faceunlock.mService = ifacelockinterface;
        return ifacelockinterface;
    }

*/

}
