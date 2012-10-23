// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import miui.app.screenelement.data.Variables;

public class IndexedNumberVariable {

    public IndexedNumberVariable(String s, String s1, Variables variables) {
        mIndex = -1;
        mIndex = variables.registerNumberVariable(s, s1);
        mVars = variables;
    }

    public IndexedNumberVariable(String s, Variables variables) {
        this(null, s, variables);
    }

    public Double get() {
        return mVars.getNum(mIndex);
    }

    public void set(double d) {
        set(Double.valueOf(d));
    }

    public void set(Double double1) {
        mVars.putNum(mIndex, double1);
    }

    private int mIndex;
    private Variables mVars;
}
