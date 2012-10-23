// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.*;
import android.util.DisplayMetrics;
import android.util.TypedValue;

final class IconUtilities {

    public IconUtilities(Context context) {
        mIconWidth = -1;
        mIconHeight = -1;
        mIconTextureWidth = -1;
        mIconTextureHeight = -1;
        mColorIndex = 0;
        Resources resources = context.getResources();
        DisplayMetrics displaymetrics = resources.getDisplayMetrics();
        mDisplayMetrics = displaymetrics;
        float f = 5F * displaymetrics.density;
        int i = (int)resources.getDimension(0x1050000);
        mIconHeight = i;
        mIconWidth = i;
        int j = mIconWidth + (int)(2.0F * f);
        mIconTextureHeight = j;
        mIconTextureWidth = j;
        mBlurPaint.setMaskFilter(new BlurMaskFilter(f, android.graphics.BlurMaskFilter.Blur.NORMAL));
        TypedValue typedvalue = new TypedValue();
        Paint paint = mGlowColorPressedPaint;
        int k;
        Paint paint1;
        int l;
        if(context.getTheme().resolveAttribute(0x101038d, typedvalue, true))
            k = typedvalue.data;
        else
            k = -15616;
        paint.setColor(k);
        mGlowColorPressedPaint.setMaskFilter(TableMaskFilter.CreateClipTable(0, 30));
        paint1 = mGlowColorFocusedPaint;
        if(context.getTheme().resolveAttribute(0x101038f, typedvalue, true))
            l = typedvalue.data;
        else
            l = -29184;
        paint1.setColor(l);
        mGlowColorFocusedPaint.setMaskFilter(TableMaskFilter.CreateClipTable(0, 30));
        (new ColorMatrix()).setSaturation(0.2F);
        mCanvas.setDrawFilter(new PaintFlagsDrawFilter(4, 2));
    }

    private Bitmap createIconBitmap(Drawable drawable) {
        int i = mIconWidth;
        int j = mIconHeight;
        int k;
        int l;
        if(drawable instanceof PaintDrawable) {
            PaintDrawable paintdrawable = (PaintDrawable)drawable;
            paintdrawable.setIntrinsicWidth(i);
            paintdrawable.setIntrinsicHeight(j);
        } else
        if(drawable instanceof BitmapDrawable) {
            BitmapDrawable bitmapdrawable = (BitmapDrawable)drawable;
            if(bitmapdrawable.getBitmap().getDensity() == 0)
                bitmapdrawable.setTargetDensity(mDisplayMetrics);
        }
        k = drawable.getIntrinsicWidth();
        l = drawable.getIntrinsicHeight();
        if(k > 0 && k > 0)
            if(i < k || j < l) {
                float f = (float)k / (float)l;
                int i1;
                int j1;
                Bitmap bitmap;
                Canvas canvas;
                int k1;
                int l1;
                if(k > l)
                    j = (int)((float)i / f);
                else
                if(l > k)
                    i = (int)(f * (float)j);
            } else
            if(k < i && l < j) {
                i = k;
                j = l;
            }
        i1 = mIconTextureWidth;
        j1 = mIconTextureHeight;
        bitmap = Bitmap.createBitmap(i1, j1, android.graphics.Bitmap.Config.ARGB_8888);
        canvas = mCanvas;
        canvas.setBitmap(bitmap);
        k1 = (i1 - i) / 2;
        l1 = (j1 - j) / 2;
        mOldBounds.set(drawable.getBounds());
        drawable.setBounds(k1, l1, k1 + i, l1 + j);
        drawable.draw(canvas);
        drawable.setBounds(mOldBounds);
        return bitmap;
    }

    private Bitmap createSelectedBitmap(Bitmap bitmap, boolean flag) {
        Bitmap bitmap1 = Bitmap.createBitmap(mIconTextureWidth, mIconTextureHeight, android.graphics.Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap1);
        canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        int ai[] = new int[2];
        Bitmap bitmap2 = bitmap.extractAlpha(mBlurPaint, ai);
        float f = ai[0];
        float f1 = ai[1];
        Paint paint;
        if(flag)
            paint = mGlowColorPressedPaint;
        else
            paint = mGlowColorFocusedPaint;
        canvas.drawBitmap(bitmap2, f, f1, paint);
        bitmap2.recycle();
        canvas.drawBitmap(bitmap, 0.0F, 0.0F, mPaint);
        canvas.setBitmap(null);
        return bitmap1;
    }

    public Drawable createIconDrawable(Drawable drawable) {
        Bitmap bitmap = createIconBitmap(drawable);
        StateListDrawable statelistdrawable = new StateListDrawable();
        int ai[] = new int[1];
        ai[0] = 0x101009c;
        statelistdrawable.addState(ai, new BitmapDrawable(createSelectedBitmap(bitmap, false)));
        int ai1[] = new int[1];
        ai1[0] = 0x10100a7;
        statelistdrawable.addState(ai1, new BitmapDrawable(createSelectedBitmap(bitmap, true)));
        statelistdrawable.addState(new int[0], new BitmapDrawable(bitmap));
        statelistdrawable.setBounds(0, 0, mIconTextureWidth, mIconTextureHeight);
        return statelistdrawable;
    }

    private static final String TAG = "IconUtilities";
    private static final int sColors[];
    private final Paint mBlurPaint = new Paint();
    private final Canvas mCanvas = new Canvas();
    private int mColorIndex;
    private final DisplayMetrics mDisplayMetrics;
    private final Paint mGlowColorFocusedPaint = new Paint();
    private final Paint mGlowColorPressedPaint = new Paint();
    private int mIconHeight;
    private int mIconTextureHeight;
    private int mIconTextureWidth;
    private int mIconWidth;
    private final Rect mOldBounds = new Rect();
    private final Paint mPaint = new Paint();

    static  {
        int ai[] = new int[3];
        ai[0] = 0xffff0000;
        ai[1] = 0xff00ff00;
        ai[2] = 0xff0000ff;
        sColors = ai;
    }
}
