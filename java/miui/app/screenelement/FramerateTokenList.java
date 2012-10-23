// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

public class FramerateTokenList {
    public class FramerateToken {

        public float getFramerate() {
            return mFramerate;
        }

        public void requestFramerate(float f) {
            if(mFramerate != f) {
                Log.d("FramerateTokenList", (new StringBuilder()).append("requestFramerate: ").append(f).append(" by:").append(mName).toString());
                mFramerate = f;
                onChange();
            }
        }

        public float mFramerate;
        public String mName;
        final FramerateTokenList this$0;

        public FramerateToken(String s) {
            this$0 = FramerateTokenList.this;
            super();
            mName = s;
        }
    }


    public FramerateTokenList() {
        mList = new ArrayList();
    }

    private void onChange() {
        float f = 0.0F;
        synchronized(mList) {
            Iterator iterator = mList.iterator();
            do {
                if(!iterator.hasNext())
                    break;
                FramerateToken frameratetoken = (FramerateToken)iterator.next();
                if(frameratetoken.mFramerate > f)
                    f = frameratetoken.mFramerate;
            } while(true);
        }
        mCurFramerate = f;
        return;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public FramerateToken createToken(String s) {
        FramerateToken frameratetoken;
        Log.d("FramerateTokenList", (new StringBuilder()).append("createToken: ").append(s).toString());
        frameratetoken = new FramerateToken(s);
        ArrayList arraylist = mList;
        arraylist;
        JVM INSTR monitorenter ;
        mList.add(frameratetoken);
        return frameratetoken;
    }

    public float getFramerate() {
        return mCurFramerate;
    }

    private static final String LOG_TAG = "FramerateTokenList";
    private float mCurFramerate;
    private ArrayList mList;

}
