// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.graphics.*;

public class ImagesInOne {

    public ImagesInOne(Bitmap bitmap, int i) {
        mSrc = new Rect();
        mDst = new Rect();
        mBitmap = bitmap;
        mOneWidth = i;
        mCount = mBitmap.getWidth() / mOneWidth;
        if(mBitmap.getWidth() % mOneWidth != 0)
            throw new IllegalArgumentException("invalid width");
        else
            return;
    }

    public void draw(Canvas canvas, int i, int j, int k, Paint paint) {
        if(k > -1 + mCount) {
            throw new IllegalArgumentException("invalid index");
        } else {
            mDst.set(i, j, i + mOneWidth, j + mBitmap.getHeight());
            int l = k * mOneWidth;
            mSrc.set(l, 0, l + mOneWidth, mBitmap.getHeight());
            canvas.drawBitmap(mBitmap, mSrc, mDst, paint);
            return;
        }
    }

    private Bitmap mBitmap;
    private int mCount;
    private Rect mDst;
    private int mOneWidth;
    private Rect mSrc;
}
