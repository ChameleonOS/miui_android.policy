// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            BaseAnimation

public class VariableAnimation extends BaseAnimation {

    public VariableAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "AniFrame", screencontext);
        mDelayValue = getItem(0).get(0);
    }

    public final double getValue() {
        return mCurrentValue;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[1];
        as[0] = "value";
        return new BaseAnimation.AnimationItem(as, super.mContext);
    }

    protected void onTick(BaseAnimation.AnimationItem animationitem, BaseAnimation.AnimationItem animationitem1, float f) {
        if(animationitem != null || animationitem1 != null) {
            double d;
            if(animationitem == null)
                d = 0.0D;
            else
                d = animationitem.get(0);
            mCurrentValue = d + (animationitem1.get(0) - d) * (double)f;
        }
    }

    public void reset(long l) {
        super.reset(l);
        mCurrentValue = mDelayValue;
    }

    public static final String INNER_TAG_NAME = "AniFrame";
    public static final String TAG_NAME = "VariableAnimation";
    private double mCurrentValue;
    private double mDelayValue;
}
