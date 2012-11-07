// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.elements;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.*;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextUtils;
import android.util.Log;
import java.util.*;
import miui.app.screenelement.*;
import miui.app.screenelement.animation.AnimatedElement;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.util.IndexedNumberVariable;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

// Referenced classes of package miui.app.screenelement.elements:
//            AnimatedScreenElement, ScreenElement, VirtualScreen

public class ImageScreenElement extends AnimatedScreenElement {
    private static class pair {

        public Object p1;
        public Object p2;

        private pair() {
        }

    }

    private static final class SrcType extends Enum {

        public static SrcType valueOf(String s) {
            return (SrcType)Enum.valueOf(miui/app/screenelement/elements/ImageScreenElement$SrcType, s);
        }

        public static SrcType[] values() {
            return (SrcType[])$VALUES.clone();
        }

        private static final SrcType $VALUES[];
        public static final SrcType ApplicationIcon;
        public static final SrcType ResourceImage;
        public static final SrcType VirtualScreen;

        static  {
            ResourceImage = new SrcType("ResourceImage", 0);
            VirtualScreen = new SrcType("VirtualScreen", 1);
            ApplicationIcon = new SrcType("ApplicationIcon", 2);
            SrcType asrctype[] = new SrcType[3];
            asrctype[0] = ResourceImage;
            asrctype[1] = VirtualScreen;
            asrctype[2] = ApplicationIcon;
            $VALUES = asrctype;
        }

        private SrcType(String s, int i) {
            super(s, i);
        }
    }


    public ImageScreenElement(Element element, ScreenContext screencontext, ScreenElementRoot screenelementroot) throws ScreenElementLoadException {
        super(element, screencontext, screenelementroot);
        mMaskPaint = new Paint();
        mPaint = new Paint();
        mDesRect = new Rect();
        mSrcType = SrcType.ResourceImage;
        load(element);
        mAntiAlias = true;
        mPaint.setFilterBitmap(mAntiAlias);
        mMaskPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
        mSrcX = Expression.build(element.getAttribute("srcX"));
        mSrcY = Expression.build(element.getAttribute("srcY"));
        mSrcW = Expression.build(element.getAttribute("srcW"));
        mSrcH = Expression.build(element.getAttribute("srcH"));
        if(mSrcX != null && mSrcY != null && mSrcW != null && mSrcH != null)
            mSrcRect = new Rect();
        mUseVirtualScreen = Boolean.parseBoolean(element.getAttribute("useVirtualScreen"));
        String s = element.getAttribute("srcType");
        if(s.equals("ResourceImage"))
            mSrcType = SrcType.ResourceImage;
        else
        if(mUseVirtualScreen || s.equals("VirtualScreen"))
            mSrcType = SrcType.VirtualScreen;
        else
        if(s.equals("ApplicationIcon"))
            mSrcType = SrcType.ApplicationIcon;
        else
            mSrcType = SrcType.ResourceImage;
        if(super.mHasName) {
            mBmpSizeWidthVar = new IndexedNumberVariable(super.mName, "bmp_width", screencontext.mVariables);
            mBmpSizeHeightVar = new IndexedNumberVariable(super.mName, "bmp_height", screencontext.mVariables);
        }
    }

    private String getKey() {
        if(mKey == null)
            mKey = UUID.randomUUID().toString();
        return mKey;
    }

    private void loadMask(Element element) throws ScreenElementLoadException {
        if(mMasks == null)
            mMasks = new ArrayList();
        mMasks.clear();
        NodeList nodelist = element.getElementsByTagName("Mask");
        for(int i = 0; i < nodelist.getLength(); i++)
            mMasks.add(new AnimatedElement((Element)nodelist.item(i), super.mContext));

    }

    private void renderWithMask(Canvas canvas, AnimatedElement animatedelement, float f, float f1) {
        Bitmap bitmap;
        canvas.save();
        bitmap = super.mContext.mResourceManager.getBitmap(animatedelement.getSrc());
        if(bitmap != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        double d;
        double d1;
        float f2;
        float f5;
        d = scale(animatedelement.getX());
        d1 = scale(animatedelement.getY());
        f2 = animatedelement.getRotationAngle();
        if(animatedelement.isAlignAbsolute()) {
            f5 = getRotation();
            if(f5 != 0.0F)
                break; /* Loop/switch isn't completed */
            d -= f;
            d1 -= f1;
        }
_L4:
        float f3 = (float)(d + (double)scale(animatedelement.getPivotX()));
        float f4 = (float)(d1 + (double)scale(animatedelement.getPivotY()));
        canvas.rotate(f2, f3, f4);
        int i = (int)d;
        int j = (int)d1;
        int k = Math.round(scale(animatedelement.getWidth()));
        if(k < 0)
            k = bitmap.getWidth();
        int l = Math.round(scale(animatedelement.getHeight()));
        if(l < 0)
            l = bitmap.getHeight();
        mDesRect.set(i, j, i + k, j + l);
        mMaskPaint.setAlpha(animatedelement.getAlpha());
        canvas.drawBitmap(bitmap, null, mDesRect, mMaskPaint);
        canvas.restore();
        if(true) goto _L1; else goto _L3
_L3:
        f2 -= f5;
        double d2 = (3.1415926535896999D * (double)f5) / 180D;
        double d3 = getPivotX();
        double d4 = getPivotY();
        if(mRotateXYpair == null)
            mRotateXYpair = new pair();
        rotateXY(d3, d4, d2, mRotateXYpair);
        double d5 = (double)f + ((Double)mRotateXYpair.p1).doubleValue();
        double d6 = (double)f1 + ((Double)mRotateXYpair.p2).doubleValue();
        rotateXY(animatedelement.getPivotX(), animatedelement.getPivotY(), (3.1415926535896999D * (double)animatedelement.getRotationAngle()) / 180D, mRotateXYpair);
        double d7 = d + (double)scale(((Double)mRotateXYpair.p1).doubleValue());
        double d8 = d1 + (double)scale(((Double)mRotateXYpair.p2).doubleValue());
        double d9 = d7 - d5;
        double d10 = d8 - d6;
        double d11 = Math.sqrt(d9 * d9 + d10 * d10);
        double d12 = Math.asin(d9 / d11);
        double d13;
        if(d10 > 0.0D)
            d13 = d2 + d12;
        else
            d13 = (3.1415926535896999D + d2) - d12;
        d = d11 * Math.sin(d13);
        d1 = d11 * Math.cos(d13);
          goto _L4
        if(true) goto _L1; else goto _L5
_L5:
    }

    private void rotateXY(double d, double d1, double d2, pair pair1) {
        double d3 = Math.sqrt(d * d + d1 * d1);
        if(d3 > 0.0D) {
            double d4 = 3.1415926535896999D - Math.acos(d / d3) - d2;
            pair1.p1 = Double.valueOf(d + d3 * Math.cos(d4));
            pair1.p2 = Double.valueOf(d1 - d3 * Math.sin(d4));
        } else {
            pair1.p1 = Double.valueOf(0.0D);
            pair1.p2 = Double.valueOf(0.0D);
        }
    }

    private void updateBmpSizeVar() {
        if(super.mHasName && mBitmapChanged) {
            mBmpSizeWidthVar.set(descale(getBitmapWidth()));
            mBmpSizeHeightVar.set(descale(getBitmapHeight()));
            mBitmapChanged = false;
        }
    }

    public void doRender(Canvas canvas) {
        Bitmap bitmap = mCurrentBitmap;
        if(bitmap != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag;
        float f;
        float f1;
        flag = canvas.isHardwareAccelerated();
        int i = getAlpha();
        mPaint.setAlpha(i);
        int j = canvas.getDensity();
        canvas.setDensity(0);
        if(mWidth == 0.0F || mHeight == 0.0F)
            continue; /* Loop/switch isn't completed */
        f = getLeft(mX, mWidth);
        f1 = getTop(mY, mHeight);
        canvas.save();
        if(mMasks.size() != 0)
            break; /* Loop/switch isn't completed */
        if(bitmap.getNinePatchChunk() != null) {
            NinePatch ninepatch = super.mContext.mResourceManager.getNinePatch(super.mAni.getSrc());
            if(ninepatch != null) {
                mDesRect.set((int)f, (int)f1, (int)(f + mWidth), (int)(f1 + mHeight));
                ninepatch.draw(canvas, mDesRect, mPaint);
            } else {
                Log.e("ImageScreenElement", (new StringBuilder()).append("the image contains ninepatch chunk but couldn't get NinePatch object: ").append(super.mAni.getSrc()).toString());
            }
        } else
        if(mAniWidth > 0.0F || mAniHeight > 0.0F || mSrcRect != null) {
            mDesRect.set((int)f, (int)f1, (int)(f + mWidth), (int)(f1 + mHeight));
            if(mSrcRect != null) {
                int i2 = (int)scale(mSrcX.evaluate(super.mContext.mVariables));
                int j2 = (int)scale(mSrcY.evaluate(super.mContext.mVariables));
                int k2 = (int)scale(mSrcW.evaluate(super.mContext.mVariables));
                int l2 = (int)scale(mSrcH.evaluate(super.mContext.mVariables));
                mSrcRect.set(i2, j2, i2 + k2, j2 + l2);
            }
            canvas.drawBitmap(bitmap, mSrcRect, mDesRect, mPaint);
        } else {
            canvas.drawBitmap(bitmap, f, f1, mPaint);
        }
_L4:
        canvas.restore();
        canvas.setDensity(j);
        if(true) goto _L1; else goto _L3
_L3:
        float f2 = getMaxWidth();
        float f3 = getMaxHeight();
        float f4 = Math.max(f2, mWidth);
        float f5 = Math.max(f3, mHeight);
        int k = (int)Math.ceil(f4);
        int l = (int)Math.ceil(f5);
        if(mMaskBuffer == null || k > mMaskBuffer.getWidth() || l > mMaskBuffer.getHeight() || !flag) {
            mMaskBuffer = super.mContext.mResourceManager.getMaskBufferBitmap(k, l, getKey(), flag);
            mMaskBuffer.setDensity(bitmap.getDensity());
            mBufferCanvas = new Canvas(mMaskBuffer);
        }
        mBufferCanvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        float f6 = super.mRoot.getScale();
        Iterator iterator;
        AnimatedElement animatedelement;
        if(mAniWidth > 0.0F || mAniHeight > 0.0F || mSrcRect != null) {
            mDesRect.set(0, 0, (int)mWidth, (int)mHeight);
            if(mSrcRect != null) {
                int i1 = (int)((double)f6 * mSrcX.evaluate(super.mContext.mVariables));
                int j1 = (int)((double)f6 * mSrcY.evaluate(super.mContext.mVariables));
                int k1 = (int)((double)f6 * mSrcW.evaluate(super.mContext.mVariables));
                int l1 = (int)((double)f6 * mSrcH.evaluate(super.mContext.mVariables));
                mSrcRect.set(i1, j1, i1 + k1, j1 + l1);
            }
            mBufferCanvas.drawBitmap(bitmap, mSrcRect, mDesRect, mPaint);
        } else {
            mBufferCanvas.drawBitmap(bitmap, 0.0F, 0.0F, null);
        }
        for(iterator = mMasks.iterator(); iterator.hasNext(); renderWithMask(mBufferCanvas, animatedelement, f, f1))
            animatedelement = (AnimatedElement)iterator.next();

        canvas.drawBitmap(mMaskBuffer, f, f1, mPaint);
          goto _L4
        if(true) goto _L1; else goto _L5
_L5:
    }

    protected Bitmap getBitmap() {
        class _cls1 {

            static final int $SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType[];

            static  {
                $SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType = new int[SrcType.values().length];
                NoSuchFieldError nosuchfielderror1;
                try {
                    $SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType[SrcType.VirtualScreen.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                $SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType[SrcType.ApplicationIcon.ordinal()] = 2;
_L2:
                return;
                nosuchfielderror1;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls1..SwitchMap.miui.app.screenelement.elements.ImageScreenElement.SrcType[mSrcType.ordinal()];
        JVM INSTR tableswitch 1 2: default 32
    //                   1 46
    //                   2 69;
           goto _L1 _L2 _L3
_L1:
        Bitmap bitmap;
        if(mBitmap != null) {
            bitmap = mBitmap;
        } else {
            String s = super.mAni.getSrc();
            if(!TextUtils.equals(mCachedBitmapName, s)) {
                mCachedBitmapName = s;
                mCachedBitmap = super.mContext.mResourceManager.getBitmap(s);
                mBitmapChanged = true;
            }
            bitmap = mCachedBitmap;
        }
_L5:
        return bitmap;
_L2:
        if(mVirtualScreen != null)
            bitmap = mVirtualScreen.getBitmap();
        else
            bitmap = null;
        continue; /* Loop/switch isn't completed */
_L3:
        bitmap = mBitmap;
        if(true) goto _L5; else goto _L4
_L4:
    }

    protected int getBitmapHeight() {
        int i;
        if(mCurrentBitmap != null)
            i = mCurrentBitmap.getHeight();
        else
            i = 0;
        return i;
    }

    protected int getBitmapWidth() {
        int i;
        if(mCurrentBitmap != null)
            i = mCurrentBitmap.getWidth();
        else
            i = 0;
        return i;
    }

    public float getHeight() {
        return mHeight;
    }

    public float getWidth() {
        return mWidth;
    }

    public float getX() {
        return mX;
    }

    public float getY() {
        return mY;
    }

    public void init() {
        super.init();
        if(mMasks != null) {
            for(Iterator iterator = mMasks.iterator(); iterator.hasNext(); ((AnimatedElement)iterator.next()).init());
        }
        mBitmapChanged = true;
        _cls1..SwitchMap.miui.app.screenelement.elements.ImageScreenElement.SrcType[mSrcType.ordinal()];
        JVM INSTR tableswitch 1 2: default 84
    //                   1 85
    //                   2 121;
           goto _L1 _L2 _L3
_L1:
        return;
_L2:
        ScreenElement screenelement = super.mRoot.findElement(super.mAni.getSrc());
        if(screenelement instanceof VirtualScreen)
            mVirtualScreen = (VirtualScreen)screenelement;
        continue; /* Loop/switch isn't completed */
_L3:
        String s = super.mAni.getSrc();
        if(s != null) {
            String as[] = s.split(",");
            if(as.length == 2)
                try {
                    android.graphics.drawable.Drawable drawable = super.mContext.mContext.getPackageManager().getActivityIcon(new ComponentName(as[0], as[1]));
                    if(drawable instanceof BitmapDrawable)
                        mBitmap = ((BitmapDrawable)drawable).getBitmap();
                }
                catch(android.content.pm.PackageManager.NameNotFoundException namenotfoundexception) {
                    Log.e("ImageScreenElement", (new StringBuilder()).append("fail to get icon for src of ApplicationIcon type: ").append(s).toString());
                }
            else
                Log.e("ImageScreenElement", (new StringBuilder()).append("invalid src of ApplicationIcon type: ").append(s).toString());
        } else {
            Log.e("ImageScreenElement", (new StringBuilder()).append("invalid src of ApplicationIcon type: ").append(s).toString());
        }
        if(true) goto _L1; else goto _L4
_L4:
    }

    public void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("ImageScreenElement", "node is null");
            throw new ScreenElementLoadException("node is null");
        } else {
            loadMask(element);
            return;
        }
    }

    public void reset(long l) {
        super.reset(l);
        if(mMasks != null) {
            for(Iterator iterator = mMasks.iterator(); iterator.hasNext(); ((AnimatedElement)iterator.next()).reset(l));
        }
    }

    public void setBitmap(Bitmap bitmap) {
        mBitmap = bitmap;
    }

    protected boolean shouldScaleBitmap() {
        return true;
    }

    public void tick(long l) {
        super.tick(l);
        if(isVisible()) {
            mCurrentBitmap = getBitmap();
            updateBmpSizeVar();
            if(mMasks != null) {
                for(Iterator iterator = mMasks.iterator(); iterator.hasNext(); ((AnimatedElement)iterator.next()).tick(l));
            }
            mAniWidth = super.getWidth();
            mBmpWidth = getBitmapWidth();
            if(mAniWidth >= 0.0F)
                mWidth = mAniWidth;
            else
                mWidth = mBmpWidth;
            mAniHeight = super.getHeight();
            mBmpHeight = getBitmapHeight();
            if(mAniHeight >= 0.0F)
                mHeight = mAniHeight;
            else
                mHeight = mBmpHeight;
            mX = super.getX();
            mY = super.getY();
        }
    }

    private static final String LOG_TAG = "ImageScreenElement";
    public static final String MASK_TAG_NAME = "Mask";
    public static final String TAG_NAME = "Image";
    private static final String VAR_BMP_HEIGHT = "bmp_height";
    private static final String VAR_BMP_WIDTH = "bmp_width";
    private float mAniHeight;
    private float mAniWidth;
    private boolean mAntiAlias;
    protected Bitmap mBitmap;
    protected boolean mBitmapChanged;
    private float mBmpHeight;
    private IndexedNumberVariable mBmpSizeHeightVar;
    private IndexedNumberVariable mBmpSizeWidthVar;
    private float mBmpWidth;
    private Canvas mBufferCanvas;
    private Bitmap mCachedBitmap;
    private String mCachedBitmapName;
    protected Bitmap mCurrentBitmap;
    private Rect mDesRect;
    private float mHeight;
    private String mKey;
    private Bitmap mMaskBuffer;
    private Paint mMaskPaint;
    private ArrayList mMasks;
    private Paint mPaint;
    private pair mRotateXYpair;
    private Expression mSrcH;
    private Rect mSrcRect;
    private SrcType mSrcType;
    private Expression mSrcW;
    private Expression mSrcX;
    private Expression mSrcY;
    private boolean mUseVirtualScreen;
    private VirtualScreen mVirtualScreen;
    private float mWidth;
    private float mX;
    private float mY;
}
