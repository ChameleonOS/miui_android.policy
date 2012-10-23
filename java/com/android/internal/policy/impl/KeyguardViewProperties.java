// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewCallback, KeyguardUpdateMonitor, KeyguardWindowController, KeyguardViewBase

public interface KeyguardViewProperties {

    public abstract KeyguardViewBase createKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardWindowController keyguardwindowcontroller);

    public abstract boolean isSecure();
}
