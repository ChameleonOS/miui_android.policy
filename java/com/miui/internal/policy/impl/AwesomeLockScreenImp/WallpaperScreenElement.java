// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import android.graphics.drawable.BitmapDrawable;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.elements.*;
import miui.content.res.ThemeResources;
import org.w3c.dom.Element;

public class WallpaperScreenElement extends ImageScreenElement {

    public WallpaperScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        BitmapDrawable bitmapdrawable = (BitmapDrawable)ThemeResources.getLockWallpaperCache(super.mContext.mContext);
        if(bitmapdrawable != null)
            super.mBitmap = bitmapdrawable.getBitmap();
    }

    public float getHeight() {
        return super.mAni.getHeight();
    }

    public float getMaxHeight() {
        return super.mAni.getMaxHeight();
    }

    public float getMaxWidth() {
        return super.mAni.getMaxWidth();
    }

    public float getWidth() {
        return super.mAni.getWidth();
    }

    protected boolean shouldScaleBitmap() {
        return false;
    }

    public static final String TAG_NAME = "Wallpaper";
}
