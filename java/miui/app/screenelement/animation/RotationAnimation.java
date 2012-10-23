// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.animation;

import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.animation:
//            BaseAnimation

public class RotationAnimation extends BaseAnimation {

    public RotationAnimation(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        super(element, "Rotation", screencontext);
    }

    public final float getAngle() {
        return mCurrentAngle;
    }

    protected BaseAnimation.AnimationItem onCreateItem() {
        String as[] = new String[1];
        as[0] = "angle";
        return new BaseAnimation.AnimationItem(as, super.mContext);
    }

    protected void onTick(BaseAnimation.AnimationItem animationitem, BaseAnimation.AnimationItem animationitem1, float f) {
        if(animationitem == null && animationitem1 == null) {
            mCurrentAngle = 0.0F;
        } else {
            double d;
            if(animationitem == null)
                d = 0.0D;
            else
                d = animationitem.get(0);
            mCurrentAngle = (float)(d + (animationitem1.get(0) - d) * (double)f);
        }
    }

    public static final String INNER_TAG_NAME = "Rotation";
    public static final String TAG_NAME = "RotationAnimation";
    private float mCurrentAngle;
}
