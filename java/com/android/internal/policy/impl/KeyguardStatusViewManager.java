// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.Context;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.widget.*;
import java.util.ArrayList;
import java.util.Date;
import libcore.util.MutableInt;

// Referenced classes of package com.android.internal.policy.impl:
//            KeyguardUpdateMonitor, KeyguardScreenCallback

class KeyguardStatusViewManager
    implements android.view.View.OnClickListener {
    static final class StatusMode extends Enum {

        public static StatusMode valueOf(String s) {
            return (StatusMode)Enum.valueOf(com/android/internal/policy/impl/KeyguardStatusViewManager$StatusMode, s);
        }

        public static StatusMode[] values() {
            return (StatusMode[])$VALUES.clone();
        }

        public boolean shouldShowStatusLines() {
            return mShowStatusLines;
        }

        private static final StatusMode $VALUES[];
        public static final StatusMode NetworkLocked;
        public static final StatusMode Normal;
        public static final StatusMode SimLocked;
        public static final StatusMode SimMissing;
        public static final StatusMode SimMissingLocked;
        public static final StatusMode SimPermDisabled;
        public static final StatusMode SimPukLocked;
        private final boolean mShowStatusLines;

        static  {
            Normal = new StatusMode("Normal", 0, true);
            NetworkLocked = new StatusMode("NetworkLocked", 1, true);
            SimMissing = new StatusMode("SimMissing", 2, false);
            SimMissingLocked = new StatusMode("SimMissingLocked", 3, false);
            SimPukLocked = new StatusMode("SimPukLocked", 4, false);
            SimLocked = new StatusMode("SimLocked", 5, true);
            SimPermDisabled = new StatusMode("SimPermDisabled", 6, false);
            StatusMode astatusmode[] = new StatusMode[7];
            astatusmode[0] = Normal;
            astatusmode[1] = NetworkLocked;
            astatusmode[2] = SimMissing;
            astatusmode[3] = SimMissingLocked;
            astatusmode[4] = SimPukLocked;
            astatusmode[5] = SimLocked;
            astatusmode[6] = SimPermDisabled;
            $VALUES = astatusmode;
        }

        private StatusMode(String s, int i, boolean flag) {
            super(s, i);
            mShowStatusLines = flag;
        }
    }

    private class TransientTextManager {
        private class Data {

            final int icon;
            final CharSequence text;
            final TransientTextManager this$1;

            Data(CharSequence charsequence, int i) {
                this$1 = TransientTextManager.this;
                super();
                text = charsequence;
                icon = i;
            }
        }


        void post(CharSequence charsequence, int i, long l) {
            if(mTextView != null) {
                mTextView.setText(charsequence);
                mTextView.setCompoundDrawablesWithIntrinsicBounds(i, 0, 0, 0);
                final Data data = new Data(charsequence, i);
                mContainer.postDelayed(new Runnable() {

                    public void run() {
                        mMessages.remove(data);
                        int j = -1 + mMessages.size();
                        CharSequence charsequence1;
                        int k;
                        if(j > 0) {
                            Data data1 = (Data)mMessages.get(j);
                            charsequence1 = data1.text;
                            k = data1.icon;
                        } else {
                            MutableInt mutableint = new MutableInt(0);
                            charsequence1 = getAltTextMessage(mutableint);
                            k = mutableint.value;
                        }
                        mTextView.setText(charsequence1);
                        mTextView.setCompoundDrawablesWithIntrinsicBounds(k, 0, 0, 0);
                    }

                    final TransientTextManager this$1;
                    final Data val$data;

                 {
                    this$1 = TransientTextManager.this;
                    data = data1;
                    super();
                }
                }, l);
            }
        }

        private ArrayList mMessages;
        private TextView mTextView;
        final KeyguardStatusViewManager this$0;



        TransientTextManager(TextView textview) {
            this$0 = KeyguardStatusViewManager.this;
            super();
            mMessages = new ArrayList(5);
            mTextView = textview;
        }
    }


    public KeyguardStatusViewManager(View view, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardScreenCallback keyguardscreencallback, boolean flag) {
        mShowingBatteryInfo = false;
        mPluggedIn = false;
        mBatteryLevel = 100;
        mInfoCallback = new KeyguardUpdateMonitor.InfoCallbackImpl() {

            public void onPhoneStateChanged(int k) {
                mPhoneState = k;
                updateEmergencyCallButtonState(k);
            }

            public void onRefreshBatteryInfo(boolean flag1, boolean flag2, int k) {
                mShowingBatteryInfo = flag1;
                mPluggedIn = flag2;
                mBatteryLevel = k;
                MutableInt mutableint = new MutableInt(0);
                update(15, getAltTextMessage(mutableint));
            }

            public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1) {
                mPlmn = charsequence;
                mSpn = charsequence1;
                updateCarrierStateWithSimStatus(mSimState);
            }

            public void onTimeChanged() {
                refreshDate();
            }

            final KeyguardStatusViewManager this$0;

             {
                this$0 = KeyguardStatusViewManager.this;
                super();
            }
        };
        mSimStateCallback = new KeyguardUpdateMonitor.SimStateCallback() {

            public void onSimStateChanged(com.android.internal.telephony.IccCard.State state) {
                updateCarrierStateWithSimStatus(state);
            }

            final KeyguardStatusViewManager this$0;

             {
                this$0 = KeyguardStatusViewManager.this;
                super();
            }
        };
        mContainer = view;
        mDateFormatString = getContext().getString(0x10400b4);
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCarrierView = (TextView)findViewById(0x10202ad);
        mDateView = (TextView)findViewById(0x1020063);
        mStatus1View = (TextView)findViewById(0x10202ac);
        mAlarmStatusView = (TextView)findViewById(0x10202ab);
        mOwnerInfoView = (TextView)findViewById(0x10202c1);
        mTransportView = (TransportControlView)findViewById(0x10202b1);
        mEmergencyCallButton = (Button)findViewById(0x1020294);
        mEmergencyCallButtonEnabledInScreen = flag;
        mDigitalClock = (DigitalClock)findViewById(0x1020064);
        if(mTransportView != null)
            mTransportView.setVisibility(8);
        if(mEmergencyCallButton != null) {
            mEmergencyCallButton.setText(0x10402fb);
            mEmergencyCallButton.setOnClickListener(this);
            mEmergencyCallButton.setFocusable(false);
        }
        mTransientTextManager = new TransientTextManager(mCarrierView);
        mUpdateMonitor.registerInfoCallback(mInfoCallback);
        mUpdateMonitor.registerSimStateCallback(mSimStateCallback);
        resetStatusInfo();
        refreshDate();
        updateOwnerInfo();
        View aview[] = new View[5];
        aview[0] = mCarrierView;
        aview[1] = mDateView;
        aview[2] = mStatus1View;
        aview[3] = mOwnerInfoView;
        aview[4] = mAlarmStatusView;
        int i = aview.length;
        for(int j = 0; j < i; j++) {
            View view1 = aview[j];
            if(view1 != null)
                view1.setSelected(true);
        }

    }

    private View findViewById(int i) {
        return mContainer.findViewById(i);
    }

    private CharSequence getAltTextMessage(MutableInt mutableint) {
        Object obj = null;
        if(!mShowingBatteryInfo) goto _L2; else goto _L1
_L1:
        if(!mPluggedIn) goto _L4; else goto _L3
_L3:
        if(mUpdateMonitor.isDeviceCharged()) {
            obj = getContext().getString(0x1040302);
        } else {
            Context context = getContext();
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(mBatteryLevel);
            obj = context.getString(0x1040301, aobj);
        }
        mutableint.value = 0;
_L6:
        return ((CharSequence) (obj));
_L4:
        if(mBatteryLevel < 20) {
            obj = getContext().getString(0x1040304);
            mutableint.value = 0;
        }
        continue; /* Loop/switch isn't completed */
_L2:
        obj = mCarrierText;
        if(true) goto _L6; else goto _L5
_L5:
    }

    private Context getContext() {
        return mContainer.getContext();
    }

    private CharSequence getPriorityTextMessage(MutableInt mutableint) {
        Object obj = null;
        if(TextUtils.isEmpty(mInstructionText)) goto _L2; else goto _L1
_L1:
        obj = mInstructionText;
        mutableint.value = 0;
_L4:
        return ((CharSequence) (obj));
_L2:
        if(mShowingBatteryInfo) {
            if(mPluggedIn) {
                if(mUpdateMonitor.isDeviceCharged()) {
                    obj = getContext().getString(0x1040302);
                } else {
                    Context context = getContext();
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(mBatteryLevel);
                    obj = context.getString(0x1040301, aobj);
                }
                mutableint.value = 0;
            } else
            if(mBatteryLevel < 20) {
                obj = getContext().getString(0x1040304);
                mutableint.value = 0;
            }
        } else
        if(!inWidgetMode() && mOwnerInfoView == null && mOwnerInfoText != null)
            obj = mOwnerInfoText;
        if(true) goto _L4; else goto _L3
_L3:
    }

    private CharSequence getText(int i) {
        CharSequence charsequence;
        if(i == 0)
            charsequence = null;
        else
            charsequence = getContext().getText(i);
        return charsequence;
    }

    private boolean inWidgetMode() {
        boolean flag;
        if(mTransportView != null && mTransportView.getVisibility() == 0)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private static CharSequence makeCarierString(CharSequence charsequence, CharSequence charsequence1) {
        boolean flag;
        boolean flag1;
        if(!TextUtils.isEmpty(charsequence))
            flag = true;
        else
            flag = false;
        if(!TextUtils.isEmpty(charsequence1))
            flag1 = true;
        else
            flag1 = false;
        if(!flag || !flag1) goto _L2; else goto _L1
_L1:
        charsequence = (new StringBuilder()).append(charsequence).append("|").append(charsequence1).toString();
_L4:
        return charsequence;
_L2:
        if(!flag)
            if(flag1)
                charsequence = charsequence1;
            else
                charsequence = "";
        if(true) goto _L4; else goto _L3
_L3:
    }

    private CharSequence makeCarrierStringOnEmergencyCapable(CharSequence charsequence, CharSequence charsequence1) {
        if(mLockPatternUtils.isEmergencyCallCapable())
            charsequence = makeCarierString(charsequence, charsequence1);
        return charsequence;
    }

    private void update(int i, CharSequence charsequence) {
        if(!inWidgetMode()) goto _L2; else goto _L1
_L1:
        i;
        JVM INSTR tableswitch 10 15: default 48
    //                   10 49
    //                   11 48
    //                   12 49
    //                   13 49
    //                   14 48
    //                   15 49;
           goto _L3 _L4 _L3 _L4 _L4 _L3 _L4
_L3:
        return;
_L4:
        mTransientTextManager.post(charsequence, 0, 2000L);
        continue; /* Loop/switch isn't completed */
_L2:
        updateStatusLines(mShowingStatus);
        if(true) goto _L3; else goto _L5
_L5:
    }

    private void updateAlarmInfo() {
        int i = 0;
        if(mAlarmStatusView != null) {
            String s = mLockPatternUtils.getNextAlarm();
            boolean flag;
            TextView textview;
            if(mShowingStatus && !TextUtils.isEmpty(s))
                flag = true;
            else
                flag = false;
            mAlarmStatusView.setText(s);
            mAlarmStatusView.setCompoundDrawablesWithIntrinsicBounds(0x108002e, 0, 0, 0);
            textview = mAlarmStatusView;
            if(!flag)
                i = 8;
            textview.setVisibility(i);
        }
    }

    private void updateCarrierStateWithSimStatus(com.android.internal.telephony.IccCard.State state) {
        CharSequence charsequence;
        int i;
        charsequence = null;
        i = 0;
        mEmergencyButtonEnabledBecauseSimLocked = false;
        mStatus = getStatusForIccState(state);
        mSimState = state;
        class _cls3 {

            static final int $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[];
            static final int $SwitchMap$com$android$internal$telephony$IccCard$State[];

            static  {
                $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode = new int[StatusMode.values().length];
                NoSuchFieldError nosuchfielderror14;
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.Normal.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.NetworkLocked.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.SimMissing.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.SimPermDisabled.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror3) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.SimMissingLocked.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror4) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.SimLocked.ordinal()] = 6;
                }
                catch(NoSuchFieldError nosuchfielderror5) { }
                try {
                    $SwitchMap$com$android$internal$policy$impl$KeyguardStatusViewManager$StatusMode[StatusMode.SimPukLocked.ordinal()] = 7;
                }
                catch(NoSuchFieldError nosuchfielderror6) { }
                $SwitchMap$com$android$internal$telephony$IccCard$State = new int[com.android.internal.telephony.IccCard.State.values().length];
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.ABSENT.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror7) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.NETWORK_LOCKED.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror8) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.NOT_READY.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror9) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PIN_REQUIRED.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror10) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PUK_REQUIRED.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror11) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.READY.ordinal()] = 6;
                }
                catch(NoSuchFieldError nosuchfielderror12) { }
                try {
                    $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.PERM_DISABLED.ordinal()] = 7;
                }
                catch(NoSuchFieldError nosuchfielderror13) { }
                $SwitchMap$com$android$internal$telephony$IccCard$State[com.android.internal.telephony.IccCard.State.UNKNOWN.ordinal()] = 8;
_L2:
                return;
                nosuchfielderror14;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls3..SwitchMap.com.android.internal.policy.impl.KeyguardStatusViewManager.StatusMode[mStatus.ordinal()];
        JVM INSTR tableswitch 1 7: default 76
    //                   1 95
    //                   2 110
    //                   3 136
    //                   4 162
    //                   5 185
    //                   6 216
    //                   7 243;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8
_L1:
        setCarrierText(charsequence);
        setCarrierHelpText(i);
        updateEmergencyCallButtonState(mPhoneState);
        return;
_L2:
        charsequence = makeCarierString(mPlmn, mSpn);
        continue; /* Loop/switch isn't completed */
_L3:
        charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040311), mPlmn);
        i = 0x10402f9;
        continue; /* Loop/switch isn't completed */
_L4:
        charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040305), mPlmn);
        i = 0x1040308;
        continue; /* Loop/switch isn't completed */
_L5:
        charsequence = getContext().getText(0x1040309);
        i = 0x104030a;
        mEmergencyButtonEnabledBecauseSimLocked = true;
        continue; /* Loop/switch isn't completed */
_L6:
        charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040305), mPlmn);
        i = 0x1040307;
        mEmergencyButtonEnabledBecauseSimLocked = true;
        continue; /* Loop/switch isn't completed */
_L7:
        charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040314), mPlmn);
        mEmergencyButtonEnabledBecauseSimLocked = true;
        continue; /* Loop/switch isn't completed */
_L8:
        charsequence = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040312), mPlmn);
        if(!mLockPatternUtils.isPukUnlockScreenEnable())
            mEmergencyButtonEnabledBecauseSimLocked = true;
        if(true) goto _L1; else goto _L9
_L9:
    }

    private void updateCarrierText() {
        if(!inWidgetMode() && mCarrierView != null)
            mCarrierView.setText(mCarrierText);
    }

    private void updateEmergencyCallButtonState(int i) {
        if(mEmergencyCallButton != null) {
            boolean flag;
            boolean flag1;
            if(mLockPatternUtils.isEmergencyCallEnabledWhileSimLocked() && mEmergencyButtonEnabledBecauseSimLocked)
                flag = true;
            else
                flag = false;
            if(mEmergencyCallButtonEnabledInScreen || flag)
                flag1 = true;
            else
                flag1 = false;
            mLockPatternUtils.updateEmergencyCallButtonState(mEmergencyCallButton, i, flag1);
        }
    }

    private void updateOwnerInfo() {
        int i = 1;
        android.content.ContentResolver contentresolver = getContext().getContentResolver();
        String s;
        if(android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_owner_info_enabled", i) == 0)
            i = 0;
        if(i != 0)
            s = android.provider.Settings.Secure.getString(contentresolver, "lock_screen_owner_info");
        else
            s = null;
        mOwnerInfoText = s;
        if(mOwnerInfoView != null) {
            mOwnerInfoView.setText(mOwnerInfoText);
            TextView textview = mOwnerInfoView;
            byte byte0;
            if(TextUtils.isEmpty(mOwnerInfoText))
                byte0 = 8;
            else
                byte0 = 0;
            textview.setVisibility(byte0);
        }
    }

    private void updateStatus1() {
        int i = 0;
        if(mStatus1View != null) {
            MutableInt mutableint = new MutableInt(0);
            CharSequence charsequence = getPriorityTextMessage(mutableint);
            mStatus1View.setText(charsequence);
            mStatus1View.setCompoundDrawablesWithIntrinsicBounds(mutableint.value, 0, 0, 0);
            TextView textview = mStatus1View;
            if(!mShowingStatus)
                i = 4;
            textview.setVisibility(i);
        }
    }

    public StatusMode getStatusForIccState(com.android.internal.telephony.IccCard.State state) {
        if(state != null) goto _L2; else goto _L1
_L1:
        StatusMode statusmode = StatusMode.Normal;
_L4:
        return statusmode;
_L2:
        boolean flag;
        if(!mUpdateMonitor.isDeviceProvisioned() && (state == com.android.internal.telephony.IccCard.State.ABSENT || state == com.android.internal.telephony.IccCard.State.PERM_DISABLED))
            flag = true;
        else
            flag = false;
        if(flag)
            state = com.android.internal.telephony.IccCard.State.NETWORK_LOCKED;
        switch(_cls3..SwitchMap.com.android.internal.telephony.IccCard.State[state.ordinal()]) {
        default:
            statusmode = StatusMode.SimMissing;
            break;

        case 1: // '\001'
            statusmode = StatusMode.SimMissing;
            break;

        case 2: // '\002'
            statusmode = StatusMode.SimMissingLocked;
            break;

        case 3: // '\003'
            statusmode = StatusMode.SimMissing;
            break;

        case 4: // '\004'
            statusmode = StatusMode.SimLocked;
            break;

        case 5: // '\005'
            statusmode = StatusMode.SimPukLocked;
            break;

        case 6: // '\006'
            statusmode = StatusMode.Normal;
            break;

        case 7: // '\007'
            statusmode = StatusMode.SimPermDisabled;
            break;

        case 8: // '\b'
            statusmode = StatusMode.SimMissing;
            break;
        }
        if(true) goto _L4; else goto _L3
_L3:
    }

    public void onClick(View view) {
        if(view == mEmergencyCallButton)
            mCallback.takeEmergencyCallAction();
    }

    public void onPause() {
        mUpdateMonitor.removeCallback(mInfoCallback);
        mUpdateMonitor.removeCallback(mSimStateCallback);
    }

    public void onResume() {
        if(mDigitalClock != null)
            mDigitalClock.updateTime();
        mUpdateMonitor.registerInfoCallback(mInfoCallback);
        mUpdateMonitor.registerSimStateCallback(mSimStateCallback);
        resetStatusInfo();
        if(mUpdateMonitor.getMaxBiometricUnlockAttemptsReached())
            setInstructionText(getContext().getString(0x1040300));
    }

    void refreshDate() {
        if(mDateView != null)
            mDateView.setText(DateFormat.format(mDateFormatString, new Date()));
    }

    void resetStatusInfo() {
        mInstructionText = null;
        mShowingBatteryInfo = mUpdateMonitor.shouldShowBatteryInfo();
        mPluggedIn = mUpdateMonitor.isDevicePluggedIn();
        mBatteryLevel = mUpdateMonitor.getBatteryLevel();
        updateStatusLines(true);
    }

    public void setCarrierHelpText(int i) {
        mCarrierHelpText = getText(i);
        update(12, mCarrierHelpText);
    }

    void setCarrierText(CharSequence charsequence) {
        mCarrierText = charsequence;
        update(11, charsequence);
    }

    public void setHelpMessage(int i, int j) {
        CharSequence charsequence = getText(i);
        String s;
        if(charsequence == null)
            s = null;
        else
            s = charsequence.toString();
        mHelpMessageText = s;
        update(13, mHelpMessageText);
    }

    void setInstructionText(String s) {
        mInstructionText = s;
        update(10, s);
    }

    void setOwnerInfo(CharSequence charsequence) {
        mOwnerInfoText = charsequence;
        update(14, charsequence);
    }

    void updateStatusLines(boolean flag) {
        mShowingStatus = flag;
        updateAlarmInfo();
        updateOwnerInfo();
        updateStatus1();
        updateCarrierText();
    }

    public static final int ALARM_ICON = 0x108002e;
    private static final int BATTERY_INFO = 15;
    public static final int BATTERY_LOW_ICON = 0;
    private static final int CARRIER_HELP_TEXT = 12;
    private static final int CARRIER_TEXT = 11;
    public static final int CHARGING_ICON = 0;
    private static final boolean DEBUG = false;
    private static final int HELP_MESSAGE_TEXT = 13;
    private static final long INSTRUCTION_RESET_DELAY = 2000L;
    private static final int INSTRUCTION_TEXT = 10;
    public static final int LOCK_ICON = 0;
    private static final int OWNER_INFO = 14;
    private static final String TAG = "KeyguardStatusView";
    private TextView mAlarmStatusView;
    private int mBatteryLevel;
    private KeyguardScreenCallback mCallback;
    private CharSequence mCarrierHelpText;
    private CharSequence mCarrierText;
    private TextView mCarrierView;
    private View mContainer;
    private String mDateFormatString;
    private TextView mDateView;
    private DigitalClock mDigitalClock;
    private boolean mEmergencyButtonEnabledBecauseSimLocked;
    private Button mEmergencyCallButton;
    private final boolean mEmergencyCallButtonEnabledInScreen;
    private String mHelpMessageText;
    private KeyguardUpdateMonitor.InfoCallbackImpl mInfoCallback;
    private String mInstructionText;
    private LockPatternUtils mLockPatternUtils;
    private CharSequence mOwnerInfoText;
    private TextView mOwnerInfoView;
    protected int mPhoneState;
    private CharSequence mPlmn;
    private boolean mPluggedIn;
    private boolean mShowingBatteryInfo;
    private boolean mShowingStatus;
    protected com.android.internal.telephony.IccCard.State mSimState;
    private KeyguardUpdateMonitor.SimStateCallback mSimStateCallback;
    private CharSequence mSpn;
    private StatusMode mStatus;
    private TextView mStatus1View;
    private TransientTextManager mTransientTextManager;
    private TransportControlView mTransportView;
    private KeyguardUpdateMonitor mUpdateMonitor;






/*
    static boolean access$402(KeyguardStatusViewManager keyguardstatusviewmanager, boolean flag) {
        keyguardstatusviewmanager.mShowingBatteryInfo = flag;
        return flag;
    }

*/


/*
    static boolean access$502(KeyguardStatusViewManager keyguardstatusviewmanager, boolean flag) {
        keyguardstatusviewmanager.mPluggedIn = flag;
        return flag;
    }

*/


/*
    static int access$602(KeyguardStatusViewManager keyguardstatusviewmanager, int i) {
        keyguardstatusviewmanager.mBatteryLevel = i;
        return i;
    }

*/



/*
    static CharSequence access$802(KeyguardStatusViewManager keyguardstatusviewmanager, CharSequence charsequence) {
        keyguardstatusviewmanager.mPlmn = charsequence;
        return charsequence;
    }

*/


/*
    static CharSequence access$902(KeyguardStatusViewManager keyguardstatusviewmanager, CharSequence charsequence) {
        keyguardstatusviewmanager.mSpn = charsequence;
        return charsequence;
    }

*/
}
