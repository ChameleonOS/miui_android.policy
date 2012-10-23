// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.view.View;

interface BiometricSensorUnlock {

    public abstract void cleanUp();

    public abstract int getQuality();

    public abstract void hide();

    public abstract void initializeView(View view);

    public abstract boolean isRunning();

    public abstract void show(long l);

    public abstract boolean start();

    public abstract boolean stop();
}
