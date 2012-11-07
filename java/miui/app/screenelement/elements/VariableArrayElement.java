// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementRoot;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.data.Variables;
import miui.app.screenelement.util.*;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ScreenElement

public class VariableArrayElement extends ScreenElement {
    private class Item {

        public Double evaluate(Variables variables) {
            Double double1;
            if(mExpression != null) {
                if(mExpression.isNull(variables))
                    double1 = null;
                else
                    double1 = Double.valueOf(mExpression.evaluate(variables));
            } else {
                double1 = Double.valueOf(mNumValue);
            }
            return double1;
        }

        public String evaluateStr(Variables variables) {
            String s;
            if(mExpression != null)
                s = mExpression.evaluateStr(variables);
            else
                s = mStrValue;
            return s;
        }

        public boolean isExpression() {
            boolean flag;
            if(mExpression != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public Expression mExpression;
        public double mNumValue;
        public String mStrValue;
        final VariableArrayElement this$0;

        public Item(Element element) {
            this$0 = VariableArrayElement.this;
            super();
            if(element == null)
                break MISSING_BLOCK_LABEL_58;
            mExpression = Expression.build(element.getAttribute("expression"));
            mStrValue = element.getAttribute("value");
            if(mIsStringType)
                break MISSING_BLOCK_LABEL_58;
            mNumValue = Double.parseDouble(mStrValue);
_L2:
            return;
            NumberFormatException numberformatexception;
            numberformatexception;
            if(true) goto _L2; else goto _L1
_L1:
        }
    }

    private class Var {

        private void update() {
            if(mIndexExpression != null) goto _L2; else goto _L1
_L1:
            return;
_L2:
            Variables variables = mContext.mVariables;
            int i = (int)mIndexExpression.evaluate(variables);
            if(i < 0 || i >= mArray.size()) {
                if(mIsStringType)
                    mStringVar.set(null);
                else
                    mNumberVar.set(null);
            } else
            if(mIndex != i || mCurrentItemIsExpression) {
                Item item = (Item)mArray.get(i);
                if(mIndex != i) {
                    mIndex = i;
                    mCurrentItemIsExpression = item.isExpression();
                }
                if(mIsStringType)
                    mStringVar.set(item.evaluateStr(variables));
                else
                    mNumberVar.set(item.evaluate(variables));
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        public void init() {
            update();
        }

        public void tick() {
            if(!mConst)
                update();
        }

        private boolean mConst;
        private boolean mCurrentItemIsExpression;
        private int mIndex;
        private Expression mIndexExpression;
        private String mName;
        private IndexedNumberVariable mNumberVar;
        private IndexedStringVariable mStringVar;
        final VariableArrayElement this$0;

        public Var(Element element) {
            this$0 = VariableArrayElement.this;
            super();
            mIndex = -1;
            if(element != null) {
                mName = element.getAttribute("name");
                mIndexExpression = Expression.build(element.getAttribute("index"));
                mConst = Boolean.parseBoolean(element.getAttribute("const"));
                if(mIsStringType)
                    mStringVar = new IndexedStringVariable(mName, mContext.mVariables);
                else
                    mNumberVar = new IndexedNumberVariable(mName, mContext.mVariables);
            }
        }
    }


    public VariableArrayElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) {
        super(element, screencontext, screenelementroot);
        mArray = new ArrayList();
        mVars = new ArrayList();
        if(element != null) {
            mIsStringType = "string".equalsIgnoreCase(element.getAttribute("type"));
            Utils.traverseXmlElementChildren(Utils.getChild(element, "Vars"), "Var", new miui.app.screenelement.util.Utils.XmlTraverseListener() {

                public void onChild(Element element1) {
                    mVars.add(new Var(element1));
                }

                final VariableArrayElement this$0;

             {
                this$0 = VariableArrayElement.this;
                super();
            }
            });
            Utils.traverseXmlElementChildren(Utils.getChild(element, "Items"), "Item", new miui.app.screenelement.util.Utils.XmlTraverseListener() {

                public void onChild(Element element1) {
                    mArray.add(new Item(element1));
                }

                final VariableArrayElement this$0;

             {
                this$0 = VariableArrayElement.this;
                super();
            }
            });
        }
    }

    public void doRender(Canvas canvas) {
    }

    public void init() {
        for(Iterator iterator = mVars.iterator(); iterator.hasNext(); ((Var)iterator.next()).init());
    }

    public void tick(long l) {
        for(Iterator iterator = mVars.iterator(); iterator.hasNext(); ((Var)iterator.next()).tick());
    }

    public static final String TAG_NAME = "VarArray";
    private ArrayList mArray;
    private boolean mIsStringType;
    private ArrayList mVars;



}
