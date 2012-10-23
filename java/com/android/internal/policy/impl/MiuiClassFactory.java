// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.os.LocalPowerManager;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl:
//            MiuiLockPatternKeyguardView, MiuiKeyguardViewMediator, MiuiLockPatternKeyguardViewProperties, MiuiPhoneFallbackEventHandler, 
//            MiuiPhoneWindowManager, KeyguardViewCallback, KeyguardUpdateMonitor, KeyguardWindowController, 
//            KeyguardViewBase, PhoneWindowManager, KeyguardViewMediator, KeyguardViewProperties, 
//            PhoneFallbackEventHandler

public class MiuiClassFactory {

    public MiuiClassFactory() {
    }

    public static KeyguardViewBase createKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardWindowController keyguardwindowcontroller) {
        return new MiuiLockPatternKeyguardView(context, keyguardviewcallback, keyguardupdatemonitor, lockpatternutils, keyguardwindowcontroller);
    }

    public static KeyguardViewMediator createKeyguardViewMediator(Context context, PhoneWindowManager phonewindowmanager, LocalPowerManager localpowermanager) {
        return new MiuiKeyguardViewMediator(context, phonewindowmanager, localpowermanager);
    }

    public static KeyguardViewProperties createKeyguardViewProperties(LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor) {
        return new MiuiLockPatternKeyguardViewProperties(lockpatternutils, keyguardupdatemonitor);
    }

    public static PhoneFallbackEventHandler createPhoneFallbackEventHandler(Context context) {
        return new MiuiPhoneFallbackEventHandler(context);
    }

    public static PhoneWindowManager createPhoneWindowManager() {
        return new MiuiPhoneWindowManager();
    }
}
