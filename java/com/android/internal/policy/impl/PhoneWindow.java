// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.KeyguardManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.Uri;
import android.os.*;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.*;
import com.android.internal.view.RootViewSurfaceTaker;
import com.android.internal.view.StandaloneActionMode;
import com.android.internal.view.menu.*;
import com.android.internal.widget.*;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneWindowManager, RoundedCorners

public class PhoneWindow extends Window
    implements com.android.internal.view.menu.MenuBuilder.Callback {
    private final class DialogMenuCallback
        implements com.android.internal.view.menu.MenuBuilder.Callback, com.android.internal.view.menu.MenuPresenter.Callback {

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag) {
            if(menubuilder.getRootMenu() != menubuilder)
                onCloseSubMenu(menubuilder);
            if(flag) {
                android.view.Window.Callback callback = getCallback();
                if(callback != null && !isDestroyed())
                    callback.onPanelClosed(mFeatureId, menubuilder);
                if(menubuilder == mContextMenu)
                    dismissContextMenu();
                if(mSubMenuHelper != null) {
                    mSubMenuHelper.dismiss();
                    mSubMenuHelper = null;
                }
            }
        }

        public void onCloseSubMenu(MenuBuilder menubuilder) {
            android.view.Window.Callback callback = getCallback();
            if(callback != null && !isDestroyed())
                callback.onPanelClosed(mFeatureId, menubuilder.getRootMenu());
        }

        public boolean onMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null && !isDestroyed() && callback.onMenuItemSelected(mFeatureId, menuitem))
                flag = true;
            else
                flag = false;
            return flag;
        }

        public void onMenuModeChange(MenuBuilder menubuilder) {
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder) {
            boolean flag;
            if(menubuilder == null) {
                flag = false;
            } else {
                menubuilder.setCallback(this);
                mSubMenuHelper = new MenuDialogHelper(menubuilder);
                mSubMenuHelper.show(null);
                flag = true;
            }
            return flag;
        }

        private int mFeatureId;
        private MenuDialogHelper mSubMenuHelper;
        final PhoneWindow this$0;

        public DialogMenuCallback(int i) {
            this$0 = PhoneWindow.this;
            super();
            mFeatureId = i;
        }
    }

    static class RotationWatcher extends android.view.IRotationWatcher.Stub {

        public void addWindow(PhoneWindow phonewindow) {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            boolean flag = mIsWatching;
            Exception exception;
            if(!flag)
                try {
                    WindowManagerHolder.sWindowManager.watchRotation(this);
                    mHandler = new Handler();
                    mIsWatching = true;
                }
                catch(RemoteException remoteexception) {
                    Log.e("PhoneWindow", "Couldn't start watching for device rotation", remoteexception);
                }
                finally {
                    arraylist;
                }
            mWindows.add(new WeakReference(phonewindow));
            arraylist;
            JVM INSTR monitorexit ;
            return;
            throw exception;
        }

        void dispatchRotationChanged() {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            for(int i = 0; i < mWindows.size();) {
                PhoneWindow phonewindow = (PhoneWindow)((WeakReference)mWindows.get(i)).get();
                if(phonewindow != null) {
                    phonewindow.onOptionsPanelRotationChanged();
                    i++;
                } else {
                    mWindows.remove(i);
                }
            }

            break MISSING_BLOCK_LABEL_72;
            Exception exception;
            exception;
            throw exception;
            arraylist;
            JVM INSTR monitorexit ;
        }

        public void onRotationChanged(int i) throws RemoteException {
            mHandler.post(mRotationChanged);
        }

        public void removeWindow(PhoneWindow phonewindow) {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            for(int i = 0; i < mWindows.size();) {
                PhoneWindow phonewindow1 = (PhoneWindow)((WeakReference)mWindows.get(i)).get();
                Exception exception;
                if(phonewindow1 == null || phonewindow1 == phonewindow)
                    mWindows.remove(i);
                else
                    i++;
            }

            break MISSING_BLOCK_LABEL_75;
            exception;
            throw exception;
            arraylist;
            JVM INSTR monitorexit ;
        }

        private Handler mHandler;
        private boolean mIsWatching;
        private final Runnable mRotationChanged = new Runnable() {

            public void run() {
                dispatchRotationChanged();
            }

            final RotationWatcher this$0;

                 {
                    this$0 = RotationWatcher.this;
                    super();
                }
        };
        private final ArrayList mWindows = new ArrayList();

        RotationWatcher() {
        }
    }

    private static final class PanelFeatureState {
        private static class SavedState
            implements Parcelable {

            private static SavedState readFromParcel(Parcel parcel) {
                boolean flag = true;
                SavedState savedstate = new SavedState();
                savedstate.featureId = parcel.readInt();
                boolean flag1;
                if(parcel.readInt() == flag)
                    flag1 = flag;
                else
                    flag1 = false;
                savedstate.isOpen = flag1;
                if(parcel.readInt() != flag)
                    flag = false;
                savedstate.isInExpandedMode = flag;
                if(savedstate.isOpen)
                    savedstate.menuState = parcel.readBundle();
                return savedstate;
            }

            public int describeContents() {
                return 0;
            }

            public void writeToParcel(Parcel parcel, int i) {
                int j = 1;
                parcel.writeInt(featureId);
                int k;
                if(isOpen)
                    k = j;
                else
                    k = 0;
                parcel.writeInt(k);
                if(!isInExpandedMode)
                    j = 0;
                parcel.writeInt(j);
                if(isOpen)
                    parcel.writeBundle(menuState);
            }

            public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

                public SavedState createFromParcel(Parcel parcel) {
                    return SavedState.readFromParcel(parcel);
                }

                public volatile Object createFromParcel(Parcel parcel) {
                    return createFromParcel(parcel);
                }

                public SavedState[] newArray(int i) {
                    return new SavedState[i];
                }

                public volatile Object[] newArray(int i) {
                    return newArray(i);
                }

            };
            int featureId;
            boolean isInExpandedMode;
            boolean isOpen;
            Bundle menuState;



            private SavedState() {
            }

        }


        void applyFrozenState() {
            if(menu != null && frozenMenuState != null) {
                menu.restorePresenterStates(frozenMenuState);
                frozenMenuState = null;
            }
        }

        public void clearMenuPresenters() {
            if(menu != null) {
                menu.removeMenuPresenter(iconMenuPresenter);
                menu.removeMenuPresenter(listMenuPresenter);
            }
            iconMenuPresenter = null;
            listMenuPresenter = null;
        }

        MenuView getIconMenuView(Context context, com.android.internal.view.menu.MenuPresenter.Callback callback) {
            MenuView menuview;
            if(menu == null) {
                menuview = null;
            } else {
                if(iconMenuPresenter == null) {
                    iconMenuPresenter = new IconMenuPresenter(context);
                    iconMenuPresenter.setCallback(callback);
                    iconMenuPresenter.setId(0x102023d);
                    menu.addMenuPresenter(iconMenuPresenter);
                }
                menuview = iconMenuPresenter.getMenuView(decorView);
            }
            return menuview;
        }

        MenuView getListMenuView(Context context, com.android.internal.view.menu.MenuPresenter.Callback callback) {
            MenuView menuview;
            if(menu == null) {
                menuview = null;
            } else {
                if(!isCompact)
                    getIconMenuView(context, callback);
                if(listMenuPresenter == null) {
                    listMenuPresenter = new ListMenuPresenter(0x1090062, listPresenterTheme);
                    listMenuPresenter.setCallback(callback);
                    listMenuPresenter.setId(0x102023e);
                    menu.addMenuPresenter(listMenuPresenter);
                }
                if(iconMenuPresenter != null)
                    listMenuPresenter.setItemIndexOffset(iconMenuPresenter.getNumActualItemsShown());
                menuview = listMenuPresenter.getMenuView(decorView);
            }
            return menuview;
        }

        public boolean hasPanelItems() {
            boolean flag = true;
            if(shownPanelView != null) goto _L2; else goto _L1
_L1:
            flag = false;
_L4:
            return flag;
_L2:
            if(createdPanelView == null)
                if(isCompact || isInExpandedMode) {
                    boolean flag1;
                    if(listMenuPresenter.getAdapter().getCount() > 0)
                        flag1 = flag;
                    else
                        flag1 = false;
                    flag = flag1;
                } else
                if(((ViewGroup)shownPanelView).getChildCount() <= 0)
                    flag = false;
            if(true) goto _L4; else goto _L3
_L3:
        }

        public boolean isInListMode() {
            boolean flag;
            if(isInExpandedMode || isCompact)
                flag = true;
            else
                flag = false;
            return flag;
        }

        void onRestoreInstanceState(Parcelable parcelable) {
            SavedState savedstate = (SavedState)parcelable;
            featureId = savedstate.featureId;
            wasLastOpen = savedstate.isOpen;
            wasLastExpanded = savedstate.isInExpandedMode;
            frozenMenuState = savedstate.menuState;
            createdPanelView = null;
            shownPanelView = null;
            decorView = null;
        }

        Parcelable onSaveInstanceState() {
            SavedState savedstate = new SavedState();
            savedstate.featureId = featureId;
            savedstate.isOpen = isOpen;
            savedstate.isInExpandedMode = isInExpandedMode;
            if(menu != null) {
                savedstate.menuState = new Bundle();
                menu.savePresenterStates(savedstate.menuState);
            }
            return savedstate;
        }

        void setMenu(MenuBuilder menubuilder) {
            if(menubuilder != menu) goto _L2; else goto _L1
_L1:
            return;
_L2:
            if(menu != null) {
                menu.removeMenuPresenter(iconMenuPresenter);
                menu.removeMenuPresenter(listMenuPresenter);
            }
            menu = menubuilder;
            if(menubuilder != null) {
                if(iconMenuPresenter != null)
                    menubuilder.addMenuPresenter(iconMenuPresenter);
                if(listMenuPresenter != null)
                    menubuilder.addMenuPresenter(listMenuPresenter);
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        void setStyle(Context context) {
            TypedArray typedarray = context.obtainStyledAttributes(com.android.internal.R.styleable.Theme);
            background = typedarray.getResourceId(46, 0);
            fullBackground = typedarray.getResourceId(47, 0);
            windowAnimations = typedarray.getResourceId(93, 0);
            isCompact = typedarray.getBoolean(225, false);
            listPresenterTheme = typedarray.getResourceId(227, 0x10302ef);
            typedarray.recycle();
        }

        int background;
        View createdPanelView;
        DecorView decorView;
        int featureId;
        Bundle frozenActionViewState;
        Bundle frozenMenuState;
        int fullBackground;
        int gravity;
        IconMenuPresenter iconMenuPresenter;
        boolean isCompact;
        boolean isHandled;
        boolean isInExpandedMode;
        boolean isOpen;
        boolean isPrepared;
        ListMenuPresenter listMenuPresenter;
        int listPresenterTheme;
        MenuBuilder menu;
        public boolean qwertyMode;
        boolean refreshDecorView;
        boolean refreshMenuContent;
        View shownPanelView;
        boolean wasLastExpanded;
        boolean wasLastOpen;
        int windowAnimations;
        int x;
        int y;

        PanelFeatureState(int i) {
            featureId = i;
            refreshDecorView = false;
        }
    }

    private static final class DrawableFeatureState {

        int alpha;
        Drawable child;
        Drawable cur;
        int curAlpha;
        Drawable def;
        final int featureId;
        Drawable local;
        int resid;
        Uri uri;

        DrawableFeatureState(int i) {
            alpha = 255;
            curAlpha = 255;
            featureId = i;
        }
    }

    final class DecorView extends FrameLayout
        implements RootViewSurfaceTaker {
        private class ActionModeCallbackWrapper
            implements android.view.ActionMode.Callback {

            public boolean onActionItemClicked(ActionMode actionmode, MenuItem menuitem) {
                return mWrapped.onActionItemClicked(actionmode, menuitem);
            }

            public boolean onCreateActionMode(ActionMode actionmode, Menu menu) {
                return mWrapped.onCreateActionMode(actionmode, menu);
            }

            public void onDestroyActionMode(ActionMode actionmode) {
                mWrapped.onDestroyActionMode(actionmode);
                if(mActionModePopup != null) {
                    removeCallbacks(mShowActionModePopup);
                    mActionModePopup.dismiss();
                } else
                if(mActionModeView != null)
                    mActionModeView.setVisibility(8);
                if(mActionModeView != null)
                    mActionModeView.removeAllViews();
                if(getCallback() != null && !isDestroyed())
                    try {
                        getCallback().onActionModeFinished(mActionMode);
                    }
                    catch(AbstractMethodError abstractmethoderror) { }
                mActionMode = null;
            }

            public boolean onPrepareActionMode(ActionMode actionmode, Menu menu) {
                return mWrapped.onPrepareActionMode(actionmode, menu);
            }

            private android.view.ActionMode.Callback mWrapped;
            final DecorView this$1;

            public ActionModeCallbackWrapper(android.view.ActionMode.Callback callback) {
                this$1 = DecorView.this;
                super();
                mWrapped = callback;
            }
        }


        private void drawableChanged() {
            if(!mChanging) goto _L2; else goto _L1
_L1:
            return;
_L2:
            setPadding(mFramePadding.left + mBackgroundPadding.left, mFramePadding.top + mBackgroundPadding.top, mFramePadding.right + mBackgroundPadding.right, mFramePadding.bottom + mBackgroundPadding.bottom);
            requestLayout();
            invalidate();
            int i = -1;
            Drawable drawable = getBackground();
            Drawable drawable1 = getForeground();
            if(drawable != null)
                if(drawable1 == null)
                    i = drawable.getOpacity();
                else
                if(mFramePadding.left <= 0 && mFramePadding.top <= 0 && mFramePadding.right <= 0 && mFramePadding.bottom <= 0) {
                    int j = drawable1.getOpacity();
                    int k = drawable.getOpacity();
                    if(j == -1 || k == -1)
                        i = -1;
                    else
                    if(j == 0)
                        i = k;
                    else
                    if(k == 0)
                        i = j;
                    else
                        i = Drawable.resolveOpacity(j, k);
                } else {
                    i = -3;
                }
            mDefaultOpacity = i;
            if(mFeatureId < 0)
                setDefaultWindowFormat(i);
            if(true) goto _L1; else goto _L3
_L3:
        }

        private boolean isOutOfBounds(int i, int j) {
            boolean flag;
            if(i < -5 || j < -5 || i > 5 + getWidth() || j > 5 + getHeight())
                flag = true;
            else
                flag = false;
            return flag;
        }

        protected void dispatchDraw(Canvas canvas) {
            super.dispatchDraw(canvas);
            Injector.drawRoundedCorners(PhoneWindow.this, this, canvas, mFrameOffsets, mDrawingBounds);
        }

        public boolean dispatchGenericMotionEvent(MotionEvent motionevent) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                flag = callback.dispatchGenericMotionEvent(motionevent);
            else
                flag = super.dispatchGenericMotionEvent(motionevent);
            return flag;
        }

        public boolean dispatchKeyEvent(KeyEvent keyevent) {
            boolean flag;
            int i;
            boolean flag1;
            flag = true;
            i = keyevent.getKeyCode();
            if(keyevent.getAction() == 0)
                flag1 = flag;
            else
                flag1 = false;
            break MISSING_BLOCK_LABEL_17;
            while(true)  {
                do
                    return flag;
                while(flag1 && keyevent.getRepeatCount() == 0 && (mPanelChordingKey > 0 && mPanelChordingKey != i && dispatchKeyShortcutEvent(keyevent) || mPreparedPanel != null && mPreparedPanel.isOpen && performPanelShortcut(mPreparedPanel, i, keyevent, 0)));
                if(!isDestroyed()) {
                    android.view.Window.Callback callback = getCallback();
                    boolean flag2;
                    if(callback != null && mFeatureId < 0)
                        flag2 = callback.dispatchKeyEvent(keyevent);
                    else
                        flag2 = super.dispatchKeyEvent(keyevent);
                    if(flag2)
                        continue;
                }
                if(flag1)
                    flag = onKeyDown(mFeatureId, keyevent.getKeyCode(), keyevent);
                else
                    flag = onKeyUp(mFeatureId, keyevent.getKeyCode(), keyevent);
            }
        }

        public boolean dispatchKeyShortcutEvent(KeyEvent keyevent) {
            boolean flag = true;
            if(mPreparedPanel == null || !performPanelShortcut(mPreparedPanel, keyevent.getKeyCode(), keyevent, flag)) goto _L2; else goto _L1
_L1:
            if(mPreparedPanel != null)
                mPreparedPanel.isHandled = flag;
_L4:
            return flag;
_L2:
            android.view.Window.Callback callback = getCallback();
            boolean flag1;
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                flag1 = callback.dispatchKeyShortcutEvent(keyevent);
            else
                flag1 = super.dispatchKeyShortcutEvent(keyevent);
            if(flag1)
                continue; /* Loop/switch isn't completed */
            if(mPreparedPanel == null) {
                PanelFeatureState panelfeaturestate = getPanelState(0, flag);
                preparePanel(panelfeaturestate, keyevent);
                boolean flag2 = performPanelShortcut(panelfeaturestate, keyevent.getKeyCode(), keyevent, flag);
                panelfeaturestate.isPrepared = false;
                if(flag2)
                    continue; /* Loop/switch isn't completed */
            }
            flag = false;
            if(true) goto _L4; else goto _L3
_L3:
        }

        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null && !isDestroyed() && callback.dispatchPopulateAccessibilityEvent(accessibilityevent))
                flag = true;
            else
                flag = super.dispatchPopulateAccessibilityEvent(accessibilityevent);
            return flag;
        }

        public boolean dispatchTouchEvent(MotionEvent motionevent) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                flag = callback.dispatchTouchEvent(motionevent);
            else
                flag = super.dispatchTouchEvent(motionevent);
            return flag;
        }

        public boolean dispatchTrackballEvent(MotionEvent motionevent) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                flag = callback.dispatchTrackballEvent(motionevent);
            else
                flag = super.dispatchTrackballEvent(motionevent);
            return flag;
        }

        public void draw(Canvas canvas) {
            super.draw(canvas);
            if(mMenuBackground != null)
                mMenuBackground.draw(canvas);
        }

        public void finishChanging() {
            mChanging = false;
            drawableChanged();
        }

        protected boolean fitSystemWindows(Rect rect) {
            mFrameOffsets.set(rect);
            if(getForeground() != null)
                drawableChanged();
            return super.fitSystemWindows(rect);
        }

        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            updateWindowResizeState();
            android.view.Window.Callback callback = getCallback();
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                callback.onAttachedToWindow();
            if(mFeatureId == -1)
                openPanelsAfterRestore();
        }

        public void onCloseSystemDialogs(String s) {
            if(mFeatureId >= 0)
                closeAllPanels();
        }

        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            android.view.Window.Callback callback = getCallback();
            if(callback != null && mFeatureId < 0)
                callback.onDetachedFromWindow();
            if(mActionBar != null)
                mActionBar.dismissPopupMenus();
            if(mActionModePopup != null) {
                removeCallbacks(mShowActionModePopup);
                if(mActionModePopup.isShowing())
                    mActionModePopup.dismiss();
                mActionModePopup = null;
            }
            PanelFeatureState panelfeaturestate = getPanelState(0, false);
            if(panelfeaturestate != null && panelfeaturestate.menu != null && mFeatureId < 0)
                panelfeaturestate.menu.close();
        }

        public boolean onInterceptTouchEvent(MotionEvent motionevent) {
            int i = motionevent.getAction();
            boolean flag;
            if(mFeatureId >= 0 && i == 0 && isOutOfBounds((int)motionevent.getX(), (int)motionevent.getY())) {
                closePanel(mFeatureId);
                flag = true;
            } else {
                flag = false;
            }
            return flag;
        }

        protected void onMeasure(int i, int j) {
            DisplayMetrics displaymetrics = getContext().getResources().getDisplayMetrics();
            boolean flag;
            int k;
            int l;
            boolean flag1;
            if(displaymetrics.widthPixels < displaymetrics.heightPixels)
                flag = true;
            else
                flag = false;
            k = android.view.View.MeasureSpec.getMode(i);
            l = android.view.View.MeasureSpec.getMode(j);
            flag1 = false;
            if(k == 0x80000000) {
                TypedValue typedvalue2;
                if(flag)
                    typedvalue2 = mFixedWidthMinor;
                else
                    typedvalue2 = mFixedWidthMajor;
                if(typedvalue2 != null && typedvalue2.type != 0) {
                    int i1;
                    boolean flag2;
                    int j1;
                    int i2;
                    if(typedvalue2.type == 5)
                        i2 = (int)typedvalue2.getDimension(displaymetrics);
                    else
                    if(typedvalue2.type == 6)
                        i2 = (int)typedvalue2.getFraction(displaymetrics.widthPixels, displaymetrics.widthPixels);
                    else
                        i2 = 0;
                    if(i2 > 0) {
                        i = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(i2, android.view.View.MeasureSpec.getSize(i)), 0x40000000);
                        flag1 = true;
                    }
                }
            }
            if(l == 0x80000000) {
                TypedValue typedvalue1;
                if(flag)
                    typedvalue1 = mFixedHeightMajor;
                else
                    typedvalue1 = mFixedHeightMinor;
                if(typedvalue1 != null && typedvalue1.type != 0) {
                    int l1;
                    if(typedvalue1.type == 5)
                        l1 = (int)typedvalue1.getDimension(displaymetrics);
                    else
                    if(typedvalue1.type == 6)
                        l1 = (int)typedvalue1.getFraction(displaymetrics.heightPixels, displaymetrics.heightPixels);
                    else
                        l1 = 0;
                    if(l1 > 0)
                        j = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(l1, android.view.View.MeasureSpec.getSize(j)), 0x40000000);
                }
            }
            super.onMeasure(i, j);
            i1 = getMeasuredWidth();
            flag2 = false;
            j1 = android.view.View.MeasureSpec.makeMeasureSpec(i1, 0x40000000);
            if(!flag1 && k == 0x80000000) {
                TypedValue typedvalue;
                if(flag)
                    typedvalue = mMinWidthMinor;
                else
                    typedvalue = mMinWidthMajor;
                if(typedvalue.type != 0) {
                    int k1;
                    if(typedvalue.type == 5)
                        k1 = (int)typedvalue.getDimension(displaymetrics);
                    else
                    if(typedvalue.type == 6)
                        k1 = (int)typedvalue.getFraction(displaymetrics.widthPixels, displaymetrics.widthPixels);
                    else
                        k1 = 0;
                    if(i1 < k1) {
                        j1 = android.view.View.MeasureSpec.makeMeasureSpec(k1, 0x40000000);
                        flag2 = true;
                    }
                }
            }
            if(flag2)
                super.onMeasure(j1, j);
        }

        public boolean onTouchEvent(MotionEvent motionevent) {
            return onInterceptTouchEvent(motionevent);
        }

        public void onWindowFocusChanged(boolean flag) {
            super.onWindowFocusChanged(flag);
            if(!flag && mPanelChordingKey != 0)
                closePanel(0);
            android.view.Window.Callback callback = getCallback();
            if(callback != null && !isDestroyed() && mFeatureId < 0)
                callback.onWindowFocusChanged(flag);
        }

        public void sendAccessibilityEvent(int i) {
            if(AccessibilityManager.getInstance(mContext).isEnabled())
                if((mFeatureId == 0 || mFeatureId == 6 || mFeatureId == 2 || mFeatureId == 5) && getChildCount() == 1)
                    getChildAt(0).sendAccessibilityEvent(i);
                else
                    super.sendAccessibilityEvent(i);
        }

        public void setBackgroundDrawable(Drawable drawable) {
            super.setBackgroundDrawable(drawable);
            if(getWindowToken() != null)
                updateWindowResizeState();
        }

        protected boolean setFrame(int i, int j, int k, int l) {
            boolean flag = super.setFrame(i, j, k, l);
            if(flag) {
                Rect rect = mDrawingBounds;
                getDrawingRect(rect);
                Drawable drawable = getForeground();
                if(drawable != null) {
                    Rect rect1 = mFrameOffsets;
                    rect.left = rect.left + rect1.left;
                    rect.top = rect.top + rect1.top;
                    rect.right = rect.right - rect1.right;
                    rect.bottom = rect.bottom - rect1.bottom;
                    drawable.setBounds(rect);
                    Rect rect2 = mFramePadding;
                    rect.left = rect.left + (rect2.left - rect1.left);
                    rect.top = rect.top + (rect2.top - rect1.top);
                    rect.right = rect.right - (rect2.right - rect1.right);
                    rect.bottom = rect.bottom - (rect2.bottom - rect1.bottom);
                }
                Drawable drawable1 = getBackground();
                if(drawable1 != null)
                    drawable1.setBounds(rect);
            }
            return flag;
        }

        public void setSurfaceFormat(int i) {
            setFormat(i);
        }

        public void setSurfaceKeepScreenOn(boolean flag) {
            if(flag)
                addFlags(128);
            else
                clearFlags(128);
        }

        public void setSurfaceType(int i) {
            setType(i);
        }

        public void setWindowBackground(Drawable drawable) {
            if(getBackground() != drawable) {
                setBackgroundDrawable(drawable);
                if(drawable != null)
                    drawable.getPadding(mBackgroundPadding);
                else
                    mBackgroundPadding.setEmpty();
                drawableChanged();
            }
        }

        public void setWindowFrame(Drawable drawable) {
            if(getForeground() != drawable) {
                setForeground(drawable);
                if(drawable != null)
                    drawable.getPadding(mFramePadding);
                else
                    mFramePadding.setEmpty();
                drawableChanged();
            }
        }

        public boolean showContextMenuForChild(View view) {
            MenuDialogHelper menudialoghelper;
            boolean flag;
            if(mContextMenu == null) {
                mContextMenu = new ContextMenuBuilder(getContext());
                mContextMenu.setCallback(mContextMenuCallback);
            } else {
                mContextMenu.clearAll();
            }
            menudialoghelper = mContextMenu.show(view, view.getWindowToken());
            if(menudialoghelper != null)
                menudialoghelper.setPresenterCallback(mContextMenuCallback);
            mContextMenuHelper = menudialoghelper;
            if(menudialoghelper != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        public ActionMode startActionMode(android.view.ActionMode.Callback callback) {
            ActionModeCallbackWrapper actionmodecallbackwrapper;
            ActionMode actionmode;
            if(mActionMode != null)
                mActionMode.finish();
            actionmodecallbackwrapper = new ActionModeCallbackWrapper(callback);
            actionmode = null;
            if(getCallback() == null || isDestroyed())
                break MISSING_BLOCK_LABEL_64;
            ActionMode actionmode1 = getCallback().onWindowStartingActionMode(actionmodecallbackwrapper);
            actionmode = actionmode1;
_L2:
            if(actionmode != null) {
                mActionMode = actionmode;
            } else {
                if(mActionModeView == null)
                    if(isFloating()) {
                        mActionModeView = new ActionBarContextView(mContext);
                        mActionModePopup = new PopupWindow(mContext, null, 0x10103c8);
                        mActionModePopup.setLayoutInScreenEnabled(true);
                        mActionModePopup.setLayoutInsetDecor(true);
                        mActionModePopup.setWindowLayoutType(2);
                        mActionModePopup.setContentView(mActionModeView);
                        mActionModePopup.setWidth(-1);
                        TypedValue typedvalue = new TypedValue();
                        mContext.getTheme().resolveAttribute(0x10102eb, typedvalue, true);
                        int i = TypedValue.complexToDimensionPixelSize(typedvalue.data, mContext.getResources().getDisplayMetrics());
                        mActionModeView.setContentHeight(i);
                        mActionModePopup.setHeight(-2);
                        mShowActionModePopup = new Runnable() {

                            public void run() {
                                mActionModePopup.showAtLocation(mActionModeView.getApplicationWindowToken(), 55, 0, 0);
                            }

                            final DecorView this$1;

                 {
                    this$1 = DecorView.this;
                    super();
                }
                        };
                    } else {
                        ViewStub viewstub = (ViewStub)findViewById(0x1020319);
                        if(viewstub != null)
                            mActionModeView = (ActionBarContextView)viewstub.inflate();
                    }
                if(mActionModeView != null) {
                    mActionModeView.killMode();
                    Context context = getContext();
                    ActionBarContextView actionbarcontextview = mActionModeView;
                    boolean flag;
                    StandaloneActionMode standaloneactionmode;
                    if(mActionModePopup == null)
                        flag = true;
                    else
                        flag = false;
                    standaloneactionmode = new StandaloneActionMode(context, actionbarcontextview, actionmodecallbackwrapper, flag);
                    if(callback.onCreateActionMode(standaloneactionmode, standaloneactionmode.getMenu())) {
                        standaloneactionmode.invalidate();
                        mActionModeView.initForMode(standaloneactionmode);
                        mActionModeView.setVisibility(0);
                        mActionMode = standaloneactionmode;
                        if(mActionModePopup != null)
                            post(mShowActionModePopup);
                        mActionModeView.sendAccessibilityEvent(32);
                    } else {
                        mActionMode = null;
                    }
                }
            }
            if(mActionMode != null && getCallback() != null && !isDestroyed())
                try {
                    getCallback().onActionModeStarted(mActionMode);
                }
                catch(AbstractMethodError abstractmethoderror) { }
            return mActionMode;
            AbstractMethodError abstractmethoderror1;
            abstractmethoderror1;
            if(true) goto _L2; else goto _L1
_L1:
        }

        public ActionMode startActionModeForChild(View view, android.view.ActionMode.Callback callback) {
            return startActionMode(callback);
        }

        public void startChanging() {
            mChanging = true;
        }

        public boolean superDispatchGenericMotionEvent(MotionEvent motionevent) {
            return super.dispatchGenericMotionEvent(motionevent);
        }

        public boolean superDispatchKeyEvent(KeyEvent keyevent) {
            boolean flag = true;
            if(!super.dispatchKeyEvent(keyevent)) goto _L2; else goto _L1
_L1:
            return flag;
_L2:
            if(keyevent.getKeyCode() == 4) {
                int i = keyevent.getAction();
                if(mActionMode != null) {
                    if(i == flag)
                        mActionMode.finish();
                    continue; /* Loop/switch isn't completed */
                }
                if(mActionBar != null && mActionBar.hasExpandedActionView()) {
                    if(i == flag)
                        mActionBar.collapseActionView();
                    continue; /* Loop/switch isn't completed */
                }
            }
            flag = false;
            if(true) goto _L1; else goto _L3
_L3:
        }

        public boolean superDispatchKeyShortcutEvent(KeyEvent keyevent) {
            return super.dispatchKeyShortcutEvent(keyevent);
        }

        public boolean superDispatchTouchEvent(MotionEvent motionevent) {
            return super.dispatchTouchEvent(motionevent);
        }

        public boolean superDispatchTrackballEvent(MotionEvent motionevent) {
            return super.dispatchTrackballEvent(motionevent);
        }

        void updateWindowResizeState() {
            Drawable drawable = getBackground();
            boolean flag;
            if(drawable == null || drawable.getOpacity() != -1)
                flag = true;
            else
                flag = false;
            hackTurnOffWindowResizeAnim(flag);
        }

        public android.view.InputQueue.Callback willYouTakeTheInputQueue() {
            android.view.InputQueue.Callback callback;
            if(mFeatureId < 0)
                callback = mTakeInputQueueCallback;
            else
                callback = null;
            return callback;
        }

        public android.view.SurfaceHolder.Callback2 willYouTakeTheSurface() {
            android.view.SurfaceHolder.Callback2 callback2;
            if(mFeatureId < 0)
                callback2 = mTakeSurfaceCallback;
            else
                callback2 = null;
            return callback2;
        }

        private ActionMode mActionMode;
        private PopupWindow mActionModePopup;
        private ActionBarContextView mActionModeView;
        private final Rect mBackgroundPadding = new Rect();
        private boolean mChanging;
        int mDefaultOpacity;
        private int mDownY;
        private final Rect mDrawingBounds = new Rect();
        private final int mFeatureId;
        private final Rect mFrameOffsets = new Rect();
        private final Rect mFramePadding = new Rect();
        private Drawable mMenuBackground;
        RoundedCorners mRoundedCorners;
        private Runnable mShowActionModePopup;
        private boolean mWatchingForMenu;
        final PhoneWindow this$0;



/*
        static ActionMode access$102(DecorView decorview, ActionMode actionmode) {
            decorview.mActionMode = actionmode;
            return actionmode;
        }

*/




        public DecorView(Context context, int i) {
            this$0 = PhoneWindow.this;
            super(context);
            mDefaultOpacity = -1;
            mFeatureId = i;
        }
    }

    private final class ActionMenuPresenterCallback
        implements com.android.internal.view.menu.MenuPresenter.Callback {

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag) {
            checkCloseActionMenu(menubuilder);
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder) {
            android.view.Window.Callback callback = getCallback();
            boolean flag;
            if(callback != null) {
                callback.onMenuOpened(8, menubuilder);
                flag = true;
            } else {
                flag = false;
            }
            return flag;
        }

        final PhoneWindow this$0;

        private ActionMenuPresenterCallback() {
            this$0 = PhoneWindow.this;
            super();
        }

    }

    private class PanelMenuPresenterCallback
        implements com.android.internal.view.menu.MenuPresenter.Callback {

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag) {
            MenuBuilder menubuilder1 = menubuilder.getRootMenu();
            boolean flag1;
            PhoneWindow phonewindow;
            PanelFeatureState panelfeaturestate;
            if(menubuilder1 != menubuilder)
                flag1 = true;
            else
                flag1 = false;
            phonewindow = PhoneWindow.this;
            if(flag1)
                menubuilder = menubuilder1;
            panelfeaturestate = phonewindow.findMenuPanel(menubuilder);
            if(panelfeaturestate != null)
                if(flag1) {
                    callOnPanelClosed(panelfeaturestate.featureId, panelfeaturestate, menubuilder1);
                    closePanel(panelfeaturestate, true);
                } else {
                    closePanel(panelfeaturestate, flag);
                }
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder) {
            if(menubuilder == null && hasFeature(8)) {
                android.view.Window.Callback callback = getCallback();
                if(callback != null && !isDestroyed())
                    callback.onMenuOpened(8, menubuilder);
            }
            return true;
        }

        final PhoneWindow this$0;

        private PanelMenuPresenterCallback() {
            this$0 = PhoneWindow.this;
            super();
        }

    }

    static class WindowManagerHolder {

        static final IWindowManager sWindowManager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));


        WindowManagerHolder() {
        }
    }

    static class Injector {

        static void drawRoundedCorners(PhoneWindow phonewindow, DecorView decorview, Canvas canvas, Rect rect, Rect rect1) {
            if(phonewindow.getAttributes().type <= 99 && rect.left == 0 && rect.right == 0 && rect.bottom == 0) {
                if(decorview.mRoundedCorners == null)
                    decorview.mRoundedCorners = new RoundedCorners(phonewindow.getContext());
                decorview.mRoundedCorners.draw(canvas, rect1.left, rect1.top + rect.top, rect1.right, rect1.bottom);
            }
        }

        static void handleIcsAppLayoutParams(PhoneWindow phonewindow, WindowManager windowmanager, android.view.WindowManager.LayoutParams layoutparams) {
            int i = -2;
            boolean flag;
            if(phonewindow.getContext().getApplicationInfo().targetSdkVersion >= 14)
                flag = true;
            else
                flag = false;
            if(flag) {
                int j = windowmanager.getDefaultDisplay().getRotation();
                if(j != 0 && j != 2)
                    i = -1;
                layoutparams.height = i;
                layoutparams.flags = 2 | layoutparams.flags;
                layoutparams.dimAmount = 0.7F;
            }
        }

        Injector() {
        }
    }


    public PhoneWindow(Context context) {
        super(context);
        mBackgroundResource = 0;
        mFrameResource = 0;
        mTextColor = 0;
        mTitle = null;
        mTitleColor = 0;
        mAlwaysReadCloseOnTouchAttr = false;
        mVolumeControlStreamType = 0x80000000;
        mUiOptions = 0;
        mLayoutInflater = LayoutInflater.from(context);
    }

    private void callOnPanelClosed(int i, PanelFeatureState panelfeaturestate, Menu menu) {
        android.view.Window.Callback callback = getCallback();
        if(callback != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(menu == null) {
            if(panelfeaturestate == null && i >= 0 && i < mPanels.length)
                panelfeaturestate = mPanels[i];
            if(panelfeaturestate != null)
                menu = panelfeaturestate.menu;
        }
        if((panelfeaturestate == null || panelfeaturestate.isOpen) && !isDestroyed())
            callback.onPanelClosed(i, menu);
        if(true) goto _L1; else goto _L3
_L3:
    }

    private static void clearMenuViews(PanelFeatureState panelfeaturestate) {
        panelfeaturestate.createdPanelView = null;
        panelfeaturestate.refreshDecorView = true;
        panelfeaturestate.clearMenuPresenters();
    }

    /**
     * @deprecated Method closeContextMenu is deprecated
     */

    private void closeContextMenu() {
        this;
        JVM INSTR monitorenter ;
        if(mContextMenu != null) {
            mContextMenu.close();
            dismissContextMenu();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method dismissContextMenu is deprecated
     */

    private void dismissContextMenu() {
        this;
        JVM INSTR monitorenter ;
        mContextMenu = null;
        if(mContextMenuHelper != null) {
            mContextMenuHelper.dismiss();
            mContextMenuHelper = null;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private ProgressBar getCircularProgressBar(boolean flag) {
        ProgressBar progressbar;
        if(mCircularProgressBar != null) {
            progressbar = mCircularProgressBar;
        } else {
            if(mContentParent == null && flag)
                installDecor();
            mCircularProgressBar = (ProgressBar)findViewById(0x102031c);
            if(mCircularProgressBar != null)
                mCircularProgressBar.setVisibility(4);
            progressbar = mCircularProgressBar;
        }
        return progressbar;
    }

    private DrawableFeatureState getDrawableState(int i, boolean flag) {
        if((getFeatures() & 1 << i) != 0) goto _L2; else goto _L1
_L1:
        if(flag) goto _L4; else goto _L3
_L3:
        DrawableFeatureState drawablefeaturestate = null;
_L6:
        return drawablefeaturestate;
_L4:
        throw new RuntimeException("The feature has not been requested");
_L2:
        DrawableFeatureState adrawablefeaturestate[] = mDrawables;
        if(adrawablefeaturestate == null || adrawablefeaturestate.length <= i) {
            DrawableFeatureState adrawablefeaturestate1[] = new DrawableFeatureState[i + 1];
            if(adrawablefeaturestate != null)
                System.arraycopy(adrawablefeaturestate, 0, adrawablefeaturestate1, 0, adrawablefeaturestate.length);
            adrawablefeaturestate = adrawablefeaturestate1;
            mDrawables = adrawablefeaturestate1;
        }
        drawablefeaturestate = adrawablefeaturestate[i];
        if(drawablefeaturestate == null) {
            drawablefeaturestate = new DrawableFeatureState(i);
            adrawablefeaturestate[i] = drawablefeaturestate;
        }
        if(true) goto _L6; else goto _L5
_L5:
    }

    private ProgressBar getHorizontalProgressBar(boolean flag) {
        ProgressBar progressbar;
        if(mHorizontalProgressBar != null) {
            progressbar = mHorizontalProgressBar;
        } else {
            if(mContentParent == null && flag)
                installDecor();
            mHorizontalProgressBar = (ProgressBar)findViewById(0x102031d);
            if(mHorizontalProgressBar != null)
                mHorizontalProgressBar.setVisibility(4);
            progressbar = mHorizontalProgressBar;
        }
        return progressbar;
    }

    private KeyguardManager getKeyguardManager() {
        if(mKeyguardManager == null)
            mKeyguardManager = (KeyguardManager)getContext().getSystemService("keyguard");
        return mKeyguardManager;
    }

    private ImageView getLeftIconView() {
        ImageView imageview;
        if(mLeftIconView != null) {
            imageview = mLeftIconView;
        } else {
            if(mContentParent == null)
                installDecor();
            imageview = (ImageView)findViewById(0x1020232);
            mLeftIconView = imageview;
        }
        return imageview;
    }

    private int getOptionsPanelGravity() {
        int j = WindowManagerHolder.sWindowManager.getPreferredOptionsPanelGravity();
        int i = j;
_L2:
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.e("PhoneWindow", "Couldn't getOptionsPanelGravity; using default", remoteexception);
        i = 81;
        if(true) goto _L2; else goto _L1
_L1:
    }

    private PanelFeatureState getPanelState(int i, boolean flag) {
        return getPanelState(i, flag, null);
    }

    private PanelFeatureState getPanelState(int i, boolean flag, PanelFeatureState panelfeaturestate) {
        if((getFeatures() & 1 << i) != 0) goto _L2; else goto _L1
_L1:
        if(flag) goto _L4; else goto _L3
_L3:
        PanelFeatureState panelfeaturestate1 = null;
_L6:
        return panelfeaturestate1;
_L4:
        throw new RuntimeException("The feature has not been requested");
_L2:
        PanelFeatureState apanelfeaturestate[] = mPanels;
        if(apanelfeaturestate == null || apanelfeaturestate.length <= i) {
            PanelFeatureState apanelfeaturestate1[] = new PanelFeatureState[i + 1];
            if(apanelfeaturestate != null)
                System.arraycopy(apanelfeaturestate, 0, apanelfeaturestate1, 0, apanelfeaturestate.length);
            apanelfeaturestate = apanelfeaturestate1;
            mPanels = apanelfeaturestate1;
        }
        panelfeaturestate1 = apanelfeaturestate[i];
        if(panelfeaturestate1 == null) {
            if(panelfeaturestate != null)
                panelfeaturestate1 = panelfeaturestate;
            else
                panelfeaturestate1 = new PanelFeatureState(i);
            apanelfeaturestate[i] = panelfeaturestate1;
        }
        if(true) goto _L6; else goto _L5
_L5:
    }

    private ImageView getRightIconView() {
        ImageView imageview;
        if(mRightIconView != null) {
            imageview = mRightIconView;
        } else {
            if(mContentParent == null)
                installDecor();
            imageview = (ImageView)findViewById(0x1020234);
            mRightIconView = imageview;
        }
        return imageview;
    }

    private void hideProgressBars(ProgressBar progressbar, ProgressBar progressbar1) {
        int i = getLocalFeatures();
        Animation animation = AnimationUtils.loadAnimation(getContext(), 0x10a0001);
        animation.setDuration(1000L);
        if((i & 0x20) != 0 && progressbar1.getVisibility() == 0) {
            progressbar1.startAnimation(animation);
            progressbar1.setVisibility(4);
        }
        if((i & 4) != 0 && progressbar.getVisibility() == 0) {
            progressbar.startAnimation(animation);
            progressbar.setVisibility(4);
        }
    }

    private void installDecor() {
        boolean flag;
        flag = true;
        if(mDecor == null) {
            mDecor = generateDecor();
            mDecor.setDescendantFocusability(0x40000);
            mDecor.setIsRootNamespace(flag);
        }
        if(mContentParent != null) goto _L2; else goto _L1
_L1:
        mContentParent = generateLayout(mDecor);
        mDecor.makeOptionalFitsSystemWindows();
        mTitleView = (TextView)findViewById(0x1020016);
        if(mTitleView == null) goto _L4; else goto _L3
_L3:
        if((2 & getLocalFeatures()) != 0) {
            View view = findViewById(0x1020235);
            if(view != null)
                view.setVisibility(8);
            else
                mTitleView.setVisibility(8);
            if(mContentParent instanceof FrameLayout)
                ((FrameLayout)mContentParent).setForeground(null);
        } else {
            mTitleView.setText(mTitle);
        }
_L2:
        return;
_L4:
        boolean flag1;
        mActionBar = (ActionBarView)findViewById(0x102031f);
        if(mActionBar == null)
            continue; /* Loop/switch isn't completed */
        mActionBar.setWindowCallback(getCallback());
        if(mActionBar.getTitle() == null)
            mActionBar.setWindowTitle(mTitle);
        int i = getLocalFeatures();
        if((i & 4) != 0)
            mActionBar.initProgress();
        if((i & 0x20) != 0)
            mActionBar.initIndeterminateProgress();
        ActionBarContainer actionbarcontainer;
        ActionBarContextView actionbarcontextview;
        if((1 & mUiOptions) == 0)
            flag = false;
        if(flag)
            flag1 = getContext().getResources().getBoolean(0x1110002);
        else
            flag1 = getWindowStyle().getBoolean(22, false);
        actionbarcontainer = (ActionBarContainer)findViewById(0x1020321);
        if(actionbarcontainer == null)
            break; /* Loop/switch isn't completed */
        mActionBar.setSplitView(actionbarcontainer);
        mActionBar.setSplitActionBar(flag1);
        mActionBar.setSplitWhenNarrow(flag);
        actionbarcontextview = (ActionBarContextView)findViewById(0x1020320);
        actionbarcontextview.setSplitView(actionbarcontainer);
        actionbarcontextview.setSplitActionBar(flag1);
        actionbarcontextview.setSplitWhenNarrow(flag);
_L7:
        mDecor.post(new Runnable() {

            public void run() {
                PanelFeatureState panelfeaturestate = getPanelState(0, false);
                if(!isDestroyed() && (panelfeaturestate == null || panelfeaturestate.menu == null))
                    invalidatePanelMenu(8);
            }

            final PhoneWindow this$0;

             {
                this$0 = PhoneWindow.this;
                super();
            }
        });
        if(true) goto _L2; else goto _L5
_L5:
        if(!flag1) goto _L7; else goto _L6
_L6:
        Log.e("PhoneWindow", "Requested split action bar with incompatible window decor! Ignoring request.");
          goto _L7
    }

    private boolean launchDefaultSearch() {
        android.view.Window.Callback callback = getCallback();
        boolean flag;
        if(callback == null || isDestroyed()) {
            flag = false;
        } else {
            sendCloseSystemWindows("search");
            flag = callback.onSearchRequested();
        }
        return flag;
    }

    private Drawable loadImageURI(Uri uri) {
        Drawable drawable = null;
        Drawable drawable1 = Drawable.createFromStream(getContext().getContentResolver().openInputStream(uri), null);
        drawable = drawable1;
_L2:
        return drawable;
        Exception exception;
        exception;
        Log.w("PhoneWindow", (new StringBuilder()).append("Unable to open content: ").append(uri).toString());
        if(true) goto _L2; else goto _L1
_L1:
    }

    private void openPanel(PanelFeatureState panelfeaturestate, KeyEvent keyevent) {
        if(!panelfeaturestate.isOpen && !isDestroyed()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(panelfeaturestate.featureId != 0) goto _L4; else goto _L3
_L3:
        Context context = getContext();
        android.view.Window.Callback callback;
        boolean flag;
        boolean flag1;
        if((0xf & context.getResources().getConfiguration().screenLayout) == 4)
            flag = true;
        else
            flag = false;
        if(context.getApplicationInfo().targetSdkVersion >= 11)
            flag1 = true;
        else
            flag1 = false;
        if(flag && flag1) goto _L1; else goto _L4
_L4:
label0:
        {
            callback = getCallback();
            if(callback == null || callback.onMenuOpened(panelfeaturestate.featureId, panelfeaturestate.menu))
                break label0;
            closePanel(panelfeaturestate, true);
        }
          goto _L1
        WindowManager windowmanager = getWindowManager();
        if(windowmanager == null || !preparePanel(panelfeaturestate, keyevent)) goto _L1; else goto _L5
_L5:
        byte byte0;
        byte0 = -2;
        if(panelfeaturestate.decorView != null && !panelfeaturestate.refreshDecorView)
            break MISSING_BLOCK_LABEL_464;
        if(panelfeaturestate.decorView != null) goto _L7; else goto _L6
_L6:
        if(!initializePanelDecor(panelfeaturestate) || panelfeaturestate.decorView == null) goto _L1; else goto _L8
_L8:
        if(!initializePanelContent(panelfeaturestate) || !panelfeaturestate.hasPanelItems()) goto _L1; else goto _L9
_L9:
        android.view.WindowManager.LayoutParams layoutparams1;
        android.view.ViewGroup.LayoutParams layoutparams = panelfeaturestate.shownPanelView.getLayoutParams();
        if(layoutparams == null)
            layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
        int i;
        android.view.ViewParent viewparent;
        if(layoutparams.width == -1) {
            i = panelfeaturestate.fullBackground;
            byte0 = -1;
        } else {
            i = panelfeaturestate.background;
        }
        panelfeaturestate.decorView.setWindowBackground(getContext().getResources().getDrawable(i));
        viewparent = panelfeaturestate.shownPanelView.getParent();
        if(viewparent != null && (viewparent instanceof ViewGroup))
            ((ViewGroup)viewparent).removeView(panelfeaturestate.shownPanelView);
        panelfeaturestate.decorView.addView(panelfeaturestate.shownPanelView, layoutparams);
        if(!panelfeaturestate.shownPanelView.hasFocus())
            panelfeaturestate.shownPanelView.requestFocus();
_L10:
        panelfeaturestate.isOpen = true;
        panelfeaturestate.isHandled = false;
        layoutparams1 = new android.view.WindowManager.LayoutParams(byte0, -2, panelfeaturestate.x, panelfeaturestate.y, 1003, 0x821000, panelfeaturestate.decorView.mDefaultOpacity);
        android.view.ViewGroup.LayoutParams layoutparams2;
        if(panelfeaturestate.isCompact) {
            layoutparams1.gravity = getOptionsPanelGravity();
            sRotationWatcher.addWindow(this);
        } else {
            layoutparams1.gravity = panelfeaturestate.gravity;
        }
        layoutparams1.windowAnimations = panelfeaturestate.windowAnimations;
        Injector.handleIcsAppLayoutParams(this, windowmanager, layoutparams1);
        windowmanager.addView(panelfeaturestate.decorView, layoutparams1);
          goto _L1
_L7:
        if(panelfeaturestate.refreshDecorView && panelfeaturestate.decorView.getChildCount() > 0)
            panelfeaturestate.decorView.removeAllViews();
          goto _L8
        if(!panelfeaturestate.isInListMode())
            byte0 = -1;
        else
        if(panelfeaturestate.createdPanelView != null) {
            layoutparams2 = panelfeaturestate.createdPanelView.getLayoutParams();
            if(layoutparams2 != null && layoutparams2.width == -1)
                byte0 = -1;
        }
          goto _L10
    }

    private void openPanelsAfterRestore() {
        PanelFeatureState apanelfeaturestate[] = mPanels;
        if(apanelfeaturestate != null) {
            int i = -1 + apanelfeaturestate.length;
            while(i >= 0)  {
                PanelFeatureState panelfeaturestate = apanelfeaturestate[i];
                if(panelfeaturestate != null) {
                    panelfeaturestate.applyFrozenState();
                    if(!panelfeaturestate.isOpen && panelfeaturestate.wasLastOpen) {
                        panelfeaturestate.isInExpandedMode = panelfeaturestate.wasLastExpanded;
                        openPanel(panelfeaturestate, null);
                    }
                }
                i--;
            }
        }
    }

    private boolean performPanelShortcut(PanelFeatureState panelfeaturestate, int i, KeyEvent keyevent, int j) {
        if(!keyevent.isSystem() && panelfeaturestate != null) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        flag = false;
        if((panelfeaturestate.isPrepared || preparePanel(panelfeaturestate, keyevent)) && panelfeaturestate.menu != null)
            flag = panelfeaturestate.menu.performShortcut(i, keyevent, j);
        if(flag) {
            panelfeaturestate.isHandled = true;
            if((j & 1) == 0 && mActionBar == null)
                closePanel(panelfeaturestate, true);
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private void reopenMenu(boolean flag) {
        if(mActionBar == null || !mActionBar.isOverflowReserved()) goto _L2; else goto _L1
_L1:
        android.view.Window.Callback callback = getCallback();
        if(mActionBar.isOverflowMenuShowing() && flag) goto _L4; else goto _L3
_L3:
        if(callback != null && !isDestroyed() && mActionBar.getVisibility() == 0) {
            PanelFeatureState panelfeaturestate1 = getPanelState(0, true);
            if(callback.onPreparePanel(0, panelfeaturestate1.createdPanelView, panelfeaturestate1.menu)) {
                callback.onMenuOpened(8, panelfeaturestate1.menu);
                mActionBar.showOverflowMenu();
            }
        }
_L6:
        return;
_L4:
        mActionBar.hideOverflowMenu();
        if(callback != null && !isDestroyed())
            callback.onPanelClosed(8, getPanelState(0, true).menu);
        continue; /* Loop/switch isn't completed */
_L2:
        PanelFeatureState panelfeaturestate = getPanelState(0, true);
        boolean flag1;
        if(flag) {
            if(!panelfeaturestate.isInExpandedMode)
                flag1 = true;
            else
                flag1 = false;
        } else {
            flag1 = panelfeaturestate.isInExpandedMode;
        }
        panelfeaturestate.refreshDecorView = true;
        closePanel(panelfeaturestate, false);
        panelfeaturestate.isInExpandedMode = flag1;
        openPanel(panelfeaturestate, null);
        if(true) goto _L6; else goto _L5
_L5:
    }

    private void restorePanelState(SparseArray sparsearray) {
        int i = -1 + sparsearray.size();
        while(i >= 0)  {
            PanelFeatureState panelfeaturestate = getPanelState(i, false);
            if(panelfeaturestate != null) {
                panelfeaturestate.onRestoreInstanceState((Parcelable)sparsearray.get(i));
                invalidatePanelMenu(i);
            }
            i--;
        }
    }

    private void savePanelState(SparseArray sparsearray) {
        PanelFeatureState apanelfeaturestate[] = mPanels;
        if(apanelfeaturestate != null) {
            int i = -1 + apanelfeaturestate.length;
            while(i >= 0)  {
                if(apanelfeaturestate[i] != null)
                    sparsearray.put(i, apanelfeaturestate[i].onSaveInstanceState());
                i--;
            }
        }
    }

    private void showProgressBars(ProgressBar progressbar, ProgressBar progressbar1) {
        int i = getLocalFeatures();
        if((i & 0x20) != 0 && progressbar1.getVisibility() == 4)
            progressbar1.setVisibility(0);
        if((i & 4) != 0 && progressbar.getProgress() < 10000)
            progressbar.setVisibility(0);
    }

    private void updateDrawable(int i, DrawableFeatureState drawablefeaturestate, boolean flag) {
        if(mContentParent != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int j = 1 << i;
        if((j & getFeatures()) != 0 || flag) {
            Drawable drawable = null;
            if(drawablefeaturestate != null) {
                drawable = drawablefeaturestate.child;
                if(drawable == null)
                    drawable = drawablefeaturestate.local;
                if(drawable == null)
                    drawable = drawablefeaturestate.def;
            }
            if((j & getLocalFeatures()) == 0) {
                if(getContainer() != null && (isActive() || flag))
                    getContainer().setChildDrawable(i, drawable);
            } else
            if(drawablefeaturestate != null && (drawablefeaturestate.cur != drawable || drawablefeaturestate.curAlpha != drawablefeaturestate.alpha)) {
                drawablefeaturestate.cur = drawable;
                drawablefeaturestate.curAlpha = drawablefeaturestate.alpha;
                onDrawableChanged(i, drawable, drawablefeaturestate.alpha);
            }
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    private void updateInt(int i, int j, boolean flag) {
        if(mContentParent != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int k = 1 << i;
        if((k & getFeatures()) != 0 || flag)
            if((k & getLocalFeatures()) == 0) {
                if(getContainer() != null)
                    getContainer().setChildInt(i, j);
            } else {
                onIntChanged(i, j);
            }
        if(true) goto _L1; else goto _L3
_L3:
    }

    private void updateProgressBars(int i) {
        ProgressBar progressbar;
        ProgressBar progressbar1;
        int j;
        progressbar = getCircularProgressBar(true);
        progressbar1 = getHorizontalProgressBar(true);
        j = getLocalFeatures();
        if(i != -1) goto _L2; else goto _L1
_L1:
        if((j & 4) != 0) {
            int k = progressbar1.getProgress();
            int l;
            if(progressbar1.isIndeterminate() || k < 10000)
                l = 0;
            else
                l = 4;
            progressbar1.setVisibility(l);
        }
        if((j & 0x20) != 0)
            progressbar.setVisibility(0);
_L4:
        return;
_L2:
        if(i == -2) {
            if((j & 4) != 0)
                progressbar1.setVisibility(8);
            if((j & 0x20) != 0)
                progressbar.setVisibility(8);
        } else
        if(i == -3)
            progressbar1.setIndeterminate(true);
        else
        if(i == -4)
            progressbar1.setIndeterminate(false);
        else
        if(i >= 0 && i <= 10000) {
            progressbar1.setProgress(i + 0);
            if(i < 10000)
                showProgressBars(progressbar1, progressbar);
            else
                hideProgressBars(progressbar1, progressbar);
        } else
        if(20000 <= i && i <= 30000) {
            progressbar1.setSecondaryProgress(i - 20000);
            showProgressBars(progressbar1, progressbar);
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void addContentView(View view, android.view.ViewGroup.LayoutParams layoutparams) {
        if(mContentParent == null)
            installDecor();
        mContentParent.addView(view, layoutparams);
        android.view.Window.Callback callback = getCallback();
        if(callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    public void alwaysReadCloseOnTouchAttr() {
        mAlwaysReadCloseOnTouchAttr = true;
    }

    void checkCloseActionMenu(Menu menu) {
        if(!mClosingActionMenu) {
            mClosingActionMenu = true;
            mActionBar.dismissPopupMenus();
            android.view.Window.Callback callback = getCallback();
            if(callback != null && !isDestroyed())
                callback.onPanelClosed(8, menu);
            mClosingActionMenu = false;
        }
    }

    public final void closeAllPanels() {
        if(getWindowManager() != null) {
            PanelFeatureState apanelfeaturestate[] = mPanels;
            int i;
            int j;
            if(apanelfeaturestate != null)
                i = apanelfeaturestate.length;
            else
                i = 0;
            for(j = 0; j < i; j++) {
                PanelFeatureState panelfeaturestate = apanelfeaturestate[j];
                if(panelfeaturestate != null)
                    closePanel(panelfeaturestate, true);
            }

            closeContextMenu();
        }
    }

    public final void closePanel(int i) {
        if(i == 0 && mActionBar != null && mActionBar.isOverflowReserved())
            mActionBar.hideOverflowMenu();
        else
        if(i == 6)
            closeContextMenu();
        else
            closePanel(getPanelState(i, true), true);
    }

    public final void closePanel(PanelFeatureState panelfeaturestate, boolean flag) {
        if(!flag || panelfeaturestate.featureId != 0 || mActionBar == null || !mActionBar.isOverflowMenuShowing()) goto _L2; else goto _L1
_L1:
        checkCloseActionMenu(panelfeaturestate.menu);
_L4:
        return;
_L2:
        WindowManager windowmanager = getWindowManager();
        if(windowmanager != null && panelfeaturestate.isOpen) {
            if(panelfeaturestate.decorView != null) {
                windowmanager.removeView(panelfeaturestate.decorView);
                if(panelfeaturestate.isCompact)
                    sRotationWatcher.removeWindow(this);
            }
            if(flag)
                callOnPanelClosed(panelfeaturestate.featureId, panelfeaturestate, null);
        }
        panelfeaturestate.isPrepared = false;
        panelfeaturestate.isHandled = false;
        panelfeaturestate.isOpen = false;
        panelfeaturestate.shownPanelView = null;
        if(panelfeaturestate.isInExpandedMode) {
            panelfeaturestate.refreshDecorView = true;
            panelfeaturestate.isInExpandedMode = false;
        }
        if(mPreparedPanel == panelfeaturestate) {
            mPreparedPanel = null;
            mPanelChordingKey = 0;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public PanelFeatureState findMenuPanel(Menu menu) {
        int j;
        PanelFeatureState panelfeaturestate;
        PanelFeatureState apanelfeaturestate[] = mPanels;
        int i;
        if(apanelfeaturestate != null)
            i = apanelfeaturestate.length;
        else
            i = 0;
        j = 0;
_L3:
        if(j >= i)
            break MISSING_BLOCK_LABEL_55;
        panelfeaturestate = apanelfeaturestate[j];
        if(panelfeaturestate == null || panelfeaturestate.menu != menu) goto _L2; else goto _L1
_L1:
        return panelfeaturestate;
_L2:
        j++;
          goto _L3
        panelfeaturestate = null;
          goto _L1
    }

    protected DecorView generateDecor() {
        return new DecorView(getContext(), -1);
    }

    protected ViewGroup generateLayout(DecorView decorview) {
        TypedArray typedarray = getWindowStyle();
        mIsFloating = typedarray.getBoolean(4, false);
        int i = 0x10100 & (-1 ^ getForcedWindowFlags());
        boolean flag;
        Context context;
        int j;
        boolean flag1;
        boolean flag2;
        boolean flag3;
        boolean flag4;
        android.view.WindowManager.LayoutParams layoutparams;
        int k;
        int l;
        ViewGroup viewgroup;
        if(mIsFloating) {
            setLayout(-2, -2);
            setFlags(0, i);
        } else {
            setFlags(0x10100, i);
        }
        if(typedarray.getBoolean(3, false))
            requestFeature(1);
        else
        if(typedarray.getBoolean(15, false))
            requestFeature(8);
        if(typedarray.getBoolean(17, false))
            requestFeature(9);
        if(typedarray.getBoolean(16, false))
            requestFeature(10);
        if(typedarray.getBoolean(9, false))
            setFlags(1024, 0x400 & (-1 ^ getForcedWindowFlags()));
        if(typedarray.getBoolean(14, false))
            setFlags(0x100000, 0x100000 & (-1 ^ getForcedWindowFlags()));
        if(getContext().getApplicationInfo().targetSdkVersion >= 11)
            flag = true;
        else
            flag = false;
        if(typedarray.getBoolean(18, flag))
            setFlags(0x800000, 0x800000 & (-1 ^ getForcedWindowFlags()));
        typedarray.getValue(19, mMinWidthMajor);
        typedarray.getValue(20, mMinWidthMinor);
        if(typedarray.hasValue(23)) {
            if(mFixedWidthMajor == null)
                mFixedWidthMajor = new TypedValue();
            typedarray.getValue(23, mFixedWidthMajor);
        }
        if(typedarray.hasValue(25)) {
            if(mFixedWidthMinor == null)
                mFixedWidthMinor = new TypedValue();
            typedarray.getValue(25, mFixedWidthMinor);
        }
        if(typedarray.hasValue(26)) {
            if(mFixedHeightMajor == null)
                mFixedHeightMajor = new TypedValue();
            typedarray.getValue(26, mFixedHeightMajor);
        }
        if(typedarray.hasValue(24)) {
            if(mFixedHeightMinor == null)
                mFixedHeightMinor = new TypedValue();
            typedarray.getValue(24, mFixedHeightMinor);
        }
        context = getContext();
        j = context.getApplicationInfo().targetSdkVersion;
        if(j < 11)
            flag1 = true;
        else
            flag1 = false;
        if(j < 14)
            flag2 = true;
        else
            flag2 = false;
        flag3 = context.getResources().getBoolean(0x1110006);
        if(!hasFeature(8) || hasFeature(1))
            flag4 = true;
        else
            flag4 = false;
        if(flag1 || flag2 && flag3 && flag4)
            addFlags(0x8000000);
        else
            addFlags(0x8000000);
        if((mAlwaysReadCloseOnTouchAttr || getContext().getApplicationInfo().targetSdkVersion >= 11) && typedarray.getBoolean(21, false))
            setCloseOnTouchOutsideIfNotSet(true);
        layoutparams = getAttributes();
        if(!hasSoftInputMode())
            layoutparams.softInputMode = typedarray.getInt(13, layoutparams.softInputMode);
        if(typedarray.getBoolean(11, mIsFloating)) {
            if((2 & getForcedWindowFlags()) == 0)
                layoutparams.flags = 2 | layoutparams.flags;
            if(!haveDimAmount())
                layoutparams.dimAmount = typedarray.getFloat(0, 0.5F);
        }
        if(layoutparams.windowAnimations == 0)
            layoutparams.windowAnimations = typedarray.getResourceId(8, 0);
        if(getContainer() == null) {
            if(mBackgroundDrawable == null) {
                if(mBackgroundResource == 0)
                    mBackgroundResource = typedarray.getResourceId(1, 0);
                if(mFrameResource == 0)
                    mFrameResource = typedarray.getResourceId(2, 0);
            }
            mTextColor = typedarray.getColor(7, 0xff000000);
        }
        k = getLocalFeatures();
        if((k & 0x18) != 0) {
            if(mIsFloating) {
                TypedValue typedvalue2 = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103cb, typedvalue2, true);
                l = typedvalue2.resourceId;
            } else {
                l = 0x109009e;
            }
            removeFeature(8);
        } else
        if((k & 0x24) != 0 && (k & 0x100) == 0)
            l = 0x109009a;
        else
        if((k & 0x80) != 0) {
            if(mIsFloating) {
                TypedValue typedvalue1 = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103cc, typedvalue1, true);
                l = typedvalue1.resourceId;
            } else {
                l = 0x1090099;
            }
            removeFeature(8);
        } else
        if((k & 2) == 0) {
            if(mIsFloating) {
                TypedValue typedvalue = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103cd, typedvalue, true);
                l = typedvalue.resourceId;
            } else
            if((k & 0x100) != 0) {
                if((k & 0x200) != 0)
                    l = 0x1090098;
                else
                    l = 0x1090097;
            } else {
                l = 0x109009d;
            }
        } else
        if((k & 0x400) != 0)
            l = 0x109009c;
        else
            l = 0x109009b;
        mDecor.startChanging();
        decorview.addView(mLayoutInflater.inflate(l, null), new android.view.ViewGroup.LayoutParams(-1, -1));
        viewgroup = (ViewGroup)findViewById(0x1020002);
        if(viewgroup == null)
            throw new RuntimeException("Window couldn't find content container view");
        if((k & 0x20) != 0) {
            ProgressBar progressbar = getCircularProgressBar(false);
            if(progressbar != null)
                progressbar.setIndeterminate(true);
        }
        if(getContainer() == null) {
            Drawable drawable = mBackgroundDrawable;
            if(mBackgroundResource != 0)
                drawable = getContext().getResources().getDrawable(mBackgroundResource);
            mDecor.setWindowBackground(drawable);
            Drawable drawable1 = null;
            if(mFrameResource != 0)
                drawable1 = getContext().getResources().getDrawable(mFrameResource);
            mDecor.setWindowFrame(drawable1);
            if(mTitleColor == 0)
                mTitleColor = mTextColor;
            if(mTitle != null)
                setTitle(mTitle);
            setTitleColor(mTitleColor);
        }
        mDecor.finishChanging();
        return viewgroup;
    }

    AudioManager getAudioManager() {
        if(mAudioManager == null)
            mAudioManager = (AudioManager)getContext().getSystemService("audio");
        return mAudioManager;
    }

    public View getCurrentFocus() {
        View view;
        if(mDecor != null)
            view = mDecor.findFocus();
        else
            view = null;
        return view;
    }

    public final View getDecorView() {
        if(mDecor == null)
            installDecor();
        return mDecor;
    }

    public LayoutInflater getLayoutInflater() {
        return mLayoutInflater;
    }

    public int getVolumeControlStream() {
        return mVolumeControlStreamType;
    }

    protected boolean initializePanelContent(PanelFeatureState panelfeaturestate) {
        boolean flag;
        if(panelfeaturestate.createdPanelView != null) {
            panelfeaturestate.shownPanelView = panelfeaturestate.createdPanelView;
            flag = true;
        } else
        if(panelfeaturestate.menu == null) {
            flag = false;
        } else {
            if(mPanelMenuPresenterCallback == null)
                mPanelMenuPresenterCallback = new PanelMenuPresenterCallback();
            MenuView menuview;
            if(panelfeaturestate.isInListMode())
                menuview = panelfeaturestate.getListMenuView(getContext(), mPanelMenuPresenterCallback);
            else
                menuview = panelfeaturestate.getIconMenuView(getContext(), mPanelMenuPresenterCallback);
            panelfeaturestate.shownPanelView = (View)menuview;
            if(panelfeaturestate.shownPanelView != null) {
                int i = menuview.getWindowAnimations();
                if(i != 0)
                    panelfeaturestate.windowAnimations = i;
                flag = true;
            } else {
                flag = false;
            }
        }
        return flag;
    }

    protected boolean initializePanelDecor(PanelFeatureState panelfeaturestate) {
        panelfeaturestate.decorView = new DecorView(getContext(), panelfeaturestate.featureId);
        panelfeaturestate.gravity = 81;
        panelfeaturestate.setStyle(getContext());
        return true;
    }

    protected boolean initializePanelMenu(PanelFeatureState panelfeaturestate) {
        Object obj = getContext();
        if((panelfeaturestate.featureId == 0 || panelfeaturestate.featureId == 8) && mActionBar != null) {
            TypedValue typedvalue = new TypedValue();
            ((Context) (obj)).getTheme().resolveAttribute(0x1010397, typedvalue, true);
            int i = typedvalue.resourceId;
            if(i != 0 && ((Context) (obj)).getThemeResId() != i)
                obj = new ContextThemeWrapper(((Context) (obj)), i);
        }
        MenuBuilder menubuilder = new MenuBuilder(((Context) (obj)));
        menubuilder.setCallback(this);
        panelfeaturestate.setMenu(menubuilder);
        return true;
    }

    public void invalidatePanelMenu(int i) {
        PanelFeatureState panelfeaturestate = getPanelState(i, true);
        if(panelfeaturestate.menu != null) {
            Bundle bundle = new Bundle();
            panelfeaturestate.menu.saveActionViewStates(bundle);
            if(bundle.size() > 0)
                panelfeaturestate.frozenActionViewState = bundle;
            panelfeaturestate.menu.stopDispatchingItemsChanged();
            panelfeaturestate.menu.clear();
        }
        panelfeaturestate.refreshMenuContent = true;
        panelfeaturestate.refreshDecorView = true;
        if((i == 8 || i == 0) && mActionBar != null) {
            PanelFeatureState panelfeaturestate1 = getPanelState(0, false);
            if(panelfeaturestate1 != null) {
                panelfeaturestate1.isPrepared = false;
                preparePanel(panelfeaturestate1, null);
            }
        }
    }

    public boolean isFloating() {
        return mIsFloating;
    }

    public boolean isShortcutKey(int i, KeyEvent keyevent) {
        boolean flag = true;
        PanelFeatureState panelfeaturestate = getPanelState(0, flag);
        if(panelfeaturestate.menu == null || !panelfeaturestate.menu.isShortcutKey(i, keyevent))
            flag = false;
        return flag;
    }

    protected void onActive() {
    }

    public void onConfigurationChanged(Configuration configuration) {
        if(mActionBar == null) {
            PanelFeatureState panelfeaturestate = getPanelState(0, false);
            if(panelfeaturestate != null && panelfeaturestate.menu != null)
                if(panelfeaturestate.isOpen) {
                    Bundle bundle = new Bundle();
                    if(panelfeaturestate.iconMenuPresenter != null)
                        panelfeaturestate.iconMenuPresenter.saveHierarchyState(bundle);
                    if(panelfeaturestate.listMenuPresenter != null)
                        panelfeaturestate.listMenuPresenter.saveHierarchyState(bundle);
                    clearMenuViews(panelfeaturestate);
                    reopenMenu(false);
                    if(panelfeaturestate.iconMenuPresenter != null)
                        panelfeaturestate.iconMenuPresenter.restoreHierarchyState(bundle);
                    if(panelfeaturestate.listMenuPresenter != null)
                        panelfeaturestate.listMenuPresenter.restoreHierarchyState(bundle);
                } else {
                    clearMenuViews(panelfeaturestate);
                }
        }
    }

    protected void onDrawableChanged(int i, Drawable drawable, int j) {
        if(i != 3) goto _L2; else goto _L1
_L1:
        ImageView imageview = getLeftIconView();
_L5:
        if(drawable != null) {
            drawable.setAlpha(j);
            imageview.setImageDrawable(drawable);
            imageview.setVisibility(0);
        } else {
            imageview.setVisibility(8);
        }
_L4:
        return;
_L2:
        if(i != 4) goto _L4; else goto _L3
_L3:
        imageview = getRightIconView();
          goto _L5
    }

    protected void onIntChanged(int i, int j) {
        if(i != 2 && i != 5) goto _L2; else goto _L1
_L1:
        updateProgressBars(j);
_L4:
        return;
_L2:
        if(i == 7) {
            FrameLayout framelayout = (FrameLayout)findViewById(0x1020235);
            if(framelayout != null)
                mLayoutInflater.inflate(j, framelayout);
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected boolean onKeyDown(int i, int j, KeyEvent keyevent) {
        boolean flag;
        android.view.KeyEvent.DispatcherState dispatcherstate;
        flag = false;
        if(mDecor != null)
            dispatcherstate = mDecor.getKeyDispatcherState();
        else
            dispatcherstate = null;
        j;
        JVM INSTR lookupswitch 5: default 72
    //                   4: 118
    //                   24: 81
    //                   25: 81
    //                   82: 99
    //                   164: 81;
           goto _L1 _L2 _L3 _L3 _L4 _L3
_L1:
        return flag;
_L3:
        getAudioManager().handleKeyDown(keyevent, mVolumeControlStreamType);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L4:
        if(i < 0)
            i = 0;
        onKeyDownPanel(i, keyevent);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L2:
        if(keyevent.getRepeatCount() <= 0 && i >= 0) {
            if(dispatcherstate != null)
                dispatcherstate.startTracking(keyevent, this);
            flag = true;
        }
        if(true) goto _L1; else goto _L5
_L5:
    }

    public final boolean onKeyDownPanel(int i, KeyEvent keyevent) {
        int j = keyevent.getKeyCode();
        if(keyevent.getRepeatCount() != 0) goto _L2; else goto _L1
_L1:
        PanelFeatureState panelfeaturestate;
        mPanelChordingKey = j;
        panelfeaturestate = getPanelState(i, true);
        if(panelfeaturestate.isOpen) goto _L2; else goto _L3
_L3:
        boolean flag = preparePanel(panelfeaturestate, keyevent);
_L5:
        return flag;
_L2:
        flag = false;
        if(true) goto _L5; else goto _L4
_L4:
    }

    protected boolean onKeyUp(int i, int j, KeyEvent keyevent) {
        boolean flag;
        flag = false;
        android.view.KeyEvent.DispatcherState dispatcherstate;
        if(mDecor != null)
            dispatcherstate = mDecor.getKeyDispatcherState();
        else
            dispatcherstate = null;
        if(dispatcherstate != null)
            dispatcherstate.handleUpEvent(keyevent);
        j;
        JVM INSTR lookupswitch 6: default 88
    //                   4: 133
    //                   24: 97
    //                   25: 97
    //                   82: 115
    //                   84: 198
    //                   164: 97;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L3
_L1:
        return flag;
_L3:
        getAudioManager().handleKeyUp(keyevent, mVolumeControlStreamType);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L4:
        if(i < 0)
            i = 0;
        onKeyUpPanel(i, keyevent);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L2:
        if(i < 0 || !keyevent.isTracking() || keyevent.isCanceled())
            continue; /* Loop/switch isn't completed */
        if(i == 0) {
            PanelFeatureState panelfeaturestate = getPanelState(i, false);
            if(panelfeaturestate != null && panelfeaturestate.isInExpandedMode) {
                reopenMenu(true);
                flag = true;
                continue; /* Loop/switch isn't completed */
            }
        }
        closePanel(i);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L5:
        if(!getKeyguardManager().inKeyguardRestrictedInputMode()) {
            if(keyevent.isTracking() && !keyevent.isCanceled())
                launchDefaultSearch();
            flag = true;
        }
        if(true) goto _L1; else goto _L6
_L6:
    }

    public final void onKeyUpPanel(int i, KeyEvent keyevent) {
        if(mPanelChordingKey == 0) goto _L2; else goto _L1
_L1:
        mPanelChordingKey = 0;
        if(!keyevent.isCanceled() && (mDecor == null || mDecor.mActionMode == null)) goto _L3; else goto _L2
_L2:
        return;
_L3:
        boolean flag;
        PanelFeatureState panelfeaturestate;
        flag = false;
        panelfeaturestate = getPanelState(i, true);
        if(i != 0 || mActionBar == null || !mActionBar.isOverflowReserved()) goto _L5; else goto _L4
_L4:
        if(mActionBar.getVisibility() == 0)
            if(!mActionBar.isOverflowMenuShowing()) {
                if(!isDestroyed() && preparePanel(panelfeaturestate, keyevent))
                    flag = mActionBar.showOverflowMenu();
            } else {
                flag = mActionBar.hideOverflowMenu();
            }
_L6:
        if(flag) {
            AudioManager audiomanager = (AudioManager)getContext().getSystemService("audio");
            boolean flag1;
            if(audiomanager != null)
                audiomanager.playSoundEffect(0);
            else
                Log.w("PhoneWindow", "Couldn't get audio manager");
        }
        if(true) goto _L2; else goto _L5
_L5:
        if(panelfeaturestate.isOpen || panelfeaturestate.isHandled) {
            flag = panelfeaturestate.isOpen;
            closePanel(panelfeaturestate, true);
        } else
        if(panelfeaturestate.isPrepared) {
            flag1 = true;
            if(panelfeaturestate.refreshMenuContent) {
                panelfeaturestate.isPrepared = false;
                flag1 = preparePanel(panelfeaturestate, keyevent);
            }
            if(flag1) {
                EventLog.writeEvent(50001, 0);
                openPanel(panelfeaturestate, keyevent);
                flag = true;
            }
        }
          goto _L6
    }

    public boolean onMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem) {
        android.view.Window.Callback callback = getCallback();
        if(callback == null || isDestroyed()) goto _L2; else goto _L1
_L1:
        PanelFeatureState panelfeaturestate = findMenuPanel(menubuilder.getRootMenu());
        if(panelfeaturestate == null) goto _L2; else goto _L3
_L3:
        boolean flag = callback.onMenuItemSelected(panelfeaturestate.featureId, menuitem);
_L5:
        return flag;
_L2:
        flag = false;
        if(true) goto _L5; else goto _L4
_L4:
    }

    public void onMenuModeChange(MenuBuilder menubuilder) {
        reopenMenu(true);
    }

    void onOptionsPanelRotationChanged() {
        PanelFeatureState panelfeaturestate = getPanelState(0, false);
        if(panelfeaturestate != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        android.view.WindowManager.LayoutParams layoutparams;
        if(panelfeaturestate.decorView != null)
            layoutparams = (android.view.WindowManager.LayoutParams)panelfeaturestate.decorView.getLayoutParams();
        else
            layoutparams = null;
        if(layoutparams != null) {
            layoutparams.gravity = getOptionsPanelGravity();
            WindowManager windowmanager = getWindowManager();
            if(windowmanager != null)
                windowmanager.updateViewLayout(panelfeaturestate.decorView, layoutparams);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public final void openPanel(int i, KeyEvent keyevent) {
        if(i == 0 && mActionBar != null && mActionBar.isOverflowReserved()) {
            if(mActionBar.getVisibility() == 0)
                mActionBar.showOverflowMenu();
        } else {
            openPanel(getPanelState(i, true), keyevent);
        }
    }

    public final View peekDecorView() {
        return mDecor;
    }

    public boolean performContextMenuIdentifierAction(int i, int j) {
        boolean flag;
        if(mContextMenu != null)
            flag = mContextMenu.performIdentifierAction(i, j);
        else
            flag = false;
        return flag;
    }

    public boolean performPanelIdentifierAction(int i, int j, int k) {
        boolean flag;
        PanelFeatureState panelfeaturestate;
        flag = false;
        panelfeaturestate = getPanelState(i, true);
        break MISSING_BLOCK_LABEL_11;
        while(true)  {
            do
                return flag;
            while(!preparePanel(panelfeaturestate, new KeyEvent(0, 82)) || panelfeaturestate.menu == null);
            flag = panelfeaturestate.menu.performIdentifierAction(j, k);
            if(mActionBar == null)
                closePanel(panelfeaturestate, true);
        }
    }

    public boolean performPanelShortcut(int i, int j, KeyEvent keyevent, int k) {
        return performPanelShortcut(getPanelState(i, true), j, keyevent, k);
    }

    public final boolean preparePanel(PanelFeatureState panelfeaturestate, KeyEvent keyevent) {
        boolean flag = false;
        if(!isDestroyed()) goto _L2; else goto _L1
_L1:
        return flag;
_L2:
        if(panelfeaturestate.isPrepared) {
            flag = true;
            continue; /* Loop/switch isn't completed */
        }
        if(mPreparedPanel != null && mPreparedPanel != panelfeaturestate)
            closePanel(mPreparedPanel, false);
        android.view.Window.Callback callback = getCallback();
        if(callback != null)
            panelfeaturestate.createdPanelView = callback.onCreatePanelView(panelfeaturestate.featureId);
        if(panelfeaturestate.createdPanelView == null) {
            if(panelfeaturestate.menu == null || panelfeaturestate.refreshMenuContent) {
                if(panelfeaturestate.menu == null && (!initializePanelMenu(panelfeaturestate) || panelfeaturestate.menu == null))
                    continue; /* Loop/switch isn't completed */
                if(mActionBar != null) {
                    if(mActionMenuPresenterCallback == null)
                        mActionMenuPresenterCallback = new ActionMenuPresenterCallback();
                    mActionBar.setMenu(panelfeaturestate.menu, mActionMenuPresenterCallback);
                }
                panelfeaturestate.menu.stopDispatchingItemsChanged();
                if(callback == null || !callback.onCreatePanelMenu(panelfeaturestate.featureId, panelfeaturestate.menu)) {
                    panelfeaturestate.setMenu(null);
                    if(mActionBar != null)
                        mActionBar.setMenu(null, mActionMenuPresenterCallback);
                    continue; /* Loop/switch isn't completed */
                }
                panelfeaturestate.refreshMenuContent = false;
            }
            panelfeaturestate.menu.stopDispatchingItemsChanged();
            if(panelfeaturestate.frozenActionViewState != null) {
                panelfeaturestate.menu.restoreActionViewStates(panelfeaturestate.frozenActionViewState);
                panelfeaturestate.frozenActionViewState = null;
            }
            if(!callback.onPreparePanel(panelfeaturestate.featureId, panelfeaturestate.createdPanelView, panelfeaturestate.menu)) {
                if(mActionBar != null)
                    mActionBar.setMenu(null, mActionMenuPresenterCallback);
                panelfeaturestate.menu.startDispatchingItemsChanged();
                continue; /* Loop/switch isn't completed */
            }
            int i;
            boolean flag1;
            if(keyevent != null)
                i = keyevent.getDeviceId();
            else
                i = -1;
            if(KeyCharacterMap.load(i).getKeyboardType() != 1)
                flag1 = true;
            else
                flag1 = false;
            panelfeaturestate.qwertyMode = flag1;
            panelfeaturestate.menu.setQwertyMode(panelfeaturestate.qwertyMode);
            panelfeaturestate.menu.startDispatchingItemsChanged();
        }
        panelfeaturestate.isPrepared = true;
        panelfeaturestate.isHandled = false;
        mPreparedPanel = panelfeaturestate;
        flag = true;
        if(true) goto _L1; else goto _L3
_L3:
    }

    public boolean requestFeature(int i) {
        if(mContentParent != null)
            throw new AndroidRuntimeException("requestFeature() must be called before adding content");
        int j = getFeatures();
        if(j != 65 && i == 7)
            throw new AndroidRuntimeException("You cannot combine custom titles with other title features");
        if((j & 0x80) != 0 && i != 7 && i != 10)
            throw new AndroidRuntimeException("You cannot combine custom titles with other title features");
        boolean flag;
        if((j & 2) != 0 && i == 8) {
            flag = false;
        } else {
            if((j & 0x100) != 0 && i == 1)
                removeFeature(8);
            flag = super.requestFeature(i);
        }
        return flag;
    }

    public void restoreHierarchyState(Bundle bundle) {
        if(mContentParent != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        SparseArray sparsearray = bundle.getSparseParcelableArray("android:views");
        if(sparsearray != null)
            mContentParent.restoreHierarchyState(sparsearray);
        int i = bundle.getInt("android:focusedViewId", -1);
        if(i != -1) {
            View view = mContentParent.findViewById(i);
            SparseArray sparsearray1;
            SparseArray sparsearray2;
            if(view != null)
                view.requestFocus();
            else
                Log.w("PhoneWindow", (new StringBuilder()).append("Previously focused view reported id ").append(i).append(" during save, but can't be found during restore.").toString());
        }
        sparsearray1 = bundle.getSparseParcelableArray("android:Panels");
        if(sparsearray1 != null)
            restorePanelState(sparsearray1);
        if(mActionBar != null) {
            sparsearray2 = bundle.getSparseParcelableArray("android:ActionBar");
            if(sparsearray2 != null)
                mActionBar.restoreHierarchyState(sparsearray2);
            else
                Log.w("PhoneWindow", "Missing saved instance states for action bar views! State will not be restored.");
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public Bundle saveHierarchyState() {
        Bundle bundle = new Bundle();
        if(mContentParent != null) goto _L2; else goto _L1
_L1:
        return bundle;
_L2:
        SparseArray sparsearray = new SparseArray();
        mContentParent.saveHierarchyState(sparsearray);
        bundle.putSparseParcelableArray("android:views", sparsearray);
        View view = mContentParent.findFocus();
        if(view != null && view.getId() != -1)
            bundle.putInt("android:focusedViewId", view.getId());
        SparseArray sparsearray1 = new SparseArray();
        savePanelState(sparsearray1);
        if(sparsearray1.size() > 0)
            bundle.putSparseParcelableArray("android:Panels", sparsearray1);
        if(mActionBar != null) {
            SparseArray sparsearray2 = new SparseArray();
            mActionBar.saveHierarchyState(sparsearray2);
            bundle.putSparseParcelableArray("android:ActionBar", sparsearray2);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    void sendCloseSystemWindows() {
        PhoneWindowManager.sendCloseSystemWindows(getContext(), null);
    }

    void sendCloseSystemWindows(String s) {
        PhoneWindowManager.sendCloseSystemWindows(getContext(), s);
    }

    public final void setBackgroundDrawable(Drawable drawable) {
        if(drawable != mBackgroundDrawable || mBackgroundResource != 0) {
            mBackgroundResource = 0;
            mBackgroundDrawable = drawable;
            if(mDecor != null)
                mDecor.setWindowBackground(drawable);
        }
    }

    public final void setChildDrawable(int i, Drawable drawable) {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        drawablefeaturestate.child = drawable;
        updateDrawable(i, drawablefeaturestate, false);
    }

    public final void setChildInt(int i, int j) {
        updateInt(i, j, false);
    }

    public final void setContainer(Window window) {
        super.setContainer(window);
    }

    public void setContentView(int i) {
        android.view.Window.Callback callback;
        if(mContentParent == null)
            installDecor();
        else
            mContentParent.removeAllViews();
        mLayoutInflater.inflate(i, mContentParent);
        callback = getCallback();
        if(callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    public void setContentView(View view) {
        setContentView(view, new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    public void setContentView(View view, android.view.ViewGroup.LayoutParams layoutparams) {
        android.view.Window.Callback callback;
        if(mContentParent == null)
            installDecor();
        else
            mContentParent.removeAllViews();
        mContentParent.addView(view, layoutparams);
        callback = getCallback();
        if(callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    protected final void setFeatureDefaultDrawable(int i, Drawable drawable) {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        if(drawablefeaturestate.def != drawable) {
            drawablefeaturestate.def = drawable;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public final void setFeatureDrawable(int i, Drawable drawable) {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        drawablefeaturestate.resid = 0;
        drawablefeaturestate.uri = null;
        if(drawablefeaturestate.local != drawable) {
            drawablefeaturestate.local = drawable;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public void setFeatureDrawableAlpha(int i, int j) {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        if(drawablefeaturestate.alpha != j) {
            drawablefeaturestate.alpha = j;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public final void setFeatureDrawableResource(int i, int j) {
        if(j != 0) {
            DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
            if(drawablefeaturestate.resid != j) {
                drawablefeaturestate.resid = j;
                drawablefeaturestate.uri = null;
                drawablefeaturestate.local = getContext().getResources().getDrawable(j);
                updateDrawable(i, drawablefeaturestate, false);
            }
        } else {
            setFeatureDrawable(i, null);
        }
    }

    public final void setFeatureDrawableUri(int i, Uri uri) {
        if(uri != null) {
            DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
            if(drawablefeaturestate.uri == null || !drawablefeaturestate.uri.equals(uri)) {
                drawablefeaturestate.resid = 0;
                drawablefeaturestate.uri = uri;
                drawablefeaturestate.local = loadImageURI(uri);
                updateDrawable(i, drawablefeaturestate, false);
            }
        } else {
            setFeatureDrawable(i, null);
        }
    }

    protected void setFeatureFromAttrs(int i, TypedArray typedarray, int j, int k) {
        Drawable drawable = typedarray.getDrawable(j);
        if(drawable != null) {
            requestFeature(i);
            setFeatureDefaultDrawable(i, drawable);
        }
        if((getFeatures() & 1 << i) != 0) {
            int l = typedarray.getInt(k, -1);
            if(l >= 0)
                setFeatureDrawableAlpha(i, l);
        }
    }

    public final void setFeatureInt(int i, int j) {
        updateInt(i, j, false);
    }

    public void setTitle(CharSequence charsequence) {
        if(mTitleView == null) goto _L2; else goto _L1
_L1:
        mTitleView.setText(charsequence);
_L4:
        mTitle = charsequence;
        return;
_L2:
        if(mActionBar != null)
            mActionBar.setWindowTitle(charsequence);
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void setTitleColor(int i) {
        if(mTitleView != null)
            mTitleView.setTextColor(i);
        mTitleColor = i;
    }

    public void setUiOptions(int i) {
        mUiOptions = i;
    }

    public void setUiOptions(int i, int j) {
        mUiOptions = mUiOptions & ~j | i & j;
    }

    public void setVolumeControlStream(int i) {
        mVolumeControlStreamType = i;
    }

    public boolean superDispatchGenericMotionEvent(MotionEvent motionevent) {
        return mDecor.superDispatchGenericMotionEvent(motionevent);
    }

    public boolean superDispatchKeyEvent(KeyEvent keyevent) {
        return mDecor.superDispatchKeyEvent(keyevent);
    }

    public boolean superDispatchKeyShortcutEvent(KeyEvent keyevent) {
        return mDecor.superDispatchKeyShortcutEvent(keyevent);
    }

    public boolean superDispatchTouchEvent(MotionEvent motionevent) {
        return mDecor.superDispatchTouchEvent(motionevent);
    }

    public boolean superDispatchTrackballEvent(MotionEvent motionevent) {
        return mDecor.superDispatchTrackballEvent(motionevent);
    }

    public void takeInputQueue(android.view.InputQueue.Callback callback) {
        mTakeInputQueueCallback = callback;
    }

    public void takeKeyEvents(boolean flag) {
        mDecor.setFocusable(flag);
    }

    public void takeSurface(android.view.SurfaceHolder.Callback2 callback2) {
        mTakeSurfaceCallback = callback2;
    }

    public final void togglePanel(int i, KeyEvent keyevent) {
        PanelFeatureState panelfeaturestate = getPanelState(i, true);
        if(panelfeaturestate.isOpen)
            closePanel(panelfeaturestate, true);
        else
            openPanel(panelfeaturestate, keyevent);
    }

    protected final void updateDrawable(int i, boolean flag) {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, false);
        if(drawablefeaturestate != null)
            updateDrawable(i, drawablefeaturestate, flag);
    }

    private static final String ACTION_BAR_TAG = "android:ActionBar";
    private static final String FOCUSED_ID_TAG = "android:focusedViewId";
    private static final String PANELS_TAG = "android:Panels";
    private static final boolean SWEEP_OPEN_MENU = false;
    private static final String TAG = "PhoneWindow";
    private static final String VIEWS_TAG = "android:views";
    static final RotationWatcher sRotationWatcher = new RotationWatcher();
    private ActionBarView mActionBar;
    private ActionMenuPresenterCallback mActionMenuPresenterCallback;
    private boolean mAlwaysReadCloseOnTouchAttr;
    private AudioManager mAudioManager;
    private Drawable mBackgroundDrawable;
    private int mBackgroundResource;
    private ProgressBar mCircularProgressBar;
    private boolean mClosingActionMenu;
    private ViewGroup mContentParent;
    private ContextMenuBuilder mContextMenu;
    final DialogMenuCallback mContextMenuCallback = new DialogMenuCallback(6);
    private MenuDialogHelper mContextMenuHelper;
    private DecorView mDecor;
    private DrawableFeatureState mDrawables[];
    TypedValue mFixedHeightMajor;
    TypedValue mFixedHeightMinor;
    TypedValue mFixedWidthMajor;
    TypedValue mFixedWidthMinor;
    private int mFrameResource;
    private ProgressBar mHorizontalProgressBar;
    private boolean mIsFloating;
    private KeyguardManager mKeyguardManager;
    private LayoutInflater mLayoutInflater;
    private ImageView mLeftIconView;
    final TypedValue mMinWidthMajor = new TypedValue();
    final TypedValue mMinWidthMinor = new TypedValue();
    private int mPanelChordingKey;
    private PanelMenuPresenterCallback mPanelMenuPresenterCallback;
    private PanelFeatureState mPanels[];
    private PanelFeatureState mPreparedPanel;
    private ImageView mRightIconView;
    android.view.InputQueue.Callback mTakeInputQueueCallback;
    android.view.SurfaceHolder.Callback2 mTakeSurfaceCallback;
    private int mTextColor;
    private CharSequence mTitle;
    private int mTitleColor;
    private TextView mTitleView;
    private int mUiOptions;
    private int mVolumeControlStreamType;



/*
    static MenuDialogHelper access$1002(PhoneWindow phonewindow, MenuDialogHelper menudialoghelper) {
        phonewindow.mContextMenuHelper = menudialoghelper;
        return menudialoghelper;
    }

*/












/*
    static ContextMenuBuilder access$902(PhoneWindow phonewindow, ContextMenuBuilder contextmenubuilder) {
        phonewindow.mContextMenu = contextmenubuilder;
        return contextmenubuilder;
    }

*/
}
