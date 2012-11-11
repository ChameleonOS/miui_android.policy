// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.*;
import android.text.TextUtils;
import android.util.Log;
import miui.app.screenelement.*;
import miui.widget.SpectrumVisualizer;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ImageScreenElement, ScreenElement

public class SpectrumVisualizerScreenElement extends ImageScreenElement {

    public SpectrumVisualizerScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mPanelSrc = element.getAttribute("panelSrc");
        mDotbar = element.getAttribute("dotbarSrc");
        mShadow = element.getAttribute("shadowSrc");
        mSpectrumVisualizer = new SpectrumVisualizer(screencontext.mContext);
        mSpectrumVisualizer.setSoftDrawEnabled(false);
        mSpectrumVisualizer.enableUpdate(false);
    }

    public void doRender(Canvas canvas) {
        if(mPanel != null) {
            super.mPaint.setAlpha(getAlpha());
            canvas.drawBitmap(mPanel, getLeft(), getTop(), super.mPaint);
        }
        super.doRender(canvas);
    }

    public void enableUpdate(boolean flag) {
        mSpectrumVisualizer.enableUpdate(flag);
    }

    protected Bitmap getBitmap() {
        Bitmap bitmap;
        if(mCanvas == null) {
            bitmap = null;
        } else {
            mCanvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
            mCanvas.setDensity(0);
            mSpectrumVisualizer.draw(mCanvas);
            mCanvas.setDensity(mResDensity);
            bitmap = super.mBitmap;
        }
        return bitmap;
    }

    public void init() {
label0:
        {
            {
                super.init();
                Bitmap bitmap;
                Bitmap bitmap1;
                Bitmap bitmap2;
                int i;
                int j;
                if(TextUtils.isEmpty(mPanelSrc))
                    bitmap = null;
                else
                    bitmap = super.mContext.mResourceManager.getBitmap(mPanelSrc);
                mPanel = bitmap;
                if(TextUtils.isEmpty(mDotbar))
                    bitmap1 = null;
                else
                    bitmap1 = super.mContext.mResourceManager.getBitmap(mDotbar);
                if(TextUtils.isEmpty(mShadow))
                    bitmap2 = null;
                else
                    bitmap2 = super.mContext.mResourceManager.getBitmap(mShadow);
                i = (int)getWidth();
                j = (int)getHeight();
                if(i <= 0 || j <= 0) {
                    if(mPanel == null)
                        break label0;
                    i = mPanel.getWidth();
                    j = mPanel.getHeight();
                }
                if(bitmap1 == null) {
                    Log.e("SpectrumVisualizerScreenElement", "no dotbar");
                } else {
                    mSpectrumVisualizer.setBitmaps(i, j, bitmap1, bitmap2);
                    mResDensity = bitmap1.getDensity();
                    mSpectrumVisualizer.layout(0, 0, i, j);
                    super.mBitmap = Bitmap.createBitmap(i, j, android.graphics.Bitmap.Config.ARGB_8888);
                    super.mBitmap.setDensity(mResDensity);
                    mCanvas = new Canvas(super.mBitmap);
                }
            }
            return;
        }
        Log.e("SpectrumVisualizerScreenElement", "no panel or size");
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_106;
    }

    public static final String TAG_NAME = "SpectrumVisualizer";
    private Canvas mCanvas;
    private String mDotbar;
    private Bitmap mPanel;
    private String mPanelSrc;
    private int mResDensity;
    private String mShadow;
    private SpectrumVisualizer mSpectrumVisualizer;
}
