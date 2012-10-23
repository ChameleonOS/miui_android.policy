// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.os.*;
import android.telephony.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.*;

class GlobalActions
    implements android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnClickListener {
    private static class SilentModeTriStateAction
        implements Action, android.view.View.OnClickListener {

        private int indexToRingerMode(int i) {
            return i;
        }

        private int ringerModeToIndex(int i) {
            return i;
        }

        public View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater) {
            View view1 = layoutinflater.inflate(0x1090042, viewgroup, false);
            int i = ringerModeToIndex(mAudioManager.getRingerMode());
            int j = 0;
            while(j < 3)  {
                View view2 = view1.findViewById(ITEM_IDS[j]);
                boolean flag;
                if(i == j)
                    flag = true;
                else
                    flag = false;
                view2.setSelected(flag);
                view2.setTag(Integer.valueOf(j));
                view2.setOnClickListener(this);
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

        public boolean onLongPress() {
            return false;
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

        private final int ITEM_IDS[];
        private final AudioManager mAudioManager;
        private final Context mContext;
        private final Handler mHandler;

        SilentModeTriStateAction(Context context, AudioManager audiomanager, Handler handler) {
            int ai[] = new int[3];
            ai[0] = 0x1020276;
            ai[1] = 0x1020277;
            ai[2] = 0x1020278;
            ITEM_IDS = ai;
            mAudioManager = audiomanager;
            mHandler = handler;
            mContext = context;
        }
    }

    private class SilentModeToggleAction extends ToggleAction {

        void onToggle(boolean flag) {
            if(flag)
                mAudioManager.setRingerMode(0);
            else
                mAudioManager.setRingerMode(2);
        }

        public boolean showBeforeProvisioning() {
            return false;
        }

        public boolean showDuringKeyguard() {
            return true;
        }

        final GlobalActions this$0;

        public SilentModeToggleAction() {
            this$0 = GlobalActions.this;
            super(0x10802a7, 0x10802a6, 0x1040138, 0x1040139, 0x104013a);
        }
    }

    private static abstract class ToggleAction
        implements Action {
        static final class State extends Enum {

            public static State valueOf(String s) {
                return (State)Enum.valueOf(com/android/internal/policy/impl/GlobalActions$ToggleAction$State, s);
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
            willCreate();
            View view1 = layoutinflater.inflate(0x1090041, viewgroup, false);
            ImageView imageview = (ImageView)view1.findViewById(0x1020006);
            TextView textview = (TextView)view1.findViewById(0x102000b);
            TextView textview1 = (TextView)view1.findViewById(0x1020275);
            boolean flag = isEnabled();
            if(textview != null) {
                textview.setText(mMessageResId);
                textview.setEnabled(flag);
            }
            boolean flag1;
            if(mState == State.On || mState == State.TurningOn)
                flag1 = true;
            else
                flag1 = false;
            if(imageview != null) {
                Resources resources = context.getResources();
                int j;
                if(flag1)
                    j = mEnabledIconResId;
                else
                    j = mDisabledIconResid;
                imageview.setImageDrawable(resources.getDrawable(j));
                imageview.setEnabled(flag);
            }
            if(textview1 != null) {
                int i;
                if(flag1)
                    i = mEnabledStatusMessageResId;
                else
                    i = mDisabledStatusMessageResId;
                textview1.setText(i);
                textview1.setVisibility(0);
                textview1.setEnabled(flag);
            }
            view1.setEnabled(flag);
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

        public boolean onLongPress() {
            return false;
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
            View view1 = layoutinflater.inflate(0x1090041, viewgroup, false);
            ImageView imageview = (ImageView)view1.findViewById(0x1020006);
            TextView textview = (TextView)view1.findViewById(0x102000b);
            view1.findViewById(0x1020275).setVisibility(8);
            imageview.setImageDrawable(context.getResources().getDrawable(mIconResId));
            if(mMessage != null)
                textview.setText(mMessage);
            else
                textview.setText(mMessageResId);
            return view1;
        }

        public boolean isEnabled() {
            return true;
        }

        public boolean onLongPress() {
            return false;
        }

        public abstract void onPress();

        private final int mIconResId;
        private final CharSequence mMessage;
        private final int mMessageResId;

        protected SinglePressAction(int i, int j) {
            mIconResId = i;
            mMessageResId = j;
            mMessage = null;
        }

        protected SinglePressAction(int i, CharSequence charsequence) {
            mIconResId = i;
            mMessageResId = 0;
            mMessage = charsequence;
        }
    }

    private static interface Action {

        public abstract View create(Context context, View view, ViewGroup viewgroup, LayoutInflater layoutinflater);

        public abstract boolean isEnabled();

        public abstract boolean onLongPress();

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

        final GlobalActions this$0;

        private MyAdapter() {
            this$0 = GlobalActions.this;
            super();
        }

    }


    public GlobalActions(Context context, android.view.WindowManagerPolicy.WindowManagerFuncs windowmanagerfuncs) {
        mKeyguardShowing = false;
        mDeviceProvisioned = false;
        mAirplaneState = ToggleAction.State.Off;
        mIsWaitingForEcmExit = false;
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

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super();
            }
        };
        mPhoneStateListener = new PhoneStateListener() {

            public void onServiceStateChanged(ServiceState servicestate) {
                if(mHasTelephony) {
                    boolean flag1;
                    GlobalActions globalactions;
                    ToggleAction.State state;
                    if(servicestate.getState() == 3)
                        flag1 = true;
                    else
                        flag1 = false;
                    globalactions = GlobalActions.this;
                    if(flag1)
                        state = ToggleAction.State.On;
                    else
                        state = ToggleAction.State.Off;
                    globalactions.mAirplaneState = state;
                    mAirplaneModeOn.updateState(mAirplaneState);
                    mAdapter.notifyDataSetChanged();
                }
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super();
            }
        };
        mRingerModeReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                if(intent.getAction().equals("android.media.RINGER_MODE_CHANGED"))
                    mHandler.sendEmptyMessage(1);
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super();
            }
        };
        mAirplaneModeObserver = new ContentObserver(new Handler()) {

            public void onChange(boolean flag1) {
                onAirplaneModeChanged();
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super(handler);
            }
        };
        mHandler = new Handler() {

            public void handleMessage(Message message) {
                message.what;
                JVM INSTR tableswitch 0 2: default 32
            //                           0 33
            //                           1 56
            //                           2 76;
                   goto _L1 _L2 _L3 _L4
_L1:
                return;
_L2:
                if(mDialog != null)
                    mDialog.dismiss();
                continue; /* Loop/switch isn't completed */
_L3:
                refreshSilentMode();
                mAdapter.notifyDataSetChanged();
                continue; /* Loop/switch isn't completed */
_L4:
                handleShow();
                if(true) goto _L1; else goto _L5
_L5:
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super();
            }
        };
        mContext = context;
        mWindowManagerFuncs = windowmanagerfuncs;
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        ((TelephonyManager)context.getSystemService("phone")).listen(mPhoneStateListener, 1);
        mHasTelephony = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("airplane_mode_on"), true, mAirplaneModeObserver);
        Vibrator vibrator = (Vibrator)mContext.getSystemService("vibrator");
        boolean flag;
        if(vibrator != null && vibrator.hasVibrator())
            flag = true;
        else
            flag = false;
        mHasVibrator = flag;
    }

    private void changeAirplaneModeSystemSetting(boolean flag) {
        ContentResolver contentresolver = mContext.getContentResolver();
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
        if(!mHasTelephony) {
            ToggleAction.State state;
            if(flag)
                state = ToggleAction.State.On;
            else
                state = ToggleAction.State.Off;
            mAirplaneState = state;
        }
    }

    private AlertDialog createDialog() {
        UserInfo userinfo;
        List list;
        Iterator iterator;
        StringBuilder stringbuilder;
        StringBuilder stringbuilder1;
        SinglePressAction singlepressaction;
        UserInfo userinfo2;
        if(!mHasVibrator)
            mSilentModeAction = new SilentModeToggleAction();
        else
            mSilentModeAction = new SilentModeTriStateAction(mContext, mAudioManager, mHandler);
        mAirplaneModeOn = new ToggleAction(0x10802dc, 0x10802dd, 0x104013b, 0x104013c, 0x104013d) {

            protected void changeStateFromPress(boolean flag1) {
                if(mHasTelephony && !Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
                    ToggleAction.State state;
                    if(flag1)
                        state = ToggleAction.State.TurningOn;
                    else
                        state = ToggleAction.State.TurningOff;
                    super.mState = state;
                    mAirplaneState = super.mState;
                }
            }

            void onToggle(boolean flag1) {
                if(mHasTelephony && Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode"))) {
                    mIsWaitingForEcmExit = true;
                    Intent intent = new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null);
                    intent.addFlags(0x10000000);
                    mContext.startActivity(intent);
                } else {
                    changeAirplaneModeSystemSetting(flag1);
                }
            }

            public boolean showBeforeProvisioning() {
                return false;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super(i, j, k, l, i1);
            }
        };
        onAirplaneModeChanged();
        mItems = new ArrayList();
        mItems.add(new SinglePressAction(0x1080030, 0x1040137) {

            public boolean onLongPress() {
                mWindowManagerFuncs.rebootSafeMode();
                return true;
            }

            public void onPress() {
                mWindowManagerFuncs.shutdown();
            }

            public boolean showBeforeProvisioning() {
                return true;
            }

            public boolean showDuringKeyguard() {
                return true;
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super(i, j);
            }
        });
        mItems.add(mAirplaneModeOn);
        mItems.add(mSilentModeAction);
        list = mContext.getPackageManager().getUsers();
        if(list.size() <= 1) goto _L2; else goto _L1
_L1:
        try {
            userinfo2 = ActivityManagerNative.getDefault().getCurrentUser();
        }
        catch(RemoteException remoteexception) {
            userinfo = null;
            continue; /* Loop/switch isn't completed */
        }
        userinfo = userinfo2;
_L4:
        iterator = list.iterator();
        while(iterator.hasNext())  {
            UserInfo userinfo1 = (UserInfo)iterator.next();
            boolean flag;
            String s;
            String s1;
            if(userinfo == null) {
                if(userinfo1.id == 0)
                    flag = true;
                else
                    flag = false;
            } else
            if(userinfo.id == userinfo1.id)
                flag = true;
            else
                flag = false;
            stringbuilder = new StringBuilder();
            if(userinfo1.name != null)
                s = userinfo1.name;
            else
                s = "Primary";
            stringbuilder1 = stringbuilder.append(s);
            if(flag)
                s1 = " \u2714";
            else
                s1 = "";
            singlepressaction = new SinglePressAction(stringbuilder1.append(s1).toString(), userinfo1) {

                public void onPress() {
                    ActivityManagerNative.getDefault().switchUser(user.id);
                    getWindowManager().lockNow();
_L1:
                    return;
                    RemoteException remoteexception1;
                    remoteexception1;
                    Log.e("GlobalActions", (new StringBuilder()).append("Couldn't switch user ").append(remoteexception1).toString());
                      goto _L1
                }

                public boolean showBeforeProvisioning() {
                    return false;
                }

                public boolean showDuringKeyguard() {
                    return true;
                }

                final GlobalActions this$0;
                final UserInfo val$user;

             {
                this$0 = GlobalActions.this;
                user = userinfo;
                super(final_i, charsequence);
            }
            };
            mItems.add(singlepressaction);
        }
_L2:
        mAdapter = new MyAdapter();
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        builder.setAdapter(mAdapter, this).setInverseBackgroundForced(true);
        AlertDialog alertdialog = builder.create();
        alertdialog.getListView().setItemsCanFocus(true);
        alertdialog.getListView().setLongClickable(true);
        alertdialog.getListView().setOnItemLongClickListener(new android.widget.AdapterView.OnItemLongClickListener() {

            public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l) {
                return mAdapter.getItem(i).onLongPress();
            }

            final GlobalActions this$0;

             {
                this$0 = GlobalActions.this;
                super();
            }
        });
        alertdialog.getWindow().setType(2008);
        alertdialog.setOnDismissListener(this);
        return alertdialog;
        if(true) goto _L4; else goto _L3
_L3:
    }

    private IWindowManager getWindowManager() {
        if(mIWindowManager == null)
            mIWindowManager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        return mIWindowManager;
    }

    private void handleShow() {
        mDialog = createDialog();
        prepareDialog();
        mDialog.show();
        mDialog.getWindow().getDecorView().setSystemUiVisibility(0x10000);
    }

    private void onAirplaneModeChanged() {
        int i = 1;
        if(!mHasTelephony) {
            ToggleAction.State state;
            if(android.provider.Settings.System.getInt(mContext.getContentResolver(), "airplane_mode_on", 0) != i)
                i = 0;
            if(i != 0)
                state = ToggleAction.State.On;
            else
                state = ToggleAction.State.Off;
            mAirplaneState = state;
            mAirplaneModeOn.updateState(mAirplaneState);
        }
    }

    private void prepareDialog() {
        refreshSilentMode();
        mAirplaneModeOn.updateState(mAirplaneState);
        mAdapter.notifyDataSetChanged();
        IntentFilter intentfilter;
        if(mKeyguardShowing)
            mDialog.getWindow().setType(2009);
        else
            mDialog.getWindow().setType(2008);
        intentfilter = new IntentFilter("android.media.RINGER_MODE_CHANGED");
        mContext.registerReceiver(mRingerModeReceiver, intentfilter);
    }

    private void refreshSilentMode() {
        if(!mHasVibrator) {
            boolean flag;
            ToggleAction toggleaction;
            ToggleAction.State state;
            if(mAudioManager.getRingerMode() != 2)
                flag = true;
            else
                flag = false;
            toggleaction = (ToggleAction)mSilentModeAction;
            if(flag)
                state = ToggleAction.State.On;
            else
                state = ToggleAction.State.Off;
            toggleaction.updateState(state);
        }
    }

    public void onClick(DialogInterface dialoginterface, int i) {
        if(!(mAdapter.getItem(i) instanceof SilentModeTriStateAction))
            dialoginterface.dismiss();
        mAdapter.getItem(i).onPress();
    }

    public void onDismiss(DialogInterface dialoginterface) {
        mContext.unregisterReceiver(mRingerModeReceiver);
    }

    public void showDialog(boolean flag, boolean flag1) {
        mKeyguardShowing = flag;
        mDeviceProvisioned = flag1;
        if(mDialog != null) {
            mDialog.dismiss();
            mDialog = null;
            mHandler.sendEmptyMessage(2);
        } else {
            handleShow();
        }
    }

    private static final int DIALOG_DISMISS_DELAY = 300;
    private static final int MESSAGE_DISMISS = 0;
    private static final int MESSAGE_REFRESH = 1;
    private static final int MESSAGE_SHOW = 2;
    private static final boolean SHOW_SILENT_TOGGLE = true;
    private static final String TAG = "GlobalActions";
    private MyAdapter mAdapter;
    private ContentObserver mAirplaneModeObserver;
    private ToggleAction mAirplaneModeOn;
    private ToggleAction.State mAirplaneState;
    private final AudioManager mAudioManager;
    private BroadcastReceiver mBroadcastReceiver;
    private final Context mContext;
    private boolean mDeviceProvisioned;
    private AlertDialog mDialog;
    private Handler mHandler;
    private boolean mHasTelephony;
    private boolean mHasVibrator;
    private IWindowManager mIWindowManager;
    private boolean mIsWaitingForEcmExit;
    private ArrayList mItems;
    private boolean mKeyguardShowing;
    PhoneStateListener mPhoneStateListener;
    private BroadcastReceiver mRingerModeReceiver;
    private Action mSilentModeAction;
    private final android.view.WindowManagerPolicy.WindowManagerFuncs mWindowManagerFuncs;





/*
    static boolean access$102(GlobalActions globalactions, boolean flag) {
        globalactions.mIsWaitingForEcmExit = flag;
        return flag;
    }

*/













/*
    static ToggleAction.State access$402(GlobalActions globalactions, ToggleAction.State state) {
        globalactions.mAirplaneState = state;
        return state;
    }

*/




}
