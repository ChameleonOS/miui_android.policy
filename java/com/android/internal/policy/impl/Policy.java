// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.util.Log;
import android.view.*;
import com.android.internal.policy.IPolicy;

// Referenced classes of package com.android.internal.policy.impl:
//            MiuiClassFactory, PhoneLayoutInflater, PhoneWindow

public class Policy
    implements IPolicy {

    public Policy() {
    }

    public FallbackEventHandler makeNewFallbackEventHandler(Context context) {
        return MiuiClassFactory.createPhoneFallbackEventHandler(context);
    }

    public LayoutInflater makeNewLayoutInflater(Context context) {
        return new PhoneLayoutInflater(context);
    }

    public Window makeNewWindow(Context context) {
        return new PhoneWindow(context);
    }

    public WindowManagerPolicy makeNewWindowManager() {
        return MiuiClassFactory.createPhoneWindowManager();
    }

    private static final String TAG = "PhonePolicy";
    private static final String preload_classes[];

    static  {
        String as[] = new String[7];
        as[0] = "com.android.internal.policy.impl.PhoneLayoutInflater";
        as[1] = "com.android.internal.policy.impl.PhoneWindow";
        as[2] = "com.android.internal.policy.impl.PhoneWindow$1";
        as[3] = "com.android.internal.policy.impl.PhoneWindow$ContextMenuCallback";
        as[4] = "com.android.internal.policy.impl.PhoneWindow$DecorView";
        as[5] = "com.android.internal.policy.impl.PhoneWindow$PanelFeatureState";
        as[6] = "com.android.internal.policy.impl.PhoneWindow$PanelFeatureState$SavedState";
        preload_classes = as;
        String as1[] = preload_classes;
        int i = as1.length;
        int j = 0;
        while(j < i)  {
            String s = as1[j];
            try {
                Class.forName(s);
            }
            catch(ClassNotFoundException classnotfoundexception) {
                Log.e("PhonePolicy", (new StringBuilder()).append("Could not preload class for phone policy: ").append(s).toString());
            }
            j++;
        }
    }
}
