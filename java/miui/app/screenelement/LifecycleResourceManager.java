// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.util.Log;
import java.util.*;

// Referenced classes of package miui.app.screenelement:
//            ResourceManager, ResourceLoader

public class LifecycleResourceManager extends ResourceManager {

    public LifecycleResourceManager(ResourceLoader resourceloader, long l, long l1) {
        super(resourceloader);
        mInactiveTime = l;
        mCheckTime = l1;
    }

    public void checkCache() {
        long l = System.currentTimeMillis();
        if(l - mLastCheckCacheTime >= mCheckTime) {
            Log.d("LifecycleResourceManager", "beging check cache... ");
            ArrayList arraylist = new ArrayList();
            Iterator iterator = super.mBitmaps.keySet().iterator();
            do {
                if(!iterator.hasNext())
                    break;
                String s1 = (String)iterator.next();
                if(l - ((ResourceManager.BitmapInfo)super.mBitmaps.get(s1)).mLastVisitTime > mInactiveTime)
                    arraylist.add(s1);
            } while(true);
            String s;
            for(Iterator iterator1 = arraylist.iterator(); iterator1.hasNext(); super.mBitmaps.remove(s)) {
                s = (String)iterator1.next();
                Log.d("LifecycleResourceManager", (new StringBuilder()).append("remove cache: ").append(s).toString());
            }

            mLastCheckCacheTime = l;
        }
    }

    private static final String LOG_TAG = "LifecycleResourceManager";
    private static long mLastCheckCacheTime;
    private long mCheckTime;
    private long mInactiveTime;
}
