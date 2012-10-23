// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.text.TextUtils;
import android.util.Log;
import android.widget.FrameLayout;
import com.android.internal.widget.LockPatternUtils;
import com.miui.internal.policy.impl.AwesomeLockScreenImp.*;
import com.miui.internal.policy.impl.KeyguardScreenCallback;
import java.util.Collection;
import java.util.Iterator;
import miui.app.screenelement.LifecycleResourceManager;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.util.*;
import miui.content.res.ThemeResources;
import miui.util.HapticFeedbackUtil;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardScreen, QcomCallback, KeyguardUpdateMonitor

class AwesomeLockScreen extends FrameLayout
    implements KeyguardScreen, KeyguardUpdateMonitor.InfoCallback, KeyguardUpdateMonitor.SimStateCallback, com.miui.internal.policy.impl.AwesomeLockScreenImp.LockScreenRoot.UnlockerCallback, UnlockerListener, QcomCallback {

    AwesomeLockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback) {
        super(context);
        isPaused = false;
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        setFocusable(true);
        setFocusableInTouchMode(true);
        if(mHapticFeedbackUtil == null)
            mHapticFeedbackUtil = new HapticFeedbackUtil(context, true);
        mAudioManager = (AudioManager)context.getSystemService("audio");
        keyguardupdatemonitor.registerInfoCallback(this);
        keyguardupdatemonitor.registerSimStateCallback(this);
        mResourceMgr = new LifecycleResourceManager((new LockScreenResourceLoader()).setLocal(mContext.getResources().getConfiguration().locale), 0x36ee80L, 0x36ee80L);
        mLockscreenContext = new ScreenContext(mContext, mResourceMgr, new LockScreenElementFactory(this, this));
        loadConfig();
        android.content.ContentResolver contentresolver = getContext().getContentResolver();
        boolean flag;
        String s;
        android.widget.FrameLayout.LayoutParams layoutparams;
        if(android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_owner_info_enabled", 1) != 0)
            flag = true;
        else
            flag = false;
        if(flag)
            s = android.provider.Settings.Secure.getString(contentresolver, "lock_screen_owner_info");
        else
            s = null;
        Utils.putVariableString("owner_info", mLockscreenContext.mVariables, s);
        mRoot = new LockScreenRoot(mLockscreenContext, this);
        mRoot.load();
        mLockscreenView = new AwesomeLockScreenView(mContext, mRoot);
        layoutparams = new android.widget.FrameLayout.LayoutParams(-1, -1);
        addView(mLockscreenView, layoutparams);
        onRefreshBatteryInfo(mUpdateMonitor.shouldShowBatteryInfo(), mUpdateMonitor.isDevicePluggedIn(), mUpdateMonitor.getBatteryLevel());
        if(sStartTime == 0L)
            sStartTime = System.currentTimeMillis() / 1000L;
        mWakeStartTime = System.currentTimeMillis() / 1000L;
    }

    private void loadConfig() {
        mConfig = new LockscreenConfigFile();
        if(!mConfig.load(ThemeResources.sAppliedLockstyleConfigPath)) {
            mConfig = null;
        } else {
            Iterator iterator = mConfig.getVariables().iterator();
            do {
                if(!iterator.hasNext())
                    break;
                miui.app.screenelement.util.LockscreenConfigFile.Variable variable = (miui.app.screenelement.util.LockscreenConfigFile.Variable)iterator.next();
                if(TextUtils.equals(variable.type, "string"))
                    Utils.putVariableString(variable.name, mLockscreenContext.mVariables, variable.value);
                else
                if(TextUtils.equals(variable.type, "number"))
                    try {
                        double d = Double.parseDouble(variable.value);
                        Utils.putVariableNumber(variable.name, mLockscreenContext.mVariables, Double.valueOf(d));
                    }
                    catch(NumberFormatException numberformatexception) { }
            } while(true);
            Iterator iterator1 = mConfig.getTasks().iterator();
            while(iterator1.hasNext())  {
                Task task = (Task)iterator1.next();
                Utils.putVariableString(task.id, "name", mLockscreenContext.mVariables, task.name);
                Utils.putVariableString(task.id, "package", mLockscreenContext.mVariables, task.packageName);
                Utils.putVariableString(task.id, "class", mLockscreenContext.mVariables, task.className);
            }
        }
    }

    public void cleanUp() {
        mLockscreenView.cleanUp();
        mUpdateMonitor.removeCallback(this);
        mLockPatternUtils = null;
        mUpdateMonitor = null;
    }

    public void endUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(mRoot != null)
            mRoot.endUnlockMoving(unlockerscreenelement);
    }

    public Task findTask(String s) {
        Task task;
        if(mConfig == null)
            task = null;
        else
            task = mConfig.getTask(s);
        return task;
    }

    public void haptic(int i) {
        mHapticFeedbackUtil.performHapticFeedback(1, false);
    }

    public boolean isDisplayDesktop() {
        return mRoot.isDisplayDesktop();
    }

    public boolean isSecure() {
        return mLockPatternUtils.isSecure();
    }

    public boolean isSoundEnable() {
        boolean flag;
        if(mAudioManager.getRingerMode() == 2)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean needsInput() {
        return false;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
    }

    public void onClockVisibilityChanged() {
    }

    protected void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    public void onDevicePolicyManagerStateChanged() {
    }

    public void onDeviceProvisioned() {
    }

    public void onPause() {
        mLockscreenView.onPause();
        mRoot.onCommand("pause");
        isPaused = true;
        mResourceMgr.checkCache();
        sTotalWakenTime = (System.currentTimeMillis() / 1000L - mWakeStartTime) + sTotalWakenTime;
    }

    public void onPhoneStateChanged(int i) {
    }

    public void onPhoneStateChanged(String s) {
    }

    public void onRefreshBatteryInfo(boolean flag, boolean flag1, int i) {
        if(mRoot != null)
            mRoot.onRefreshBatteryInfo(flag, flag1, i);
    }

    public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1) {
    }

    public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1, int i) {
    }

    public void onResume() {
        mLockscreenView.onResume();
        mRoot.onCommand("resume");
        isPaused = false;
        mWakeStartTime = System.currentTimeMillis() / 1000L;
    }

    public void onRingerModeChanged(int i) {
    }

    public void onSimStateChanged(com.android.internal.telephony.IccCard.State state) {
    }

    public void onSimStateChanged(com.android.internal.telephony.IccCard.State state, int i) {
    }

    public void onTimeChanged() {
    }

    public void onUserChanged(int i) {
    }

    public void pokeWakelock() {
        mCallback.pokeWakelock();
    }

    public void pokeWakelock(int i) {
        mCallback.pokeWakelock(i);
    }

    public void startUnlockMoving(UnlockerScreenElement unlockerscreenelement) {
        if(mRoot != null)
            mRoot.startUnlockMoving(unlockerscreenelement);
    }

    public void unlocked(Intent intent) {
        mCallback.setPendingIntent(intent);
        post(new Runnable() {

            public void run() {
                mCallback.goToUnlockScreen();
_L1:
                return;
                ActivityNotFoundException activitynotfoundexception;
                activitynotfoundexception;
                Log.e("AwesomeLockScreen", activitynotfoundexception.toString());
                activitynotfoundexception.printStackTrace();
                  goto _L1
            }

            final AwesomeLockScreen this$0;

             {
                this$0 = AwesomeLockScreen.this;
                super();
            }
        });
        Object aobj[] = new Object[2];
        aobj[0] = Long.valueOf(sTotalWakenTime);
        aobj[1] = Long.valueOf(System.currentTimeMillis() / 1000L - sStartTime);
        Log.i("AwesomeLockScreen", String.format("lockscreen awake time: [%d sec] in time range: [%d sec]", aobj));
    }

    private static final String COMMAND_PAUSE = "pause";
    private static final String COMMAND_RESUME = "resume";
    private static final boolean DBG = false;
    private static final String OWNER_INFO_VAR = "owner_info";
    private static final String TAG = "AwesomeLockScreen";
    private static HapticFeedbackUtil mHapticFeedbackUtil;
    private static long sStartTime;
    private static long sTotalWakenTime;
    private boolean isPaused;
    private AudioManager mAudioManager;
    private final KeyguardScreenCallback mCallback;
    private LockscreenConfigFile mConfig;
    private LockPatternUtils mLockPatternUtils;
    private final ScreenContext mLockscreenContext;
    private AwesomeLockScreenView mLockscreenView;
    private LifecycleResourceManager mResourceMgr;
    private LockScreenRoot mRoot;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private long mWakeStartTime;

}
