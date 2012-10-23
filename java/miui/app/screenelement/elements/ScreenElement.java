// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import android.text.TextUtils;
import android.view.MotionEvent;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementRoot;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.IndexedNumberVariable;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ElementGroup

public abstract class ScreenElement {
    protected static final class Align extends Enum {

        public static Align valueOf(String s) {
            return (Align)Enum.valueOf(miui/app/screenelement/elements/ScreenElement$Align, s);
        }

        public static Align[] values() {
            return (Align[])$VALUES.clone();
        }

        private static final Align $VALUES[];
        public static final Align CENTER;
        public static final Align LEFT;
        public static final Align RIGHT;

        static  {
            LEFT = new Align("LEFT", 0);
            CENTER = new Align("CENTER", 1);
            RIGHT = new Align("RIGHT", 2);
            Align aalign[] = new Align[3];
            aalign[0] = LEFT;
            aalign[1] = CENTER;
            aalign[2] = RIGHT;
            $VALUES = aalign;
        }

        private Align(String s, int i) {
            super(s, i);
        }
    }

    protected static final class AlignV extends Enum {

        public static AlignV valueOf(String s) {
            return (AlignV)Enum.valueOf(miui/app/screenelement/elements/ScreenElement$AlignV, s);
        }

        public static AlignV[] values() {
            return (AlignV[])$VALUES.clone();
        }

        private static final AlignV $VALUES[];
        public static final AlignV BOTTOM;
        public static final AlignV CENTER;
        public static final AlignV TOP;

        static  {
            TOP = new AlignV("TOP", 0);
            CENTER = new AlignV("CENTER", 1);
            BOTTOM = new AlignV("BOTTOM", 2);
            AlignV aalignv[] = new AlignV[3];
            aalignv[0] = TOP;
            aalignv[1] = CENTER;
            aalignv[2] = BOTTOM;
            $VALUES = aalignv;
        }

        private AlignV(String s, int i) {
            super(s, i);
        }
    }


    public ScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) {
        mShow = true;
        mIsVisible = true;
        mContext = screencontext;
        mRoot = screenelementroot;
        if(element != null) {
            mCategory = element.getAttribute("category");
            mName = element.getAttribute("name");
            boolean flag;
            String s;
            String s1;
            String s2;
            if(!TextUtils.isEmpty(mName))
                flag = true;
            else
                flag = false;
            mHasName = flag;
            s = element.getAttribute("visibility");
            if(!TextUtils.isEmpty(s))
                if(s.equalsIgnoreCase("false"))
                    mShow = false;
                else
                if(s.equalsIgnoreCase("true"))
                    mShow = true;
                else
                    mVisibilityExpression = Expression.build(s);
            mAlign = Align.LEFT;
            s1 = element.getAttribute("align");
            if(s1.equalsIgnoreCase("right"))
                mAlign = Align.RIGHT;
            else
            if(s1.equalsIgnoreCase("left"))
                mAlign = Align.LEFT;
            else
            if(s1.equalsIgnoreCase("center"))
                mAlign = Align.CENTER;
            mAlignV = AlignV.TOP;
            s2 = element.getAttribute("alignV");
            if(s2.equalsIgnoreCase("bottom"))
                mAlignV = AlignV.BOTTOM;
            else
            if(s2.equalsIgnoreCase("top"))
                mAlignV = AlignV.TOP;
            else
            if(s2.equalsIgnoreCase("center"))
                mAlignV = AlignV.CENTER;
        }
    }

    protected float descale(float f) {
        return f / mRoot.getScale();
    }

    public ScreenElement findElement(String s) {
        if(!mName.equals(s))
            this = null;
        return this;
    }

    public void finish() {
    }

    protected float getFramerate() {
        float f;
        if(mFramerateToken == null)
            f = 0.0F;
        else
            f = mFramerateToken.getFramerate();
        return f;
    }

    protected float getLeft(float f, float f1) {
        if(f1 > 0.0F) goto _L2; else goto _L1
_L1:
        return f;
_L2:
        float f2;
        f2 = f;
        class _cls1 {

            static final int $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[];
            static final int $SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV[];

            static  {
                $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align = new int[Align.values().length];
                NoSuchFieldError nosuchfielderror3;
                try {
                    $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[Align.CENTER.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[Align.RIGHT.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                $SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV = new int[AlignV.values().length];
                try {
                    $SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV[AlignV.CENTER.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                $SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV[AlignV.BOTTOM.ordinal()] = 2;
_L2:
                return;
                nosuchfielderror3;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        switch(_cls1..SwitchMap.miui.app.screenelement.elements.ScreenElement.Align[mAlign.ordinal()]) {
        default:
            break;

        case 1: // '\001'
            break; /* Loop/switch isn't completed */

        case 2: // '\002'
            break;
        }
        break MISSING_BLOCK_LABEL_58;
_L4:
        f = f2;
        if(true) goto _L1; else goto _L3
_L3:
        f2 -= f1 / 2.0F;
          goto _L4
        f2 -= f1;
          goto _L4
    }

    public String getName() {
        return mName;
    }

    protected float getTop(float f, float f1) {
        if(f1 > 0.0F) goto _L2; else goto _L1
_L1:
        return f;
_L2:
        float f2;
        f2 = f;
        switch(_cls1..SwitchMap.miui.app.screenelement.elements.ScreenElement.AlignV[mAlignV.ordinal()]) {
        default:
            break;

        case 1: // '\001'
            break; /* Loop/switch isn't completed */

        case 2: // '\002'
            break;
        }
        break MISSING_BLOCK_LABEL_58;
_L4:
        f = f2;
        if(true) goto _L1; else goto _L3
_L3:
        f2 -= f1 / 2.0F;
          goto _L4
        f2 -= f1;
          goto _L4
    }

    public void init() {
        reset();
        updateVisibility();
        if(isVisible())
            onVisibilityChange(true);
    }

    public boolean isVisible() {
        return mIsVisible;
    }

    protected boolean isVisibleInner() {
        boolean flag;
        if(mShow && (mVisibilityExpression == null || mVisibilityExpression.evaluate(mContext.mVariables) > 0.0D))
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean onTouch(MotionEvent motionevent) {
        return false;
    }

    protected void onVisibilityChange(boolean flag) {
        if(mHasName) {
            if(mVisibilityVar == null)
                mVisibilityVar = new IndexedNumberVariable(mName, "visibility", mContext.mVariables);
            IndexedNumberVariable indexednumbervariable = mVisibilityVar;
            double d;
            if(flag)
                d = 1.0D;
            else
                d = 0.0D;
            indexednumbervariable.set(d);
        }
    }

    public void pause() {
    }

    public abstract void render(Canvas canvas);

    protected void requestFramerate(float f) {
        if(f >= 0.0F) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(mFramerateToken == null) {
            if(f == 0.0F)
                continue; /* Loop/switch isn't completed */
            mFramerateToken = mContext.createToken(toString());
        }
        if(mFramerateToken != null)
            mFramerateToken.requestFramerate(f);
        if(true) goto _L1; else goto _L3
_L3:
    }

    public void requestUpdate() {
        mContext.requestUpdate();
    }

    public void reset() {
    }

    public void resume() {
        updateVisibility();
    }

    protected float scale(double d) {
        return (float)(d * (double)mRoot.getScale());
    }

    protected void setActualHeight(double d) {
        if(mHasName) {
            if(mActualHeightVar == null)
                mActualHeightVar = new IndexedNumberVariable(mName, "actual_h", mContext.mVariables);
            mActualHeightVar.set(d);
        }
    }

    protected void setActualWidth(double d) {
        if(mHasName) {
            if(mActualWidthVar == null)
                mActualWidthVar = new IndexedNumberVariable(mName, "actual_w", mContext.mVariables);
            mActualWidthVar.set(d);
        }
    }

    public void setParent(ElementGroup elementgroup) {
        mParent = elementgroup;
    }

    public void show(boolean flag) {
        mShow = flag;
        updateVisibility();
    }

    public void showCategory(String s, boolean flag) {
        if(mCategory.equals(s))
            show(flag);
    }

    public void tick(long l) {
        updateVisibility();
    }

    protected void updateVisibility() {
        boolean flag = isVisibleInner();
        if(mIsVisible != flag) {
            mIsVisible = flag;
            onVisibilityChange(mIsVisible);
        }
    }

    public static final String ACTUAL_H = "actual_h";
    public static final String ACTUAL_W = "actual_w";
    public static final String ACTUAL_X = "actual_x";
    public static final String ACTUAL_Y = "actual_y";
    public static final String VISIBILITY = "visibility";
    public static final int VISIBILITY_FALSE = 0;
    public static final int VISIBILITY_TRUE = 1;
    private IndexedNumberVariable mActualHeightVar;
    private IndexedNumberVariable mActualWidthVar;
    protected Align mAlign;
    protected AlignV mAlignV;
    protected String mCategory;
    protected ScreenContext mContext;
    private miui.app.screenelement.FramerateTokenList.FramerateToken mFramerateToken;
    protected boolean mHasName;
    protected boolean mIsVisible;
    protected String mName;
    protected ElementGroup mParent;
    protected ScreenElementRoot mRoot;
    private boolean mShow;
    private Expression mVisibilityExpression;
    private IndexedNumberVariable mVisibilityVar;
}
