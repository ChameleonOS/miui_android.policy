// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.os.Handler;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardUpdateMonitor

public class MiuiKeyguardUpdateMonitor extends KeyguardUpdateMonitor {

    public MiuiKeyguardUpdateMonitor(Context context) {
        super(context);
        mContext = context;
        mLowBatteryThresholdObserver = new ContentObserver(null) {

            public void onChange(boolean flag) {
                super.onChange(flag);
                mLowBatteryThreshold = mContext.getResources().getInteger(0x6080002);
                mLowBatteryThreshold = android.provider.Settings.System.getInt(mContext.getContentResolver(), "battery_level_low_customized", mLowBatteryThreshold);
            }

            final MiuiKeyguardUpdateMonitor this$0;

             {
                this$0 = MiuiKeyguardUpdateMonitor.this;
                super(handler);
            }
        };
        mLowBatteryThresholdObserver.onChange(true);
        mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("battery_level_low_customized"), false, mLowBatteryThresholdObserver);
    }

    protected void finalize() throws Throwable {
        mContext.getContentResolver().unregisterContentObserver(mLowBatteryThresholdObserver);
        super.finalize();
    }

    private Context mContext;
    private int mLowBatteryThreshold;
    private ContentObserver mLowBatteryThresholdObserver;



/*
    static int access$002(MiuiKeyguardUpdateMonitor miuikeyguardupdatemonitor, int i) {
        miuikeyguardupdatemonitor.mLowBatteryThreshold = i;
        return i;
    }

*/

}
