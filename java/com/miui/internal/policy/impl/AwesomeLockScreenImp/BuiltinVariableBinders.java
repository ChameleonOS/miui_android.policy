// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import miui.app.screenelement.data.VariableBinderManager;

public class BuiltinVariableBinders {

    public BuiltinVariableBinders() {
    }

    public static void fill(VariableBinderManager variablebindermanager) {
        fillMissedCall(variablebindermanager);
        fillUnreadSms(variablebindermanager);
    }

    private static void fillMissedCall(VariableBinderManager variablebindermanager) {
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "number";
        variablebindermanager.addContentProviderBinder("content://call_log/calls").setColumns(as).setWhere("type=3 AND new=1").setCountName("call_missed_count");
    }

    private static void fillUnreadSms(VariableBinderManager variablebindermanager) {
        String as[] = new String[1];
        as[0] = "_id";
        variablebindermanager.addContentProviderBinder("content://sms/inbox").setColumns(as).setWhere("seen=0 AND read=0").setCountName("sms_unread_count");
    }
}
