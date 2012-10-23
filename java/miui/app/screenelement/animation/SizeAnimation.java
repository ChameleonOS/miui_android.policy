// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            BaseAnimation

public class SizeAnimation extends BaseAnimation {

    public SizeAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "Size", screencontext);
        Utils.asserts(element.getNodeName().equalsIgnoreCase("SizeAnimation"), (new StringBuilder()).append("wrong tag name:").append(element.getNodeName()).toString());
        Iterator iterator = super.mItems.iterator();
        do {
            if(!iterator.hasNext())
                break;
            BaseAnimation.AnimationItem animationitem1 = (BaseAnimation.AnimationItem)iterator.next();
            if(animationitem1.get(0) > mMaxW)
                mMaxW = animationitem1.get(0);
            if(animationitem1.get(1) > mMaxH)
                mMaxH = animationitem1.get(1);
        } while(true);
        BaseAnimation.AnimationItem animationitem = getItem(0);
        mDelayW = animationitem.get(0);
        mDelayH = animationitem.get(1);
    }

    public final double getHeight() {
        return mCurrentH;
    }

    public final double getMaxHeight() {
        return mMaxH;
    }

    public final double getMaxWidth() {
        return mMaxW;
    }

    public final double getWidth() {
        return mCurrentW;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[2];
        as[0] = "w";
        as[1] = "h";
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
            mCurrentW = d1 + (animationitem1.get(0) - d1) * (double)f;
            mCurrentH = d + (animationitem1.get(1) - d) * (double)f;
        }
    }

    public void reset(long l) {
        super.reset(l);
        mCurrentW = mDelayW;
        mCurrentH = mDelayH;
    }

    public static final String INNER_TAG_NAME = "Size";
    public static final String TAG_NAME = "SizeAnimation";
    private double mCurrentH;
    private double mCurrentW;
    private double mDelayH;
    private double mDelayW;
    private double mMaxH;
    private double mMaxW;
}
