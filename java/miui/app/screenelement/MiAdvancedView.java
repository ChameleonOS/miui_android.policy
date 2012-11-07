// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.content.Context;
import android.graphics.Canvas;
import android.util.Log;
import android.view.*;
import miui.app.screenelement.util.Utils;

// Referenced classes of package miui.app.screenelement:
//            RendererController, ScreenElementRoot, RenderThread, ScreenContext

public class MiAdvancedView extends View
    implements RendererController.Listener {

    public MiAdvancedView(Context context, ScreenElementRoot screenelementroot) {
        super(context);
        mPaused = true;
        setFocusable(true);
        setFocusableInTouchMode(true);
        mRoot = screenelementroot;
        mRendererController = new RendererController(this);
        mRoot.setRenderController(mRendererController);
    }

    public MiAdvancedView(Context context, ScreenElementRoot screenelementroot, RenderThread renderthread) {
        this(context, screenelementroot);
        if(renderthread != null) {
            mRendererController.init();
            mUseExternalRenderThread = true;
            mThread = renderthread;
            mThread.addRendererController(mRendererController);
        }
    }

    public void cleanUp() {
        setOnTouchListener(null);
        if(mThread != null)
            if(!mUseExternalRenderThread) {
                mThread.setStop();
            } else {
                mThread.removeRendererController(mRendererController);
                mRendererController.finish();
            }
    }

    public void doRender() {
        postInvalidate();
    }

    public void finish() {
        mRoot.finish();
    }

    public final ScreenElementRoot getRoot() {
        return mRoot;
    }

    public void init() {
        mRoot.init();
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if(!mUseExternalRenderThread && mThread == null) {
            mThread = new RenderThread(mRendererController);
            mThread.setPaused(mPaused);
            mThread.start();
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    protected void onDraw(Canvas canvas) {
        if(mThread != null && mThread.isStarted()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        if(!mLoggedHardwareRender) {
            Log.d("MiAdvancedView", (new StringBuilder()).append("canvas hardware render: ").append(canvas.isHardwareAccelerated()).toString());
            mLoggedHardwareRender = true;
        }
        ScreenElementRoot screenelementroot = mRoot;
        screenelementroot;
        JVM INSTR monitorenter ;
        mRoot.render(canvas);
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        exception.printStackTrace();
        Log.e("MiAdvancedView", exception.toString());
        continue; /* Loop/switch isn't completed */
        OutOfMemoryError outofmemoryerror;
        outofmemoryerror;
        outofmemoryerror.printStackTrace();
        Log.e("MiAdvancedView", outofmemoryerror.toString());
        if(true) goto _L1; else goto _L3
_L3:
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l) {
        Utils.putVariableNumber("view_width", mRoot.getContext().mVariables, Double.valueOf(Double.valueOf(k - i).doubleValue() / (double)mRoot.getScale()));
        Utils.putVariableNumber("view_height", mRoot.getContext().mVariables, Double.valueOf(Double.valueOf(l - j).doubleValue() / (double)mRoot.getScale()));
    }

    public void onPause() {
        mPaused = true;
        if(mThread != null)
            if(!mUseExternalRenderThread)
                mThread.setPaused(true);
            else
                mRendererController.selfPause();
    }

    public void onResume() {
        mPaused = false;
        if(mThread != null)
            if(!mUseExternalRenderThread)
                mThread.setPaused(false);
            else
                mRendererController.selfResume();
    }

    public boolean onTouchEvent(MotionEvent motionevent) {
        if(mRoot == null) goto _L2; else goto _L1
_L1:
        if(motionevent.getPointerCount() > 1)
            motionevent.setAction(4);
        boolean flag1 = mRoot.needDisallowInterceptTouchEvent();
        if(mNeedDisallowInterceptTouchEvent != flag1) {
            getParent().requestDisallowInterceptTouchEvent(flag1);
            mNeedDisallowInterceptTouchEvent = flag1;
        }
        ScreenElementRoot screenelementroot = mRoot;
        screenelementroot;
        JVM INSTR monitorenter ;
        boolean flag = mRoot.onTouch(motionevent);
          goto _L3
        Exception exception;
        exception;
        exception.printStackTrace();
        Log.e("MiAdvancedView", exception.toString());
_L2:
        flag = false;
        break; /* Loop/switch isn't completed */
        OutOfMemoryError outofmemoryerror;
        outofmemoryerror;
        outofmemoryerror.printStackTrace();
        Log.e("MiAdvancedView", outofmemoryerror.toString());
        if(true) goto _L2; else goto _L3
_L3:
        return flag;
    }

    public void pause() {
        mRoot.pause();
    }

    public void resume() {
        mRoot.resume();
    }

    public void setVisibility(int i) {
        super.setVisibility(i);
        if(i != 0) goto _L2; else goto _L1
_L1:
        onResume();
_L4:
        return;
_L2:
        if(i == 4 || i == 8)
            onPause();
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void tick(long l) {
        ScreenElementRoot screenelementroot = mRoot;
        screenelementroot;
        JVM INSTR monitorenter ;
        mRoot.tick(l);
        return;
    }

    public void updateFramerate(long l) {
        mRoot.updateFramerate(l);
    }

    private static final String LOG_TAG = "MiAdvancedView";
    private static final String VARIABLE_VIEW_HEIGHT = "view_height";
    private static final String VARIABLE_VIEW_WIDTH = "view_width";
    private boolean mLoggedHardwareRender;
    private boolean mNeedDisallowInterceptTouchEvent;
    private boolean mPaused;
    private RendererController mRendererController;
    protected ScreenElementRoot mRoot;
    private RenderThread mThread;
    private boolean mUseExternalRenderThread;
}
