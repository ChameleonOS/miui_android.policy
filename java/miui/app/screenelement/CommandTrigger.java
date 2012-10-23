// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Iterator;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement:
//            ScreenElementLoadException, ActionCommand, ScreenContext, ScreenElementRoot

public class CommandTrigger {

    public CommandTrigger(ScreenContext screencontext, Element element, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Other;
        mCommands = new ArrayList();
        mContext = screencontext;
        mRoot = screenelementroot;
        load(element, screenelementroot);
    }

    private void load(Element element, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        if(element != null) {
            String s = element.getAttribute("target");
            String s1 = element.getAttribute("property");
            String s2 = element.getAttribute("value");
            if(!TextUtils.isEmpty(s1) && !TextUtils.isEmpty(s) && !TextUtils.isEmpty(s2))
                mPropertyCommand = ActionCommand.PropertyCommand.create(mContext, screenelementroot, (new StringBuilder()).append(s).append(".").append(s1).toString(), s2);
            String s3 = element.getAttribute("action");
            mActionString = s3;
            NodeList nodelist;
            if(!TextUtils.isEmpty(s3))
                if(s3.equalsIgnoreCase("down"))
                    mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Down;
                else
                if(s3.equalsIgnoreCase("up"))
                    mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Up;
                else
                if(s3.equalsIgnoreCase("double"))
                    mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Double;
                else
                if(s3.equalsIgnoreCase("long"))
                    mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Long;
                else
                    mAction = miui.app.screenelement.elements.ButtonScreenElement.ButtonAction.Other;
            nodelist = element.getChildNodes();
            for(int i = 0; i < nodelist.getLength(); i++)
                if(nodelist.item(i).getNodeType() == 1) {
                    Element element1 = (Element)nodelist.item(i);
                    ActionCommand actioncommand = ActionCommand.create(mContext, element1, screenelementroot);
                    if(actioncommand != null)
                        mCommands.add(actioncommand);
                }

        }
    }

    public void finish() {
        for(Iterator iterator = mCommands.iterator(); iterator.hasNext(); ((ActionCommand)iterator.next()).finish());
    }

    public miui.app.screenelement.elements.ButtonScreenElement.ButtonAction getAction() {
        return mAction;
    }

    public String getActionString() {
        return mActionString;
    }

    public void init() {
        for(Iterator iterator = mCommands.iterator(); iterator.hasNext(); ((ActionCommand)iterator.next()).init());
    }

    public void pause() {
        for(Iterator iterator = mCommands.iterator(); iterator.hasNext(); ((ActionCommand)iterator.next()).pause());
    }

    public void perform() {
        if(mPropertyCommand != null)
            mPropertyCommand.perform();
        for(Iterator iterator = mCommands.iterator(); iterator.hasNext(); ((ActionCommand)iterator.next()).perform());
    }

    public void resume() {
        for(Iterator iterator = mCommands.iterator(); iterator.hasNext(); ((ActionCommand)iterator.next()).resume());
    }

    public static final String TAG_NAME = "Trigger";
    private miui.app.screenelement.elements.ButtonScreenElement.ButtonAction mAction;
    private String mActionString;
    private ArrayList mCommands;
    private ScreenContext mContext;
    private ActionCommand.PropertyCommand mPropertyCommand;
    protected ScreenElementRoot mRoot;
}
