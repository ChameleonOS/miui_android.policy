// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.MiuiThemeHelper;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Message;
import android.telephony.TelephonyManager;
import com.google.android.collect.Lists;
import java.util.ArrayList;

public class KeyguardUpdateMonitor {
    static interface SimStateCallback {

        public abstract void onSimStateChanged(com.android.internal.telephony.IccCard.State state);
    }

    public static class InfoCallbackImpl
        implements InfoCallback {

        public void onClockVisibilityChanged() {
        }

        public void onDevicePolicyManagerStateChanged() {
        }

        public void onDeviceProvisioned() {
        }

        public void onPhoneStateChanged(int i) {
        }

        public void onRefreshBatteryInfo(boolean flag, boolean flag1, int i) {
        }

        public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1) {
        }

        public void onRingerModeChanged(int i) {
        }

        public void onTimeChanged() {
        }

        public void onUserChanged(int i) {
        }

        public InfoCallbackImpl() {
        }
    }

    static interface InfoCallback {

        public abstract void onClockVisibilityChanged();

        public abstract void onDevicePolicyManagerStateChanged();

        public abstract void onDeviceProvisioned();

        public abstract void onPhoneStateChanged(int i);

        public abstract void onRefreshBatteryInfo(boolean flag, boolean flag1, int i);

        public abstract void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1);

        public abstract void onRingerModeChanged(int i);

        public abstract void onTimeChanged();

        public abstract void onUserChanged(int i);
    }

    private static class BatteryStatus {

        public final int health;
        public final int level;
        public final int plugged;
        public final int status;

        public BatteryStatus(int i, int j, int k, int l) {
            status = i;
            level = j;
            plugged = k;
            health = l;
        }
    }

    private static class SimArgs {

        static SimArgs fromIntent(Intent intent) {
            if(!"android.intent.action.SIM_STATE_CHANGED".equals(intent.getAction()))
                throw new IllegalArgumentException("only handles intent ACTION_SIM_STATE_CHANGED");
            String s = intent.getStringExtra("ss");
            com.android.internal.telephony.IccCard.State state;
            if("ABSENT".equals(s)) {
                if("PERM_DISABLED".equals(intent.getStringExtra("reason")))
                    state = com.android.internal.telephony.IccCard.State.PERM_DISABLED;
                else
                    state = com.android.internal.telephony.IccCard.State.ABSENT;
            } else
            if("READY".equals(s))
                state = com.android.internal.telephony.IccCard.State.READY;
            else
            if("LOCKED".equals(s)) {
                String s1 = intent.getStringExtra("reason");
                if("PIN".equals(s1))
                    state = com.android.internal.telephony.IccCard.State.PIN_REQUIRED;
                else
                if("PUK".equals(s1))
                    state = com.android.internal.telephony.IccCard.State.PUK_REQUIRED;
                else
                    state = com.android.internal.telephony.IccCard.State.UNKNOWN;
            } else
            if("NETWORK".equals(s))
                state = com.android.internal.telephony.IccCard.State.NETWORK_LOCKED;
            else
                state = Injector.getIccCardState(s);
            return new SimArgs(state);
        }

        public String toString() {
            return simState.toString();
        }

        public final com.android.internal.telephony.IccCard.State simState;

        SimArgs(com.android.internal.telephony.IccCard.State state) {
            simState = state;
        }
    }

    static class Injector {

        static com.android.internal.telephony.IccCard.State getIccCardState(String s) {
            com.android.internal.telephony.IccCard.State state;
            if("IMSI".equals(s))
                state = com.android.internal.telephony.IccCard.State.READY;
            else
            if("LOADED".equals(s))
                state = com.android.internal.telephony.IccCard.State.READY;
            else
                state = com.android.internal.telephony.IccCard.State.UNKNOWN;
            return state;
        }

        Injector() {
        }
    }


    public KeyguardUpdateMonitor(Context context) {
        mSimState = com.android.internal.telephony.IccCard.State.READY;
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
        mInfoCallbacks = Lists.newArrayList();
        mSimStateCallbacks = Lists.newArrayList();
        mContext = context;
        mHandler = new Handler() {

            public void handleMessage(Message message) {
                message.what;
                JVM INSTR tableswitch 301 310: default 60
            //                           301 61
            //                           302 71
            //                           303 88
            //                           304 98
            //                           305 115
            //                           306 129
            //                           307 146
            //                           308 156
            //                           309 166
            //                           310 176;
                   goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11
_L1:
                return;
_L2:
                handleTimeUpdate();
                continue; /* Loop/switch isn't completed */
_L3:
                handleBatteryUpdate((BatteryStatus)message.obj);
                continue; /* Loop/switch isn't completed */
_L4:
                handleCarrierInfoUpdate();
                continue; /* Loop/switch isn't completed */
_L5:
                handleSimStateChange((SimArgs)message.obj);
                continue; /* Loop/switch isn't completed */
_L6:
                handleRingerModeChange(message.arg1);
                continue; /* Loop/switch isn't completed */
_L7:
                handlePhoneStateChanged((String)message.obj);
                continue; /* Loop/switch isn't completed */
_L8:
                handleClockVisibilityChanged();
                continue; /* Loop/switch isn't completed */
_L9:
                handleDeviceProvisioned();
                continue; /* Loop/switch isn't completed */
_L10:
                handleDevicePolicyManagerStateChanged();
                continue; /* Loop/switch isn't completed */
_L11:
                handleUserChanged(message.arg1);
                if(true) goto _L1; else goto _L12
_L12:
            }

            final KeyguardUpdateMonitor this$0;

             {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
        };
        boolean flag;
        if(android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0)
            flag = true;
        else
            flag = false;
        mDeviceProvisioned = flag;
        if(!mDeviceProvisioned) {
            mContentObserver = new ContentObserver(mHandler) {

                public void onChange(boolean flag2) {
                    boolean flag3 = false;
                    super.onChange(flag2);
                    KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.this;
                    if(android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0)
                        flag3 = true;
                    keyguardupdatemonitor.mDeviceProvisioned = flag3;
                    if(mDeviceProvisioned)
                        mHandler.sendMessage(mHandler.obtainMessage(308));
                }

                final KeyguardUpdateMonitor this$0;

             {
                this$0 = KeyguardUpdateMonitor.this;
                super(handler);
            }
            };
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.Secure.getUriFor("device_provisioned"), false, mContentObserver);
            IntentFilter intentfilter;
            boolean flag1;
            if(android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0)
                flag1 = true;
            else
                flag1 = false;
            if(flag1 != mDeviceProvisioned) {
                mDeviceProvisioned = flag1;
                if(mDeviceProvisioned)
                    mHandler.sendMessage(mHandler.obtainMessage(308));
            }
        }
        mSimState = com.android.internal.telephony.IccCard.State.READY;
        mBatteryStatus = new BatteryStatus(1, 100, 0, 0);
        mTelephonyPlmn = getDefaultPlmn();
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.PHONE_STATE");
        intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
        intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
        intentfilter.addAction("android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.USER_SWITCHED");
        intentfilter.addAction("android.intent.action.USER_REMOVED");
        context.registerReceiver(new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                String s = intent.getAction();
                if(!"android.intent.action.TIME_TICK".equals(s) && !"android.intent.action.TIME_SET".equals(s) && !"android.intent.action.TIMEZONE_CHANGED".equals(s)) goto _L2; else goto _L1
_L1:
                mHandler.sendMessage(mHandler.obtainMessage(301));
_L4:
                return;
_L2:
                if("android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s)) {
                    mTelephonyPlmn = getTelephonyPlmnFrom(intent);
                    mTelephonySpn = getTelephonySpnFrom(intent);
                    mHandler.sendMessage(mHandler.obtainMessage(303));
                } else
                if("android.intent.action.BATTERY_CHANGED".equals(s)) {
                    int i = intent.getIntExtra("status", 1);
                    int j = intent.getIntExtra("plugged", 0);
                    int k = intent.getIntExtra("level", 0);
                    int l = intent.getIntExtra("health", 1);
                    Message message = mHandler.obtainMessage(302, new BatteryStatus(i, k, j, l));
                    mHandler.sendMessage(message);
                } else
                if("android.intent.action.SIM_STATE_CHANGED".equals(s))
                    mHandler.sendMessage(mHandler.obtainMessage(304, SimArgs.fromIntent(intent)));
                else
                if("android.media.RINGER_MODE_CHANGED".equals(s))
                    mHandler.sendMessage(mHandler.obtainMessage(305, intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1), 0));
                else
                if("android.intent.action.PHONE_STATE".equals(s)) {
                    String s1 = intent.getStringExtra("state");
                    mHandler.sendMessage(mHandler.obtainMessage(306, s1));
                } else
                if("android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED".equals(s))
                    mHandler.sendMessage(mHandler.obtainMessage(309));
                else
                if("android.intent.action.USER_SWITCHED".equals(s))
                    mHandler.sendMessage(mHandler.obtainMessage(310, intent.getIntExtra("android.intent.extra.user_id", 0), 0));
                if(true) goto _L4; else goto _L3
_L3:
            }

            final KeyguardUpdateMonitor this$0;

             {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
        }, intentfilter);
    }

    private CharSequence getDefaultPlmn() {
        return mContext.getResources().getText(0x10402f6);
    }

    private CharSequence getTelephonyPlmnFrom(Intent intent) {
        Object obj;
        if(intent.getBooleanExtra("showPlmn", false)) {
            obj = intent.getStringExtra("plmn");
            if(obj == null)
                obj = getDefaultPlmn();
        } else {
            obj = null;
        }
        return ((CharSequence) (obj));
    }

    private CharSequence getTelephonySpnFrom(Intent intent) {
        if(!intent.getBooleanExtra("showSpn", false)) goto _L2; else goto _L1
_L1:
        String s = intent.getStringExtra("spn");
        if(s == null) goto _L2; else goto _L3
_L3:
        return s;
_L2:
        s = null;
        if(true) goto _L3; else goto _L4
_L4:
    }

    private void handleBatteryUpdate(BatteryStatus batterystatus) {
        boolean flag = isBatteryUpdateInteresting(mBatteryStatus, batterystatus);
        mBatteryStatus = batterystatus;
        if(flag) {
            for(int i = 0; i < mInfoCallbacks.size(); i++)
                ((InfoCallback)mInfoCallbacks.get(i)).onRefreshBatteryInfo(shouldShowBatteryInfo(), isPluggedIn(batterystatus), batterystatus.level);

        }
    }

    private void handleCarrierInfoUpdate() {
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onRefreshCarrierInfo(mTelephonyPlmn, mTelephonySpn);

    }

    private void handleClockVisibilityChanged() {
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onClockVisibilityChanged();

    }

    private void handleSimStateChange(SimArgs simargs) {
        com.android.internal.telephony.IccCard.State state = simargs.simState;
        if(state != com.android.internal.telephony.IccCard.State.UNKNOWN && state != mSimState) {
            mSimState = state;
            for(int i = 0; i < mSimStateCallbacks.size(); i++)
                ((SimStateCallback)mSimStateCallbacks.get(i)).onSimStateChanged(state);

        }
    }

    private void handleTimeUpdate() {
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onTimeChanged();

    }

    private static boolean isBatteryLow(BatteryStatus batterystatus) {
        boolean flag;
        if(batterystatus.level < 20)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static boolean isBatteryUpdateInteresting(BatteryStatus batterystatus, BatteryStatus batterystatus1) {
        boolean flag;
        boolean flag1;
        flag = true;
        flag1 = isPluggedIn(batterystatus1);
        boolean flag2 = isPluggedIn(batterystatus);
        boolean flag3;
        if(flag2 == flag && flag1 == flag && batterystatus.status != batterystatus1.status)
            flag3 = flag;
        else
            flag3 = false;
        break MISSING_BLOCK_LABEL_38;
        if(flag2 == flag1 && !flag3 && (!flag1 || batterystatus.level == batterystatus1.level) && (flag1 || !isBatteryLow(batterystatus1) || batterystatus1.level == batterystatus.level))
            flag = false;
        return flag;
    }

    private static boolean isPluggedIn(BatteryStatus batterystatus) {
        boolean flag = true;
        if(batterystatus.plugged != flag && batterystatus.plugged != 2 || MiuiThemeHelper.isScreenshotMode())
            flag = false;
        return flag;
    }

    public void clearFailedAttempts() {
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
    }

    public int getBatteryLevel() {
        return mBatteryStatus.level;
    }

    public int getFailedAttempts() {
        return mFailedAttempts;
    }

    public boolean getMaxBiometricUnlockAttemptsReached() {
        boolean flag;
        if(mFailedBiometricUnlockAttempts >= 3)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public int getPhoneState() {
        return mPhoneState;
    }

    public com.android.internal.telephony.IccCard.State getSimState() {
        return mSimState;
    }

    public CharSequence getTelephonyPlmn() {
        return mTelephonyPlmn;
    }

    public CharSequence getTelephonySpn() {
        return mTelephonySpn;
    }

    protected void handleDevicePolicyManagerStateChanged() {
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onDevicePolicyManagerStateChanged();

    }

    protected void handleDeviceProvisioned() {
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onDeviceProvisioned();

        if(mContentObserver != null) {
            mContext.getContentResolver().unregisterContentObserver(mContentObserver);
            mContentObserver = null;
        }
    }

    protected void handlePhoneStateChanged(String s) {
        if(!TelephonyManager.EXTRA_STATE_IDLE.equals(s)) goto _L2; else goto _L1
_L1:
        mPhoneState = 0;
_L4:
        for(int i = 0; i < mInfoCallbacks.size(); i++)
            ((InfoCallback)mInfoCallbacks.get(i)).onPhoneStateChanged(mPhoneState);

        break; /* Loop/switch isn't completed */
_L2:
        if(TelephonyManager.EXTRA_STATE_OFFHOOK.equals(s))
            mPhoneState = 2;
        else
        if(TelephonyManager.EXTRA_STATE_RINGING.equals(s))
            mPhoneState = 1;
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void handleRingerModeChange(int i) {
        mRingMode = i;
        for(int j = 0; j < mInfoCallbacks.size(); j++)
            ((InfoCallback)mInfoCallbacks.get(j)).onRingerModeChanged(i);

    }

    protected void handleUserChanged(int i) {
        for(int j = 0; j < mInfoCallbacks.size(); j++)
            ((InfoCallback)mInfoCallbacks.get(j)).onUserChanged(i);

    }

    public boolean isClockVisible() {
        return mClockVisible;
    }

    public boolean isDeviceCharged() {
        boolean flag;
        if(mBatteryStatus.status == 5 || mBatteryStatus.level >= 100)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean isDevicePluggedIn() {
        return isPluggedIn(mBatteryStatus);
    }

    public boolean isDeviceProvisioned() {
        return mDeviceProvisioned;
    }

    public boolean isSimLocked() {
        boolean flag;
        if(mSimState == com.android.internal.telephony.IccCard.State.PIN_REQUIRED || mSimState == com.android.internal.telephony.IccCard.State.PUK_REQUIRED || mSimState == com.android.internal.telephony.IccCard.State.PERM_DISABLED)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void registerInfoCallback(InfoCallback infocallback) {
        if(!mInfoCallbacks.contains(infocallback)) {
            mInfoCallbacks.add(infocallback);
            infocallback.onRefreshBatteryInfo(shouldShowBatteryInfo(), isPluggedIn(mBatteryStatus), mBatteryStatus.level);
            infocallback.onTimeChanged();
            infocallback.onRingerModeChanged(mRingMode);
            infocallback.onPhoneStateChanged(mPhoneState);
            infocallback.onRefreshCarrierInfo(mTelephonyPlmn, mTelephonySpn);
            infocallback.onClockVisibilityChanged();
        }
    }

    public void registerSimStateCallback(SimStateCallback simstatecallback) {
        if(!mSimStateCallbacks.contains(simstatecallback)) {
            mSimStateCallbacks.add(simstatecallback);
            simstatecallback.onSimStateChanged(mSimState);
        }
    }

    public void removeCallback(Object obj) {
        mInfoCallbacks.remove(obj);
        mSimStateCallbacks.remove(obj);
    }

    public void reportClockVisible(boolean flag) {
        mClockVisible = flag;
        mHandler.obtainMessage(307).sendToTarget();
    }

    public void reportFailedAttempt() {
        mFailedAttempts = 1 + mFailedAttempts;
    }

    public void reportFailedBiometricUnlockAttempt() {
        mFailedBiometricUnlockAttempts = 1 + mFailedBiometricUnlockAttempts;
    }

    public void reportSimUnlocked() {
        handleSimStateChange(new SimArgs(com.android.internal.telephony.IccCard.State.READY));
    }

    public boolean shouldShowBatteryInfo() {
        boolean flag;
        if((isPluggedIn(mBatteryStatus) || isBatteryLow(mBatteryStatus)) && !MiuiThemeHelper.isScreenshotMode())
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static final boolean DEBUG = false;
    protected static final boolean DEBUG_SIM_STATES = false;
    private static final int FAILED_BIOMETRIC_UNLOCK_ATTEMPTS_BEFORE_BACKUP = 3;
    static final int LOW_BATTERY_THRESHOLD = 20;
    private static final int MSG_BATTERY_UPDATE = 302;
    private static final int MSG_CARRIER_INFO_UPDATE = 303;
    private static final int MSG_CLOCK_VISIBILITY_CHANGED = 307;
    private static final int MSG_DEVICE_PROVISIONED = 308;
    protected static final int MSG_DPM_STATE_CHANGED = 309;
    private static final int MSG_PHONE_STATE_CHANGED = 306;
    private static final int MSG_RINGER_MODE_CHANGED = 305;
    private static final int MSG_SIM_STATE_CHANGE = 304;
    private static final int MSG_TIME_UPDATE = 301;
    protected static final int MSG_USER_CHANGED = 310;
    private static final String TAG = "KeyguardUpdateMonitor";
    private BatteryStatus mBatteryStatus;
    private boolean mClockVisible;
    private ContentObserver mContentObserver;
    private final Context mContext;
    private boolean mDeviceProvisioned;
    private int mFailedAttempts;
    private int mFailedBiometricUnlockAttempts;
    private Handler mHandler;
    private ArrayList mInfoCallbacks;
    private int mPhoneState;
    private int mRingMode;
    private com.android.internal.telephony.IccCard.State mSimState;
    private ArrayList mSimStateCallbacks;
    private CharSequence mTelephonyPlmn;
    private CharSequence mTelephonySpn;




/*
    static CharSequence access$1002(KeyguardUpdateMonitor keyguardupdatemonitor, CharSequence charsequence) {
        keyguardupdatemonitor.mTelephonySpn = charsequence;
        return charsequence;
    }

*/







/*
    static boolean access$502(KeyguardUpdateMonitor keyguardupdatemonitor, boolean flag) {
        keyguardupdatemonitor.mDeviceProvisioned = flag;
        return flag;
    }

*/




/*
    static CharSequence access$802(KeyguardUpdateMonitor keyguardupdatemonitor, CharSequence charsequence) {
        keyguardupdatemonitor.mTelephonyPlmn = charsequence;
        return charsequence;
    }

*/

}
