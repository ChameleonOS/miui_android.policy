// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;

public class PhoneLayoutInflater extends LayoutInflater {

    public PhoneLayoutInflater(Context context) {
        super(context);
    }

    protected PhoneLayoutInflater(LayoutInflater layoutinflater, Context context) {
        super(layoutinflater, context);
    }

    public LayoutInflater cloneInContext(Context context) {
        return new PhoneLayoutInflater(this, context);
    }

    protected View onCreateView(String s, AttributeSet attributeset) throws ClassNotFoundException {
        String as[];
        int i;
        int j;
        as = sClassPrefixList;
        i = as.length;
        j = 0;
_L3:
        if(j >= i) goto _L2; else goto _L1
_L1:
        String s1 = as[j];
        View view1 = createView(s, s1, attributeset);
        View view;
        view = view1;
        if(view == null)
            continue; /* Loop/switch isn't completed */
_L4:
        return view;
        ClassNotFoundException classnotfoundexception;
        classnotfoundexception;
        j++;
          goto _L3
_L2:
        view = super.onCreateView(s, attributeset);
          goto _L4
    }

    private static final String sClassPrefixList[];

    static  {
        String as[] = new String[2];
        as[0] = "android.widget.";
        as[1] = "android.webkit.";
        sClassPrefixList = as;
    }
}
