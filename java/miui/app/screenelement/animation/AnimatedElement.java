// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.TextFormatter;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            AlphaAnimation, PositionAnimation, RotationAnimation, SizeAnimation, 
//            SourcesAnimation, BaseAnimation

public class AnimatedElement {

    public AnimatedElement(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        mAnimations = new ArrayList();
        mContext = screencontext;
        load(element);
    }

    private Expression createExp(Element element, String s, String s1) {
        Expression expression = Expression.build(element.getAttribute(s));
        if(expression == null && !TextUtils.isEmpty(s1))
            expression = Expression.build(element.getAttribute(s1));
        return expression;
    }

    private void loadAlphaAnimations(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "AlphaAnimation");
        if(element1 != null) {
            mAlphas = new AlphaAnimation(element1, mContext);
            mAnimations.add(mAlphas);
        }
    }

    private void loadPositionAnimations(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "PositionAnimation");
        if(element1 != null) {
            mPositions = new PositionAnimation(element1, mContext);
            mAnimations.add(mPositions);
        }
    }

    private void loadRotationAnimations(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "RotationAnimation");
        if(element1 != null) {
            mRotations = new RotationAnimation(element1, mContext);
            mAnimations.add(mRotations);
        }
    }

    private void loadSizeAnimations(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "SizeAnimation");
        if(element1 != null) {
            mSizes = new SizeAnimation(element1, mContext);
            mAnimations.add(mSizes);
        }
    }

    private void loadSourceAnimations(Element element) throws ScreenElementLoadException {
        Element element1 = Utils.getChild(element, "SourcesAnimation");
        if(element1 != null) {
            mSources = new SourcesAnimation(element1, mContext);
            mAnimations.add(mSources);
        }
    }

    public int getAlpha() {
        int i;
        int j;
        if(mAlphaExpression != null)
            i = (int)mAlphaExpression.evaluate(mContext.mVariables);
        else
            i = 255;
        if(mAlphas != null)
            j = mAlphas.getAlpha();
        else
            j = 255;
        return Utils.mixAlpha(i, j);
    }

    public float getHeight() {
        float f;
        if(mSizes != null) {
            f = (float)mSizes.getHeight();
        } else {
            double d;
            if(mHeightExpression != null)
                d = mHeightExpression.evaluate(mContext.mVariables);
            else
                d = -1D;
            f = (float)d;
        }
        return f;
    }

    public float getMaxHeight() {
        float f;
        if(mSizes != null) {
            f = (float)mSizes.getMaxHeight();
        } else {
            double d;
            if(mHeightExpression != null)
                d = mHeightExpression.evaluate(mContext.mVariables);
            else
                d = -1D;
            f = (float)d;
        }
        return f;
    }

    public float getMaxWidth() {
        float f;
        if(mSizes != null) {
            f = (float)mSizes.getMaxWidth();
        } else {
            double d;
            if(mWidthExpression != null)
                d = mWidthExpression.evaluate(mContext.mVariables);
            else
                d = -1D;
            f = (float)d;
        }
        return f;
    }

    public float getPivotX() {
        double d;
        if(mCenterXExpression != null)
            d = mCenterXExpression.evaluate(mContext.mVariables);
        else
            d = 0.0D;
        return (float)d;
    }

    public float getPivotY() {
        double d;
        if(mCenterYExpression != null)
            d = mCenterYExpression.evaluate(mContext.mVariables);
        else
            d = 0.0D;
        return (float)d;
    }

    public float getRotationAngle() {
        double d;
        float f;
        if(mRotationExpression != null)
            d = mRotationExpression.evaluate(mContext.mVariables);
        else
            d = 0.0D;
        if(mRotations != null)
            f = mRotations.getAngle();
        else
            f = 0.0F;
        return (float)(d + (double)f);
    }

    public String getSrc() {
        String s = mSrcFormatter.getText(mContext.mVariables);
        if(mSources != null)
            s = mSources.getSrc();
        if(s != null && mSrcIdExpression != null)
            s = Utils.addFileNameSuffix(s, String.valueOf((long)mSrcIdExpression.evaluate(mContext.mVariables)));
        return s;
    }

    public float getWidth() {
        float f;
        if(mSizes != null) {
            f = (float)mSizes.getWidth();
        } else {
            double d;
            if(mWidthExpression != null)
                d = mWidthExpression.evaluate(mContext.mVariables);
            else
                d = -1D;
            f = (float)d;
        }
        return f;
    }

    public float getX() {
        double d;
        if(mBaseXExpression != null)
            d = mBaseXExpression.evaluate(mContext.mVariables);
        else
            d = 0.0D;
        if(mSources != null)
            d += mSources.getX();
        if(mPositions != null)
            d += mPositions.getX();
        return (float)d;
    }

    public float getY() {
        double d;
        if(mBaseYExpression != null)
            d = mBaseYExpression.evaluate(mContext.mVariables);
        else
            d = 0.0D;
        if(mSources != null)
            d += mSources.getY();
        if(mPositions != null)
            d += mPositions.getY();
        return (float)d;
    }

    public void init() {
        for(Iterator iterator = mAnimations.iterator(); iterator.hasNext(); ((BaseAnimation)iterator.next()).init());
    }

    public boolean isAlignAbsolute() {
        return mAlignAbsolute;
    }

    public void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("AnimatedElement", "node is null");
            throw new ScreenElementLoadException("node is null");
        }
        mBaseXExpression = createExp(element, "x", "left");
        mBaseYExpression = createExp(element, "y", "top");
        mWidthExpression = createExp(element, "w", "width");
        mHeightExpression = createExp(element, "h", "height");
        mRotationExpression = createExp(element, "angle", "rotation");
        mCenterXExpression = createExp(element, "centerX", "pivotX");
        mCenterYExpression = createExp(element, "centerY", "pivotY");
        mSrcIdExpression = createExp(element, "srcid", null);
        mAlphaExpression = createExp(element, "alpha", null);
        mSrcFormatter = TextFormatter.fromElement(element, "src", "srcFormat", "srcParas", "srcExp", "srcFormatExp");
        if(element.getAttribute("align").equalsIgnoreCase("absolute"))
            mAlignAbsolute = true;
        loadSourceAnimations(element);
        loadPositionAnimations(element);
        loadRotationAnimations(element);
        loadSizeAnimations(element);
        loadAlphaAnimations(element);
    }

    public void reset(long l) {
        for(Iterator iterator = mAnimations.iterator(); iterator.hasNext(); ((BaseAnimation)iterator.next()).reset(l));
    }

    public void tick(long l) {
        for(Iterator iterator = mAnimations.iterator(); iterator.hasNext(); ((BaseAnimation)iterator.next()).tick(l));
    }

    private static final boolean DEBUG = false;
    private static final String LOG_TAG = "AnimatedElement";
    private boolean mAlignAbsolute;
    private Expression mAlphaExpression;
    private AlphaAnimation mAlphas;
    private ArrayList mAnimations;
    protected Expression mBaseXExpression;
    protected Expression mBaseYExpression;
    protected Expression mCenterXExpression;
    protected Expression mCenterYExpression;
    private ScreenContext mContext;
    protected Expression mHeightExpression;
    private PositionAnimation mPositions;
    protected Expression mRotationExpression;
    private RotationAnimation mRotations;
    private SizeAnimation mSizes;
    private SourcesAnimation mSources;
    private TextFormatter mSrcFormatter;
    protected Expression mSrcIdExpression;
    protected Expression mWidthExpression;
}
