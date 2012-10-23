// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewProperties, KeyguardUpdateMonitor, MiuiLockPatternKeyguardView, KeyguardViewCallback, 
//            KeyguardWindowController, KeyguardViewBase

public class MiuiLockPatternKeyguardViewProperties
    implements KeyguardViewProperties {

    public MiuiLockPatternKeyguardViewProperties(LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor) {
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
    }

    private boolean isSimPinSecure() {
        com.android.internal.telephony.IccCard.State state = mUpdateMonitor.getSimState();
        boolean flag;
        if(state == com.android.internal.telephony.IccCard.State.PIN_REQUIRED || state == com.android.internal.telephony.IccCard.State.PUK_REQUIRED || state == com.android.internal.telephony.IccCard.State.PERM_DISABLED)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public KeyguardViewBase createKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardWindowController keyguardwindowcontroller) {
        return new MiuiLockPatternKeyguardView(context, keyguardviewcallback, keyguardupdatemonitor, mLockPatternUtils, keyguardwindowcontroller);
    }

    public boolean isSecure() {
        boolean flag;
        if(mLockPatternUtils.isSecure() || isSimPinSecure())
            flag = true;
        else
            flag = false;
        return flag;
    }

    private final LockPatternUtils mLockPatternUtils;
    private final KeyguardUpdateMonitor mUpdateMonitor;
}
