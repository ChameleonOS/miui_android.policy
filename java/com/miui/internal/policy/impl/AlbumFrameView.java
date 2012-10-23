// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl;

import android.content.Context;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.View;

public class AlbumFrameView extends View {

    public AlbumFrameView(Context context) {
        this(context, null);
    }

    public AlbumFrameView(Context context, AttributeSet attributeset) {
        this(context, attributeset, 0);
    }

    public AlbumFrameView(Context context, AttributeSet attributeset, int i) {
        super(context, attributeset, i);
        mDisplayMatrix = new Matrix();
        mPrepareValues = null;
        mMatrixValuesTemp = new float[9];
        mDisplayBitmap = null;
        mFilterBitmap = null;
        mFilterPaint = new Paint();
        mMaskPaint = new Paint();
        mPaintFlags = new PaintFlagsDrawFilter(0, 7);
        mTempBitmap = null;
        mFilterPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
        mFilterBitmapPaddingRect = new Rect();
    }

    private void fitCenter() {
        if(mDisplayBitmap != null && mFilterBitmap != null) {
            float f = mFilterBitmap.getWidth() - mFilterBitmapPaddingRect.left - mFilterBitmapPaddingRect.right;
            float f1 = mFilterBitmap.getHeight() - mFilterBitmapPaddingRect.top - mFilterBitmapPaddingRect.bottom;
            float f2 = mDisplayBitmap.getWidth();
            float f3 = mDisplayBitmap.getHeight();
            float f4 = Math.max(f / f2, f1 / f3);
            mDisplayMatrix.reset();
            mDisplayMatrix.postScale(f4, f4);
            mDisplayMatrix.postTranslate(mFilterBitmapPaddingRect.left, mFilterBitmapPaddingRect.top);
        }
    }

    private void updateTempBitmap() {
        int i;
        int j;
        i = getHeight();
        j = getWidth();
        if(mTempBitmap != null && mTempBitmap.getHeight() == i && mTempBitmap.getWidth() == j) goto _L2; else goto _L1
_L1:
        if(j > 0 && i > 0) goto _L4; else goto _L3
_L3:
        return;
_L4:
        mTempBitmap = Bitmap.createBitmap(j, i, android.graphics.Bitmap.Config.ARGB_8888);
_L2:
        Canvas canvas = new Canvas(mTempBitmap);
        canvas.setDrawFilter(mPaintFlags);
        canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        Bitmap bitmap = mDisplayBitmap;
        fitCenter();
        if(bitmap != null) {
            canvas.save();
            if(mDisplayMatrix != null)
                canvas.concat(mDisplayMatrix);
            canvas.drawBitmap(bitmap, 0.0F, 0.0F, null);
            canvas.restore();
        }
        int k = getWidth();
        int l = getHeight();
        int i1 = 0;
        int j1 = 0;
        if(mFilterBitmap != null) {
            i1 = (k - mFilterBitmap.getWidth()) / 2;
            j1 = (l - mFilterBitmap.getHeight()) / 2;
            canvas.drawBitmap(mFilterBitmap, i1, j1, mFilterPaint);
        }
        if(i1 > 0 && j1 > 0) {
            canvas.clipRect(i1, j1, k - i1, l - j1, android.graphics.Region.Op.DIFFERENCE);
            canvas.drawRect(0.0F, 0.0F, k, l, mMaskPaint);
        }
        if(true) goto _L3; else goto _L5
_L5:
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.setDrawFilter(mPaintFlags);
        updateTempBitmap();
        canvas.drawBitmap(mTempBitmap, 0.0F, 0.0F, null);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l) {
        super.onLayout(flag, i, j, k, l);
        if(flag)
            if(mPrepareValues == null) {
                fitCenter();
            } else {
                System.arraycopy(mPrepareValues, 0, mMatrixValuesTemp, 0, 9);
                mDisplayMatrix.setValues(mMatrixValuesTemp);
            }
    }

    public void recyleFilterBitmap() {
        if(mFilterBitmap != null) {
            mFilterBitmap.recycle();
            mFilterBitmap = null;
        }
    }

    public void setDisplayBitmap(Bitmap bitmap) {
        mDisplayBitmap = bitmap;
        invalidate();
    }

    public void setFilterBitmap(Bitmap bitmap) {
        recyleFilterBitmap();
        mFilterBitmap = bitmap;
        invalidate();
    }

    public void setMatrixValues(float af[]) {
        if(getWidth() == 0) {
            float af1[] = new float[9];
            System.arraycopy(af, 0, af1, 0, 9);
            mPrepareValues = af1;
        } else {
            mPrepareValues = null;
            System.arraycopy(af, 0, mMatrixValuesTemp, 0, 9);
            mDisplayMatrix.setValues(mMatrixValuesTemp);
            invalidate();
        }
    }

    public void setRect(Rect rect) {
        mFilterBitmapPaddingRect = rect;
    }

    public static final int MATRIX_VALUES_SIZE = 9;
    private Bitmap mDisplayBitmap;
    private final Matrix mDisplayMatrix;
    private Bitmap mFilterBitmap;
    private Rect mFilterBitmapPaddingRect;
    private Paint mFilterPaint;
    private Paint mMaskPaint;
    private final float mMatrixValuesTemp[];
    private PaintFlagsDrawFilter mPaintFlags;
    private float mPrepareValues[];
    private Bitmap mTempBitmap;
}
