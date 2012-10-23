// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            BaseAnimation

public class PositionAnimation extends BaseAnimation {

    public PositionAnimation(Element element, String s, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, s, screencontext);
        BaseAnimation.AnimationItem animationitem = getItem(0);
        mDelayX = animationitem.get(0);
        mDelayY = animationitem.get(1);
    }

    public PositionAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "Position", screencontext);
        Utils.asserts(element.getNodeName().equalsIgnoreCase("PositionAnimation"), (new StringBuilder()).append("wrong tag name:").append(element.getNodeName()).toString());
    }

    public final double getX() {
        return mCurrentX;
    }

    public final double getY() {
        return mCurrentY;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[2];
        as[0] = "x";
        as[1] = "y";
        return new BaseAnimation.AnimationItem(as, super.mContext);
    }

    protected void onTick(BaseAnimation.AnimationItem animationitem, BaseAnimation.AnimationItem animationitem1, float f) {
        double d = 0.0D;
        if(animationitem != null || animationitem1 != null) {
            double d1;
            if(animationitem == null)
                d1 = d;
            else
                d1 = animationitem.get(0);
            if(animationitem != null)
                d = animationitem.get(1);
            mCurrentX = d1 + (animationitem1.get(0) - d1) * (double)f;
            mCurrentY = d + (animationitem1.get(1) - d) * (double)f;
        }
    }

    public void reset(long l) {
        super.reset(l);
        mCurrentX = mDelayX;
        mCurrentY = mDelayY;
    }

    public static final String INNER_TAG_NAME = "Position";
    public static final String TAG_NAME = "PositionAnimation";
    protected double mCurrentX;
    protected double mCurrentY;
    protected double mDelayX;
    protected double mDelayY;
}
