// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.StatusBarManager;
import android.content.Context;
import android.os.LocalPowerManager;
import miui.app.ExtraStatusBarManager;
import miui.net.FirewallManager;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardViewMediator, PhoneWindowManager

public class MiuiKeyguardViewMediator extends KeyguardViewMediator {

    public MiuiKeyguardViewMediator(Context context, PhoneWindowManager phonewindowmanager, LocalPowerManager localpowermanager) {
        super(context, phonewindowmanager, localpowermanager);
    }

    void adjustStatusBarLocked() {
        super.adjustStatusBarLocked();
        if(super.mStatusBarManager != null) {
            int i = 0;
            if(isShowing()) {
                int j = 0 | 0x1000000;
                int k;
                if(isShowingAndNotHidden())
                    k = 0x80000000;
                else
                    k = 0;
                i = j | k;
                if(isSecure() || !ExtraStatusBarManager.isExpandableUnderKeyguard(super.mContext))
                    i |= 0x90000;
            }
            super.mStatusBarManager.disable(i);
        }
    }

    public void onScreenTurnedOff(int i) {
        this;
        JVM INSTR monitorenter ;
        notifyScreenOffLocked();
        FirewallManager.getInstance().removeAccessControlPass("*");
        this;
        JVM INSTR monitorexit ;
        super.onScreenTurnedOff(i);
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }
}
