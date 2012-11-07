// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.*;
import android.text.TextUtils;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement, ElementGroup

public abstract class AnimatedScreenElement extends ScreenElement {

    public AnimatedScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mMatrix = new Matrix();
        mAni = new AnimatedElement(element, super.mContext);
        if(super.mHasName) {
            mActualXVar = new IndexedNumberVariable(super.mName, "actual_x", screencontext.mVariables);
            mActualYVar = new IndexedNumberVariable(super.mName, "actual_y", screencontext.mVariables);
        }
        mScaleExpression = createExp(element, "scale", null);
        mScaleXExpression = createExp(element, "scaleX", null);
        mScaleYExpression = createExp(element, "scaleY", null);
        mRotationX = createExp(element, "angleX", "rotationX");
        mRotationY = createExp(element, "angleY", "rotationY");
        mRotationZ = createExp(element, "angleZ", "rotationZ");
        mPivotZ = createExp(element, "centerZ", "pivotZ");
        if(mRotationX != null || mRotationY != null || mRotationZ != null)
            mCamera = new Camera();
    }

    private Expression createExp(Element element, String s, String s1) {
        Expression expression = Expression.build(element.getAttribute(s));
        if(expression == null && !TextUtils.isEmpty(s1))
            expression = Expression.build(element.getAttribute(s1));
        return expression;
    }

    public int getAlpha() {
        int i = mAni.getAlpha();
        if(super.mParent != null)
            i = Utils.mixAlpha(i, super.mParent.getAlpha());
        return i;
    }

    public float getHeight() {
        return scale(mAni.getHeight());
    }

    protected float getLeft() {
        return getLeft(getX(), getWidth());
    }

    public float getMaxHeight() {
        return scale(mAni.getMaxHeight());
    }

    public float getMaxWidth() {
        return scale(mAni.getMaxWidth());
    }

    public float getPivotX() {
        return scale(mAni.getPivotX());
    }

    public float getPivotY() {
        return scale(mAni.getPivotY());
    }

    public float getRotation() {
        return mAni.getRotationAngle();
    }

    protected float getTop() {
        return getTop(getY(), getHeight());
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

    public void render(Canvas canvas) {
        updateVisibility();
        if(super.mIsVisible) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag;
        float f;
        float f1;
        int i;
        boolean flag1;
        mMatrix.reset();
        flag = false;
        f = getLeft() + getPivotX();
        f1 = getTop() + getPivotY();
        if(mCamera != null) {
            mCamera.save();
            if(mRotationX != null) {
                mCamera.rotateX((float)mRotationX.evaluate(super.mContext.mVariables));
                flag = true;
            }
            if(mRotationY != null) {
                mCamera.rotateY((float)mRotationY.evaluate(super.mContext.mVariables));
                flag = true;
            }
            if(mRotationZ != null) {
                mCamera.rotateZ((float)mRotationZ.evaluate(super.mContext.mVariables));
                flag = true;
            }
            if(mPivotZ != null)
                mCamera.translate(0.0F, 0.0F, (float)mPivotZ.evaluate(super.mContext.mVariables));
            mCamera.getMatrix(mMatrix);
            mMatrix.preTranslate(-f, -f1);
            mMatrix.postTranslate(f, f1);
            mCamera.restore();
        }
        i = 0;
        if(flag) {
            i = canvas.save();
            canvas.concat(mMatrix);
            mMatrix.reset();
        }
        flag1 = false;
        float f2 = getRotation();
        if(f2 != 0.0F) {
            mMatrix.setRotate(f2, f, f1);
            flag1 = true;
        }
        if(mScaleExpression == null)
            break; /* Loop/switch isn't completed */
        float f5 = (float)mScaleExpression.evaluate(super.mContext.mVariables);
        mMatrix.setScale(f5, f5, f, f1);
        flag1 = true;
_L5:
        if(flag1) {
            if(!flag)
                i = canvas.save();
            canvas.concat(mMatrix);
        }
        doRender(canvas);
        if(flag || flag1)
            canvas.restoreToCount(i);
        if(true) goto _L1; else goto _L3
_L3:
        if(mScaleXExpression == null && mScaleYExpression == null) goto _L5; else goto _L4
_L4:
        float f3;
        float f4;
        if(mScaleXExpression == null)
            f3 = 1.0F;
        else
            f3 = (float)mScaleXExpression.evaluate(super.mContext.mVariables);
        if(mScaleYExpression == null)
            f4 = 1.0F;
        else
            f4 = (float)mScaleYExpression.evaluate(super.mContext.mVariables);
        mMatrix.setScale(f3, f4, f, f1);
        flag1 = true;
          goto _L5
    }

    public void reset(long l) {
        super.reset(l);
        mAni.reset(l);
    }

    public void tick(long l) {
        super.tick(l);
        mAni.tick(l);
        if(super.mHasName) {
            mActualXVar.set(mAni.getX());
            mActualYVar.set(mAni.getY());
        }
    }

    private IndexedNumberVariable mActualXVar;
    private IndexedNumberVariable mActualYVar;
    protected AnimatedElement mAni;
    private Camera mCamera;
    private Matrix mMatrix;
    private Expression mPivotZ;
    private Expression mRotationX;
    private Expression mRotationY;
    private Expression mRotationZ;
    private Expression mScaleExpression;
    private Expression mScaleXExpression;
    private Expression mScaleYExpression;
}
