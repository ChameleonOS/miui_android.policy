// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.content.Context;
import android.text.format.DateFormat;
import android.util.Log;
import java.util.Calendar;
import miui.app.screenelement.*;
import miui.app.screenelement.data.Expression;
import miui.util.LunarDate;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            TextScreenElement, ScreenElement

public class DateTimeScreenElement extends TextScreenElement {

    public DateTimeScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mCalendar = Calendar.getInstance();
        mCurDay = -1;
        mValue = Expression.build(element.getAttribute("value"));
    }

    protected String getText() {
        long l;
        String s1;
        if(mValue != null)
            l = (long)mValue.evaluate(super.mContext.mVariables);
        else
            l = System.currentTimeMillis();
        if(l - mPreValue < 200L) {
            s1 = mText;
        } else {
            mCalendar.setTimeInMillis(l);
            String s = getFormat();
            if(s == null) {
                s1 = null;
            } else {
                if(s.contains("NNNN")) {
                    if(mCalendar.get(5) != mCurDay) {
                        android.content.res.Resources resources = super.mContext.mContext.getResources();
                        mLunarDate = LunarDate.getString(resources, mCalendar);
                        String s2 = LunarDate.getSolarTerm(resources, mCalendar);
                        if(s2 != null)
                            mLunarDate = (new StringBuilder()).append(mLunarDate).append(" ").append(s2).toString();
                        mCurDay = mCalendar.get(5);
                        Log.i("DateTimeScreenElement", (new StringBuilder()).append("get lunar date:").append(mLunarDate).toString());
                    }
                    s = s.replace("NNNN", mLunarDate);
                }
                mText = DateFormat.format(s, mCalendar).toString();
                mPreValue = l;
                s1 = mText;
            }
        }
        return s1;
    }

    public void resume() {
        super.resume();
        mCalendar = Calendar.getInstance();
    }

    public static final String TAG_NAME = "DateTime";
    protected Calendar mCalendar;
    private int mCurDay;
    private String mLunarDate;
    private long mPreValue;
    private String mText;
    private Expression mValue;
}
