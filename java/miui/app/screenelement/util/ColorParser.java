// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.graphics.Color;
import android.util.Log;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.data.Variables;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.util:
//            IndexedStringVariable

public class ColorParser {
    private static final class ExpressionType extends Enum {

        public static ExpressionType valueOf(String s) {
            return (ExpressionType)Enum.valueOf(miui/app/screenelement/util/ColorParser$ExpressionType, s);
        }

        public static ExpressionType[] values() {
            return (ExpressionType[])$VALUES.clone();
        }

        private static final ExpressionType $VALUES[];
        public static final ExpressionType ARGB;
        public static final ExpressionType CONST;
        public static final ExpressionType INVALID;
        public static final ExpressionType VARIABLE;

        static  {
            CONST = new ExpressionType("CONST", 0);
            VARIABLE = new ExpressionType("VARIABLE", 1);
            ARGB = new ExpressionType("ARGB", 2);
            INVALID = new ExpressionType("INVALID", 3);
            ExpressionType aexpressiontype[] = new ExpressionType[4];
            aexpressiontype[0] = CONST;
            aexpressiontype[1] = VARIABLE;
            aexpressiontype[2] = ARGB;
            aexpressiontype[3] = INVALID;
            $VALUES = aexpressiontype;
        }

        private ExpressionType(String s, int i) {
            super(s, i);
        }
    }


    public ColorParser(String s) {
        mColorExpression = s.trim();
        if(!mColorExpression.startsWith("#"))
            break MISSING_BLOCK_LABEL_53;
        mType = ExpressionType.CONST;
        mColor = Color.parseColor(mColorExpression);
_L1:
        return;
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        mColor = -1;
          goto _L1
        if(mColorExpression.startsWith("@"))
            mType = ExpressionType.VARIABLE;
        else
        if(mColorExpression.startsWith("argb(") && mColorExpression.endsWith(")")) {
            mType = ExpressionType.ARGB;
            mRGBExpression = Expression.buildMultiple(mColorExpression.substring(5, -1 + mColorExpression.length()));
            if(mRGBExpression.length != 4) {
                Log.e("ColorParser", "bad expression format");
                throw new IllegalArgumentException("bad expression format.");
            }
        } else {
            mType = ExpressionType.INVALID;
        }
          goto _L1
    }

    public static ColorParser fromElement(Element element) {
        return new ColorParser(element.getAttribute("color"));
    }

    public int getColor(Variables variables) {
        class _cls1 {

            static final int $SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType[];

            static  {
                $SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType = new int[ExpressionType.values().length];
                NoSuchFieldError nosuchfielderror2;
                try {
                    $SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType[ExpressionType.CONST.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType[ExpressionType.VARIABLE.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                $SwitchMap$miui$app$screenelement$util$ColorParser$ExpressionType[ExpressionType.ARGB.ordinal()] = 3;
_L2:
                return;
                nosuchfielderror2;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls1..SwitchMap.miui.app.screenelement.util.ColorParser.ExpressionType[mType.ordinal()];
        JVM INSTR tableswitch 1 3: default 36
    //                   1 36
    //                   2 41
    //                   3 103;
           goto _L1 _L1 _L2 _L3
_L1:
        return mColor;
_L2:
        if(mIndexedColorVar == null)
            mIndexedColorVar = new IndexedStringVariable(mColorExpression.substring(1), variables);
        int i;
        if(mIndexedColorVar.get() != null)
            i = Color.parseColor(mIndexedColorVar.get());
        else
            i = -1;
        mColor = i;
        continue; /* Loop/switch isn't completed */
_L3:
        mColor = Color.argb((int)mRGBExpression[0].evaluate(variables), (int)mRGBExpression[1].evaluate(variables), (int)mRGBExpression[2].evaluate(variables), (int)mRGBExpression[3].evaluate(variables));
        if(true) goto _L1; else goto _L4
_L4:
    }

    private static final int DEFAULT_COLOR = -1;
    private static final String LOG_TAG = "ColorParser";
    private int mColor;
    private String mColorExpression;
    private IndexedStringVariable mIndexedColorVar;
    private Expression mRGBExpression[];
    private ExpressionType mType;
}
