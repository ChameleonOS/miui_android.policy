// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.MemoryFile;
import android.util.Log;
import java.io.IOException;
import java.util.*;

// Referenced classes of package miui.app.screenelement:
//            ResourceManager

public class SoundManager
    implements android.media.SoundPool.OnLoadCompleteListener {

    public SoundManager(Context context, ResourceManager resourcemanager) {
        mSoundPoolMap = new HashMap();
        mPendingSoundMap = new HashMap();
        mPlayingSoundMap = new ArrayList();
        mResourceManager = resourcemanager;
        mContext = context;
        mSoundPool = new SoundPool(4, 1, 100);
        mSoundPool.setOnLoadCompleteListener(this);
        mAudioManager = (AudioManager)context.getSystemService("audio");
    }

    /**
     * @deprecated Method playSoundImp is deprecated
     */

    private void playSoundImp(int i, boolean flag) {
        this;
        JVM INSTR monitorenter ;
        SoundPool soundpool = mSoundPool;
        if(soundpool != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if(!flag)
            break MISSING_BLOCK_LABEL_88;
        if(mPlayingSoundMap.size() == 0)
            break MISSING_BLOCK_LABEL_88;
        Integer integer;
        for(Iterator iterator = mPlayingSoundMap.iterator(); iterator.hasNext(); mSoundPool.stop(integer.intValue()))
            integer = (Integer)iterator.next();

        break MISSING_BLOCK_LABEL_81;
        Exception exception;
        exception;
        throw exception;
        mPlayingSoundMap.clear();
        int j = mSoundPool.play(i, 1.0F, 1.0F, 1, 0, 1.0F);
        mPlayingSoundMap.add(Integer.valueOf(j));
          goto _L1
    }

    public void onLoadComplete(SoundPool soundpool, int i, int j) {
        if(j == 0)
            playSoundImp(i, ((Boolean)mPendingSoundMap.get(Integer.valueOf(i))).booleanValue());
        mPendingSoundMap.remove(Integer.valueOf(i));
    }

    /**
     * @deprecated Method playSound is deprecated
     */

    public void playSound(String s, boolean flag) {
        this;
        JVM INSTR monitorenter ;
        if(mSoundPool == null) goto _L2; else goto _L1
_L1:
        AudioManager audiomanager = mAudioManager;
        if(audiomanager != null) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        if(mAudioManager.getMode() != 0) goto _L2; else goto _L4
_L4:
        Integer integer;
        MemoryFile memoryfile;
        integer = (Integer)mSoundPoolMap.get(s);
        if(integer != null)
            break MISSING_BLOCK_LABEL_191;
        memoryfile = mResourceManager.getFile(s);
        if(memoryfile != null)
            break MISSING_BLOCK_LABEL_99;
        Log.e("Lockscreen_SoundManager", (new StringBuilder()).append("the sound does not exist: ").append(s).toString());
          goto _L2
        Exception exception;
        exception;
        throw exception;
        try {
            integer = Integer.valueOf(mSoundPool.load(memoryfile.getFileDescriptor(), 0L, memoryfile.length(), 1));
            mSoundPoolMap.put(s, integer);
            memoryfile.close();
        }
        catch(IOException ioexception) {
            Log.e("Lockscreen_SoundManager", (new StringBuilder()).append("fail to load sound. ").append(ioexception.toString()).toString());
        }
        mPendingSoundMap.put(integer, Boolean.valueOf(flag));
          goto _L2
        playSoundImp(integer.intValue(), flag);
          goto _L2
    }

    /**
     * @deprecated Method release is deprecated
     */

    public void release() {
        this;
        JVM INSTR monitorenter ;
        if(mSoundPool != null) {
            mSoundPoolMap.clear();
            mSoundPool.setOnLoadCompleteListener(null);
            mSoundPool.release();
            mSoundPool = null;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private AudioManager mAudioManager;
    private Context mContext;
    private HashMap mPendingSoundMap;
    private ArrayList mPlayingSoundMap;
    private ResourceManager mResourceManager;
    private SoundPool mSoundPool;
    private HashMap mSoundPoolMap;
}
