// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.*;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.*;
import android.widget.*;
import miui.util.HapticFeedbackUtil;

public class SlidingPanel extends LinearLayout {
    private class Slider extends FrameLayout {

        public int getTextVisibility() {
            return zText.getVisibility();
        }

        public void setImage(int i) {
            zImageBackground.setBackgroundResource(i);
            zImageBackground.setVisibility(0);
        }

        public void setText(String s) {
            zText.setText(s);
            TextView textview = zText;
            byte byte0;
            if(TextUtils.isEmpty(s))
                byte0 = 8;
            else
                byte0 = 0;
            textview.setVisibility(byte0);
        }

        final SlidingPanel this$0;
        private FrameLayout zImageBackground;
        private TextView zText;

        public Slider(Context context) {
            this$0 = SlidingPanel.this;
            super(context);
            zImageBackground = new FrameLayout(mContext);
            zImageBackground.setVisibility(8);
            addView(zImageBackground, new android.widget.FrameLayout.LayoutParams(-2, -2, 17));
            zText = new TextView(mContext);
            zText.setBackgroundResource(0x60200bc);
            zText.setGravity(17);
            zText.setTextColor(-1);
            zText.setShadowLayer(0.0F, 0.0F, -1F, 0xa0000000);
            zText.setTextSize(2, 12F);
            zText.setVisibility(8);
            android.widget.FrameLayout.LayoutParams layoutparams = new android.widget.FrameLayout.LayoutParams(-2, -2);
            layoutparams.gravity = 53;
            zImageBackground.addView(zText, layoutparams);
        }
    }

    private class AnimationSequenceListener
        implements android.view.animation.Animation.AnimationListener {

        public void onAnimationEnd(Animation animation) {
            zTarget.startAnimation(zNext);
        }

        public void onAnimationRepeat(Animation animation) {
        }

        public void onAnimationStart(Animation animation) {
        }

        final SlidingPanel this$0;
        private Animation zNext;
        private View zTarget;

        public AnimationSequenceListener(View view, Animation animation) {
            this$0 = SlidingPanel.this;
            super();
            zTarget = view;
            zNext = animation;
        }
    }

    private class BatteryInfo {

        public void clearBatteryAnimations() {
            if(mBatteryArea != null) {
                removeCallbacks(mBatteryAnimationRunnable);
                mBatteryAnimationArrow.clearAnimation();
                mBatteryAnimationLight.clearAnimation();
            }
        }

        public boolean needLayoutBattery() {
            boolean flag;
            if(mBatteryAnimationArrow != null && mBatteryAnimationArrow.getAnimation() != null && mBatteryAnimationArrow.getDrawable() != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public void onPasue() {
            if(mBatteryArea != null) {
                mBatteryArea.setVisibility(8);
                clearBatteryAnimations();
            }
        }

        public void onResume() {
            if(mBatteryArea != null && mBattery.needLayoutBattery()) {
                clearBatteryAnimations();
                setBatteryAnimations();
            }
        }

        public void setBackgroundFor(int i) {
            mBackgroundMode = i;
            if(!mIsPaused) goto _L2; else goto _L1
_L1:
            return;
_L2:
            int j;
            int k;
            int l;
            int i1;
            int j1;
            if((i != 0 || mIsShowBatteryLevel) && mBatteryArea == null)
                mBattery.setupBatteryArea();
            j = 0x60200ba;
            k = 0;
            l = 0;
            i1 = 0;
            j1 = -1;
            i;
            JVM INSTR tableswitch 0 3: default 100
        //                       0 296
        //                       1 286
        //                       2 271
        //                       3 100;
               goto _L3 _L4 _L5 _L6 _L3
_L3:
            if(mIsPressing)
                j = 0x60200bb;
            mButtonRegion.setBackgroundResource(j);
            if(mBatteryArea != null) {
                int k1;
                int l1;
                if(k != 0)
                    k1 = 0;
                else
                    k1 = 8;
                mBatteryArea.setVisibility(k1);
                mBatteryAnimationProgress.setVisibility(k1);
                mBatteryAnimationProgress.setImageResource(k);
                if(j1 != -1) {
                    android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mBatteryAnimationProgress.getLayoutParams();
                    layoutparams.leftMargin = j1;
                    mBatteryAnimationProgress.setLayoutParams(layoutparams);
                }
                if(l != 0)
                    l1 = 0;
                else
                    l1 = 8;
                mBatteryAnimationArrow.setVisibility(l1);
                mBatteryAnimationLight.setVisibility(l1);
                mBatteryAnimationArrow.setImageResource(l);
                mBatteryAnimationLight.setImageResource(i1);
                clearBatteryAnimations();
                if(i1 != 0 && l != 0 && k != 0)
                    setBatteryAnimations();
            }
            if(true) goto _L1; else goto _L6
_L6:
            i1 = 0x602008c;
            k = 0x6020089;
            l = 0x602008b;
              goto _L3
_L5:
            k = 0x602008f;
            j1 = 0;
              goto _L3
_L4:
            if(mIsShowBatteryLevel) {
                k = 0x6020089;
                j1 = (int)(0.5F + ((float)mDisplayWidth * (float)mBatteryLevel) / (float)MAX_BATTERY_LEVEL) - mDisplayWidth;
            }
              goto _L3
        }

        public void setBatteryAnimations() {
            int i = (int)(0.5F + ((float)mDisplayWidth * (float)mBatteryLevel) / (float)MAX_BATTERY_LEVEL);
            int j = mDisplayWidth - i;
            int k = j;
            NinePatchDrawable ninepatchdrawable = (NinePatchDrawable)mBatteryAnimationProgress.getDrawable();
            if(ninepatchdrawable != null) {
                Rect rect = new Rect();
                ninepatchdrawable.getPadding(rect);
                i -= rect.right;
                k += rect.right;
            }
            android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mBatteryAnimationProgress.getLayoutParams();
            layoutparams.leftMargin = -j;
            mBatteryAnimationProgress.setLayoutParams(layoutparams);
            android.widget.FrameLayout.LayoutParams layoutparams1 = (android.widget.FrameLayout.LayoutParams)mBatteryAnimationLight.getLayoutParams();
            layoutparams1.leftMargin = i;
            mBatteryAnimationLight.setLayoutParams(layoutparams1);
            Drawable drawable = mBatteryAnimationArrow.getDrawable();
            android.widget.FrameLayout.LayoutParams layoutparams2 = (android.widget.FrameLayout.LayoutParams)mBatteryAnimationArrow.getLayoutParams();
            layoutparams2.rightMargin = -drawable.getIntrinsicWidth();
            mBatteryAnimationArrow.setLayoutParams(layoutparams2);
            final TranslateAnimation barTranslate1 = new TranslateAnimation(0.0F, -k, 0.0F, 0.0F);
            barTranslate1.setDuration(1000);
            barTranslate1.setInterpolator(new AccelerateInterpolator());
            int l = k + 2 * drawable.getIntrinsicWidth();
            TranslateAnimation translateanimation = new TranslateAnimation(-k, -l, 0.0F, 0.0F);
            AlphaAnimation alphaanimation = new AlphaAnimation(1.0F, 0.0F);
            AnimationSet animationset = new AnimationSet(false);
            animationset.addAnimation(translateanimation);
            animationset.addAnimation(alphaanimation);
            animationset.setDuration(1000);
            AnimationSequenceListener animationsequencelistener = new AnimationSequenceListener(mBatteryAnimationArrow, animationset);
            barTranslate1.setAnimationListener(animationsequencelistener);
            mBatteryAnimationArrow.startAnimation(barTranslate1);
            final AlphaAnimation lightAlpha1 = new AlphaAnimation(0.0F, 0.0F);
            lightAlpha1.setFillAfter(true);
            lightAlpha1.setDuration(1000);
            AlphaAnimation alphaanimation1 = new AlphaAnimation(1.0F, 0.0F);
            alphaanimation1.setFillAfter(true);
            alphaanimation1.setDuration(1000);
            AnimationSequenceListener animationsequencelistener1 = new AnimationSequenceListener(mBatteryAnimationLight, alphaanimation1);
            lightAlpha1.setAnimationListener(animationsequencelistener1);
            mBatteryAnimationLight.startAnimation(lightAlpha1);
            if(mBatteryAnimationRunnable == null) {
                Runnable runnable = new Runnable() {

                    public void run() {
                        removeCallbacks(mBatteryAnimationRunnable);
                        mBatteryAnimationArrow.startAnimation(barTranslate1);
                        mBatteryAnimationLight.startAnimation(lightAlpha1);
                        postDelayed(mBatteryAnimationRunnable, 3500L);
                    }

                    final BatteryInfo this$1;
                    final TranslateAnimation val$barTranslate1;
                    final AlphaAnimation val$lightAlpha1;

                 {
                    this$1 = BatteryInfo.this;
                    barTranslate1 = translateanimation;
                    lightAlpha1 = alphaanimation;
                    super();
                }
                };
                mBatteryAnimationRunnable = runnable;
            }
            postDelayed(mBatteryAnimationRunnable, 3500L);
        }

        public void setBatteryLevel(int i) {
            if(i > MAX_BATTERY_LEVEL)
                i = MAX_BATTERY_LEVEL;
            mBatteryLevel = i;
        }

        public void setupBatteryArea() {
            mBatteryArea = new FrameLayout(
// JavaClassFileOutputException: get_constant: invalid tag

        private int MAX_BATTERY_LEVEL;
        private ImageView mBatteryAnimationArrow;
        private ImageView mBatteryAnimationLight;
        private ImageView mBatteryAnimationProgress;
        private Runnable mBatteryAnimationRunnable;
        private FrameLayout mBatteryArea;
        private int mBatteryLevel;
        final SlidingPanel this$0;




        private BatteryInfo() {
            this$0 = SlidingPanel.this;
            super();
            MAX_BATTERY_LEVEL = 100;
        }

    }

    public static interface OnTriggerListener {

        public abstract void onGrabbedStateChange(View view, int i);

        public abstract void onTrigger(View view, int i);

        public static final int DOUBLE_CLICK_HANDLE = 6;
        public static final int LEFT_HANDLE = 1;
        public static final int MIDDLE_HANDLE = 3;
        public static final int NO_HANDLE = 0;
        public static final int POKE_HANDLE = 4;
        public static final int RIGHT_HANDLE = 2;
        public static final int SLIDING_HANDLE = 5;
    }


    public SlidingPanel(Context context) {
        SlidingPanel(context, null);
    }

    public SlidingPanel(Context context, AttributeSet attributeset) {
        LinearLayout(context, attributeset);
        MIN_MOVING_THRESHOLD = 14;
        mGrabbedState = 0;
        mTriggered = false;
        mLongVibrate = false;
        mTrackingPointerId = -1;
        mDownY = 0;
        mLastSetGrabstateTime = 0L;
        mTmpLocation = new int[2];
        mIsPaused = false;
        mBackgroundMode = -1;
        Resources resources = getResources();
        mDisplayWidth = resources.getDisplayMetrics().widthPixels;
        mDisplayHeight = resources.getDisplayMetrics().heightPixels;
        if(mDisplayWidth > mDisplayHeight) {
            int i = mDisplayWidth;
            mDisplayWidth = mDisplayHeight;
            mDisplayHeight = i;
        }
        boolean flag;
        if(!resources.getBoolean(0x6090001))
            flag = true;
        else
            flag = false;
        mIsShowBatteryLevel = flag;
        setOrientation(1);
        setGravity(80);
        setChildrenDrawnWithCacheEnabled(true);
        mBattery = new BatteryInfo();
        setupContentArea();
        setHapticFeedbackEnabled(true);
        setBackgroundFor(0);
        MOVING_THRESHOLD = mButtonRegionHeight / 8;
        if(MOVING_THRESHOLD < MIN_MOVING_THRESHOLD)
            MOVING_THRESHOLD = MIN_MOVING_THRESHOLD;
        mAnimation = new SlidingPanelAnimation(this, 0);
        mAnimation.setDuration(80L);
        mAnimation.setAnimationListener(new android.view.animation.Animation.AnimationListener() {

            public void onAnimationEnd(Animation animation) {
                if(!mIsPressing)
                    resetSlidingPanel();
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }

            final SlidingPanel this$0;

             {
                this$0 = SlidingPanel.this;
                super();
            }
        });
        mHapticFeedbackUtil = new HapticFeedbackUtil(mContext, true);
    }

    private void dispatchTriggerEvent(int i) {
        if(mOnTriggerListener != null)
            mOnTriggerListener.onTrigger(this, i);
    }

    private Slider getSlider(int i) {
        Slider slider = null;
        i;
        JVM INSTR tableswitch 0 2: default 28
    //                   0 30
    //                   1 28
    //                   2 38;
           goto _L1 _L2 _L1 _L3
_L1:
        return slider;
_L2:
        slider = mLeftSlider;
        continue; /* Loop/switch isn't completed */
_L3:
        slider = mRightSlider;
        if(true) goto _L1; else goto _L4
_L4:
    }

    private void handleMotionDown(float f, float f1) {
        boolean flag;
        boolean flag1;
        boolean flag2;
        flag = withinView(f, f1, mLeftSlider);
        flag1 = withinView(f, f1, mRightSlider);
        flag2 = withinView(f, f1, mTimeRegion);
        if(flag || flag1 || flag2) goto _L2; else goto _L1
_L1:
        mWaitForHandleMotionEvent = true;
_L4:
        return;
_L2:
        mMoving = false;
        mTriggered = false;
        mDownY = (int)f1;
        mHapticFeedbackUtil.performHapticFeedback(1, false);
        if(!flag2)
            break; /* Loop/switch isn't completed */
        mCurrentDragView = mTimeRegion;
        if(System.currentTimeMillis() - mLastDownTime > 500L) {
            mLastDownTime = System.currentTimeMillis();
            setGrabbedState(0);
            postDelayed(mSingleClick, 150L);
        } else {
            mLastDownTime = 0L;
            setGrabbedState(6);
        }
_L5:
        mLastSetGrabstateTime = SystemClock.elapsedRealtime();
        if(mCurrentDragView != null) {
            mIsPressing = true;
            mCurrentDragView.setPressed(true);
            setBackgroundFor(mBackgroundMode);
        }
        mWaitForHandleMotionEvent = false;
        if(true) goto _L4; else goto _L3
_L3:
        if(flag) {
            mCurrentDragView = mLeftSlider;
            setGrabbedState(1);
        } else
        if(flag1) {
            mCurrentDragView = mRightSlider;
            setGrabbedState(2);
        } else {
            setGrabbedState(4);
        }
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }

    private boolean hitDownThreshold() {
        boolean flag;
        if(-mScrollY >= (2 * mFooterRegionHeight) / 3)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private boolean hitVibrateThreshold() {
        boolean flag;
        if(-mScrollY >= mFooterRegionHeight)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private void movePanel(float f, float f1) {
        int i = Math.min((int)f1 - mDownY, mFooterRegionHeight);
        if(i > 0)
            scrollTo(0, -i);
    }

    private void resetSlidingPanel() {
        setBackgroundFor(mBackgroundMode);
        if(!hitDownThreshold())
            setGrabbedState(0);
    }

    private void setGrabbedState(int i) {
        if(i != 4) goto _L2; else goto _L1
_L1:
        if(mOnTriggerListener != null)
            mOnTriggerListener.onGrabbedStateChange(this, mGrabbedState);
_L4:
        return;
_L2:
        if(i != mGrabbedState) {
            mGrabbedState = i;
            if(mOnTriggerListener != null)
                mOnTriggerListener.onGrabbedStateChange(this, mGrabbedState);
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private void setupContentArea() {
        FrameLayout framelayout = new FrameLayout(mContext);
        framelayout.addView(new View(mContext), new android.widget.FrameLayout.LayoutParams(-1, -1, 83));
        mControlRegion = new FrameLayout(mContext);
        mControlRegion.setVisibility(8);
        framelayout.addView(mControlRegion, new android.widget.FrameLayout.LayoutParams(-1, -2, 83));
        addView(framelayout, new android.widget.LinearLayout.LayoutParams(-1, 0, 1.0F));
        mContentArea = new FrameLayout(mContext);
        addView(mContentArea, new android.widget.FrameLayout.LayoutParams(-1, -2, 80));
        mButtonRegion = new FrameLayout(mContext);
        mButtonRegion.setDrawingCacheEnabled(true);
        mButtonRegion.setBackgroundResource(0x6020090);
        mContentArea.addView(mButtonRegion, new android.widget.FrameLayout.LayoutParams(-1, -2, 80));
        mLeftSlider = new Slider(mContext);
        mLeftSlider.setBackgroundResource(0x602006f);
        mLeftSlider.setImage(0x602006e);
        mButtonRegion.addView(mLeftSlider, new android.widget.FrameLayout.LayoutParams(-1, -1, 17));
        mTimeRegion = new FrameLayout(mContext);
        mTimeRegion.setBackgroundResource(0x6020084);
        mButtonRegion.addView(mTimeRegion, new android.widget.FrameLayout.LayoutParams(-1, -1, 17));
        mRightSlider = new Slider(mContext);
        mRightSlider.setBackgroundResource(0x6020075);
        mRightSlider.setImage(0x6020074);
        mButtonRegion.addView(mRightSlider, new android.widget.FrameLayout.LayoutParams(-1, -1, 17));
        Drawable drawable = mButtonRegion.getBackground();
        Rect rect = new Rect();
        drawable.getPadding(rect);
        mButtonRegionHeight = drawable.getIntrinsicHeight() - rect.top - rect.bottom;
        mFooterRegionHeight = rect.bottom;
        ImageView imageview = new ImageView(mContext);
        imageview.setImageResource(0x602009a);
        mBottomAnimationDrawable = (AnimationDrawable)imageview.getDrawable();
        mContentArea.addView(imageview, new android.widget.FrameLayout.LayoutParams(-1, -2, 81));
        ImageView imageview1 = new ImageView(mContext);
        imageview1.setImageResource(0x6020092);
        mContentArea.addView(imageview1, new android.widget.FrameLayout.LayoutParams(-1, -2, 80));
    }

    private boolean withinTouchArea(float f, View view) {
        boolean flag = true;
        view.getLocationOnScreen(mTmpLocation);
        int i = mTmpLocation[flag] - mContext.getResources().getDimensionPixelOffset(0x60a0005);
        int j = (mTmpLocation[flag] + view.getHeight()) - view.getPaddingBottom();
        if((float)i > f || f > (float)j)
            flag = false;
        return flag;
    }

    private boolean withinView(float f, float f1, View view) {
        boolean flag = true;
        view.getLocationOnScreen(mTmpLocation);
        int i = mTmpLocation[0] + view.getPaddingLeft();
        int j = (mTmpLocation[0] + view.getWidth()) - view.getPaddingRight();
        int k = mTmpLocation[flag];
        int l = mTmpLocation[flag] + view.getHeight();
        if((float)i > f || f > (float)j || (float)k > f1 || f1 > (float)l)
            flag = false;
        return flag;
    }

    public void clearBatteryAnimations() {
        mBattery.clearBatteryAnimations();
    }

    public int getBottomHeight() {
        return mButtonRegionHeight + mFooterRegionHeight;
    }

    public FrameLayout getControlView() {
        return mControlRegion;
    }

    public int getSliderTextVisibility(int i) {
        return getSlider(i).getTextVisibility();
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l) {
        super.onLayout(flag, i, j, k, l);
        if(flag)
            mBattery.onResume();
    }

    public void onPause() {
        mIsPaused = true;
        mBattery.onPasue();
        if(mBottomAnimationDrawable != null)
            mBottomAnimationDrawable.stop();
    }

    public void onResume() {
        mIsPaused = false;
        scrollTo(0, 0);
        setBackgroundFor(mBackgroundMode);
        if(mBottomAnimationDrawable != null)
            mBottomAnimationDrawable.start();
    }

    public boolean onTouchEvent(MotionEvent motionevent) {
        int i;
        int j;
        float f;
        float f1;
        i = motionevent.getActionMasked();
        j = motionevent.getActionIndex();
        getLocationOnScreen(mTmpLocation);
        f = 0.0F;
        f1 = 0.0F;
        if(mTrackingPointerId >= 0) goto _L2; else goto _L1
_L1:
        if(i == 5 || i == 0) {
            float f2 = motionevent.getX(j);
            float f3 = motionevent.getY(j) + (float)mTmpLocation[1];
            if(withinTouchArea(f3, mButtonRegion)) {
                mTrackingPointerId = motionevent.getPointerId(j);
                handleMotionDown(f2, f3);
            }
        }
_L4:
        return true;
_L2:
        int k = motionevent.findPointerIndex(mTrackingPointerId);
        if(k < 0) {
            motionevent.setAction(3);
        } else {
            f = motionevent.getX(k);
            f1 = motionevent.getY(k) + (float)mTmpLocation[1];
        }
        switch(i) {
        case 4: // '\004'
        case 5: // '\005'
        default:
            break;

        case 2: // '\002'
            if(mWaitForHandleMotionEvent)
                handleMotionDown(f, f1);
            if(!mWaitForHandleMotionEvent && (mMoving || Math.abs(f1 - (float)mDownY) >= (float)MOVING_THRESHOLD)) {
                if(!mMoving) {
                    setGrabbedState(5);
                    mMoving = true;
                }
                if(SystemClock.elapsedRealtime() - mLastSetGrabstateTime >= 4000L) {
                    setGrabbedState(4);
                    mLastSetGrabstateTime = SystemClock.elapsedRealtime();
                }
                movePanel(f, f1);
                if(!mTriggered && hitDownThreshold())
                    mTriggered = true;
                if(!hitDownThreshold())
                    mTriggered = false;
                if(!mLongVibrate && hitVibrateThreshold()) {
                    mLongVibrate = true;
                    mHapticFeedbackUtil.performHapticFeedback(0, false);
                }
                if(!hitVibrateThreshold())
                    mLongVibrate = false;
            }
            continue; /* Loop/switch isn't completed */

        case 6: // '\006'
            if(motionevent.getActionIndex() != k)
                continue; /* Loop/switch isn't completed */
            // fall through

        case 1: // '\001'
            mIsPressing = false;
            removeCallbacks(mSingleClick);
            if(mTriggered) {
                mTrackingPointerId = -1;
                mWaitForHandleMotionEvent = false;
                if(mMoving) {
                    int l;
                    if(mCurrentDragView == mLeftSlider)
                        l = 1;
                    else
                    if(mCurrentDragView == mRightSlider)
                        l = 2;
                    else
                        l = 3;
                    dispatchTriggerEvent(l);
                } else {
                    resetSlidingPanel();
                }
                continue; /* Loop/switch isn't completed */
            }
            mHapticFeedbackUtil.performHapticFeedback(2, false);
            // fall through

        case 3: // '\003'
            mIsPressing = false;
            removeCallbacks(mSingleClick);
            mTrackingPointerId = -1;
            mWaitForHandleMotionEvent = false;
            mTriggered = false;
            if(mCurrentDragView != null) {
                mCurrentDragView.setPressed(false);
                mCurrentDragView = null;
            }
            mDownY = 0;
            if(mMoving)
                startAnimation(mAnimation);
            else
                resetSlidingPanel();
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void setBackgroundFor(int i) {
        mBattery.setBackgroundFor(i);
    }

    public void setBatteryLevel(int i) {
        mBattery.setBatteryLevel(i);
    }

    public void setOnTriggerListener(OnTriggerListener ontriggerlistener) {
        mOnTriggerListener = ontriggerlistener;
    }

    public void setSliderText(int i, String s) {
        getSlider(i).setText(s);
    }

    public void setTimeView(View view, android.view.ViewGroup.LayoutParams layoutparams) {
        if(layoutparams == null)
            layoutparams = new android.widget.FrameLayout.LayoutParams(-2, -2, 17);
        mTimeRegion.removeAllViews();
        mTimeRegion.addView(view, layoutparams);
        mTimeRegion.setVisibility(0);
    }

    private static final int ANIM_MODE_FLY_DOWN = 1;
    private static final int ANIM_MODE_RESET = 0;
    public static final int BACKGROUND_MODE_BATTERY_CHARGING = 2;
    public static final int BACKGROUND_MODE_BATTERY_FULL = 3;
    public static final int BACKGROUND_MODE_BATTERY_LOW = 1;
    public static final int BACKGROUND_MODE_NORMAL = 0;
    private static final long DOUBLE_CLICK_THRESHOLD = 500L;
    private static final String LOG_TAG = "SlidingPanel";
    private static final long SINGLE_CLICK_THRESHOLD = 150L;
    public static final int SLIDER_LEFT = 0;
    public static final int SLIDER_MIDDLE = 1;
    public static final int SLIDER_RIGHT = 2;
    private int MIN_MOVING_THRESHOLD;
    private int MOVING_THRESHOLD;
    private SlidingPanelAnimation mAnimation;
    private int mBackgroundMode;
    private BatteryInfo mBattery;
    private AnimationDrawable mBottomAnimationDrawable;
    private FrameLayout mButtonRegion;
    private int mButtonRegionHeight;
    private FrameLayout mContentArea;
    private FrameLayout mControlRegion;
    private View mCurrentDragView;
    private int mDisplayHeight;
    private int mDisplayWidth;
    private int mDownY;
    private int mFooterRegionHeight;
    private int mGrabbedState;
    private HapticFeedbackUtil mHapticFeedbackUtil;
    private boolean mIsPaused;
    private boolean mIsPressing;
    private boolean mIsShowBatteryLevel;
    private long mLastDownTime;
    private long mLastSetGrabstateTime;
    private Slider mLeftSlider;
    private boolean mLongVibrate;
    private boolean mMoving;
    private OnTriggerListener mOnTriggerListener;
    private Slider mRightSlider;
    private Runnable mSingleClick = new Runnable() {

        public void run() {
            removeCallbacks(mSingleClick);
            if(!mMoving)
                setGrabbedState(3);
            mLastDownTime = 0L;
        }

        final SlidingPanel this$0;

             {
                this$0 = SlidingPanel.this;
                super();
            }
    };
    private FrameLayout mTimeRegion;
    private int mTmpLocation[];
    private int mTrackingPointerId;
    private boolean mTriggered;
    private boolean mWaitForHandleMotionEvent;



















/*
    static long access$802(SlidingPanel slidingpanel, long l) {
        slidingpanel.mLastDownTime = l;
        return l;
    }

*/


/*
    static int access$902(SlidingPanel slidingpanel, int i) {
        slidingpanel.mBackgroundMode = i;
        return i;
    }

*/
}
