// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import miui.app.screenelement.ScreenContext;

// Referenced classes of package miui.app.screenelement.data:
//            VariableUpdaterManager

public class VariableUpdater {

    public VariableUpdater(VariableUpdaterManager variableupdatermanager) {
        mVariableUpdaterManager = variableupdatermanager;
    }

    public void finish() {
    }

    protected ScreenContext getContext() {
        return mVariableUpdaterManager.getContext();
    }

    public void init() {
    }

    public void pause() {
    }

    public void resume() {
    }

    public void tick(long l) {
    }

    private VariableUpdaterManager mVariableUpdaterManager;
}
