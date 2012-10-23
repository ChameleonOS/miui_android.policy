// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.util.Log;
import miui.app.screenelement.*;
import miui.app.screenelement.elements.AdvancedSlider;
import org.w3c.dom.Element;

// Referenced classes of package com.miui.internal.policy.impl.AwesomeLockScreenImp:
//            UnlockerListener

public class UnlockerScreenElement extends AdvancedSlider
    implements UnlockerListener {

    public UnlockerScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot, LockScreenRoot.UnlockerCallback unlockercallback, UnlockerListener unlockerlistener) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mUnlockerCallback = unlockercallback;
        mUnlockerListener = unlockerlistener;
        mAlwaysShow = Boolean.parseBoolean(element.getAttribute("alwaysShow"));
        mNoUnlock = Boolean.parseBoolean(element.getAttribute("noUnlock"));
    }

    public void endUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(unlockerscreenelement != this && !mAlwaysShow)
            mUnlockingHide = false;
    }

    public boolean isVisible() {
        boolean flag;
        if(super.isVisible() && !mUnlockingHide)
            flag = true;
        else
            flag = false;
        return flag;
    }

    protected void onCancel() {
        super.onCancel();
        mUnlockerListener.endUnlockMoving(this);
    }

    protected boolean onLaunch(String s, Intent intent) {
        super.onLaunch(s, intent);
        mUnlockerListener.endUnlockMoving(this);
        if(!mNoUnlock || intent != null) goto _L2; else goto _L1
_L1:
        boolean flag;
        mUnlockerCallback.pokeWakelock();
        flag = false;
_L4:
        return flag;
_L2:
        try {
            mUnlockerCallback.unlocked(intent);
        }
        catch(ActivityNotFoundException activitynotfoundexception) {
            Log.e("LockScreen_UnlockerScreenElement", activitynotfoundexception.toString());
            activitynotfoundexception.printStackTrace();
        }
        flag = true;
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onStart() {
        super.onStart();
        mUnlockerListener.startUnlockMoving(this);
        mUnlockerCallback.pokeWakelock();
    }

    public void startUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(unlockerscreenelement != this && !mAlwaysShow)
            mUnlockingHide = true;
    }

    private static final String LOG_TAG = "LockScreen_UnlockerScreenElement";
    public static final String TAG_NAME = "Unlocker";
    private boolean mAlwaysShow;
    private boolean mNoUnlock;
    private final LockScreenRoot.UnlockerCallback mUnlockerCallback;
    private final UnlockerListener mUnlockerListener;
    private boolean mUnlockingHide;
}
