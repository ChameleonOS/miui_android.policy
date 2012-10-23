// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.text.TextUtils;
import android.util.Log;

public class Variable {

    public Variable(String s) {
        int i = s.indexOf('.');
        if(i == -1) {
            mObjectName = null;
            mPropertyName = s;
        } else {
            mObjectName = s.substring(0, i);
            mPropertyName = s.substring(i + 1);
        }
        if(TextUtils.isEmpty(mPropertyName))
            Log.e("Variable", (new StringBuilder()).append("invalid variable name:").append(s).toString());
    }

    public String getObjName() {
        return mObjectName;
    }

    public String getPropertyName() {
        return mPropertyName;
    }

    private String mObjectName;
    private String mPropertyName;
}
