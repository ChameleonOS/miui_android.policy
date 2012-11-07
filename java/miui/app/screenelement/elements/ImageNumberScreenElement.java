// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.*;
import android.util.Log;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            AnimatedScreenElement, ScreenElement

public class ImageNumberScreenElement extends AnimatedScreenElement {

    public ImageNumberScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mPaint = new Paint();
        load(element);
        if(super.mHasName)
            mActualWidthVar = new IndexedNumberVariable(super.mName, "actual_w", screencontext.mVariables);
    }

    public void doRender(Canvas canvas) {
        if(isVisible()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i = getAlpha();
        String s = String.valueOf((int)mNumExpression.evaluate(super.mContext.mVariables));
        float f = getX();
        float f1 = getY();
        float f2 = 0.0F;
        mPaint.setAlpha(i);
        for(int j = 0; j < s.length(); j++) {
            Bitmap bitmap = getBitmap(s.charAt(j));
            if(bitmap != null) {
                canvas.drawBitmap(bitmap, f + f2, f1, mPaint);
                f2 += bitmap.getWidth();
            }
        }

        if(super.mHasName)
            mActualWidthVar.set(descale(f2));
        if(true) goto _L1; else goto _L3
_L3:
    }

    protected Bitmap getBitmap(char c) {
        String s = Utils.addFileNameSuffix(super.mAni.getSrc(), String.valueOf(c));
        return super.mContext.mResourceManager.getBitmap(s);
    }

    public void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("ImageNumberScreenElement", "node is null");
            throw new ScreenElementLoadException("node is null");
        } else {
            mNumExpression = Expression.build(element.getAttribute("number"));
            return;
        }
    }

    private static final String LOG_TAG = "ImageNumberScreenElement";
    public static final String TAG_NAME = "ImageNumber";
    private IndexedNumberVariable mActualWidthVar;
    private Expression mNumExpression;
    private Paint mPaint;
}
