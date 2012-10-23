// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.TextFormatter;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement.data:
//            ContentProviderBinder, WebServiceBinder, VariableBinder

public class VariableBinderManager
    implements ContentProviderBinder.QueryCompleteListener {

    public VariableBinderManager(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        mVariableBinders = new ArrayList();
        mContext = screencontext;
        if(element != null)
            load(element);
    }

    private static VariableBinder createBinder(Element element, ScreenContext screencontext, VariableBinderManager variablebindermanager) {
        Object obj;
label0:
        {
            String s = element.getTagName();
            try {
                if(s.equalsIgnoreCase("ContentProviderBinder")) {
                    obj = new ContentProviderBinder(element, screencontext, variablebindermanager);
                    break label0;
                }
                if(s.equalsIgnoreCase("WebServiceBinder")) {
                    obj = new WebServiceBinder(element, screencontext);
                    break label0;
                }
            }
            catch(ScreenElementLoadException screenelementloadexception) {
                screenelementloadexception.printStackTrace();
            }
            obj = null;
        }
        return ((VariableBinder) (obj));
    }

    private void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("VariableBinderManager", "node is null");
            throw new ScreenElementLoadException("node is null");
        } else {
            loadBinders(element);
            return;
        }
    }

    private void loadBinders(Element element) throws ScreenElementLoadException {
        NodeList nodelist = element.getChildNodes();
        for(int i = 0; i < nodelist.getLength(); i++) {
            if(nodelist.item(i).getNodeType() != 1)
                continue;
            VariableBinder variablebinder = createBinder((Element)nodelist.item(i), mContext, this);
            if(variablebinder != null)
                mVariableBinders.add(variablebinder);
        }

    }

    public ContentProviderBinder.Builder addContentProviderBinder(String s) {
        return addContentProviderBinder(new TextFormatter(s));
    }

    public ContentProviderBinder.Builder addContentProviderBinder(String s, String s1) {
        return addContentProviderBinder(new TextFormatter(s, s1));
    }

    public ContentProviderBinder.Builder addContentProviderBinder(TextFormatter textformatter) {
        ContentProviderBinder contentproviderbinder = new ContentProviderBinder(mContext, this);
        contentproviderbinder.mUriFormatter = textformatter;
        mVariableBinders.add(contentproviderbinder);
        return new ContentProviderBinder.Builder(contentproviderbinder);
    }

    public VariableBinder findBinder(String s) {
        Iterator iterator = mVariableBinders.iterator();
_L4:
        if(!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        VariableBinder variablebinder = (VariableBinder)iterator.next();
        if(!TextUtils.equals(s, variablebinder.getName())) goto _L4; else goto _L3
_L3:
        return variablebinder;
_L2:
        variablebinder = null;
        if(true) goto _L3; else goto _L5
_L5:
    }

    public void finish() {
        for(Iterator iterator = mVariableBinders.iterator(); iterator.hasNext(); ((VariableBinder)iterator.next()).finish());
    }

    public void init() {
        for(Iterator iterator = mVariableBinders.iterator(); iterator.hasNext(); ((VariableBinder)iterator.next()).init());
    }

    public void onQueryCompleted(String s) {
        Iterator iterator = mVariableBinders.iterator();
        do {
            if(!iterator.hasNext())
                break;
            VariableBinder variablebinder = (VariableBinder)iterator.next();
            if(variablebinder instanceof ContentProviderBinder) {
                ContentProviderBinder contentproviderbinder = (ContentProviderBinder)variablebinder;
                String s1 = contentproviderbinder.getDependency();
                if(!TextUtils.isEmpty(s1) && s1.equals(s))
                    contentproviderbinder.startQuery();
            }
        } while(true);
    }

    public void pause() {
        for(Iterator iterator = mVariableBinders.iterator(); iterator.hasNext(); ((VariableBinder)iterator.next()).pause());
    }

    public void resume() {
        for(Iterator iterator = mVariableBinders.iterator(); iterator.hasNext(); ((VariableBinder)iterator.next()).resume());
    }

    private static final String LOG_TAG = "VariableBinderManager";
    public static final String TAG_NAME = "VariableBinders";
    private ScreenContext mContext;
    private ArrayList mVariableBinders;
}
