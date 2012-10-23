// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.Context;
import android.content.Intent;
import miui.app.screenelement.NotifierManager;
import miui.app.screenelement.ScreenContext;

// Referenced classes of package miui.app.screenelement.data:
//            VariableUpdater, VariableUpdaterManager

public abstract class NotifierVariableUpdater extends VariableUpdater
    implements miui.app.screenelement.NotifierManager.OnNotifyListener {

    public NotifierVariableUpdater(VariableUpdaterManager variableupdatermanager, miui.app.screenelement.NotifierManager.NotifierType notifiertype) {
        super(variableupdatermanager);
        mType = notifiertype;
        mNotifierManager = NotifierManager.getInstance(variableupdatermanager.getContext().getRawContext());
    }

    public void finish() {
        mNotifierManager.releaseNotifier(mType, this);
    }

    public void init() {
        mNotifierManager.acquireNotifier(mType, this);
    }

    public abstract void onNotify(Context context, Intent intent, Object obj);

    public void pause() {
        mNotifierManager.pause(mType, this);
    }

    public void resume() {
        mNotifierManager.resume(mType, this);
    }

    protected NotifierManager mNotifierManager;
    private miui.app.screenelement.NotifierManager.NotifierType mType;
}
