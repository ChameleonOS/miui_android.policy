// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl;

import android.content.Intent;

public interface KeyguardScreenCallback
    extends com.android.internal.policy.impl.KeyguardScreenCallback {

    public abstract void setPendingIntent(Intent intent);
}
