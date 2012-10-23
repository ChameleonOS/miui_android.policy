// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.text.TextUtils;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.data.Variables;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement.util:
//            IndexedNumberVariable, IndexedStringVariable

public class Utils {
    public static interface XmlTraverseListener {

        public abstract void onChild(Element element);
    }

    public static class Point {

        public void Offset(Point point) {
            x = x + point.x;
            y = y + point.y;
        }

        Point minus(Point point) {
            return new Point(x - point.x, y - point.y);
        }

        public double x;
        public double y;

        public Point(double d, double d1) {
            x = d;
            y = d1;
        }
    }

    public static class GetChildWrapper {

        public GetChildWrapper getChild(String s) {
            return new GetChildWrapper(Utils.getChild(mEle, s));
        }

        public Element getElement() {
            return mEle;
        }

        private Element mEle;

        public GetChildWrapper(Element element) {
            mEle = element;
        }
    }


    public Utils() {
    }

    public static double Dist(Point point, Point point1, boolean flag) {
        double d = point.x - point1.x;
        double d1 = point.y - point1.y;
        double d2;
        if(flag)
            d2 = Math.sqrt(d * d + d1 * d1);
        else
            d2 = d * d + d1 * d1;
        return d2;
    }

    public static String addFileNameSuffix(String s, String s1) {
        return addFileNameSuffix(s, "_", s1);
    }

    public static String addFileNameSuffix(String s, String s1, String s2) {
        int i = s.indexOf('.');
        return (new StringBuilder(s.substring(0, i))).append(s1).append(s2).append(s.substring(i)).toString();
    }

    public static void asserts(boolean flag) throws ScreenElementLoadException {
        asserts(flag, "assert error");
    }

    public static void asserts(boolean flag, String s) throws ScreenElementLoadException {
        if(!flag)
            throw new ScreenElementLoadException(s);
        else
            return;
    }

    public static String doubleToString(double d) {
        String s = String.valueOf(d);
        if(s.endsWith(".0"))
            s = s.substring(0, -2 + s.length());
        return s;
    }

    public static boolean equals(Object obj, Object obj1) {
        boolean flag;
        if(obj != obj1 && (obj == null || !obj.equals(obj1)))
            flag = false;
        else
            flag = true;
        return flag;
    }

    public static float getAttrAsFloat(Element element, String s, float f) {
        float f1 = Float.parseFloat(element.getAttribute(s));
        f = f1;
_L2:
        return f;
        NumberFormatException numberformatexception;
        numberformatexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static float getAttrAsFloatThrows(Element element, String s) throws ScreenElementLoadException {
        float f;
        try {
            f = Float.parseFloat(element.getAttribute(s));
        }
        catch(NumberFormatException numberformatexception) {
            Object aobj[] = new Object[2];
            aobj[0] = s;
            aobj[1] = element.toString();
            throw new ScreenElementLoadException(String.format("fail to get attribute name: %s of Element %s", aobj));
        }
        return f;
    }

    public static int getAttrAsInt(Element element, String s, int i) {
        int j = Integer.parseInt(element.getAttribute(s));
        i = j;
_L2:
        return i;
        NumberFormatException numberformatexception;
        numberformatexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static int getAttrAsIntThrows(Element element, String s) throws ScreenElementLoadException {
        int i;
        try {
            i = Integer.parseInt(element.getAttribute(s));
        }
        catch(NumberFormatException numberformatexception) {
            Object aobj[] = new Object[2];
            aobj[0] = s;
            aobj[1] = element.toString();
            throw new ScreenElementLoadException(String.format("fail to get attribute name: %s of Element %s", aobj));
        }
        return i;
    }

    public static long getAttrAsLong(Element element, String s, long l) {
        long l1 = Long.parseLong(element.getAttribute(s));
        l = l1;
_L2:
        return l;
        NumberFormatException numberformatexception;
        numberformatexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static long getAttrAsLongThrows(Element element, String s) throws ScreenElementLoadException {
        long l;
        try {
            l = Long.parseLong(element.getAttribute(s));
        }
        catch(NumberFormatException numberformatexception) {
            Object aobj[] = new Object[2];
            aobj[0] = s;
            aobj[1] = element.toString();
            throw new ScreenElementLoadException(String.format("fail to get attribute name: %s of Element %s", aobj));
        }
        return l;
    }

    public static Element getChild(Element element, String s) {
        if(element != null) goto _L2; else goto _L1
_L1:
        Element element1 = null;
_L4:
        return element1;
_L2:
        NodeList nodelist = element.getChildNodes();
        int i = 0;
        do {
            if(i >= nodelist.getLength())
                break;
            Node node = nodelist.item(i);
            if(node.getNodeType() == 1 && node.getNodeName().equalsIgnoreCase(s)) {
                element1 = (Element)node;
                continue; /* Loop/switch isn't completed */
            }
            i++;
        } while(true);
        element1 = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public static double getVariableNumber(String s, String s1, Variables variables) {
        return (new IndexedNumberVariable(s, s1, variables)).get().doubleValue();
    }

    public static double getVariableNumber(String s, Variables variables) {
        return getVariableNumber(null, s, variables);
    }

    public static String getVariableString(String s, String s1, Variables variables) {
        return (new IndexedStringVariable(s, s1, variables)).get();
    }

    public static String getVariableString(String s, Variables variables) {
        return getVariableString(null, s, variables);
    }

    public static int mixAlpha(int i, int j) {
        if(i < 255)
            if(j >= 255)
                j = i;
            else
                j = Math.round((float)(i * j) / 255F);
        return j;
    }

    public static Point pointProjectionOnSegment(Point point, Point point1, Point point2, boolean flag) {
        Point point3 = point1.minus(point);
        Point point4 = point2.minus(point);
        double d = (point3.x * point4.x + point3.y * point4.y) / Dist(point, point1, false);
        Point point5;
        if(d < 0.0D || d > 1.0D) {
            if(!flag)
                point = null;
            else
            if(d >= 0.0D)
                point = point1;
            point5 = point;
        } else {
            point5 = point3;
            point5.x = d * point5.x;
            point5.y = d * point5.y;
            point5.Offset(point);
        }
        return point5;
    }

    public static void putVariableNumber(String s, String s1, Variables variables, Double double1) {
        (new IndexedNumberVariable(s, s1, variables)).set(double1);
    }

    public static void putVariableNumber(String s, Variables variables, Double double1) {
        putVariableNumber(null, s, variables, double1);
    }

    public static void putVariableString(String s, String s1, Variables variables, String s2) {
        (new IndexedStringVariable(s, s1, variables)).set(s2);
    }

    public static void putVariableString(String s, Variables variables, String s1) {
        putVariableString(null, s, variables, s1);
    }

    public static double stringToDouble(String s, double d) {
        double d1 = Double.parseDouble(s);
        d = d1;
_L2:
        return d;
        NumberFormatException numberformatexception;
        numberformatexception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static void traverseXmlElementChildren(Element element, String s, XmlTraverseListener xmltraverselistener) {
        NodeList nodelist = element.getChildNodes();
        for(int i = 0; i < nodelist.getLength(); i++) {
            Node node = nodelist.item(i);
            if(node.getNodeType() == 1 && (s == null || TextUtils.equals(node.getNodeName(), s)))
                xmltraverselistener.onChild((Element)node);
        }

    }
}
