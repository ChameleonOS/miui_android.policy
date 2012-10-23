// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.IllegalFormatException;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.data.Variables;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.util:
//            Variable, IndexedStringVariable

public class TextFormatter {
    private static class StringVarPara extends FormatPara {

        public Object evaluate(Variables variables) {
            if(mVar == null)
                mVar = new IndexedStringVariable(mVariable.getObjName(), mVariable.getPropertyName(), variables);
            String s = mVar.get();
            if(s == null)
                s = "";
            return s;
        }

        private IndexedStringVariable mVar;
        private Variable mVariable;

        public StringVarPara(Variable variable) {
            mVariable = variable;
        }
    }

    private static class ExpressioPara extends FormatPara {

        public Object evaluate(Variables variables) {
            return Long.valueOf((long)mExp.evaluate(variables));
        }

        private Expression mExp;

        public ExpressioPara(Expression expression) {
            mExp = expression;
        }
    }

    private static abstract class FormatPara {

        public static FormatPara build(String s) {
            String s1 = s.trim();
            Object obj;
            if(s1.startsWith("@")) {
                obj = new StringVarPara(new Variable(s1.substring(1)));
            } else {
                Expression expression = Expression.build(s1);
                if(expression == null) {
                    Log.e("TextFormatter", (new StringBuilder()).append("invalid parameter expression:").append(s).toString());
                    obj = null;
                } else {
                    obj = new ExpressioPara(expression);
                }
            }
            return ((FormatPara) (obj));
        }

        public static FormatPara[] buildArray(String s) {
            FormatPara aformatpara[];
            int i;
            int j;
            ArrayList arraylist;
            int k;
            aformatpara = null;
            i = 0;
            j = 0;
            arraylist = new ArrayList();
            k = 0;
_L7:
            if(k >= s.length()) goto _L2; else goto _L1
_L1:
            char c = s.charAt(k);
            if(i != 0 || c != ',') goto _L4; else goto _L3
_L3:
            FormatPara formatpara1 = build(s.substring(j, k));
            if(formatpara1 != null) goto _L6; else goto _L5
_L5:
            return aformatpara;
_L6:
            arraylist.add(formatpara1);
            j = k + 1;
_L4:
            if(c == '(')
                i++;
            else
            if(c == ')')
                i--;
            k++;
              goto _L7
_L2:
            FormatPara formatpara = build(s.substring(j));
            if(formatpara != null) {
                arraylist.add(formatpara);
                aformatpara = (FormatPara[])arraylist.toArray(new FormatPara[arraylist.size()]);
            }
              goto _L5
        }

        public abstract Object evaluate(Variables variables);

        private FormatPara() {
        }

    }


    public TextFormatter(String s) {
        this(s, "", "");
    }

    public TextFormatter(String s, String s1) {
        this("", s, s1);
    }

    public TextFormatter(String s, String s1, String s2) {
        mText = s;
        if(mText.startsWith("@")) {
            mText = mText.substring(1);
            if(!mText.startsWith("@")) {
                mTextVar = new Variable(mText);
                mText = "";
            }
        }
        mFormat = s1;
        if(mFormat.startsWith("@")) {
            mFormat = mFormat.substring(1);
            if(!mFormat.startsWith("@")) {
                mFormatVar = new Variable(mFormat);
                mFormat = "";
            }
        }
        if(!TextUtils.isEmpty(s2)) {
            mParas = FormatPara.buildArray(s2);
            if(mParas != null)
                mParasValue = new Object[mParas.length];
        }
    }

    public TextFormatter(String s, String s1, String s2, Expression expression, Expression expression1) {
        this(s, s1, s2);
        mTextExpression = expression;
        mFormatExpression = expression1;
    }

    public static TextFormatter fromElement(Element element) {
        return new TextFormatter(element.getAttribute("text"), element.getAttribute("format"), element.getAttribute("paras"), Expression.build(element.getAttribute("textExp")), Expression.build(element.getAttribute("formatExp")));
    }

    public static TextFormatter fromElement(Element element, String s, String s1, String s2, String s3, String s4) {
        return new TextFormatter(element.getAttribute(s), element.getAttribute(s1), element.getAttribute(s2), Expression.build(element.getAttribute(s3)), Expression.build(element.getAttribute(s4)));
    }

    public String getFormat(Variables variables) {
        String s;
        if(mFormatExpression != null)
            s = mFormatExpression.evaluateStr(variables);
        else
        if(mFormatVar != null) {
            if(mIndexedFormatVar == null)
                mIndexedFormatVar = new IndexedStringVariable(mFormatVar.getObjName(), mFormatVar.getPropertyName(), variables);
            s = mIndexedFormatVar.get();
        } else {
            s = mFormat;
        }
        return s;
    }

    public String getText(Variables variables) {
        if(mTextExpression == null) goto _L2; else goto _L1
_L1:
        String s1 = mTextExpression.evaluateStr(variables);
_L4:
        return s1;
_L2:
        String s = getFormat(variables);
        if(!TextUtils.isEmpty(s) && mParas != null) {
            for(int i = 0; i < mParas.length; i++)
                mParasValue[i] = mParas[i].evaluate(variables);

            String s2;
            try {
                s2 = String.format(s, mParasValue);
            }
            catch(IllegalFormatException illegalformatexception) {
                s1 = (new StringBuilder()).append("Format error: ").append(s).toString();
                continue; /* Loop/switch isn't completed */
            }
            s1 = s2;
            continue; /* Loop/switch isn't completed */
        }
        if(mTextVar != null) {
            if(mIndexedTextVar == null)
                mIndexedTextVar = new IndexedStringVariable(mTextVar.getObjName(), mTextVar.getPropertyName(), variables);
            s1 = mIndexedTextVar.get();
        } else {
            s1 = mText;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public boolean hasFormat() {
        boolean flag;
        if(!TextUtils.isEmpty(mFormat) || mFormatVar != null)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void setText(String s) {
        mText = s;
        mFormat = "";
    }

    private static final String LOG_TAG = "TextFormatter";
    private String mFormat;
    private Expression mFormatExpression;
    private Variable mFormatVar;
    private IndexedStringVariable mIndexedFormatVar;
    private IndexedStringVariable mIndexedTextVar;
    private FormatPara mParas[];
    private Object mParasValue[];
    private String mText;
    private Expression mTextExpression;
    private Variable mTextVar;
}
