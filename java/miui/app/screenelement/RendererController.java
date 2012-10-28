// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.util.Log;

// Referenced classes of package miui.app.screenelement:
//            FramerateTokenList, RenderThread

public class RendererController {
    public static interface Listener {

        public abstract void doRender();

        public abstract void finish();

        public abstract void init();

        public abstract void pause();

        public abstract void resume();

        public abstract void tick(long l);

        public abstract void updateFramerate(long l);
    }


    public RendererController(Listener listener) {
        mFramerateTokenList = new FramerateTokenList();
        mLock = new Object();
        mFrameTime = 0x7fffffff;
        mListener = listener;
    }

    public FramerateTokenList.FramerateToken createToken(String s) {
        return mFramerateTokenList.createToken(s);
    }

    public void doRender() {
        mPendingRender = true;
        mListener.doRender();
    }

    public void doneRender() {
        mPendingRender = false;
    }

    public void finish() {
        mListener.finish();
_L1:
        return;
        Exception exception;
        exception;
        exception.printStackTrace();
        Log.e("RendererController", exception.toString());
          goto _L1
    }

    public float getCurFramerate() {
        return mCurFramerate;
    }

    public int getFrameTime() {
        return mFrameTime;
    }

    public float getFramerate() {
        return mFramerateTokenList.getFramerate();
    }

    public long getLastUpdateTime() {
        return mLastUpdateSystemTime;
    }

    public void init() {
        mListener.init();
_L1:
        return;
        Exception exception;
        exception;
        exception.printStackTrace();
        Log.e("RendererController", exception.toString());
          goto _L1
    }

    public boolean isSelfPaused() {
        return mSelfPaused;
    }

    public void pause() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mPaused = true;
        if(!mSelfPaused)
            mListener.pause();
        return;
    }

    public boolean pendingRender() {
        return mPendingRender;
    }

    public void requestUpdate() {
        mShouldUpdate = true;
    }

    public void resume() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mPaused = false;
        if(!mSelfPaused)
            mListener.resume();
        return;
    }

    public void selfPause() {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        mSelfPaused = true;
        if(!mPaused)
            mListener.pause();
        return;
    }

    public void selfResume() {
        synchronized(mLock) {
            mSelfPaused = false;
            if(!mPaused)
                mListener.resume();
        }
        if(mRenderThread != null)
            mRenderThread.setPaused(false);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setCurFramerate(float f) {
        mCurFramerate = f;
    }

    public void setFrameTime(int i) {
        mFrameTime = i;
    }

    public void setLastUpdateTime(long l) {
        mLastUpdateSystemTime = l;
    }

    public void setRenderThread(RenderThread renderthread) {
        mRenderThread = renderthread;
    }

    public boolean shouldUpdate() {
        return mShouldUpdate;
    }

    public void tick(long l) {
        mShouldUpdate = false;
        mListener.tick(l);
    }

    public void updateFramerate(long l) {
        mListener.updateFramerate(l);
    }

    private static final String LOG_TAG = "RendererController";
    private float mCurFramerate;
    private int mFrameTime;
    private FramerateTokenList mFramerateTokenList;
    private long mLastUpdateSystemTime;
    private Listener mListener;
    private Object mLock;
    private boolean mPaused;
    private boolean mPendingRender;
    private RenderThread mRenderThread;
    private boolean mSelfPaused;
    private boolean mShouldUpdate;
}
