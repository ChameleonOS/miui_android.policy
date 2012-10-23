// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;

public class RoundedCorners {

    public RoundedCorners(Context context) {
        Resources resources = context.getResources();
        mDisplayWidth = resources.getDisplayMetrics().widthPixels;
        mDisplayHeight = resources.getDisplayMetrics().heightPixels;
        mStatusBarHeight = resources.getDimensionPixelSize(0x60a0000);
        boolean flag;
        if(android.provider.Settings.System.getInt(context.getContentResolver(), "show_rounded_corners", resources.getInteger(0x608000b)) != 0)
            flag = true;
        else
            flag = false;
        mEnabled = flag;
        if(mEnabled) {
            int i = 0;
            while(i < 4)  {
                mCorners[i] = resources.getDrawable(CORNER_IDS[i]);
                mWidth[i] = mCorners[i].getMinimumWidth();
                mHeight[i] = mCorners[i].getMinimumHeight();
                i++;
            }
        }
    }

    private boolean matchLandscape(int i, int j) {
        boolean flag;
        if(i == mDisplayWidth && (j == mDisplayHeight || j == mDisplayHeight - mStatusBarHeight))
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean matchPortrait(int i, int j) {
        boolean flag;
        if(i == mDisplayHeight && (j == mDisplayWidth || j == mDisplayWidth - mStatusBarHeight))
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void draw(Canvas canvas, int i, int j, int k, int l) {
        int i1 = k - i;
        int j1 = l - j;
        if(mEnabled && (matchLandscape(i1, j1) || matchPortrait(i1, j1))) {
            if(i != mLastLeft || j != mLastTop || k != mLastRight || l != mLastBottom) {
                mLastLeft = i;
                mLastTop = j;
                mLastRight = k;
                mLastBottom = l;
                mCorners[0].setBounds(i, j, i + mWidth[0], j + mHeight[0]);
                mCorners[1].setBounds(k - mWidth[1], j, k, j + mHeight[1]);
                mCorners[2].setBounds(i, l - mHeight[2], i + mWidth[2], l);
                mCorners[3].setBounds(k - mWidth[3], l - mHeight[3], k, l);
            }
            int k1 = 0;
            while(k1 < 4)  {
                mCorners[k1].draw(canvas);
                k1++;
            }
        }
    }

    private static final int CORNER_IDS[];
    private static final int NUM_CORNERS = 4;
    private final Drawable mCorners[] = new Drawable[4];
    private final int mDisplayHeight;
    private final int mDisplayWidth;
    private final boolean mEnabled;
    private final int mHeight[] = new int[4];
    private int mLastBottom;
    private int mLastLeft;
    private int mLastRight;
    private int mLastTop;
    private final int mStatusBarHeight;
    private final int mWidth[] = new int[4];

    static  {
        int ai[] = new int[4];
        ai[0] = 0x60200e1;
        ai[1] = 0x60200e2;
        ai[2] = 0x60200df;
        ai[3] = 0x60200e0;
        CORNER_IDS = ai;
    }
}
