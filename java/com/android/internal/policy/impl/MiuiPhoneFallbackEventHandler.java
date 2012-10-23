// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.content.Intent;
import android.view.KeyEvent;
import android.view.View;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneFallbackEventHandler

public class MiuiPhoneFallbackEventHandler extends PhoneFallbackEventHandler {

    public MiuiPhoneFallbackEventHandler(Context context) {
        super(context);
    }

    protected void handleCameraKeyEvent() {
        int i;
        int j;
        i = 0;
        if(1 == android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "camera_key_preferred_action_type", 0))
            i = android.provider.Settings.System.getInt(super.mContext.getContentResolver(), "camera_key_preferred_action_shortcut_id", -1);
        j = 0;
        i;
        JVM INSTR tableswitch 2 3: default 60
    //                   2 127
    //                   3 122;
           goto _L1 _L2 _L3
_L1:
        break; /* Loop/switch isn't completed */
_L2:
        break MISSING_BLOCK_LABEL_127;
_L4:
        if(j != 0) {
            KeyEvent keyevent = new KeyEvent(0, j);
            if(!super.mView.dispatchKeyEvent(keyevent))
                dispatchKeyEvent(keyevent);
            KeyEvent keyevent1 = new KeyEvent(1, j);
            if(!super.mView.dispatchKeyEvent(keyevent1))
                dispatchKeyEvent(keyevent1);
        } else {
            super.mContext.sendBroadcast(new Intent("com.miui.app.ExtraStatusBarManager.TRIGGER_CAMERA_KEY"));
        }
        return;
_L3:
        j = 5;
          goto _L4
        j = 84;
          goto _L4
    }
}
