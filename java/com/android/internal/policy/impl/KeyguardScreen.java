// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;


public interface KeyguardScreen {

    public abstract void cleanUp();

    public abstract boolean needsInput();

    public abstract void onPause();

    public abstract void onResume();
}
