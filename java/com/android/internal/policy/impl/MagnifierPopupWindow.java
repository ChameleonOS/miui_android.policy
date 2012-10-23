// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.util.DisplayMetrics;
import android.view.*;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.PopupWindow;

public class MagnifierPopupWindow extends PopupWindow {
    private class MagnifierView extends View {

        private float getDegreesForRotation(int i) {
            i;
            JVM INSTR tableswitch 1 3: default 28
        //                       1 32
        //                       2 38
        //                       3 44;
               goto _L1 _L2 _L3 _L4
_L1:
            float f = 0.0F;
_L6:
            return f;
_L2:
            f = 270F;
            continue; /* Loop/switch isn't completed */
_L3:
            f = 180F;
            continue; /* Loop/switch isn't completed */
_L4:
            f = 90F;
            if(true) goto _L6; else goto _L5
_L5:
        }

        private void refresh() {
            mHandler.sendEmptyMessage(2);
            mUpdateHandler.removeMessages(1);
            mUpdateHandler.sendEmptyMessageDelayed(1, 1000L);
        }

        public void hide() {
            mUpdateHandler.removeMessages(1);
            if(isShowing() && !mIsHideAnimate.booleanValue()) {
                mIsHideAnimate = Boolean.valueOf(true);
                startAnimation(mAnimationExit);
            }
        }

        protected void onAnimationEnd() {
            super.onAnimationEnd();
            if(mIsHideAnimate.booleanValue()) {
                mHandler.removeMessages(2);
                mHandler.sendEmptyMessage(4);
                mIsHideAnimate = Boolean.valueOf(false);
            }
        }

        protected void onDraw(Canvas canvas) {
            if(!mSrcRect.isEmpty() && mBitmap != null) {
                canvas.save();
                canvas.translate(mLocationX, mLocationY);
                mFilterDrawable.setBounds(mDstRect);
                mFilterDrawable.draw(canvas);
                canvas.drawBitmap(mBitmap, mSrcRect, mDstRect, mBitmapPaint);
                mFrontDrawable.setBounds(mDstRect);
                mFrontDrawable.draw(canvas);
                canvas.restore();
            }
        }

        protected void onMeasure(int i, int j) {
            setMeasuredDimension(-1, -1);
        }

        void takeScreenshot() {
            mDisplay.getRealMetrics(mDisplayMetrics);
            float af[] = new float[2];
            af[0] = mDisplayMetrics.widthPixels;
            af[1] = mDisplayMetrics.heightPixels;
            float f = getDegreesForRotation(mDisplay.getRotation());
            boolean flag;
            Bitmap bitmap;
            Bitmap bitmap1;
            if(f > 0.0F)
                flag = true;
            else
                flag = false;
            if(flag) {
                mDisplayMatrix.reset();
                mDisplayMatrix.preRotate(-f);
                mDisplayMatrix.mapPoints(af);
                af[0] = Math.abs(af[0]);
                af[1] = Math.abs(af[1]);
            }
            bitmap = mBitmap;
            if(mDisplayMetrics.widthPixels != mLastWidth || mDisplayMetrics.heightPixels != mLastHeight) {
                bitmap = Bitmap.createBitmap(mDisplayMetrics.widthPixels, mDisplayMetrics.heightPixels, android.graphics.Bitmap.Config.ARGB_8888);
                mLastWidth = mDisplayMetrics.widthPixels;
                mLastHeight = mDisplayMetrics.heightPixels;
            }
            bitmap1 = Surface.screenshot((int)af[0], (int)af[1], 0, mMaxLayer);
            if(flag) {
                Canvas canvas = new Canvas(bitmap);
                canvas.translate(bitmap.getWidth() / 2, bitmap.getHeight() / 2);
                canvas.rotate(f);
                canvas.translate(-af[0] / 2.0F, -af[1] / 2.0F);
                canvas.drawBitmap(bitmap1, 0.0F, 0.0F, null);
                canvas.setBitmap(null);
                bitmap1.recycle();
            } else {
                bitmap = bitmap1;
            }
            bitmap.setHasAlpha(false);
            bitmap.prepareToDraw();
            mBitmap = bitmap;
        }

        public void updateCache() {
            mUpdateHandler.removeMessages(1);
            mUpdateHandler.sendEmptyMessageDelayed(1, 80L);
        }

        void updateMagnifier(Rect rect) {
            mSrcRect.left = rect.centerX() - mSrcWidth / 2;
            mSrcRect.top = rect.centerY() - mSrcHeight / 2;
            mSrcRect.right = mSrcRect.left + mSrcWidth;
            mSrcRect.bottom = mSrcRect.top + mSrcHeight;
            mLocationX = rect.centerX() - mMagWidth / 2;
            mLocationY = Math.max(rect.centerY() - mMagHeight / 2 - mFingerOffset, -mFingerOffset);
            invalidate();
        }

        private Bitmap mBitmap;
        private Paint mBitmapPaint;
        private Matrix mDisplayMatrix;
        private Rect mDstRect;
        private Drawable mFilterDrawable;
        private Drawable mFrontDrawable;
        private Boolean mIsHideAnimate;
        private int mLastHeight;
        private int mLastWidth;
        private int mMagHeight;
        private int mMagWidth;
        private int mSrcHeight;
        private Rect mSrcRect;
        private int mSrcWidth;
        private Handler mUpdateHandler;
        private HandlerThread mUpdateThread;
        final MagnifierPopupWindow this$0;


        public MagnifierView(Context context, float f) {
            this$0 = MagnifierPopupWindow.this;
            super(context);
            mBitmapPaint = new Paint();
            mDstRect = new Rect();
            mBitmap = null;
            mSrcRect = new Rect();
            mDisplayMatrix = new Matrix();
            mUpdateThread = new HandlerThread("UpdateMagnifier");
            mUpdateThread.start();
            mUpdateHandler = new Handler(MagnifierPopupWindow.this) {

                public void handleMessage(Message message) {
                    if(message.what == 1) {
                        takeScreenshot();
                        refresh();
                    }
                }

                final MagnifierView this$1;
                final MagnifierPopupWindow val$this$0;

                 {
                    this$1 = MagnifierView.this;
                    this$0 = magnifierpopupwindow;
                    super(final_looper);
                }
            };
            mBitmapPaint.setAntiAlias(true);
            mBitmapPaint.setFilterBitmap(true);
            mBitmapPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.MULTIPLY));
            mFilterDrawable = context.getResources().getDrawable(0x60201da);
            mFrontDrawable = context.getResources().getDrawable(0x60201db);
            mMagWidth = mFilterDrawable.getIntrinsicWidth();
            mMagHeight = mFilterDrawable.getIntrinsicHeight();
            mSrcWidth = Math.round((float)mMagWidth / f);
            mSrcHeight = Math.round((float)mMagHeight / f);
            mDstRect.set(0, 0, mMagWidth, mMagHeight);
            mFingerOffset = (int)context.getResources().getDimension(0x60a0019);
            mIsHideAnimate = Boolean.valueOf(false);
        }
    }


    public MagnifierPopupWindow(Context context, int i) {
        this(context, i, 0);
    }

    public MagnifierPopupWindow(Context context, int i, int j) {
        super(context);
        mDisplayMetrics = new DisplayMetrics();
        mMaxLayer = i;
        mToken = new Binder();
        mDisplay = ((WindowManager)context.getSystemService("window")).getDefaultDisplay();
        mDisplay.getMetrics(mDisplayMetrics);
        mMagnifierView = new MagnifierView(context, 1.2F);
        mMagnifierView.setClickable(false);
        setContentView(mMagnifierView);
        setFocusable(false);
        setTouchable(false);
        setClippingEnabled(false);
        setInputMethodMode(2);
        setBackgroundDrawable(new ColorDrawable(0));
        mAnimationEnter = AnimationUtils.loadAnimation(context, 0x6040010);
        mAnimationExit = AnimationUtils.loadAnimation(context, 0x6040011);
        setWindowLayoutType(2016);
        setLayoutInScreenEnabled(true);
    }

    private void showMagnifier() {
        showMagnifier(new Rect(mX, mY, mX, mY));
    }

    private void showMagnifier(Rect rect) {
        mMagnifierView.updateMagnifier(rect);
        if(!isShowing()) {
            mMagnifierView.measure(0, 0);
            mMagnifierView.updateCache();
            setWidth(-1);
            setHeight(-1);
            showAtLocation(mToken, 51, 0, 0);
            mMagnifierView.startAnimation(mAnimationEnter);
        }
    }

    public void hide() {
        mHandler.removeMessages(2);
        mHandler.sendEmptyMessage(3);
    }

    public void showMagnifier(int i, int j) {
        mHandler.removeMessages(2);
        if(Math.abs(i - mX) >= 1 || Math.abs(j - mY) >= 1) {
            mX = i;
            mY = j;
            mHandler.sendEmptyMessage(2);
        }
    }

    public void updateCache() {
        mMagnifierView.updateCache();
    }

    public static final float DEFAULT_TIMES = 1.2F;
    public static final String LOG_TAG = "MagnifierPopupWindow";
    private static final int MSG_DISMISS = 4;
    private static final int MSG_HIDE_MAGNIFIER = 3;
    private static final int MSG_SHOW_MAGNIFIER = 2;
    private static final int MSG_UPDATE_CACHE = 1;
    private static final int REFRESH_DELAY = 1000;
    private static final int UPDATE_CACHE_DELAY = 80;
    private Animation mAnimationEnter;
    private Animation mAnimationExit;
    private Display mDisplay;
    private DisplayMetrics mDisplayMetrics;
    private int mFingerOffset;
    Handler mHandler = new Handler() {

        public void handleMessage(Message message) {
            if(message.what != 2) goto _L2; else goto _L1
_L1:
            showMagnifier();
_L4:
            return;
_L2:
            if(message.what == 3)
                mMagnifierView.hide();
            else
            if(message.what == 4)
                dismiss();
            if(true) goto _L4; else goto _L3
_L3:
        }

        final MagnifierPopupWindow this$0;

             {
                this$0 = MagnifierPopupWindow.this;
                super();
            }
    };
    private int mLocationX;
    private int mLocationY;
    private MagnifierView mMagnifierView;
    private int mMaxLayer;
    private IBinder mToken;
    private int mX;
    private int mY;



/*
    static int access$102(MagnifierPopupWindow magnifierpopupwindow, int i) {
        magnifierpopupwindow.mFingerOffset = i;
        return i;
    }

*/







/*
    static int access$602(MagnifierPopupWindow magnifierpopupwindow, int i) {
        magnifierpopupwindow.mLocationX = i;
        return i;
    }

*/



/*
    static int access$702(MagnifierPopupWindow magnifierpopupwindow, int i) {
        magnifierpopupwindow.mLocationY = i;
        return i;
    }

*/


}
