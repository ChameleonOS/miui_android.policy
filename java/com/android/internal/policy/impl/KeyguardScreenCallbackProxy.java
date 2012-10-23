// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.res.Configuration;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreenCallback

public class KeyguardScreenCallbackProxy
    implements KeyguardScreenCallback {

    public KeyguardScreenCallbackProxy(KeyguardScreenCallback keyguardscreencallback) {
        mClient = keyguardscreencallback;
    }

    public boolean doesFallbackUnlockScreenExist() {
        return mClient.doesFallbackUnlockScreenExist();
    }

    public void forgotPattern(boolean flag) {
        mClient.forgotPattern(flag);
    }

    public void goToLockScreen() {
        mClient.goToLockScreen();
    }

    public void goToUnlockScreen() {
        mClient.goToUnlockScreen();
    }

    public boolean isSecure() {
        return mClient.isSecure();
    }

    public boolean isVerifyUnlockOnly() {
        return mClient.isVerifyUnlockOnly();
    }

    public void keyguardDone(boolean flag) {
        mClient.keyguardDone(flag);
    }

    public void keyguardDoneDrawing() {
        mClient.keyguardDoneDrawing();
    }

    public void pokeWakelock() {
        mClient.pokeWakelock();
    }

    public void pokeWakelock(int i) {
        mClient.pokeWakelock(i);
    }

    public void recreateMe(Configuration configuration) {
        mClient.recreateMe(configuration);
    }

    public void reportFailedUnlockAttempt() {
        mClient.reportFailedUnlockAttempt();
    }

    public void reportSuccessfulUnlockAttempt() {
        mClient.reportSuccessfulUnlockAttempt();
    }

    public void takeEmergencyCallAction() {
        mClient.takeEmergencyCallAction();
    }

    private KeyguardScreenCallback mClient;
}
