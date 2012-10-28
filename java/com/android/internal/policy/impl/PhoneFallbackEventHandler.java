// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.KeyguardManager;
import android.app.SearchManager;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.IAudioService;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.util.Slog;
import android.view.*;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneWindowManager

public class PhoneFallbackEventHandler
    implements FallbackEventHandler {

    public PhoneFallbackEventHandler(Context context) {
        mContext = context;
    }

    private void handleMediaKeyEvent(KeyEvent keyevent) {
        IAudioService iaudioservice;
        iaudioservice = android.media.IAudioService.Stub.asInterface(ServiceManager.checkService("audio"));
        if(iaudioservice == null)
            break MISSING_BLOCK_LABEL_53;
        iaudioservice.dispatchMediaKeyEvent(keyevent);
_L1:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e(TAG, (new StringBuilder()).append("dispatchMediaKeyEvent threw exception ").append(remoteexception).toString());
          goto _L1
        Slog.w(TAG, "Unable to find IAudioService for media key event.");
          goto _L1
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent) {
        int i = keyevent.getAction();
        int j = keyevent.getKeyCode();
        boolean flag;
        if(i == 0)
            flag = onKeyDown(j, keyevent);
        else
            flag = onKeyUp(j, keyevent);
        return flag;
    }

    AudioManager getAudioManager() {
        if(mAudioManager == null)
            mAudioManager = (AudioManager)mContext.getSystemService("audio");
        return mAudioManager;
    }

    KeyguardManager getKeyguardManager() {
        if(mKeyguardManager == null)
            mKeyguardManager = (KeyguardManager)mContext.getSystemService("keyguard");
        return mKeyguardManager;
    }

    SearchManager getSearchManager() {
        if(mSearchManager == null)
            mSearchManager = (SearchManager)mContext.getSystemService("search");
        return mSearchManager;
    }

    TelephonyManager getTelephonyManager() {
        if(mTelephonyManager == null)
            mTelephonyManager = (TelephonyManager)mContext.getSystemService("phone");
        return mTelephonyManager;
    }

    void handleCameraKeyEvent() {
    }

    boolean onKeyDown(int i, KeyEvent keyevent) {
        boolean flag;
        android.view.KeyEvent.DispatcherState dispatcherstate;
        flag = true;
        dispatcherstate = mView.getKeyDispatcherState();
        i;
        JVM INSTR lookupswitch 17: default 160
    //                   5: 195
    //                   24: 164
    //                   25: 164
    //                   27: 302
    //                   79: 187
    //                   84: 403
    //                   85: 177
    //                   86: 187
    //                   87: 187
    //                   88: 187
    //                   89: 187
    //                   90: 187
    //                   91: 187
    //                   126: 177
    //                   127: 177
    //                   130: 187
    //                   164: 164;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L6 _L7 _L5 _L5 _L5 _L5 _L5 _L5 _L7 _L7 _L5 _L3
_L1:
        flag = false;
_L8:
        return flag;
_L3:
        getAudioManager().handleKeyDown(keyevent, 0x80000000);
          goto _L8
_L7:
        if(getTelephonyManager().getCallState() != 0) goto _L8; else goto _L5
_L5:
        handleMediaKeyEvent(keyevent);
          goto _L8
_L2:
        if(getKeyguardManager().inKeyguardRestrictedInputMode() || dispatcherstate == null)
            continue; /* Loop/switch isn't completed */
        if(keyevent.getRepeatCount() == 0)
            dispatcherstate.startTracking(keyevent, this);
        else
        if(keyevent.isLongPress() && dispatcherstate.isTracking(keyevent)) {
            dispatcherstate.performedLongPress(keyevent);
            mView.performHapticFeedback(0);
            Intent intent2 = new Intent("android.intent.action.VOICE_COMMAND");
            intent2.setFlags(0x10000000);
            try {
                sendCloseSystemWindows();
                mContext.startActivity(intent2);
            }
            catch(ActivityNotFoundException activitynotfoundexception1) {
                startCallActivity();
            }
        }
          goto _L8
_L4:
        if(getKeyguardManager().inKeyguardRestrictedInputMode() || dispatcherstate == null)
            continue; /* Loop/switch isn't completed */
        if(keyevent.getRepeatCount() == 0)
            dispatcherstate.startTracking(keyevent, this);
        else
        if(keyevent.isLongPress() && dispatcherstate.isTracking(keyevent)) {
            dispatcherstate.performedLongPress(keyevent);
            mView.performHapticFeedback(0);
            sendCloseSystemWindows();
            Intent intent1 = new Intent("android.intent.action.CAMERA_BUTTON", null);
            intent1.putExtra("android.intent.extra.KEY_EVENT", keyevent);
            mContext.sendOrderedBroadcast(intent1, null);
        }
          goto _L8
_L6:
        Intent intent;
        if(getKeyguardManager().inKeyguardRestrictedInputMode() || dispatcherstate == null)
            continue; /* Loop/switch isn't completed */
        if(keyevent.getRepeatCount() == 0) {
            dispatcherstate.startTracking(keyevent, this);
            continue; /* Loop/switch isn't completed */
        }
        if(!keyevent.isLongPress() || !dispatcherstate.isTracking(keyevent))
            continue; /* Loop/switch isn't completed */
        Configuration configuration = mContext.getResources().getConfiguration();
        if(configuration.keyboard != flag && configuration.hardKeyboardHidden != 2)
            continue; /* Loop/switch isn't completed */
        intent = new Intent("android.intent.action.SEARCH_LONG_PRESS");
        intent.setFlags(0x10000000);
        mView.performHapticFeedback(0);
        sendCloseSystemWindows();
        getSearchManager().stopSearch();
        mContext.startActivity(intent);
        dispatcherstate.performedLongPress(keyevent);
          goto _L8
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        if(true) goto _L1; else goto _L9
_L9:
    }

    boolean onKeyUp(int i, KeyEvent keyevent) {
        boolean flag;
        flag = true;
        android.view.KeyEvent.DispatcherState dispatcherstate = mView.getKeyDispatcherState();
        if(dispatcherstate != null)
            dispatcherstate.handleUpEvent(keyevent);
        i;
        JVM INSTR lookupswitch 16: default 160
    //                   5: 238
    //                   24: 164
    //                   25: 164
    //                   27: 207
    //                   79: 199
    //                   85: 199
    //                   86: 199
    //                   87: 199
    //                   88: 199
    //                   89: 199
    //                   90: 199
    //                   91: 199
    //                   126: 199
    //                   127: 199
    //                   130: 199
    //                   164: 164;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L5 _L5 _L5 _L5 _L5 _L5 _L5 _L5 _L5 _L5 _L3
_L1:
        flag = false;
_L6:
        return flag;
_L3:
        if(!keyevent.isCanceled() && (AudioManager)mContext.getSystemService("audio") != null)
            getAudioManager().handleKeyUp(keyevent, 0x80000000);
          goto _L6
_L5:
        handleMediaKeyEvent(keyevent);
          goto _L6
_L4:
        if(getKeyguardManager().inKeyguardRestrictedInputMode()) goto _L1; else goto _L7
_L7:
        if(keyevent.isTracking() && !keyevent.isCanceled())
            handleCameraKeyEvent();
          goto _L6
_L2:
        if(getKeyguardManager().inKeyguardRestrictedInputMode()) goto _L1; else goto _L8
_L8:
        if(keyevent.isTracking() && !keyevent.isCanceled())
            startCallActivity();
          goto _L6
    }

    public void preDispatchKeyEvent(KeyEvent keyevent) {
        getAudioManager().preDispatchKeyEvent(keyevent, 0x80000000);
    }

    void sendCloseSystemWindows() {
        PhoneWindowManager.sendCloseSystemWindows(mContext, null);
    }

    public void setView(View view) {
        mView = view;
    }

    void startCallActivity() {
        Intent intent;
        sendCloseSystemWindows();
        intent = new Intent("android.intent.action.CALL_BUTTON");
        intent.setFlags(0x10000000);
        mContext.startActivity(intent);
_L1:
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Slog.w(TAG, "No activity found for android.intent.action.CALL_BUTTON.");
          goto _L1
    }

    private static final boolean DEBUG;
    private static String TAG = "PhoneFallbackEventHandler";
    AudioManager mAudioManager;
    Context mContext;
    KeyguardManager mKeyguardManager;
    SearchManager mSearchManager;
    TelephonyManager mTelephonyManager;
    View mView;

}
