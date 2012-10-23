// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import miui.app.screenelement.*;
import miui.app.screenelement.elements.ScreenElement;
import miui.app.screenelement.elements.ScreenElementFactory;
import org.w3c.dom.Element;

// Referenced classes of package com.miui.internal.policy.impl.AwesomeLockScreenImp:
//            UnlockerScreenElement, WallpaperScreenElement, UnlockerListener

public class LockScreenElementFactory extends ScreenElementFactory {

    public LockScreenElementFactory(LockScreenRoot.UnlockerCallback unlockercallback, UnlockerListener unlockerlistener) {
        mUnlockerCallback = unlockercallback;
        mUnlockerListener = unlockerlistener;
    }

    public ScreenElement createInstance(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        String s = element.getTagName();
        Object obj;
        if(s.equalsIgnoreCase("Unlocker"))
            obj = new UnlockerScreenElement(element, screencontext, screenelementroot, mUnlockerCallback, mUnlockerListener);
        else
        if(s.equalsIgnoreCase("Wallpaper"))
            obj = new WallpaperScreenElement(element, screencontext, screenelementroot);
        else
            obj = super.createInstance(element, screencontext, screenelementroot);
        return ((ScreenElement) (obj));
    }

    private final LockScreenRoot.UnlockerCallback mUnlockerCallback;
    private final UnlockerListener mUnlockerListener;
}
