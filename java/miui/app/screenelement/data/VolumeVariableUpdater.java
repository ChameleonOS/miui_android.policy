// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.util.IndexedNumberVariable;

// Referenced classes of package miui.app.screenelement.data:
//            NotifierVariableUpdater, VariableUpdaterManager

public class VolumeVariableUpdater extends NotifierVariableUpdater {

    public VolumeVariableUpdater(VariableUpdaterManager variableupdatermanager) {
        super(variableupdatermanager, miui.app.screenelement.NotifierManager.NotifierType.VolumeChanged);
        mHandler = new Handler();
        mVolumeLevel = new IndexedNumberVariable("volume_level", getContext().mVariables);
        mVolumeLevelOld = new IndexedNumberVariable("volume_level_old", getContext().mVariables);
        mVolumeType = new IndexedNumberVariable("volume_type", getContext().mVariables);
        mVolumeType.set(-1D);
    }

    public void onNotify(Context context, Intent intent, Object obj) {
        if(intent.getAction().equals("android.media.VOLUME_CHANGED_ACTION")) {
            int i = intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_TYPE", -1);
            mVolumeType.set(i);
            int j = intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_VALUE", 0);
            mVolumeLevel.set(j);
            int k = intent.getIntExtra("android.media.EXTRA_PREV_VOLUME_STREAM_VALUE", 0);
            if(k != j)
                mVolumeLevelOld.set(k);
            getContext().requestUpdate();
            mHandler.removeCallbacks(mResetType);
            mHandler.postDelayed(mResetType, 1000L);
        }
    }

    private static final int SHOW_DELAY_TIME = 1000;
    public static final String VAR_VOLUME_LEVEL = "volume_level";
    public static final String VAR_VOLUME_LEVEL_OLD = "volume_level_old";
    public static final String VAR_VOLUME_TYPE = "volume_type";
    private Handler mHandler;
    private final Runnable mResetType = new Runnable() {

        public void run() {
            mVolumeType.set(-1D);
        }

        final VolumeVariableUpdater this$0;

             {
                this$0 = VolumeVariableUpdater.this;
                super();
            }
    };
    private IndexedNumberVariable mVolumeLevel;
    private IndexedNumberVariable mVolumeLevelOld;
    private IndexedNumberVariable mVolumeType;

}
