// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.*;
import miui.app.screenelement.elements.ElementGroup;
import miui.app.screenelement.elements.ScreenElement;
import org.w3c.dom.Element;

// Referenced classes of package com.miui.internal.policy.impl.AwesomeLockScreenImp:
//            UnlockerListener, UnlockerScreenElement

public class LockScreenElementGroup extends ElementGroup
    implements UnlockerListener {

    public LockScreenElementGroup(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
    }

    public void endUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        Iterator iterator = super.mElements.iterator();
        do {
            if(!iterator.hasNext())
                break;
            ScreenElement screenelement = (ScreenElement)iterator.next();
            if(screenelement instanceof UnlockerListener)
                ((UnlockerListener)screenelement).endUnlockMoving(unlockerscreenelement);
        } while(true);
    }

    public void startUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        Iterator iterator = super.mElements.iterator();
        do {
            if(!iterator.hasNext())
                break;
            ScreenElement screenelement = (ScreenElement)iterator.next();
            if(screenelement instanceof UnlockerListener)
                ((UnlockerListener)screenelement).startUnlockMoving(unlockerscreenelement);
        } while(true);
    }
}
