// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import android.content.Context;
import android.content.Intent;
import android.view.MotionEvent;
import miui.app.screenelement.*;
import miui.app.screenelement.data.*;
import miui.app.screenelement.elements.*;
import miui.app.screenelement.util.*;
import miui.net.FirewallManager;
import miui.security.ChooseLockSettingsHelper;
import org.w3c.dom.Element;

// Referenced classes of package com.miui.internal.policy.impl.AwesomeLockScreenImp:
//            UnlockerListener, LockScreenElementGroup, BuiltinVariableBinders, UnlockerScreenElement

public class LockScreenRoot extends ScreenElementRoot
    implements UnlockerListener {
    public static interface UnlockerCallback {

        public abstract Task findTask(String s);

        public abstract void haptic(int i);

        public abstract boolean isSecure();

        public abstract boolean isSoundEnable();

        public abstract void pokeWakelock();

        public abstract void pokeWakelock(int i);

        public abstract void unlocked(Intent intent);
    }


    public LockScreenRoot(ScreenContext screencontext, UnlockerCallback unlockercallback) {
        super(screencontext);
        mUnlockerCallback = unlockercallback;
        mBatteryState = new IndexedNumberVariable("battery_state", super.mContext.mVariables);
        mBatteryLevel = new IndexedNumberVariable("battery_level", super.mContext.mVariables);
    }

    protected ElementGroup createElementGroup(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        return new LockScreenElementGroup(element, super.mContext, this);
    }

    public void endUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(super.mElementGroup != null)
            ((LockScreenElementGroup)super.mElementGroup).endUnlockMoving(unlockerscreenelement);
    }

    public Task findTask(String s) {
        return mUnlockerCallback.findTask(s);
    }

    public void haptic(int i) {
        mUnlockerCallback.haptic(i);
    }

    public void init() {
        int i = 1;
        super.init();
        ChooseLockSettingsHelper chooselocksettingshelper = new ChooseLockSettingsHelper(super.mContext.mContext);
        IndexedNumberVariable indexednumbervariable;
        double d;
        if(android.provider.Settings.System.getInt(super.mContext.mContext.getContentResolver(), "pref_key_enable_notification_body", i) != i || FirewallManager.isAccessControlProtected(super.mContext.mContext, "com.android.mms") && chooselocksettingshelper.isACLockEnabled() || chooselocksettingshelper.isPrivacyModeEnabled() || mUnlockerCallback.isSecure())
            i = 0;
        indexednumbervariable = new IndexedNumberVariable("sms_body_preview", super.mContext.mVariables);
        if(i != 0)
            d = 1.0D;
        else
            d = 0.0D;
        indexednumbervariable.set(d);
    }

    public boolean isDisplayDesktop() {
        return mDisplayDesktop;
    }

    protected void onAddVariableUpdater(VariableUpdaterManager variableupdatermanager) {
        super.onAddVariableUpdater(variableupdatermanager);
        variableupdatermanager.add(new BatteryVariableUpdater(variableupdatermanager));
        variableupdatermanager.add(new VolumeVariableUpdater(variableupdatermanager));
    }

    public void onButtonInteractive(ButtonScreenElement buttonscreenelement, miui.app.screenelement.elements.ButtonScreenElement.ButtonAction buttonaction) {
        mUnlockerCallback.pokeWakelock();
    }

    protected boolean onLoad(Element element) {
        boolean flag;
        if(!super.onLoad(element)) {
            flag = false;
        } else {
            mDisplayDesktop = Boolean.parseBoolean(element.getAttribute("displayDesktop"));
            mFrameRateCharging = Utils.getAttrAsFloat(element, "frameRateCharging", super.mNormalFrameRate);
            mFrameRateBatteryLow = Utils.getAttrAsFloat(element, "frameRateBatteryLow", super.mNormalFrameRate);
            mFrameRateBatteryFull = Utils.getAttrAsFloat(element, "frameRateBatteryFull", super.mNormalFrameRate);
            BuiltinVariableBinders.fill(super.mVariableBinderManager);
            flag = true;
        }
        return flag;
    }

    public void onRefreshBatteryInfo(boolean flag, boolean flag1, int i) {
        mBatteryLevel.set(i);
        if(super.mElementGroup != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        curCategory;
        String s;
        int j;
        if(flag) {
            if(flag1) {
                if(i >= 100) {
                    s = "BatteryFull";
                    j = 3;
                    super.mFrameRate = mFrameRateBatteryFull;
                } else {
                    s = "Charging";
                    j = 1;
                    super.mFrameRate = mFrameRateCharging;
                }
            } else {
                s = "BatteryLow";
                j = 2;
                super.mFrameRate = mFrameRateBatteryLow;
            }
        } else {
            s = "Normal";
            j = 0;
            super.mFrameRate = super.mNormalFrameRate;
        }
        if(s != curCategory) {
            requestFramerate(super.mFrameRate);
            requestUpdate();
            mBatteryState.set(j);
            super.mElementGroup.showCategory("BatteryFull", false);
            super.mElementGroup.showCategory("Charging", false);
            super.mElementGroup.showCategory("BatteryLow", false);
            super.mElementGroup.showCategory("Normal", false);
            super.mElementGroup.showCategory(s, true);
            curCategory = s;
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public boolean onTouch(MotionEvent motionevent) {
        boolean flag;
        if(super.mElementGroup == null) {
            mUnlockerCallback.unlocked(null);
            flag = false;
        } else {
            flag = super.onTouch(motionevent);
        }
        return flag;
    }

    public void pokeWakelock() {
        mUnlockerCallback.pokeWakelock();
    }

    protected boolean shouldPlaySound() {
        return mUnlockerCallback.isSoundEnable();
    }

    public void startUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(super.mElementGroup != null)
            ((LockScreenElementGroup)super.mElementGroup).startUnlockMoving(unlockerscreenelement);
    }

    private static final String LOG_TAG = "LockScreenRoot";
    public static final String SMS_BODY_PREVIEW = "sms_body_preview";
    private static final String TAG_NAME_BATTERYFULL = "BatteryFull";
    private static final String TAG_NAME_CHARGING = "Charging";
    private static final String TAG_NAME_LOWBATTERY = "BatteryLow";
    private static final String TAG_NAME_NORMAL = "Normal";
    private String curCategory;
    private IndexedNumberVariable mBatteryLevel;
    private IndexedNumberVariable mBatteryState;
    private boolean mDisplayDesktop;
    private float mFrameRateBatteryFull;
    private float mFrameRateBatteryLow;
    private float mFrameRateCharging;
    private final UnlockerCallback mUnlockerCallback;
}
