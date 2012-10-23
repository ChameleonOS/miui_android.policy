// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import miui.app.screenelement.data.Variables;

public class IndexedStringVariable {

    public IndexedStringVariable(String s, String s1, Variables variables) {
        mIndex = -1;
        mIndex = variables.registerStringVariable(s, s1);
        mVars = variables;
    }

    public IndexedStringVariable(String s, Variables variables) {
        this(null, s, variables);
    }

    public String get() {
        return mVars.getStr(mIndex);
    }

    public void set(String s) {
        mVars.putStr(mIndex, s);
    }

    private int mIndex;
    private Variables mVars;
}
