// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.VariableAnimation;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.*;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement

public class VariableElement extends ScreenElement {

    public VariableElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) {
        super(element, screencontext, screenelementroot);
        if(element == null)
            break MISSING_BLOCK_LABEL_111;
        mExpression = Expression.build(element.getAttribute("expression"));
        mIsStringType = "string".equalsIgnoreCase(element.getAttribute("type"));
        mConst = Boolean.parseBoolean(element.getAttribute("const"));
        Element element1;
        if(mIsStringType)
            mStringVar = new IndexedStringVariable(super.mName, screencontext.mVariables);
        else
            mNumberVar = new IndexedNumberVariable(super.mName, screencontext.mVariables);
        element1 = Utils.getChild(element, "VariableAnimation");
        if(element1 == null)
            break MISSING_BLOCK_LABEL_111;
        mAnimation = new VariableAnimation(element1, screencontext);
_L1:
        return;
        ScreenElementLoadException screenelementloadexception;
        screenelementloadexception;
        screenelementloadexception.printStackTrace();
          goto _L1
    }

    private void update() {
        miui.app.screenelement.data.Variables variables = super.mContext.mVariables;
        if(!mIsStringType) goto _L2; else goto _L1
_L1:
        if(mExpression != null)
            mStringVar.set(mExpression.evaluateStr(variables));
_L4:
        return;
_L2:
        Double double1;
        double1 = null;
        if(mAnimation == null)
            break; /* Loop/switch isn't completed */
        double1 = Double.valueOf(mAnimation.getValue());
_L6:
        mNumberVar.set(double1);
        if(true) goto _L4; else goto _L3
_L3:
        if(mExpression == null || mExpression.isNull(variables)) goto _L6; else goto _L5
_L5:
        double1 = Double.valueOf(mExpression.evaluate(variables));
          goto _L6
    }

    public void init() {
        if(mAnimation != null)
            mAnimation.init();
        update();
    }

    public void render(Canvas canvas) {
    }

    public void reset() {
        if(mAnimation != null)
            mAnimation.reset();
        update();
    }

    public void tick(long l) {
        if(mAnimation != null)
            mAnimation.tick(l);
        if(!mConst)
            update();
    }

    public static final String TAG_NAME = "Var";
    private VariableAnimation mAnimation;
    private boolean mConst;
    private Expression mExpression;
    private boolean mIsStringType;
    private IndexedNumberVariable mNumberVar;
    private IndexedStringVariable mStringVar;
}
