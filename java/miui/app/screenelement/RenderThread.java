// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.os.SystemClock;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package miui.app.screenelement:
//            RendererController

public class RenderThread extends Thread {

    public RenderThread() {
        super("MAML RenderThread");
        mRendererControllerList = new ArrayList();
        mPaused = true;
        mResumeSignal = new Object();
    }

    public RenderThread(RendererController renderercontroller) {
        super("MAML RenderThread");
        mRendererControllerList = new ArrayList();
        mPaused = true;
        mResumeSignal = new Object();
        addRendererController(renderercontroller);
    }

    private void doFinish() {
        if(mRendererControllerList.size() != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        for(Iterator iterator = mRendererControllerList.iterator(); iterator.hasNext(); ((RendererController)iterator.next()).finish());
        break MISSING_BLOCK_LABEL_55;
        Exception exception;
        exception;
        throw exception;
        arraylist;
        JVM INSTR monitorexit ;
          goto _L1
    }

    private void doInit() {
        if(mRendererControllerList.size() != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        long l = SystemClock.elapsedRealtime();
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        RendererController renderercontroller;
        for(Iterator iterator = mRendererControllerList.iterator(); iterator.hasNext(); renderercontroller.requestUpdate()) {
            renderercontroller = (RendererController)iterator.next();
            renderercontroller.setLastUpdateTime(l);
            renderercontroller.init();
            if(mPaused)
                renderercontroller.tick(l);
        }

        break MISSING_BLOCK_LABEL_92;
        Exception exception;
        exception;
        throw exception;
        arraylist;
        JVM INSTR monitorexit ;
          goto _L1
    }

    private void doPause() {
        if(mRendererControllerList.size() != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        for(Iterator iterator = mRendererControllerList.iterator(); iterator.hasNext(); ((RendererController)iterator.next()).pause());
        break MISSING_BLOCK_LABEL_55;
        Exception exception;
        exception;
        throw exception;
        arraylist;
        JVM INSTR monitorexit ;
          goto _L1
    }

    private void doResume() {
        if(mRendererControllerList.size() != 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        for(Iterator iterator = mRendererControllerList.iterator(); iterator.hasNext(); ((RendererController)iterator.next()).resume());
        break MISSING_BLOCK_LABEL_55;
        Exception exception;
        exception;
        throw exception;
        arraylist;
        JVM INSTR monitorexit ;
          goto _L1
    }

    private boolean doUpdateFramerate(long l) {
        if(mRendererControllerList.size() != 0) goto _L2; else goto _L1
_L1:
        boolean flag = true;
_L4:
        return flag;
_L2:
        flag = true;
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        Iterator iterator = mRendererControllerList.iterator();
        do {
            if(!iterator.hasNext())
                break;
            RendererController renderercontroller = (RendererController)iterator.next();
            if(!renderercontroller.isSelfPaused()) {
                renderercontroller.updateFramerate(l);
                flag = false;
            }
        } while(true);
        if(true) goto _L4; else goto _L3
_L3:
    }

    public static RenderThread globalThread() {
        if(sGlobalThread == null)
            synchronized(sGlobalThreadLock) {
                if(sGlobalThread == null)
                    sGlobalThread = new RenderThread();
            }
        return sGlobalThread;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void sleepForFramerate(float f) {
        if(f <= 50F) {
            long l = 50L;
            if(f > 10F)
                l = (long)(500F / f);
            try {
                Thread.sleep(l);
            }
            catch(InterruptedException interruptedexception) { }
        }
    }

    private void waiteForResume() {
        mResumeSignal.wait();
_L1:
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        interruptedexception.printStackTrace();
          goto _L1
    }

    public void addRendererController(RendererController renderercontroller) {
        synchronized(mRendererControllerList) {
            mRendererControllerList.add(renderercontroller);
            renderercontroller.setRenderThread(this);
        }
        setPaused(false);
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isStarted() {
        return mStarted;
    }

    public void removeRendererController(RendererController renderercontroller) {
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        mRendererControllerList.remove(renderercontroller);
        renderercontroller.setRenderThread(null);
        return;
    }

    public void run() {
        Log.i("RenderThread", "RenderThread started");
        doInit();
        mStarted = true;
_L6:
        if(mStop) goto _L2; else goto _L1
_L1:
        if(mPaused)
            synchronized(mResumeSignal) {
                if(mPaused) {
                    doPause();
                    Log.i("RenderThread", "RenderThread paused, waiting for signal");
                    waiteForResume();
                    Log.i("RenderThread", "RenderThread resumed");
                    doResume();
                }
            }
        boolean flag = mStop;
        if(!flag) goto _L3; else goto _L2
_L2:
        doFinish();
        Log.i("RenderThread", "RenderThread stopped");
        return;
        exception2;
        obj;
        JVM INSTR monitorexit ;
        long l;
        try {
            throw exception2;
        }
        catch(Exception exception) {
            exception.printStackTrace();
            Log.e("RenderThread", exception.toString());
        }
        catch(OutOfMemoryError outofmemoryerror) {
            outofmemoryerror.printStackTrace();
            Log.e("RenderThread", outofmemoryerror.toString());
        }
        if(true) goto _L2; else goto _L3
_L3:
        l = SystemClock.elapsedRealtime();
        if(!doUpdateFramerate(l)) goto _L5; else goto _L4
_L4:
        mPaused = true;
          goto _L6
_L5:
        float f;
        boolean flag1;
        f = 0.0F;
        flag1 = false;
        ArrayList arraylist = mRendererControllerList;
        arraylist;
        JVM INSTR monitorenter ;
        Iterator iterator = mRendererControllerList.iterator();
_L10:
        if(!iterator.hasNext()) goto _L8; else goto _L7
_L7:
        RendererController renderercontroller = (RendererController)iterator.next();
        if(renderercontroller.isSelfPaused()) goto _L10; else goto _L9
_L9:
        boolean flag2;
        float f1;
        flag2 = false;
        f1 = renderercontroller.getFramerate();
        if(f1 > f)
            f = f1;
        if(renderercontroller.getCurFramerate() == f1) goto _L12; else goto _L11
_L11:
        float f2;
        if(renderercontroller.getCurFramerate() > 1.0F && f1 < 1.0F)
            flag2 = true;
        renderercontroller.setCurFramerate(f1);
        Log.d("RenderThread", (new StringBuilder()).append("framerate changed: ").append(f1).append(" at time: ").append(l).toString());
        if(f1 == 0.0F)
            break MISSING_BLOCK_LABEL_432;
        f2 = 1000F / f1;
_L14:
        renderercontroller.setFrameTime((int)f2);
_L12:
        if(!renderercontroller.pendingRender() && (l - renderercontroller.getLastUpdateTime() > (long)renderercontroller.getFrameTime() || renderercontroller.shouldUpdate() || flag2)) {
            renderercontroller.tick(l);
            renderercontroller.doRender();
            renderercontroller.setLastUpdateTime(l);
            flag1 = true;
        }
          goto _L10
_L8:
        if(flag1) goto _L6; else goto _L13
_L13:
        sleepForFramerate(f);
          goto _L6
        Exception exception1;
        exception1;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception1;
        f2 = 2.147484E+09F;
          goto _L14
    }

    public void setPaused(boolean flag) {
        Object obj = mResumeSignal;
        obj;
        JVM INSTR monitorenter ;
        mPaused = flag;
        if(!flag)
            mResumeSignal.notify();
        return;
    }

    public void setStop() {
        mStop = true;
        setPaused(false);
    }

    private static final String LOG_TAG = "RenderThread";
    private static RenderThread sGlobalThread;
    private static Object sGlobalThreadLock = new Object();
    private boolean mPaused;
    private ArrayList mRendererControllerList;
    private Object mResumeSignal;
    private boolean mStarted;
    private boolean mStop;

}
