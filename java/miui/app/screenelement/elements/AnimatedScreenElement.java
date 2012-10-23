// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement, ElementGroup

public abstract class AnimatedScreenElement extends ScreenElement {

    public AnimatedScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mAni = new AnimatedElement(element, super.mContext);
        if(super.mHasName) {
            mActualXVar = new IndexedNumberVariable(super.mName, "actual_x", screencontext.mVariables);
            mActualYVar = new IndexedNumberVariable(super.mName, "actual_y", screencontext.mVariables);
        }
    }

    public int getAlpha() {
        int i = mAni.getAlpha();
        if(super.mParent != null)
            i = Utils.mixAlpha(i, super.mParent.getAlpha());
        return i;
    }

    public float getAngle() {
        return mAni.getRotationAngle();
    }

    public float getCenterX() {
        return scale(mAni.getCenterX());
    }

    public float getCenterY() {
        return scale(mAni.getCenterY());
    }

    public float getHeight() {
        return scale(mAni.getHeight());
    }

    public float getMaxHeight() {
        return scale(mAni.getMaxHeight());
    }

    public float getMaxWidth() {
        return scale(mAni.getMaxWidth());
    }

    public float getWidth() {
        return scale(mAni.getWidth());
    }

    public float getX() {
        return scale(mAni.getX());
    }

    public float getY() {
        return scale(mAni.getY());
    }

    public void init() {
        super.init();
        mAni.init();
    }

    protected boolean isVisibleInner() {
        boolean flag;
        if(super.isVisibleInner() && getAlpha() > 0)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void reset(long l) {
        super.reset(l);
        mAni.reset(l);
    }

    public void tick(long l) {
        mAni.tick(l);
        updateVisibility();
        if(super.mHasName) {
            mActualXVar.set(mAni.getX());
            mActualYVar.set(mAni.getY());
        }
    }

    private IndexedNumberVariable mActualXVar;
    private IndexedNumberVariable mActualYVar;
    protected AnimatedElement mAni;
}
