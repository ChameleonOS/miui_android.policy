// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;


public interface KeyguardViewCallback {

    public abstract void keyguardDone(boolean flag);

    public abstract void keyguardDoneDrawing();

    public abstract void pokeWakelock();

    public abstract void pokeWakelock(int i);
}
