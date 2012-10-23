// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Canvas;
import android.graphics.Color;
import android.text.*;
import android.util.Log;
import miui.app.screenelement.*;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.*;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            AnimatedScreenElement, ScreenElement

public class TextScreenElement extends AnimatedScreenElement {

    public TextScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mColor = -1;
        mPaint = new TextPaint();
        mMarqueePos = 3.402823E+38F;
        load(element);
        if(super.mHasName) {
            mTextWidthVar = new IndexedNumberVariable(super.mName, "text_width", screencontext.mVariables);
            mTextHeightVar = new IndexedNumberVariable(super.mName, "text_height", screencontext.mVariables);
        }
    }

    private android.text.Layout.Alignment getAlignment() {
        android.text.Layout.Alignment alignment = android.text.Layout.Alignment.ALIGN_NORMAL;
        class _cls1 {

            static final int $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[];

            static  {
                $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align = new int[ScreenElement.Align.values().length];
                NoSuchFieldError nosuchfielderror2;
                try {
                    $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[ScreenElement.Align.LEFT.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[ScreenElement.Align.CENTER.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                $SwitchMap$miui$app$screenelement$elements$ScreenElement$Align[ScreenElement.Align.RIGHT.ordinal()] = 3;
_L2:
                return;
                nosuchfielderror2;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls1..SwitchMap.miui.app.screenelement.elements.ScreenElement.Align[super.mAlign.ordinal()];
        JVM INSTR tableswitch 1 3: default 40
    //                   1 42
    //                   2 49
    //                   3 56;
           goto _L1 _L2 _L3 _L4
_L1:
        return alignment;
_L2:
        alignment = android.text.Layout.Alignment.ALIGN_LEFT;
        continue; /* Loop/switch isn't completed */
_L3:
        alignment = android.text.Layout.Alignment.ALIGN_CENTER;
        continue; /* Loop/switch isn't completed */
_L4:
        alignment = android.text.Layout.Alignment.ALIGN_RIGHT;
        if(true) goto _L1; else goto _L5
_L5:
    }

    private void updateTextWidth() {
        if(!TextUtils.isEmpty(mText)) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(mSizeExpression != null)
            mPaint.setTextSize(scale(mSizeExpression.evaluate(super.mContext.mVariables)));
        mTextWidth = mPaint.measureText(mText);
        if(super.mHasName)
            mTextWidthVar.set(descale(mTextWidth));
        if(true) goto _L1; else goto _L3
_L3:
    }

    protected String getFormat() {
        return mFormatter.getFormat(super.mContext.mVariables);
    }

    protected String getText() {
        return mFormatter.getText(super.mContext.mVariables);
    }

    public void init() {
        super.init();
        mText = getText();
        updateTextWidth();
    }

    public void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("TextScreenElement", "node is null");
            throw new ScreenElementLoadException("node is null");
        }
        mFormatter = TextFormatter.fromElement(element);
        boolean flag;
        try {
            mColor = Color.parseColor(element.getAttribute("color"));
        }
        catch(IllegalArgumentException illegalargumentexception) {
            mColor = -1;
        }
        mSizeExpression = Expression.build(element.getAttribute("size"));
        mMarqueeSpeed = Utils.getAttrAsInt(element, "marqueeSpeed", 0);
        flag = Boolean.parseBoolean(element.getAttribute("bold"));
        mSpacingMult = Utils.getAttrAsFloat(element, "spacingMult", 1.0F);
        mSpacingAdd = Utils.getAttrAsFloat(element, "spacingAdd", 0.0F);
        mMultiLine = Boolean.parseBoolean(element.getAttribute("multiLine"));
        mPaint.setColor(mColor);
        mPaint.setTextSize(18F);
        mPaint.setAntiAlias(true);
        mPaint.setFakeBoldText(flag);
    }

    protected void onVisibilityChange(boolean flag) {
        super.onVisibilityChange(flag);
        float f = getWidth();
        String s = getText();
        if(s == null) {
            requestFramerate(0.0F);
        } else {
            int i = (int)mPaint.measureText(s);
            if(flag && mMarqueeSpeed > 0 && f > 0.0F && (float)i > f)
                requestFramerate(30F);
            else
                requestFramerate(0.0F);
        }
    }

    public void render(Canvas canvas) {
        if(isVisible() && !TextUtils.isEmpty(mText)) {
            mPaint.setAlpha(getAlpha());
            float f = getWidth();
            if(f < 0.0F || f > mTextWidth)
                f = mTextWidth;
            float f1 = getHeight();
            float f2 = mPaint.getTextSize();
            if(f1 < 0.0F && mTextLayout == null)
                f1 = f2;
            float f3 = getLeft(getX(), f);
            float f4;
            if(f1 > 0.0F)
                f4 = getTop(getY(), f1);
            else
                f4 = getY();
            canvas.save();
            canvas.rotate(getAngle(), f3 + getCenterX(), f4 + getCenterY());
            if(f > 0.0F && f1 > 0.0F)
                canvas.clipRect(f3, f4 - 10F, f3 + f, 20F + (f4 + f1));
            if(mTextLayout != null) {
                int i = mTextLayout.getLineCount();
                for(int j = 0; j < i; j++) {
                    int k = mTextLayout.getLineStart(j);
                    int l = mTextLayout.getLineEnd(j);
                    int i1 = mTextLayout.getLineTop(j);
                    float f6 = mTextLayout.getLineLeft(j);
                    canvas.drawText(mText, k, l, f3 + f6, f4 + f2 + (float)i1, mPaint);
                }

            } else {
                String s = mText;
                float f5;
                if(mMarqueePos == 3.402823E+38F)
                    f5 = 0.0F;
                else
                    f5 = mMarqueePos;
                canvas.drawText(s, f5 + f3, f4 + f2, mPaint);
            }
            canvas.restore();
        }
    }

    public void setText(String s) {
        mFormatter.setText(s);
    }

    public void tick(long l) {
        super.tick(l);
        if(isVisible()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        float f;
        mText = getText();
        if(TextUtils.isEmpty(mText)) {
            mTextLayout = null;
            continue; /* Loop/switch isn't completed */
        }
        updateTextWidth();
        f = getWidth();
        if(f <= 0.0F || mTextWidth <= f) goto _L4; else goto _L3
_L3:
        if(mMultiLine) {
            if(mTextLayout == null || !mPreText.equals(mText)) {
                mPreText = mText;
                mTextLayout = new StaticLayout(mText, mPaint, (int)f, getAlignment(), mSpacingMult, mSpacingAdd, true);
                if(super.mHasName)
                    mTextHeightVar.set(descale(mTextLayout.getLineTop(mTextLayout.getLineCount())));
            }
            continue; /* Loop/switch isn't completed */
        }
        if(mMarqueeSpeed <= 0)
            continue; /* Loop/switch isn't completed */
        if(mMarqueePos != 3.402823E+38F) goto _L6; else goto _L5
_L5:
        mMarqueePos = 50F;
_L7:
        mPreviousTime = l;
        continue; /* Loop/switch isn't completed */
_L6:
        mMarqueePos = mMarqueePos - (float)((long)mMarqueeSpeed * (l - mPreviousTime)) / 1000F;
        if(mMarqueePos < f - mTextWidth - 50F)
            mMarqueePos = 50F;
        if(true) goto _L7; else goto _L4
_L4:
        mTextLayout = null;
        mMarqueePos = 3.402823E+38F;
        if(true) goto _L1; else goto _L8
_L8:
    }

    private static final int DEFAULT_SIZE = 18;
    private static final String LOG_TAG = "TextScreenElement";
    private static final int MARQUEE_FRAMERATE = 30;
    private static final int PADDING = 50;
    public static final String TAG_NAME = "Text";
    public static final String TEXT_HEIGHT = "text_height";
    public static final String TEXT_WIDTH = "text_width";
    private int mColor;
    private TextFormatter mFormatter;
    private float mMarqueePos;
    private int mMarqueeSpeed;
    private boolean mMultiLine;
    private TextPaint mPaint;
    private String mPreText;
    private long mPreviousTime;
    private Expression mSizeExpression;
    private float mSpacingAdd;
    private float mSpacingMult;
    private String mText;
    private IndexedNumberVariable mTextHeightVar;
    private StaticLayout mTextLayout;
    private float mTextWidth;
    private IndexedNumberVariable mTextWidthVar;
}
