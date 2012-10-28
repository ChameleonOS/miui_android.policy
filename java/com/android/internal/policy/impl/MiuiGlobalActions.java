// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.AlertDialog;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.os.*;
import android.telephony.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
import miui.content.res.ExtraConfiguration;
import miui.security.ChooseLockSettingsHelper;
import miui.util.AudioManagerHelper;

class MiuiGlobalActions
    implements android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnClickListener {
    private static class SilentModeAction
        implements Action, android.view.View.OnClickListener {

        private int indexToRingerMode(int i) {
            return i;
        }

        private int ringerModeToIndex(int i) {
            return i;
        }

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater) {
            View view1 = layoutinflater.inflate(0x6030022, viewgroup, false);
            int i = ringerModeToIndex(mAudioManager.getRingerMode());
            int j = 0;
            while(j < 3)  {
                LinearLayout linearlayout = (LinearLayout)view1.findViewById(ITEM_IDS[j]);
                boolean flag;
                if(i == j)
                    flag = true;
                else
                    flag = false;
                linearlayout.setSelected(flag);
                linearlayout.setTag(Integer.valueOf(j));
                linearlayout.setOnClickListener(this);
                ((ImageView)linearlayout.getChildAt(0)).setImageResource(ICON_IDS[j]);
                j++;
            }
            return view1;
        }

        public boolean isEnabled() {
            return true;
        }

        public void onClick(View view) {
            if(view.getTag() instanceof Integer) {
                int i = ((Integer)view.getTag()).intValue();
                mAudioManager.setRingerMode(indexToRingerMode(i));
                mHandler.sendEmptyMessageDelayed(0, 300L);
            }
        }

        public void onPress() {
        }

        public boolean showBeforeProvisioning() {
            return false;
        }

        public boolean showDuringKeyguard() {
            return true;
        }

        void willCreate() {
        }

        private final int ICON_IDS[];
        private final int ITEM_IDS[];
        private final AudioManager mAudioManager;
        private final Handler mHandler;

        SilentModeAction(AudioManager audiomanager, Handler handler) {
            int ai[] = new int[3];
            ai[0] = 0x60b0029;
            ai[1] = 0x60b002a;
            ai[2] = 0x60b002b;
            ITEM_IDS = ai;
            int ai1[] = new int[3];
            ai1[0] = 0x6020119;
            ai1[1] = 0x6020117;
            ai1[2] = 0x6020118;
            ICON_IDS = ai1;
            mAudioManager = audiomanager;
            mHandler = handler;
        }
    }

    private static abstract class ToggleAction
        implements Action {
        static final class State extends Enum {

            public static State valueOf(String s) {
                return (State)Enum.valueOf(com/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State, s);
            }

            public static State[] values() {
                return (State[])$VALUES.clone();
            }

            public boolean inTransition() {
                return inTransition;
            }

            private static final State $VALUES[];
            public static final State Off;
            public static final State On;
            public static final State TurningOff;
            public static final State TurningOn;
            private final boolean inTransition;

            static  {
                Off = new State("Off", 0, false);
                TurningOn = new State("TurningOn", 1, true);
                TurningOff = new State("TurningOff", 2, true);
                On = new State("On", 3, false);
                State astate[] = new State[4];
                astate[0] = Off;
                astate[1] = TurningOn;
                astate[2] = TurningOff;
                astate[3] = On;
                $VALUES = astate;
            }

            private State(String s, int i, boolean flag) {
                super(s, i);
                inTransition = flag;
            }
        }


        protected void changeStateFromPress(boolean flag) {
            State state;
            if(flag)
                state = State.On;
            else
                state = State.Off;
            mState = state;
        }

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater) {
            boolean flag = false;
            willCreate();
            View view1 = layoutinflater.inflate(0x6030021, viewgroup, false);
            ImageView imageview = (ImageView)view1.findViewById(0x60b0027);
            TextView textview = (TextView)view1.findViewById(0x60b0028);
            TextView textview1 = (TextView)view1.findViewById(0x60b0026);
            boolean flag1 = isEnabled();
            if(textview != null) {
                textview.setText(mMessageResId);
                textview.setEnabled(flag1);
            }
            if(mState == State.On || mState == State.TurningOn)
                flag = true;
            if(imageview != null) {
                Resources resources = context.getResources();
                int j;
                if(flag)
                    j = mEnabledIconResId;
                else
                    j = mDisabledIconResid;
                imageview.setImageDrawable(resources.getDrawable(j));
                imageview.setEnabled(flag1);
            }
            if(textview1 != null) {
                int i;
                if(flag)
                    i = mEnabledStatusMessageResId;
                else
                    i = mDisabledStatusMessageResId;
                textview1.setText(i);
                textview1.setVisibility(8);
                textview1.setEnabled(flag1);
            }
            view1.setEnabled(flag1);
            return view1;
        }

        public boolean isEnabled() {
            boolean flag;
            if(!mState.inTransition())
                flag = true;
            else
                flag = false;
            return flag;
        }

        public final void onPress() {
            if(mState.inTransition()) {
                Log.w("GlobalActions", "shouldn't be able to toggle when in transition");
            } else {
                boolean flag;
                if(mState != State.On)
                    flag = true;
                else
                    flag = false;
                onToggle(flag);
                changeStateFromPress(flag);
            }
        }

        abstract void onToggle(boolean flag);

        public void updateState(State state) {
            mState = state;
        }

        void willCreate() {
        }

        protected int mDisabledIconResid;
        protected int mDisabledStatusMessageResId;
        protected int mEnabledIconResId;
        protected int mEnabledStatusMessageResId;
        protected int mMessageResId;
        protected State mState;

        public ToggleAction(int i, int j, int k, int l, int i1) {
            mState = State.Off;
            mEnabledIconResId = i;
            mDisabledIconResid = j;
            mMessageResId = k;
            mEnabledStatusMessageResId = l;
            mDisabledStatusMessageResId = i1;
        }
    }

    private static abstract class SinglePressAction
        implements Action {

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater) {
            View view1 = layoutinflater.inflate(0x6030021, viewgroup, false);
            mIconView = (ImageView)view1.findViewById(0x60b0027);
            mTextview = (TextView)view1.findViewById(0x60b0028);
            view1.findViewById(0x60b0026).setVisibility(8);
            mIconView.setImageResource(mIconResId);
            mTextview.setText(mMessageResId);
            return view1;
        }

        public boolean isEnabled() {
            return true;
        }

        public abstract void onPress();

        public void setIcon(int i) {
            mIconResId = i;
            if(mIconView != null)
                mIconView.setImageResource(mIconResId);
        }

        public void setMessage(int i) {
            mMessageResId = i;
            if(mTextview != null)
                mTextview.setText(mMessageResId);
        }

        private int mIconResId;
        private ImageView mIconView;
        private int mMessageResId;
        private TextView mTextview;

        protected SinglePressAction(int i, int j) {
            mIconResId = i;
            mMessageResId = j;
        }
    }

    private static interface Action {

        public abstract View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater);

        public abstract boolean isEnabled();

        public abstract void onPress();

        public abstract boolean showBeforeProvisioning();

        public abstract boolean showDuringKeyguard();
    }

    private class MyAdapter extends BaseAdapter {

        public boolean areAllItemsEnabled() {
            return false;
        }

        public int getCount() {
            int i = 0;
            int j = 0;
            do {
                if(j >= mItems.size())
                    break;
                Action action = (Action)mItems.get(j);
                if((!mKeyguardShowing || action.showDuringKeyguard()) && (mDeviceProvisioned || action.showBeforeProvisioning()))
                    i++;
                j++;
            } while(true);
            return i;
        }

        public Action getItem(int i) {
            int j = 0;
            int k = 0;
            do {
                if(k >= mItems.size())
                    break;
                Action action = (Action)mItems.get(k);
                if((!mKeyguardShowing || action.showDuringKeyguard()) && (mDeviceProvisioned || action.showBeforeProvisioning())) {
                    if(j == i)
                        return action;
                    j++;
                }
                k++;
            } while(true);
            throw new IllegalArgumentException((new StringBuilder()).append("position ").append(i).append(" out of range of showable actions").append(", filtered count=").append(getCount()).append(", keyguardshowing=").append(mKeyguardShowing).append(", provisioned=").append(mDeviceProvisioned).toString());
        }

        public volatile Object getItem(int i) {
            return getItem(i);
        }

        public long getItemId(int i) {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup) {
            return getItem(i).create(mContext, view, viewgroup, LayoutInflater.from(mContext));
        }

        public boolean isEnabled(int i) {
            return getItem(i).isEnabled();
        }

        final MiuiGlobalActions this$0;

        private MyAdapter() {
            this$0 = MiuiGlobalActions.this;
            super();
        }

    }


    public MiuiGlobalActions(Context context, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs) {
        mThemeChanged = -1;
        mKeyguardShowing = false;
        mDeviceProvisioned = false;
        mAirplaneState = ToggleAction.State.Off;
        mIsWaitingForEcmExit = false;
        mSecurityHelper = null;
        mBroadcastReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                String s = intent.getAction();
                if(!"android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(s) && !"android.intent.action.SCREEN_OFF".equals(s)) goto _L2; else goto _L1
_L1:
                if(!"globalactions".equals(intent.getStringExtra("reason")))
                    mHandler.sendEmptyMessage(0);
_L4:
                return;
_L2:
                if("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED".equals(s) && !intent.getBooleanExtra("PHONE_IN_ECM_STATE", false) && mIsWaitingForEcmExit) {
                    mIsWaitingForEcmExit = false;
                    changeAirplaneModeSystemSetting(true);
                }
                if(true) goto _L4; else goto _L3
_L3:
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super();
            }
        };
        mPhoneStateListener = new PhoneStateListener() {

            public void onServiceStateChanged(ServiceState servicestate) {
                boolean flag;
                MiuiGlobalActions miuiglobalactions;
                ToggleAction.State state;
                if(servicestate.getState() == 3)
                    flag = true;
                else
                    flag = false;
                miuiglobalactions = MiuiGlobalActions.this;
                if(flag)
                    state = ToggleAction.State.On;
                else
                    state = ToggleAction.State.Off;
                miuiglobalactions.mAirplaneState = state;
                mAirplaneModeOn.updateState(mAirplaneState);
                mAdapter.notifyDataSetChanged();
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super();
            }
        };
        mRingerModeReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                if(intent.getAction().equals("android.media.RINGER_MODE_CHANGED"))
                    mHandler.sendEmptyMessage(1);
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super();
            }
        };
        mHandler = new Handler() {

            public void handleMessage(Message message) {
                if(message.what != 0) goto _L2; else goto _L1
_L1:
                if(mDialog != null)
                    mDialog.dismiss();
_L4:
                return;
_L2:
                if(message.what == 1)
                    mAdapter.notifyDataSetChanged();
                if(true) goto _L4; else goto _L3
_L3:
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super();
            }
        };
        mContext = new ContextThemeWrapper(context, 0x1030073);
        mWindowManagerFuncs = windowmanagerfuncs;
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        mSecurityHelper = new ChooseLockSettingsHelper(context);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        ((TelephonyManager)context.getSystemService("phone")).listen(mPhoneStateListener, 1);
    }

    private void changeAirplaneModeSystemSetting(boolean flag) {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        Intent intent;
        if(flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.System.putInt(contentresolver, "airplane_mode_on", i);
        intent = new Intent("android.intent.action.AIRPLANE_MODE");
        intent.addFlags(0x20000000);
        intent.putExtra("state", flag);
        mContext.sendBroadcast(intent);
    }

    private AlertDialog createDialog() {
        mSilentModeAction = new SilentModeAction(mAudioManager, mHandler);
        mAirplaneModeOn = new ToggleAction(0x602011a, 0x602011b, 0x60c0188, 0x60c0189, 0x60c018a) {

            protected void changeStateFromPress(boolean flag) {
                if(!Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
                    ToggleAction.State state;
                    if(flag)
                        state = ToggleAction.State.TurningOn;
                    else
                        state = ToggleAction.State.TurningOff;
                    super.mState = state;
                    mAirplaneState = super.mState;
                }
            }

            void onToggle(boolean flag) {
                if(Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
                    mIsWaitingForEcmExit = true;
                    Intent intent = new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null);
                    intent.addFlags(0x10000000);
                    mContext.startActivity(intent);
                } else {
                    changeAirplaneModeSystemSetting(flag);
                }
            }

            public boolean showBeforeProvisioning() {
                return false;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super(i, j, k, l, i1);
            }
        };
        mItems = new ArrayList();
        mItems.add(mAirplaneModeOn);
        mMuteToggle = new SinglePressAction(getMuteIconResId(), 0x60c0195) {

            public void onPress() {
                AudioManagerHelper.toggleSilent(mContext, 5);
            }

            public boolean showBeforeProvisioning() {
                return true;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super(i, j);
            }
        };
        mItems.add(mMuteToggle);
        mItems.add(new SinglePressAction(0x602011d, 0x60c018c) {

            public void onPress() {
                mWindowManagerFuncs.rebootSafeMode();
            }

            public boolean showBeforeProvisioning() {
                return true;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super(i, j);
            }
        });
        mItems.add(new SinglePressAction(0x602011c, 0x60c018b) {

            public void onPress() {
                mWindowManagerFuncs.shutdown();
            }

            public boolean showBeforeProvisioning() {
                return true;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final MiuiGlobalActions this$0;

             {
                this$0 = MiuiGlobalActions.this;
                super(i, j);
            }
        });
        mAdapter = new MyAdapter();
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext, 3);
        builder.setAdapter(mAdapter, this).setInverseBackgroundForced(true);
        AlertDialog alertdialog = builder.create();
        alertdialog.getListView().setItemsCanFocus(true);
        alertdialog.getWindow().setType(2008);
        alertdialog.setOnDismissListener(this);
        return alertdialog;
    }

    private int getMuteIconResId() {
        boolean flag;
        int i;
        if(mAudioManager.getRingerMode() != 2)
            flag = true;
        else
            flag = false;
        if(flag)
            i = 0x6020024;
        else
            i = 0x6020023;
        return i;
    }

    private void prepareDialog() {
        mAirplaneModeOn.updateState(mAirplaneState);
        mMuteToggle.setIcon(getMuteIconResId());
        mAdapter.notifyDataSetChanged();
        IntentFilter intentfilter;
        if(mKeyguardShowing)
            mDialog.getWindow().setType(2009);
        else
            mDialog.getWindow().setType(2008);
        intentfilter = new IntentFilter("android.media.RINGER_MODE_CHANGED");
        mContext.registerReceiver(mRingerModeReceiver, intentfilter);
    }

    public void onClick(DialogInterface dialoginterface, int i) {
        if(!(mAdapter.getItem(i) instanceof SilentModeAction))
            dialoginterface.dismiss();
        mAdapter.getItem(i).onPress();
    }

    public void onDismiss(DialogInterface dialoginterface) {
        mContext.unregisterReceiver(mRingerModeReceiver);
    }

    public void showDialog(boolean flag, boolean flag1) {
        mKeyguardShowing = flag;
        mDeviceProvisioned = flag1;
        Configuration configuration = mContext.getResources().getConfiguration();
        int i;
        if(configuration != null)
            i = configuration.extraConfig.themeChanged;
        else
            i = 0;
        if(mDialog == null || i != mThemeChanged) {
            mThemeChanged = i;
            mDialog = createDialog();
        }
        prepareDialog();
        mDialog.show();
        mDialog.getWindow().getDecorView().setSystemUiVisibility(0x10000);
    }

    private static final int DIALOG_DISMISS_DELAY = 300;
    private static final int MESSAGE_DISMISS = 0;
    private static final int MESSAGE_REFRESH = 1;
    private static final boolean SHOW_SILENT_TOGGLE = true;
    private static final String TAG = "GlobalActions";
    private MyAdapter mAdapter;
    private ToggleAction mAirplaneModeOn;
    private ToggleAction.State mAirplaneState;
    private final AudioManager mAudioManager;
    private BroadcastReceiver mBroadcastReceiver;
    private final Context mContext;
    private boolean mDeviceProvisioned;
    private AlertDialog mDialog;
    private Handler mHandler;
    private boolean mIsWaitingForEcmExit;
    private ArrayList mItems;
    private boolean mKeyguardShowing;
    private SinglePressAction mMuteToggle;
    PhoneStateListener mPhoneStateListener;
    private BroadcastReceiver mRingerModeReceiver;
    private ChooseLockSettingsHelper mSecurityHelper;
    private SilentModeAction mSilentModeAction;
    private int mThemeChanged;
    private final android.view.WindowManagerPolicy.WindowManagerFuncs mWindowManagerFuncs;



/*
    static boolean access$002(MiuiGlobalActions miuiglobalactions, boolean flag) {
        miuiglobalactions.mIsWaitingForEcmExit = flag;
        return flag;
    }

*/








/*
    static ToggleAction.State access$302(MiuiGlobalActions miuiglobalactions, ToggleAction.State state) {
        miuiglobalactions.mAirplaneState = state;
        return state;
    }

*/





}
