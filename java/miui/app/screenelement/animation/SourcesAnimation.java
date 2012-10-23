// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            PositionAnimation, BaseAnimation

public class SourcesAnimation extends PositionAnimation {
    public static class Source extends BaseAnimation.AnimationItem {

        public BaseAnimation.AnimationItem load(Element element) throws ScreenElementLoadException {
            mSrc = element.getAttribute("src");
            return super.load(element);
        }

        public static final String TAG_NAME = "Source";
        public String mSrc;

        public Source(String as[], ScreenContext screencontext) {
            super(as, screencontext);
        }
    }


    public SourcesAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "Source", screencontext);
    }

    public final String getSrc() {
        return mCurrentBitmap;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[2];
        as[0] = "x";
        as[1] = "y";
        return new Source(as, super.mContext);
    }

    protected void onTick(BaseAnimation.AnimationItem animationitem, BaseAnimation.AnimationItem animationitem1, float f) {
        if(animationitem1 == null) {
            super.mCurrentX = 0.0D;
            super.mCurrentY = 0.0D;
        } else {
            super.mCurrentX = animationitem1.get(0);
            super.mCurrentY = animationitem1.get(1);
            mCurrentBitmap = ((Source)animationitem1).mSrc;
        }
    }

    public static final String TAG_NAME = "SourcesAnimation";
    private String mCurrentBitmap;
}
