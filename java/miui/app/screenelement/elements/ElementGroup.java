// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import android.util.Log;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.*;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement.elements:
//            AnimatedScreenElement, ScreenElement, ScreenElementFactory

public class ElementGroup extends AnimatedScreenElement {

    public ElementGroup(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mElements = new ArrayList();
        mClip = Boolean.parseBoolean(element.getAttribute("clip"));
        load(element, screenelementroot);
    }

    public void doRender(Canvas canvas) {
        float f = getX();
        float f1 = getY();
        int i = canvas.save();
        canvas.translate(f, f1);
        float f2 = getWidth();
        float f3 = getHeight();
        if(f2 > 0.0F && f3 > 0.0F && mClip)
            canvas.clipRect(0.0F, 0.0F, f2, f3);
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).render(canvas));
        canvas.restoreToCount(i);
    }

    public ScreenElement findElement(String s) {
        ScreenElement screenelement = super.findElement(s);
        if(screenelement == null) goto _L2; else goto _L1
_L1:
        ScreenElement screenelement1 = screenelement;
_L4:
        return screenelement1;
_L2:
        for(Iterator iterator = mElements.iterator(); iterator.hasNext();) {
            ScreenElement screenelement2 = ((ScreenElement)iterator.next()).findElement(s);
            if(screenelement2 != null) {
                screenelement1 = screenelement2;
                continue; /* Loop/switch isn't completed */
            }
        }

        screenelement1 = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void finish() {
        super.finish();
        for(Iterator iterator = mElements.iterator(); iterator.hasNext();) {
            ScreenElement screenelement = (ScreenElement)iterator.next();
            try {
                screenelement.finish();
            }
            catch(Exception exception) {
                Log.e("LockScreen_ElementGroup", exception.toString());
                exception.printStackTrace();
            }
        }

    }

    public ArrayList getElements() {
        return mElements;
    }

    public void init() {
        super.init();
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).init());
    }

    public void load(Element element, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("LockScreen_ElementGroup", "node is null");
            throw new ScreenElementLoadException("node is null");
        }
        ScreenElementFactory screenelementfactory = super.mContext.mFactory;
        NodeList nodelist = element.getChildNodes();
        for(int i = 0; i < nodelist.getLength(); i++) {
            if(nodelist.item(i).getNodeType() != 1)
                continue;
            ScreenElement screenelement = screenelementfactory.createInstance((Element)nodelist.item(i), super.mContext, screenelementroot);
            if(screenelement != null) {
                screenelement.setParent(this);
                mElements.add(screenelement);
            }
        }

    }

    public boolean onTouch(MotionEvent motionevent) {
        boolean flag;
        if(!isVisible()) {
            flag = false;
        } else {
            flag = super.onTouch(motionevent);
            Iterator iterator = mElements.iterator();
            while(iterator.hasNext()) 
                if(((ScreenElement)iterator.next()).onTouch(motionevent))
                    flag = true;
        }
        return flag;
    }

    protected void onVisibilityChange(boolean flag) {
        super.onVisibilityChange(flag);
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).onVisibilityChange(flag));
    }

    public void pause() {
        super.pause();
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).pause());
    }

    public void reset(long l) {
        super.reset(l);
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).reset(l));
    }

    public void resume() {
        super.resume();
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).resume());
    }

    public void showCategory(String s, boolean flag) {
        super.showCategory(s, flag);
        for(Iterator iterator = mElements.iterator(); iterator.hasNext(); ((ScreenElement)iterator.next()).showCategory(s, flag));
    }

    public void tick(long l) {
        super.tick(l);
        if(super.mIsVisible) {
            Iterator iterator = mElements.iterator();
            while(iterator.hasNext()) 
                ((ScreenElement)iterator.next()).tick(l);
        }
    }

    private static final String LOG_TAG = "LockScreen_ElementGroup";
    public static final String TAG_NAME = "ElementGroup";
    public static final String TAG_NAME1 = "Group";
    private boolean mClip;
    protected ArrayList mElements;
}
