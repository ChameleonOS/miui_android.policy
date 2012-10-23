// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import android.content.Context;
import android.os.SystemClock;
import android.view.MotionEvent;
import miui.app.screenelement.MiAdvancedView;

// Referenced classes of package com.miui.internal.policy.impl.AwesomeLockScreenImp:
//            LockScreenRoot

public class AwesomeLockScreenView extends MiAdvancedView {

    public AwesomeLockScreenView(Context context, LockScreenRoot lockscreenroot) {
        super(context, lockscreenroot);
        setFocusable(true);
        setFocusableInTouchMode(true);
    }

    public boolean onTouchEvent(MotionEvent motionevent) {
        int i;
        int j;
        int k;
        i = motionevent.getActionMasked();
        j = (int)motionevent.getX();
        k = (int)motionevent.getY();
        if(i != 2) goto _L2; else goto _L1
_L1:
        if(SystemClock.elapsedRealtime() - mLastTouchTime >= 1000L) {
            int l = j - mPreX;
            int i1 = k - mPreY;
            if(l * l + i1 * i1 > 25) {
                ((LockScreenRoot)super.mRoot).pokeWakelock();
                mLastTouchTime = SystemClock.elapsedRealtime();
                mPreX = j;
                mPreY = k;
            }
        }
_L4:
        return super.onTouchEvent(motionevent);
_L2:
        if(i == 0) {
            mPreX = j;
            mPreY = k;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    private static final String LOG_TAG = "AwesomeLockScreenView";
    private static final int MOVING_THRESHOLD = 25;
    private long mLastTouchTime;
    private int mPreX;
    private int mPreY;
}
