// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.text.TextUtils;
import miui.app.screenelement.*;
import miui.widget.SpectrumVisualizer;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ImageScreenElement, ScreenElement

public class SpectrumVisualizerScreenElement extends ImageScreenElement {

    public SpectrumVisualizerScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mPanel = element.getAttribute("panelSrc");
        mDotbar = element.getAttribute("dotbarSrc");
        mShadow = element.getAttribute("shadowSrc");
        mSpectrumVisualizer = new SpectrumVisualizer(screencontext.mContext);
        mSpectrumVisualizer.setSoftDrawEnabled(false);
        mSpectrumVisualizer.enableUpdate(false);
    }

    public void enableUpdate(boolean flag) {
        mSpectrumVisualizer.enableUpdate(flag);
    }

    protected Bitmap getBitmap() {
        mCanvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        mCanvas.setDensity(0);
        mSpectrumVisualizer.draw(mCanvas);
        mCanvas.setDensity(mResDensity);
        return super.mBitmap;
    }

    public void init() {
        Bitmap bitmap;
        Bitmap bitmap1;
        Bitmap bitmap2;
        int i;
        int j;
        if(TextUtils.isEmpty(mPanel))
            bitmap = null;
        else
            bitmap = super.mContext.mResourceManager.getBitmap(mPanel);
        if(TextUtils.isEmpty(mDotbar))
            bitmap1 = null;
        else
            bitmap1 = super.mContext.mResourceManager.getBitmap(mDotbar);
        if(TextUtils.isEmpty(mShadow))
            bitmap2 = null;
        else
            bitmap2 = super.mContext.mResourceManager.getBitmap(mShadow);
        if(bitmap != null && bitmap1 != null) {
            mSpectrumVisualizer.setBitmaps(bitmap, bitmap1, bitmap2);
            mResDensity = bitmap.getDensity();
        }
        i = mSpectrumVisualizer.getVisualWidth();
        j = mSpectrumVisualizer.getVisualHeight();
        mSpectrumVisualizer.layout(0, 0, i, j);
        super.mBitmap = Bitmap.createBitmap(i, j, android.graphics.Bitmap.Config.ARGB_8888);
        super.mBitmap.setDensity(mResDensity);
        mCanvas = new Canvas(super.mBitmap);
    }

    public static final String TAG_NAME = "SpectrumVisualizer";
    private Canvas mCanvas;
    private String mDotbar;
    private String mPanel;
    private int mResDensity;
    private String mShadow;
    private SpectrumVisualizer mSpectrumVisualizer;
}
