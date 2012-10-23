// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import android.text.TextUtils;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            BaseAnimation

public class AlphaAnimation extends BaseAnimation {

    public AlphaAnimation(Element element, String s, ScreenContext screencontext) throws ScreenElementLoadException {
        String s1;
        super(element, s, screencontext);
        mCurrentAlpha = 255;
        s1 = element.getAttribute("delayValue");
        if(TextUtils.isEmpty(s1)) goto _L2; else goto _L1
_L1:
        mDelayValue = Integer.parseInt(s1);
_L4:
        return;
_L2:
        mDelayValue = (int)getItem(0).get(0);
        continue; /* Loop/switch isn't completed */
        NumberFormatException numberformatexception;
        numberformatexception;
        if(true) goto _L4; else goto _L3
_L3:
    }

    public AlphaAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "Alpha", screencontext);
        mCurrentAlpha = 255;
        Utils.asserts(element.getNodeName().equalsIgnoreCase("AlphaAnimation"), (new StringBuilder()).append("wrong tag name:").append(element.getNodeName()).toString());
    }

    public final int getAlpha() {
        return mCurrentAlpha;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[1];
        as[0] = "a";
        return new BaseAnimation.AnimationItem(as, super.mContext);
    }

    protected void onTick(BaseAnimation.AnimationItem animationitem, BaseAnimation.AnimationItem animationitem1, float f) {
        if(animationitem != null || animationitem1 != null) {
            double d;
            if(animationitem == null)
                d = 255D;
            else
                d = animationitem.get(0);
            mCurrentAlpha = (int)Math.round(d + (animationitem1.get(0) - d) * (double)f);
        }
    }

    public void reset() {
        super.reset();
        mCurrentAlpha = mDelayValue;
    }

    public static final String INNER_TAG_NAME = "Alpha";
    public static final String TAG_NAME = "AlphaAnimation";
    private int mCurrentAlpha;
    private int mDelayValue;
}
