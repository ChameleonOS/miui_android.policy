// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.res.Configuration;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewCallback

public interface KeyguardScreenCallback
    extends KeyguardViewCallback {

    public abstract boolean doesFallbackUnlockScreenExist();

    public abstract void forgotPattern(boolean flag);

    public abstract void goToLockScreen();

    public abstract void goToUnlockScreen();

    public abstract boolean isSecure();

    public abstract boolean isVerifyUnlockOnly();

    public abstract void recreateMe(Configuration configuration);

    public abstract void reportFailedUnlockAttempt();

    public abstract void reportSuccessfulUnlockAttempt();

    public abstract void takeEmergencyCallAction();
}
