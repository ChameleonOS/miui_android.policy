// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;

// Referenced classes of package miui.app.screenelement.data:
//            VariableUpdater

public class VariableUpdaterManager {

    public VariableUpdaterManager(ScreenContext screencontext) {
        mUpdaters = new ArrayList();
        mContext = screencontext;
    }

    public void add(VariableUpdater variableupdater) {
        mUpdaters.add(variableupdater);
    }

    public void finish() {
        for(Iterator iterator = mUpdaters.iterator(); iterator.hasNext(); ((VariableUpdater)iterator.next()).finish());
    }

    public ScreenContext getContext() {
        return mContext;
    }

    public void init() {
        for(Iterator iterator = mUpdaters.iterator(); iterator.hasNext(); ((VariableUpdater)iterator.next()).init());
    }

    public void pause() {
        for(Iterator iterator = mUpdaters.iterator(); iterator.hasNext(); ((VariableUpdater)iterator.next()).pause());
    }

    public void remove(VariableUpdater variableupdater) {
        mUpdaters.remove(variableupdater);
    }

    public void resume() {
        for(Iterator iterator = mUpdaters.iterator(); iterator.hasNext(); ((VariableUpdater)iterator.next()).resume());
    }

    public void tick(long l) {
        for(Iterator iterator = mUpdaters.iterator(); iterator.hasNext(); ((VariableUpdater)iterator.next()).tick(l));
    }

    private ScreenContext mContext;
    private ArrayList mUpdaters;
}
