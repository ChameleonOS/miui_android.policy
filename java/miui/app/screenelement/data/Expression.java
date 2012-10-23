// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.text.TextUtils;
import android.util.Log;
import java.util.*;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.*;

// Referenced classes of package miui.app.screenelement.data:
//            Variables

public abstract class Expression {
    private static class FunctionExpression extends Expression {
        private static class FunctionDesc {

            Fun fun;
            int params;

            public FunctionDesc(Fun fun1, int i) {
                fun = fun1;
                params = i;
            }
        }

        private static final class Fun extends Enum {

            public static Fun valueOf(String s) {
                return (Fun)Enum.valueOf(miui/app/screenelement/data/Expression$FunctionExpression$Fun, s);
            }

            public static Fun[] values() {
                return (Fun[])$VALUES.clone();
            }

            private static final Fun $VALUES[];
            public static final Fun ABS;
            public static final Fun ACOS;
            public static final Fun ASIN;
            public static final Fun ATAN;
            public static final Fun COS;
            public static final Fun COSH;
            public static final Fun DIGIT;
            public static final Fun EQ;
            public static final Fun EQS;
            public static final Fun GE;
            public static final Fun GT;
            public static final Fun IFELSE;
            public static final Fun INT;
            public static final Fun INVALID;
            public static final Fun ISNULL;
            public static final Fun LE;
            public static final Fun LEN;
            public static final Fun LT;
            public static final Fun MAX;
            public static final Fun MIN;
            public static final Fun NE;
            public static final Fun NOT;
            public static final Fun ROUND;
            public static final Fun SIN;
            public static final Fun SINH;
            public static final Fun SQRT;
            public static final Fun SUBSTR;
            public static final Fun TAN;

            static  {
                INVALID = new Fun("INVALID", 0);
                SIN = new Fun("SIN", 1);
                COS = new Fun("COS", 2);
                TAN = new Fun("TAN", 3);
                ASIN = new Fun("ASIN", 4);
                ACOS = new Fun("ACOS", 5);
                ATAN = new Fun("ATAN", 6);
                SINH = new Fun("SINH", 7);
                COSH = new Fun("COSH", 8);
                SQRT = new Fun("SQRT", 9);
                ABS = new Fun("ABS", 10);
                LEN = new Fun("LEN", 11);
                ROUND = new Fun("ROUND", 12);
                INT = new Fun("INT", 13);
                MIN = new Fun("MIN", 14);
                MAX = new Fun("MAX", 15);
                DIGIT = new Fun("DIGIT", 16);
                EQ = new Fun("EQ", 17);
                NE = new Fun("NE", 18);
                GE = new Fun("GE", 19);
                GT = new Fun("GT", 20);
                LE = new Fun("LE", 21);
                LT = new Fun("LT", 22);
                ISNULL = new Fun("ISNULL", 23);
                NOT = new Fun("NOT", 24);
                IFELSE = new Fun("IFELSE", 25);
                EQS = new Fun("EQS", 26);
                SUBSTR = new Fun("SUBSTR", 27);
                Fun afun[] = new Fun[28];
                afun[0] = INVALID;
                afun[1] = SIN;
                afun[2] = COS;
                afun[3] = TAN;
                afun[4] = ASIN;
                afun[5] = ACOS;
                afun[6] = ATAN;
                afun[7] = SINH;
                afun[8] = COSH;
                afun[9] = SQRT;
                afun[10] = ABS;
                afun[11] = LEN;
                afun[12] = ROUND;
                afun[13] = INT;
                afun[14] = MIN;
                afun[15] = MAX;
                afun[16] = DIGIT;
                afun[17] = EQ;
                afun[18] = NE;
                afun[19] = GE;
                afun[20] = GT;
                afun[21] = LE;
                afun[22] = LT;
                afun[23] = ISNULL;
                afun[24] = NOT;
                afun[25] = IFELSE;
                afun[26] = EQS;
                afun[27] = SUBSTR;
                $VALUES = afun;
            }

            private Fun(String s, int i) {
                super(s, i);
            }
        }


        private int digit(int i, int j) {
            int k = -1;
            if(j > 0) goto _L2; else goto _L1
_L1:
            return k;
_L2:
            for(int l = 0; i > 0 && l < j - 1; l++)
                i /= 10;

            if(i > 0)
                k = i % 10;
            if(true) goto _L1; else goto _L3
_L3:
        }

        private int len(int i) {
            int j;
            for(j = 1; i >= 10; j++)
                i /= 10;

            return j;
        }

        private void parseFunction(String s) throws ScreenElementLoadException {
            boolean flag = true;
            FunctionDesc functiondesc = (FunctionDesc)sFunMap.get(s);
            boolean flag1;
            if(functiondesc != null)
                flag1 = flag;
            else
                flag1 = false;
            Utils.asserts(flag1, (new StringBuilder()).append("invalid function:").append(s).toString());
            mFun = functiondesc.fun;
            if(mParaExps.length < functiondesc.params)
                flag = false;
            Utils.asserts(flag, (new StringBuilder()).append("parameters count not matching for function: ").append(s).toString());
        }

        public double evaluate(Variables variables) {
            double d;
            double d1;
            double d2;
            d = 1.0D;
            d1 = 0.0D;
            d2 = mParaExps[0].evaluate(variables);
            class _cls1 {

                static final int $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[];
                static final int $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[];
                static final int $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[];
                static final int $SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope[];

                static  {
                    $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType = new int[Tokenizer.TokenType.values().length];
                    NoSuchFieldError nosuchfielderror39;
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.VAR.ordinal()] = 1;
                    }
                    catch(NoSuchFieldError nosuchfielderror) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.VARSTR.ordinal()] = 2;
                    }
                    catch(NoSuchFieldError nosuchfielderror1) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.NUM.ordinal()] = 3;
                    }
                    catch(NoSuchFieldError nosuchfielderror2) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.STR.ordinal()] = 4;
                    }
                    catch(NoSuchFieldError nosuchfielderror3) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.BRACKET.ordinal()] = 5;
                    }
                    catch(NoSuchFieldError nosuchfielderror4) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.OPE.ordinal()] = 6;
                    }
                    catch(NoSuchFieldError nosuchfielderror5) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$Tokenizer$TokenType[Tokenizer.TokenType.FUN.ordinal()] = 7;
                    }
                    catch(NoSuchFieldError nosuchfielderror6) { }
                    $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun = new int[FunctionExpression.Fun.values().length];
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.SIN.ordinal()] = 1;
                    }
                    catch(NoSuchFieldError nosuchfielderror7) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.COS.ordinal()] = 2;
                    }
                    catch(NoSuchFieldError nosuchfielderror8) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.TAN.ordinal()] = 3;
                    }
                    catch(NoSuchFieldError nosuchfielderror9) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ASIN.ordinal()] = 4;
                    }
                    catch(NoSuchFieldError nosuchfielderror10) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ACOS.ordinal()] = 5;
                    }
                    catch(NoSuchFieldError nosuchfielderror11) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ATAN.ordinal()] = 6;
                    }
                    catch(NoSuchFieldError nosuchfielderror12) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.SINH.ordinal()] = 7;
                    }
                    catch(NoSuchFieldError nosuchfielderror13) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.COSH.ordinal()] = 8;
                    }
                    catch(NoSuchFieldError nosuchfielderror14) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.SQRT.ordinal()] = 9;
                    }
                    catch(NoSuchFieldError nosuchfielderror15) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ABS.ordinal()] = 10;
                    }
                    catch(NoSuchFieldError nosuchfielderror16) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.LEN.ordinal()] = 11;
                    }
                    catch(NoSuchFieldError nosuchfielderror17) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ROUND.ordinal()] = 12;
                    }
                    catch(NoSuchFieldError nosuchfielderror18) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.INT.ordinal()] = 13;
                    }
                    catch(NoSuchFieldError nosuchfielderror19) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.ISNULL.ordinal()] = 14;
                    }
                    catch(NoSuchFieldError nosuchfielderror20) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.NOT.ordinal()] = 15;
                    }
                    catch(NoSuchFieldError nosuchfielderror21) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.MIN.ordinal()] = 16;
                    }
                    catch(NoSuchFieldError nosuchfielderror22) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.MAX.ordinal()] = 17;
                    }
                    catch(NoSuchFieldError nosuchfielderror23) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.DIGIT.ordinal()] = 18;
                    }
                    catch(NoSuchFieldError nosuchfielderror24) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.EQ.ordinal()] = 19;
                    }
                    catch(NoSuchFieldError nosuchfielderror25) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.NE.ordinal()] = 20;
                    }
                    catch(NoSuchFieldError nosuchfielderror26) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.GE.ordinal()] = 21;
                    }
                    catch(NoSuchFieldError nosuchfielderror27) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.GT.ordinal()] = 22;
                    }
                    catch(NoSuchFieldError nosuchfielderror28) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.LE.ordinal()] = 23;
                    }
                    catch(NoSuchFieldError nosuchfielderror29) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.LT.ordinal()] = 24;
                    }
                    catch(NoSuchFieldError nosuchfielderror30) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.IFELSE.ordinal()] = 25;
                    }
                    catch(NoSuchFieldError nosuchfielderror31) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.EQS.ordinal()] = 26;
                    }
                    catch(NoSuchFieldError nosuchfielderror32) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$FunctionExpression$Fun[FunctionExpression.Fun.SUBSTR.ordinal()] = 27;
                    }
                    catch(NoSuchFieldError nosuchfielderror33) { }
                    $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope = new int[BinaryExpression.Ope.values().length];
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[BinaryExpression.Ope.ADD.ordinal()] = 1;
                    }
                    catch(NoSuchFieldError nosuchfielderror34) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[BinaryExpression.Ope.MIN.ordinal()] = 2;
                    }
                    catch(NoSuchFieldError nosuchfielderror35) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[BinaryExpression.Ope.MUL.ordinal()] = 3;
                    }
                    catch(NoSuchFieldError nosuchfielderror36) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[BinaryExpression.Ope.DIV.ordinal()] = 4;
                    }
                    catch(NoSuchFieldError nosuchfielderror37) { }
                    try {
                        $SwitchMap$miui$app$screenelement$data$Expression$BinaryExpression$Ope[BinaryExpression.Ope.MOD.ordinal()] = 5;
                    }
                    catch(NoSuchFieldError nosuchfielderror38) { }
                    $SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope = new int[UnaryExpression.Ope.values().length];
                    $SwitchMap$miui$app$screenelement$data$Expression$UnaryExpression$Ope[UnaryExpression.Ope.MIN.ordinal()] = 1;
_L2:
                    return;
                    nosuchfielderror39;
                    if(true) goto _L2; else goto _L1
_L1:
                }
            }

            _cls1..SwitchMap.miui.app.screenelement.data.Expression.FunctionExpression.Fun[mFun.ordinal()];
            JVM INSTR tableswitch 1 27: default 152
        //                       1 188
        //                       2 197
        //                       3 206
        //                       4 215
        //                       5 224
        //                       6 233
        //                       7 242
        //                       8 251
        //                       9 260
        //                       10 269
        //                       11 278
        //                       12 296
        //                       13 306
        //                       14 314
        //                       15 333
        //                       16 353
        //                       17 372
        //                       18 391
        //                       19 414
        //                       20 436
        //                       21 458
        //                       22 480
        //                       23 502
        //                       24 524
        //                       25 546
        //                       26 674
        //                       27 706;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25 _L26 _L27 _L28
_L1:
            Log.e("Expression", (new StringBuilder()).append("fail to evalute FunctionExpression, invalid function: ").append(mFun.toString()).toString());
            d = d1;
_L30:
            return d;
_L2:
            d = Math.sin(d2);
            continue; /* Loop/switch isn't completed */
_L3:
            d = Math.cos(d2);
            continue; /* Loop/switch isn't completed */
_L4:
            d = Math.tan(d2);
            continue; /* Loop/switch isn't completed */
_L5:
            d = Math.asin(d2);
            continue; /* Loop/switch isn't completed */
_L6:
            d = Math.acos(d2);
            continue; /* Loop/switch isn't completed */
_L7:
            d = Math.atan(d2);
            continue; /* Loop/switch isn't completed */
_L8:
            d = Math.sinh(d2);
            continue; /* Loop/switch isn't completed */
_L9:
            d = Math.cosh(d2);
            continue; /* Loop/switch isn't completed */
_L10:
            d = Math.sqrt(d2);
            continue; /* Loop/switch isn't completed */
_L11:
            d = Math.abs(d2);
            continue; /* Loop/switch isn't completed */
_L12:
            d = mParaExps[0].evaluateStr(variables).length();
            continue; /* Loop/switch isn't completed */
_L13:
            d = Math.round(d2);
            continue; /* Loop/switch isn't completed */
_L14:
            d = (int)d2;
            continue; /* Loop/switch isn't completed */
_L15:
            if(!mParaExps[0].isNull(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L16:
            if(d2 <= d1)
                d1 = d;
            d = d1;
            continue; /* Loop/switch isn't completed */
_L17:
            d = Math.min(d2, mParaExps[1].evaluate(variables));
            continue; /* Loop/switch isn't completed */
_L18:
            d = Math.max(d2, mParaExps[1].evaluate(variables));
            continue; /* Loop/switch isn't completed */
_L19:
            d = digit((int)d2, (int)mParaExps[1].evaluate(variables));
            continue; /* Loop/switch isn't completed */
_L20:
            if(d2 != mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L21:
            if(d2 == mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L22:
            if(d2 < mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L23:
            if(d2 <= mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L24:
            if(d2 > mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L25:
            if(d2 >= mParaExps[1].evaluate(variables))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L26:
            int i = mParaExps.length;
            if(i % 2 != 1) {
                Log.e("Expression", (new StringBuilder()).append("function parameter number should be 2*n+1: ").append(mFun.toString()).toString());
                d = d1;
                continue; /* Loop/switch isn't completed */
            }
            int j = 0;
            do {
                if(j >= (i - 1) / 2)
                    break;
                if(mParaExps[j * 2].evaluate(variables) > d1) {
                    d = mParaExps[1 + j * 2].evaluate(variables);
                    continue; /* Loop/switch isn't completed */
                }
                j++;
            } while(true);
            d = mParaExps[i - 1].evaluate(variables);
            continue; /* Loop/switch isn't completed */
_L27:
            if(!TextUtils.equals(mParaExps[0].evaluateStr(variables), mParaExps[1].evaluateStr(variables)))
                d = d1;
            continue; /* Loop/switch isn't completed */
_L28:
            d = Utils.stringToDouble(evaluateStr(variables), d1);
            if(true) goto _L30; else goto _L29
_L29:
        }

        public String evaluateStr(Variables variables) {
            String s = null;
            _cls1..SwitchMap.miui.app.screenelement.data.Expression.FunctionExpression.Fun[mFun.ordinal()];
            JVM INSTR tableswitch 25 27: default 40
        //                       25 51
        //                       26 40
        //                       27 175;
               goto _L1 _L2 _L1 _L3
_L1:
            s = Utils.doubleToString(evaluate(variables));
_L7:
            return s;
_L2:
            int k = mParaExps.length;
            if(k % 2 != 1) {
                Log.e("Expression", (new StringBuilder()).append("function parameter number should be 2*n+1: ").append(mFun.toString()).toString());
                continue; /* Loop/switch isn't completed */
            }
            int l = 0;
            do {
                if(l >= (k - 1) / 2)
                    break;
                if(mParaExps[l * 2].evaluate(variables) > 0.0D) {
                    s = mParaExps[1 + l * 2].evaluateStr(variables);
                    continue; /* Loop/switch isn't completed */
                }
                l++;
            } while(true);
            s = mParaExps[k - 1].evaluateStr(variables);
            continue; /* Loop/switch isn't completed */
_L3:
            String s1;
            int i;
            int j;
            s1 = mParaExps[0].evaluateStr(variables);
            i = mParaExps.length;
            j = (int)mParaExps[1].evaluate(variables);
            if(i < 3) goto _L5; else goto _L4
_L4:
            s = s1.substring(j, (int)mParaExps[2].evaluate(variables));
            continue; /* Loop/switch isn't completed */
_L5:
            String s2 = s1.substring(j);
            s = s2;
            continue; /* Loop/switch isn't completed */
            IndexOutOfBoundsException indexoutofboundsexception;
            indexoutofboundsexception;
            if(true) goto _L7; else goto _L6
_L6:
        }

        private static HashMap sFunMap;
        private Fun mFun;
        private Expression mParaExps[];

        static  {
            sFunMap = new HashMap();
            sFunMap.put("sin", new FunctionDesc(Fun.SIN, 1));
            sFunMap.put("cos", new FunctionDesc(Fun.COS, 1));
            sFunMap.put("tan", new FunctionDesc(Fun.TAN, 1));
            sFunMap.put("asin", new FunctionDesc(Fun.ASIN, 1));
            sFunMap.put("acos", new FunctionDesc(Fun.ACOS, 1));
            sFunMap.put("atan", new FunctionDesc(Fun.ATAN, 1));
            sFunMap.put("sinh", new FunctionDesc(Fun.SINH, 1));
            sFunMap.put("cosh", new FunctionDesc(Fun.COSH, 1));
            sFunMap.put("sqrt", new FunctionDesc(Fun.SQRT, 1));
            sFunMap.put("abs", new FunctionDesc(Fun.ABS, 1));
            sFunMap.put("len", new FunctionDesc(Fun.LEN, 1));
            sFunMap.put("round", new FunctionDesc(Fun.ROUND, 1));
            sFunMap.put("int", new FunctionDesc(Fun.INT, 1));
            sFunMap.put("isnull", new FunctionDesc(Fun.ISNULL, 1));
            sFunMap.put("not", new FunctionDesc(Fun.NOT, 1));
            sFunMap.put("min", new FunctionDesc(Fun.MIN, 2));
            sFunMap.put("max", new FunctionDesc(Fun.MAX, 2));
            sFunMap.put("digit", new FunctionDesc(Fun.DIGIT, 2));
            sFunMap.put("eq", new FunctionDesc(Fun.EQ, 2));
            sFunMap.put("ne", new FunctionDesc(Fun.NE, 2));
            sFunMap.put("ge", new FunctionDesc(Fun.GE, 2));
            sFunMap.put("gt", new FunctionDesc(Fun.GT, 2));
            sFunMap.put("le", new FunctionDesc(Fun.LE, 2));
            sFunMap.put("lt", new FunctionDesc(Fun.LT, 2));
            sFunMap.put("ifelse", new FunctionDesc(Fun.IFELSE, 3));
            sFunMap.put("eqs", new FunctionDesc(Fun.EQS, 2));
            sFunMap.put("substr", new FunctionDesc(Fun.SUBSTR, 2));
        }

        public FunctionExpression(Expression aexpression[], String s) throws ScreenElementLoadException {
            mParaExps = aexpression;
            parseFunction(s);
        }
    }

    private static class BinaryExpression extends Expression {
        public static final class Ope extends Enum {

            public static Ope valueOf(String s) {
                return (Ope)Enum.valueOf(miui/app/screenelement/data/Expression$BinaryExpression$Ope, s);
            }

            public static Ope[] values() {
                return (Ope[])$VALUES.clone();
            }

            private static final Ope $VALUES[];
            public static final Ope ADD;
            public static final Ope DIV;
            public static final Ope INVALID;
            public static final Ope MIN;
            public static final Ope MOD;
            public static final Ope MUL;

            static  {
                INVALID = new Ope("INVALID", 0);
                ADD = new Ope("ADD", 1);
                MIN = new Ope("MIN", 2);
                MUL = new Ope("MUL", 3);
                DIV = new Ope("DIV", 4);
                MOD = new Ope("MOD", 5);
                Ope aope[] = new Ope[6];
                aope[0] = INVALID;
                aope[1] = ADD;
                aope[2] = MIN;
                aope[3] = MUL;
                aope[4] = DIV;
                aope[5] = MOD;
                $VALUES = aope;
            }

            private Ope(String s, int i) {
                super(s, i);
            }
        }


        public static Ope parseOperator(String s) {
            Ope ope;
            if(s.equals("+"))
                ope = Ope.ADD;
            else
            if(s.equals("-"))
                ope = Ope.MIN;
            else
            if(s.equals("*"))
                ope = Ope.MUL;
            else
            if(s.equals("/"))
                ope = Ope.DIV;
            else
            if(s.equals("%"))
                ope = Ope.MOD;
            else
                ope = Ope.INVALID;
            return ope;
        }

        public double evaluate(Variables variables) {
            _cls1..SwitchMap.miui.app.screenelement.data.Expression.BinaryExpression.Ope[mOpe.ordinal()];
            JVM INSTR tableswitch 1 5: default 44
        //                       1 56
        //                       2 77
        //                       3 98
        //                       4 119
        //                       5 140;
               goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
            double d;
            Log.e("Expression", "fail to evalute BinaryExpression, invalid operator");
            d = 0.0D;
_L8:
            return d;
_L2:
            d = mExp1.evaluate(variables) + mExp2.evaluate(variables);
            continue; /* Loop/switch isn't completed */
_L3:
            d = mExp1.evaluate(variables) - mExp2.evaluate(variables);
            continue; /* Loop/switch isn't completed */
_L4:
            d = mExp1.evaluate(variables) * mExp2.evaluate(variables);
            continue; /* Loop/switch isn't completed */
_L5:
            d = mExp1.evaluate(variables) / mExp2.evaluate(variables);
            continue; /* Loop/switch isn't completed */
_L6:
            d = mExp1.evaluate(variables) % mExp2.evaluate(variables);
            if(true) goto _L8; else goto _L7
_L7:
        }

        public String evaluateStr(Variables variables) {
            String s;
            String s1;
            s = mExp1.evaluateStr(variables);
            s1 = mExp2.evaluateStr(variables);
            _cls1..SwitchMap.miui.app.screenelement.data.Expression.BinaryExpression.Ope[mOpe.ordinal()];
            JVM INSTR tableswitch 1 1: default 48
        //                       1 60;
               goto _L1 _L2
_L1:
            Log.e("Expression", "fail to evalute string BinaryExpression, invalid operator");
            s1 = null;
_L4:
            return s1;
_L2:
            if(s == null && s1 == null)
                s1 = null;
            else
            if(s != null)
                if(s1 == null)
                    s1 = s;
                else
                    s1 = (new StringBuilder()).append(s).append(s1).toString();
            if(true) goto _L4; else goto _L3
_L3:
        }

        public boolean isNull(Variables variables) {
            boolean flag;
            boolean flag1;
            flag = false;
            flag1 = true;
            _cls1..SwitchMap.miui.app.screenelement.data.Expression.BinaryExpression.Ope[mOpe.ordinal()];
            JVM INSTR tableswitch 1 5: default 48
        //                       1 50
        //                       2 50
        //                       3 77
        //                       4 77
        //                       5 77;
               goto _L1 _L2 _L2 _L3 _L3 _L3
_L1:
            return flag1;
_L2:
            if(!mExp1.isNull(variables) || !mExp2.isNull(variables))
                flag1 = false;
            continue; /* Loop/switch isn't completed */
_L3:
            if(mExp1.isNull(variables) || mExp2.isNull(variables))
                flag = flag1;
            flag1 = flag;
            if(true) goto _L1; else goto _L4
_L4:
        }

        private Expression mExp1;
        private Expression mExp2;
        private Ope mOpe;

        public BinaryExpression(Expression expression, Expression expression1, String s) {
            mOpe = Ope.INVALID;
            mExp1 = expression;
            mExp2 = expression1;
            mOpe = parseOperator(s);
            if(mOpe == Ope.INVALID)
                Log.e("Expression", (new StringBuilder()).append("BinaryExpression: invalid operator:").append(s).toString());
        }
    }

    private static class UnaryExpression extends Expression {
        public static final class Ope extends Enum {

            public static Ope valueOf(String s) {
                return (Ope)Enum.valueOf(miui/app/screenelement/data/Expression$UnaryExpression$Ope, s);
            }

            public static Ope[] values() {
                return (Ope[])$VALUES.clone();
            }

            private static final Ope $VALUES[];
            public static final Ope INVALID;
            public static final Ope MIN;

            static  {
                INVALID = new Ope("INVALID", 0);
                MIN = new Ope("MIN", 1);
                Ope aope[] = new Ope[2];
                aope[0] = INVALID;
                aope[1] = MIN;
                $VALUES = aope;
            }

            private Ope(String s, int i) {
                super(s, i);
            }
        }


        public static Ope parseOperator(String s) {
            Ope ope;
            if(s.equals("-"))
                ope = Ope.MIN;
            else
                ope = Ope.INVALID;
            return ope;
        }

        public double evaluate(Variables variables) {
            _cls1..SwitchMap.miui.app.screenelement.data.Expression.UnaryExpression.Ope[mOpe.ordinal()];
            JVM INSTR tableswitch 1 1: default 28
        //                       1 47;
               goto _L1 _L2
_L1:
            double d;
            Log.e("Expression", "fail to evalute UnaryExpression, invalid operator");
            d = mExp.evaluate(variables);
_L4:
            return d;
_L2:
            d = 0.0D - mExp.evaluate(variables);
            if(true) goto _L4; else goto _L3
_L3:
        }

        public String evaluateStr(Variables variables) {
            return Utils.doubleToString(evaluate(variables));
        }

        public boolean isNull(Variables variables) {
            return mExp.isNull(variables);
        }

        private Expression mExp;
        private Ope mOpe;

        public UnaryExpression(Expression expression, String s) {
            mOpe = Ope.INVALID;
            mExp = expression;
            mOpe = parseOperator(s);
            if(mOpe == Ope.INVALID)
                Log.e("Expression", (new StringBuilder()).append("BinaryExpression: invalid operator:").append(s).toString());
        }
    }

    private static class StringExpression extends Expression {

        public double evaluate(Variables variables) {
            double d1 = Double.valueOf(Double.parseDouble(mValue)).doubleValue();
            double d = d1;
_L2:
            return d;
            NumberFormatException numberformatexception;
            numberformatexception;
            d = 0.0D;
            if(true) goto _L2; else goto _L1
_L1:
        }

        public String evaluateStr(Variables variables) {
            return mValue;
        }

        private String mValue;

        public StringExpression(String s) {
            mValue = s;
        }
    }

    private static class NumberExpression extends Expression {

        public double evaluate(Variables variables) {
            return mValue;
        }

        public String evaluateStr(Variables variables) {
            if(mString == null)
                mString = Utils.doubleToString(mValue);
            return mString;
        }

        private String mString;
        private double mValue;

        public NumberExpression(String s) {
            mValue = Double.parseDouble(s);
_L1:
            return;
            NumberFormatException numberformatexception;
            numberformatexception;
            Log.e("Expression", (new StringBuilder()).append("invalid NumberExpression:").append(s).toString());
            numberformatexception.printStackTrace();
              goto _L1
        }
    }

    private static class StringVariableExpression extends VariableExpression {

        private void ensureVar(Variables variables) {
            if(mIndexedVar == null)
                mIndexedVar = new IndexedStringVariable(super.mVar.getObjName(), super.mVar.getPropertyName(), variables);
        }

        public double evaluate(Variables variables) {
            double d;
            String s;
            d = 0.0D;
            s = evaluateStr(variables);
            if(s != null) goto _L2; else goto _L1
_L1:
            return d;
_L2:
            double d1 = Double.valueOf(Double.parseDouble(s)).doubleValue();
            d = d1;
            continue; /* Loop/switch isn't completed */
            NumberFormatException numberformatexception;
            numberformatexception;
            if(true) goto _L1; else goto _L3
_L3:
        }

        public String evaluateStr(Variables variables) {
            ensureVar(variables);
            return mIndexedVar.get();
        }

        public boolean isNull(Variables variables) {
            ensureVar(variables);
            boolean flag;
            if(mIndexedVar.get() == null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        private IndexedStringVariable mIndexedVar;

        public StringVariableExpression(String s) {
            super(s);
        }
    }

    private static class NumberVariableExpression extends VariableExpression {

        private void ensureVar(Variables variables) {
            if(mIndexedVar == null)
                mIndexedVar = new IndexedNumberVariable(super.mVar.getObjName(), super.mVar.getPropertyName(), variables);
        }

        public double evaluate(Variables variables) {
            ensureVar(variables);
            Double double1 = mIndexedVar.get();
            double d;
            if(double1 == null)
                d = 0.0D;
            else
                d = double1.doubleValue();
            return d;
        }

        public String evaluateStr(Variables variables) {
            return Utils.doubleToString(evaluate(variables));
        }

        public boolean isNull(Variables variables) {
            ensureVar(variables);
            boolean flag;
            if(mIndexedVar.get() == null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        private IndexedNumberVariable mIndexedVar;

        public NumberVariableExpression(String s) {
            super(s);
        }
    }

    private static abstract class VariableExpression extends Expression {

        protected Variable mVar;

        public VariableExpression(String s) {
            mVar = new Variable(s);
        }
    }

    private static class Tokenizer {
        public class Token {

            final Tokenizer this$0;
            public String token;
            public TokenType type;

            public Token(TokenType tokentype, String s) {
                this$0 = Tokenizer.this;
                super();
                type = TokenType.INVALID;
                type = tokentype;
                token = s;
            }
        }

        public static final class TokenType extends Enum {

            public static TokenType valueOf(String s) {
                return (TokenType)Enum.valueOf(miui/app/screenelement/data/Expression$Tokenizer$TokenType, s);
            }

            public static TokenType[] values() {
                return (TokenType[])$VALUES.clone();
            }

            private static final TokenType $VALUES[];
            public static final TokenType BRACKET;
            public static final TokenType FUN;
            public static final TokenType INVALID;
            public static final TokenType NUM;
            public static final TokenType OPE;
            public static final TokenType STR;
            public static final TokenType VAR;
            public static final TokenType VARSTR;

            static  {
                INVALID = new TokenType("INVALID", 0);
                VAR = new TokenType("VAR", 1);
                VARSTR = new TokenType("VARSTR", 2);
                NUM = new TokenType("NUM", 3);
                STR = new TokenType("STR", 4);
                OPE = new TokenType("OPE", 5);
                FUN = new TokenType("FUN", 6);
                BRACKET = new TokenType("BRACKET", 7);
                TokenType atokentype[] = new TokenType[8];
                atokentype[0] = INVALID;
                atokentype[1] = VAR;
                atokentype[2] = VARSTR;
                atokentype[3] = NUM;
                atokentype[4] = STR;
                atokentype[5] = OPE;
                atokentype[6] = FUN;
                atokentype[7] = BRACKET;
                $VALUES = atokentype;
            }

            private TokenType(String s, int i) {
                super(s, i);
            }
        }


        public Token getToken() {
            Token token;
            int i;
            int j;
            int k;
            token = null;
            i = 0;
            j = -1;
            k = mPos;
_L13:
            char c;
            if(k >= mString.length())
                break MISSING_BLOCK_LABEL_573;
            c = mString.charAt(k);
            if(i != 0) goto _L2; else goto _L1
_L1:
            if(c != '#' && c != '@') goto _L4; else goto _L3
_L3:
            int l = k + 1;
_L7:
            if(l < mString.length() && Expression.isVariableChar(mString.charAt(l))) goto _L6; else goto _L5
_L5:
            if(l == k + 1) {
                Log.e("Expression", (new StringBuilder()).append("invalid variable name:").append(mString).toString());
            } else {
                mPos = l;
                TokenType tokentype;
                if(c == '#')
                    tokentype = TokenType.VAR;
                else
                    tokentype = TokenType.VARSTR;
                token = new Token(tokentype, mString.substring(k + 1, l));
            }
_L8:
            return token;
_L6:
            l++;
              goto _L7
_L4:
label0:
            {
                if(!Expression.isDigitChar(c))
                    break MISSING_BLOCK_LABEL_264;
                for(int k1 = k + 1; k1 < mString.length() && Expression.isDigitChar(mString.charAt(k1)); k1++)
                    break label0;

                mPos = k1;
                token = new Token(TokenType.NUM, mString.substring(k, k1));
            }
              goto _L8
label1:
            {
                if(!Expression.isFunctionChar(c))
                    break MISSING_BLOCK_LABEL_343;
                for(int j1 = k + 1; j1 < mString.length() && Expression.isFunctionChar(mString.charAt(j1)); j1++)
                    break label1;

                mPos = j1;
                token = new Token(TokenType.FUN, mString.substring(k, j1));
            }
              goto _L8
label2:
            {
                if(BinaryExpression.parseOperator(String.valueOf(c)) == BinaryExpression.Ope.INVALID)
                    break label2;
                mPos = k + 1;
                token = new Token(TokenType.OPE, String.valueOf(c));
            }
              goto _L8
            if(c != '\'') goto _L2; else goto _L9
_L9:
            boolean flag;
            int i1;
            flag = false;
            i1 = k + 1;
_L10:
            char c1;
label3:
            {
                if(i1 < mString.length()) {
                    c1 = mString.charAt(i1);
                    if(flag || c1 != '\'')
                        break label3;
                }
                mPos = i1 + 1;
                token = new Token(TokenType.STR, mString.substring(k + 1, i1).replace("\\'", "'"));
            }
              goto _L8
            if(c1 == '\\')
                flag = true;
            else
                flag = false;
            i1++;
              goto _L10
_L2:
            if(c != '(') goto _L12; else goto _L11
_L11:
            if(i == 0)
                j = k + 1;
            i++;
_L15:
            k++;
              goto _L13
_L12:
            if(c != ')' || --i != 0) goto _L15; else goto _L14
_L14:
            mPos = k + 1;
            token = new Token(TokenType.BRACKET, mString.substring(j, k));
              goto _L8
            if(i != 0)
                Log.e("Expression", (new StringBuilder()).append("mismatched bracket:").append(mString).toString());
              goto _L8
        }

        public void reset() {
            mPos = 0;
        }

        private int mPos;
        private String mString;

        public Tokenizer(String s) {
            mString = s;
            reset();
        }
    }


    public Expression() {
    }

    public static Expression build(String s) {
        if(!TextUtils.isEmpty(s.trim())) goto _L2; else goto _L1
_L1:
        Object obj = null;
_L22:
        return ((Expression) (obj));
_L2:
        Tokenizer tokenizer;
        Tokenizer.Token token;
        Stack stack;
        Stack stack1;
        boolean flag;
        tokenizer = new Tokenizer(s);
        token = null;
        stack = new Stack();
        stack1 = new Stack();
        flag = false;
_L7:
        Tokenizer.Token token1;
        token1 = tokenizer.getToken();
        if(token1 == null)
            break MISSING_BLOCK_LABEL_500;
        _cls1..SwitchMap.miui.app.screenelement.data.Expression.Tokenizer.TokenType[token1.type.ordinal()];
        JVM INSTR tableswitch 1 7: default 112
    //                   1 118
    //                   2 118
    //                   3 118
    //                   4 118
    //                   5 118
    //                   6 333
    //                   7 490;
           goto _L3 _L4 _L4 _L4 _L4 _L4 _L5 _L6
_L3:
        break; /* Loop/switch isn't completed */
_L6:
        break MISSING_BLOCK_LABEL_490;
_L14:
        token = token1;
          goto _L7
_L4:
        Expression expression1 = null;
        _cls1..SwitchMap.miui.app.screenelement.data.Expression.Tokenizer.TokenType[token1.type.ordinal()];
        JVM INSTR tableswitch 1 5: default 168
    //                   1 201
    //                   2 218
    //                   3 235
    //                   4 297
    //                   5 314;
           goto _L8 _L9 _L10 _L11 _L12 _L13
_L8:
        Object obj1 = expression1;
_L15:
        Expression expression;
        Object obj2;
        StringBuilder stringbuilder;
        String s1;
        NumberExpression numberexpression;
        if(flag)
            obj2 = new UnaryExpression(((Expression) (obj1)), "-");
        else
            obj2 = obj1;
        stack1.push(obj2);
          goto _L14
_L9:
        obj1 = new NumberVariableExpression(token1.token);
          goto _L15
_L10:
        obj1 = new StringVariableExpression(token1.token);
          goto _L15
_L11:
        stringbuilder = new StringBuilder();
        if(flag)
            s1 = "-";
        else
            s1 = "";
        numberexpression = new NumberExpression(stringbuilder.append(s1).append(token1.token).toString());
        flag = false;
        obj1 = numberexpression;
          goto _L15
_L12:
        obj1 = new StringExpression(token1.token);
          goto _L15
_L13:
        expression1 = buildBracket(token1, stack);
        if(expression1 != null) goto _L8; else goto _L16
_L16:
        obj = null;
        continue; /* Loop/switch isn't completed */
_L5:
        if(!token1.token.equals("-") || token != null && token.type != Tokenizer.TokenType.OPE) goto _L18; else goto _L17
_L17:
        flag = true;
          goto _L14
_L20:
        expression = (Expression)stack1.pop();
        stack1.push(new BinaryExpression((Expression)stack1.pop(), expression, ((Tokenizer.Token)stack.pop()).token));
_L18:
        if(stack.size() <= 0 || cmpOpePri(token1.token, ((Tokenizer.Token)stack.peek()).token) > 0)
            break; /* Loop/switch isn't completed */
        if(stack1.size() < 2) {
            Log.e("Expression", (new StringBuilder()).append("fail to buid: invalid operation position:").append(s).toString());
            obj = null;
            continue; /* Loop/switch isn't completed */
        }
        if(true) goto _L20; else goto _L19
_L19:
        stack.push(token1);
        flag = false;
          goto _L14
        stack.push(token1);
          goto _L14
        if(stack1.size() == 1 + stack.size())
            break; /* Loop/switch isn't completed */
        Log.e("Expression", (new StringBuilder()).append("fail to buid: invalid expression:").append(s).toString());
        obj = null;
        if(true) goto _L22; else goto _L21
_L21:
        obj = (Expression)stack1.pop();
        while(stack.size() > 0) 
            obj = new BinaryExpression((Expression)stack1.pop(), ((Expression) (obj)), ((Tokenizer.Token)stack.pop()).token);
        if(true) goto _L22; else goto _L23
_L23:
    }

    private static Expression buildBracket(Tokenizer.Token token, Stack stack) {
        Object obj;
label0:
        {
            Expression aexpression[] = buildMultiple(token.token);
            try {
                if(!stack.isEmpty() && ((Tokenizer.Token)stack.peek()).type == Tokenizer.TokenType.FUN) {
                    obj = new FunctionExpression(aexpression, ((Tokenizer.Token)stack.pop()).token);
                    break label0;
                }
                if(aexpression.length == 1) {
                    obj = aexpression[0];
                    break label0;
                }
            }
            catch(ScreenElementLoadException screenelementloadexception) {
                screenelementloadexception.printStackTrace();
            }
            Log.e("Expression", (new StringBuilder()).append("fail to buid: multiple expressions in brackets, but seems no function presents:").append(token.token).toString());
            obj = null;
        }
        return ((Expression) (obj));
    }

    public static Expression[] buildMultiple(String s) {
        int i = 0;
        boolean flag = false;
        int j = 0;
        ArrayList arraylist = new ArrayList();
        int k = 0;
        while(k < s.length())  {
            char c = s.charAt(k);
            if(!flag)
                if(c == ',' && i == 0) {
                    arraylist.add(build(s.substring(j, k)));
                    j = k + 1;
                } else
                if(c == '(')
                    i++;
                else
                if(c == ')')
                    i--;
            if(c == '\'')
                if(!flag)
                    flag = true;
                else
                    flag = false;
            k++;
        }
        arraylist.add(build(s.substring(j)));
        return (Expression[])arraylist.toArray(new Expression[arraylist.size()]);
    }

    private static int cmpOpePri(String s, String s1) {
        return getPriority(s) - getPriority(s1);
    }

    private static int getPriority(String s) {
        int i = 0;
_L3:
        if(i >= mOperatorsPriority.length)
            break MISSING_BLOCK_LABEL_30;
        if(mOperatorsPriority[i].indexOf(s) < 0) goto _L2; else goto _L1
_L1:
        return i;
_L2:
        i++;
          goto _L3
        i = -1;
          goto _L1
    }

    private static boolean isDigitChar(char c) {
        boolean flag;
        if(c >= '0' && c <= '9' || c == '.')
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static boolean isFunctionChar(char c) {
        boolean flag;
        if(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static boolean isVariableChar(char c) {
        boolean flag;
        if(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c == '_' || c == '.' || c >= '0' && c <= '9')
            flag = true;
        else
            flag = false;
        return flag;
    }

    public abstract double evaluate(Variables variables);

    public String evaluateStr(Variables variables) {
        return null;
    }

    public boolean isNull(Variables variables) {
        return false;
    }

    private static final boolean DEBUG = false;
    private static final String LOG_TAG = "Expression";
    private static String mOperatorsPriority[];

    static  {
        String as[] = new String[2];
        as[0] = "+-";
        as[1] = "*/%";
        mOperatorsPriority = as;
    }



}
