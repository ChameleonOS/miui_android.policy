// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.Context;
import android.content.Intent;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.util.IndexedNumberVariable;

// Referenced classes of package miui.app.screenelement.data:
//            NotifierVariableUpdater, VariableUpdaterManager

public class BatteryVariableUpdater extends NotifierVariableUpdater {

    public BatteryVariableUpdater(VariableUpdaterManager variableupdatermanager) {
        super(variableupdatermanager, miui.app.screenelement.NotifierManager.NotifierType.Battery);
        mBatteryLevel = new IndexedNumberVariable("battery_level", getContext().mVariables);
    }

    public void onNotify(Context context, Intent intent, Object obj) {
        if(intent.getAction().equals("android.intent.action.BATTERY_CHANGED")) {
            int i = intent.getIntExtra("level", -1);
            if(i != -1) {
                IndexedNumberVariable indexednumbervariable = mBatteryLevel;
                double d;
                if(i >= 100)
                    d = 100D;
                else
                    d = i;
                indexednumbervariable.set(d);
                getContext().requestUpdate();
            }
        }
    }

    private IndexedNumberVariable mBatteryLevel;
}
