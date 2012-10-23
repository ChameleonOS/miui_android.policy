// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;


public interface VariableBinder {

    public abstract void finish();

    public abstract CharSequence getName();

    public abstract void init();

    public abstract void pause();

    public abstract void refresh();

    public abstract void resume();
}
