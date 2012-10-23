// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement:
//            ScreenElementLoadException, CommandTrigger, ScreenContext, ScreenElementRoot

public class ExternalCommandManager {

    public ExternalCommandManager(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        mTriggers = new ArrayList();
        mContext = screencontext;
        if(element != null)
            load(element, screenelementroot);
    }

    private void load(Element element, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("ExternalCommandManager", "node is null");
            throw new ScreenElementLoadException("node is null");
        }
        NodeList nodelist = element.getChildNodes();
        int i = 0;
        while(i < nodelist.getLength())  {
            if(nodelist.item(i).getNodeType() == 1) {
                Element element1 = (Element)nodelist.item(i);
                if(element1.getNodeName().equals("Trigger"))
                    mTriggers.add(new CommandTrigger(mContext, element1, screenelementroot));
            }
            i++;
        }
    }

    public void finish() {
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).finish());
    }

    public void init() {
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).init());
    }

    public void onCommand(String s) {
        Iterator iterator = mTriggers.iterator();
        do {
            if(!iterator.hasNext())
                break;
            CommandTrigger commandtrigger = (CommandTrigger)iterator.next();
            if(!commandtrigger.getActionString().equals(s))
                continue;
            commandtrigger.perform();
            break;
        } while(true);
    }

    public void pause() {
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).pause());
    }

    public void resume() {
        for(Iterator iterator = mTriggers.iterator(); iterator.hasNext(); ((CommandTrigger)iterator.next()).resume());
    }

    private static final String LOG_TAG = "ExternalCommandManager";
    public static final String TAG_NAME = "ExternalCommands";
    private ScreenContext mContext;
    private ArrayList mTriggers;
}
