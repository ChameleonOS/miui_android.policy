// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import miui.app.screenelement.*;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement.elements:
//            ElementGroup, ScreenElement

public class VirtualScreen extends ElementGroup {

    public VirtualScreen(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
    }

    public void finish() {
        mScreenBitmap.recycle();
    }

    public Bitmap getBitmap() {
        return mScreenBitmap;
    }

    public void init() {
        super.init();
        float f = getWidth();
        if(f < 0.0F)
            f = scale(Utils.getVariableNumber("screen_width", super.mContext.mVariables));
        float f1 = getHeight();
        if(f1 < 0.0F)
            f1 = scale(Utils.getVariableNumber("screen_height", super.mContext.mVariables));
        mScreenBitmap = Bitmap.createBitmap(Math.round(f), Math.round(f1), android.graphics.Bitmap.Config.ARGB_8888);
        mScreenBitmap.setDensity(super.mRoot.getTargetDensity());
        mScreenCanvas = new Canvas(mScreenBitmap);
    }

    public void render(Canvas canvas) {
        mScreenCanvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        super.render(mScreenCanvas);
    }

    public static final String TAG_NAME = "VirtualScreen";
    private Bitmap mScreenBitmap;
    private Canvas mScreenCanvas;
}
