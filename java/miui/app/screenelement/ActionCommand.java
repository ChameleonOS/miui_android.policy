// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.*;
import android.os.storage.StorageManager;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import miui.app.screenelement.data.Expression;
import miui.app.screenelement.data.VariableBinder;
import miui.app.screenelement.elements.ScreenElement;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.IndexedStringVariable;
import miui.app.screenelement.util.Task;
import miui.app.screenelement.util.Utils;
import miui.app.screenelement.util.Variable;
import org.w3c.dom.Element;

// Referenced classes of package miui.app.screenelement:
//            ScreenContext, ScreenElementRoot, NotifierManager

public abstract class ActionCommand {
    private static class AnimationProperty extends PropertyCommand {

        public void doPerform() {
            if(mIsPlay)
                super.mTargetElement.reset();
        }

        public static final String PROPERTY_NAME = "animation";
        private boolean mIsPlay;

        protected AnimationProperty(ScreenContext screencontext, ScreenElementRoot screenelementroot, Variable variable, String s) {
            super(screencontext, screenelementroot, variable, s);
            if(s.equalsIgnoreCase("play"))
                mIsPlay = true;
        }
    }

    private static class VisibilityProperty extends PropertyCommand {

        public void doPerform() {
            if(mIsToggle) {
                ScreenElement screenelement = super.mTargetElement;
                boolean flag;
                if(!super.mTargetElement.isVisible())
                    flag = true;
                else
                    flag = false;
                screenelement.show(flag);
            } else {
                super.mTargetElement.show(mIsShow);
            }
        }

        public static final String PROPERTY_NAME = "visibility";
        private boolean mIsShow;
        private boolean mIsToggle;

        protected VisibilityProperty(ScreenContext screencontext, ScreenElementRoot screenelementroot, Variable variable, String s) {
            super(screencontext, screenelementroot, variable, s);
            if(!s.equalsIgnoreCase("toggle")) goto _L2; else goto _L1
_L1:
            mIsToggle = true;
_L4:
            return;
_L2:
            if(s.equalsIgnoreCase("true"))
                mIsShow = true;
            else
            if(s.equalsIgnoreCase("false"))
                mIsShow = false;
            if(true) goto _L4; else goto _L3
_L3:
        }
    }

    public static abstract class PropertyCommand extends ActionCommand {

        public static PropertyCommand create(ScreenContext screencontext, ScreenElementRoot screenelementroot, String s, String s1) {
            Variable variable = new Variable(s);
            Object obj;
            if("visibility".equals(variable.getPropertyName()))
                obj = new VisibilityProperty(screencontext, screenelementroot, variable, s1);
            else
            if("animation".equals(variable.getPropertyName()))
                obj = new AnimationProperty(screencontext, screenelementroot, variable, s1);
            else
                obj = null;
            return ((PropertyCommand) (obj));
        }

        public void perform() {
            if(mTargetObj != null) goto _L2; else goto _L1
_L1:
            return;
_L2:
            if(mTargetElement == null) {
                mTargetElement = mRoot.findElement(mTargetObj.getObjName());
                if(mTargetElement == null) {
                    Log.w("ActionCommand", (new StringBuilder()).append("could not find PropertyCommand target, name: ").append(mTargetObj.getObjName()).toString());
                    mTargetObj = null;
                    continue; /* Loop/switch isn't completed */
                }
            }
            doPerform();
            if(true) goto _L1; else goto _L3
_L3:
        }

        protected ScreenElementRoot mRoot;
        protected ScreenElement mTargetElement;
        private Variable mTargetObj;

        protected PropertyCommand(ScreenContext screencontext, ScreenElementRoot screenelementroot, Variable variable, String s) {
            super(screencontext);
            mRoot = screenelementroot;
            mTargetObj = variable;
        }
    }

    private static class DelayCommand extends ActionCommand {

        protected void doPerform() {
            mContext.mHandler.postDelayed(new Runnable() {

                public void run() {
                    mCommand.perform();
                }

                final DelayCommand this$0;

                 {
                    this$0 = DelayCommand.this;
                    super();
                }
            }, mDelay);
        }

        public void init() {
            mCommand.init();
        }

        private ActionCommand mCommand;
        private long mDelay;


        public DelayCommand(ActionCommand actioncommand, long l) {
            super(actioncommand.getContext());
            mCommand = actioncommand;
            mDelay = l;
        }
    }

    private static class ConditionCommand extends ActionCommand {

        protected void doPerform() {
            if(mCondition.evaluate(mContext.mVariables) > 0.0D)
                mCommand.perform();
        }

        public void init() {
            mCommand.init();
        }

        private ActionCommand mCommand;
        private Expression mCondition;

        public ConditionCommand(ActionCommand actioncommand, Expression expression) {
            super(actioncommand.getContext());
            mCommand = actioncommand;
            mCondition = expression;
        }
    }

    private static class IntentCommand extends ActionCommand {

        protected void doPerform() {
            if(mIntent == null)
                break MISSING_BLOCK_LABEL_21;
            mContext.mContext.startActivity(mIntent);
_L1:
            return;
            ActivityNotFoundException activitynotfoundexception;
            activitynotfoundexception;
            activitynotfoundexception.printStackTrace();
            Log.e("ActionCommand", activitynotfoundexception.toString());
              goto _L1
        }

        public void init() {
            Task task = mRoot.findTask(mTask.id);
            if(task != null && !TextUtils.isEmpty(task.action))
                mTask = task;
            if(!TextUtils.isEmpty(mTask.action)) {
                mIntent = new Intent(mTask.action);
                if(!TextUtils.isEmpty(mTask.type))
                    mIntent.setType(mTask.type);
                if(!TextUtils.isEmpty(mTask.category))
                    mIntent.addCategory(mTask.category);
                if(!TextUtils.isEmpty(mTask.packageName) && !TextUtils.isEmpty(mTask.className))
                    mIntent.setComponent(new ComponentName(mTask.packageName, mTask.className));
                mIntent.setFlags(0x34000000);
            }
        }

        public static final String TAG_NAME = "IntentCommand";
        private Intent mIntent;
        private ScreenElementRoot mRoot;
        private Task mTask;

        public IntentCommand(ScreenContext screencontext, ScreenElementRoot screenelementroot, Element element) {
            super(screencontext);
            mRoot = screenelementroot;
            mTask = Task.load(element);
        }
    }

    private static class VariableBinderCommand extends ActionCommand {
        private static final class Command extends Enum {

            public static Command valueOf(String s) {
                return (Command)Enum.valueOf(miui/app/screenelement/ActionCommand$VariableBinderCommand$Command, s);
            }

            public static Command[] values() {
                return (Command[])$VALUES.clone();
            }

            private static final Command $VALUES[];
            public static final Command Invalid;
            public static final Command Refresh;

            static  {
                Refresh = new Command("Refresh", 0);
                Invalid = new Command("Invalid", 1);
                Command acommand[] = new Command[2];
                acommand[0] = Refresh;
                acommand[1] = Invalid;
                $VALUES = acommand;
            }

            private Command(String s, int i) {
                super(s, i);
            }
        }


        protected void doPerform() {
            if(mBinder == null) goto _L2; else goto _L1
_L1:
            class _cls1 {

                static final int $SwitchMap$miui$app$screenelement$ActionCommand$VariableBinderCommand$Command[];

                static  {
                    $SwitchMap$miui$app$screenelement$ActionCommand$VariableBinderCommand$Command = new int[VariableBinderCommand.Command.values().length];
                    $SwitchMap$miui$app$screenelement$ActionCommand$VariableBinderCommand$Command[VariableBinderCommand.Command.Refresh.ordinal()] = 1;
_L2:
                    return;
                    NoSuchFieldError nosuchfielderror;
                    nosuchfielderror;
                    if(true) goto _L2; else goto _L1
_L1:
                }
            }

            _cls1..SwitchMap.miui.app.screenelement.ActionCommand.VariableBinderCommand.Command[mCommand.ordinal()];
            JVM INSTR tableswitch 1 1: default 36
        //                       1 37;
               goto _L2 _L3
_L2:
            return;
_L3:
            mBinder.refresh();
            if(true) goto _L2; else goto _L4
_L4:
        }

        public void init() {
            mBinder = mRoot.findBinder(mName);
        }

        public static final String TAG_NAME = "BinderCommand";
        private VariableBinder mBinder;
        private Command mCommand;
        private String mName;
        private ScreenElementRoot mRoot;

        public VariableBinderCommand(ScreenContext screencontext, ScreenElementRoot screenelementroot, Element element) {
            super(screencontext);
            mCommand = Command.Invalid;
            mRoot = screenelementroot;
            mName = element.getAttribute("name");
            if(element.getAttribute("command").equals("refresh"))
                mCommand = Command.Refresh;
        }
    }

    private static class VariableAssignmentCommand extends ActionCommand {

        protected void doPerform() {
            if(mNumVariable == null) goto _L2; else goto _L1
_L1:
            mNumVariable.set(mExpression.evaluate(mContext.mVariables));
_L4:
            return;
_L2:
            if(mStrVariable != null)
                mStrVariable.set(mExpression.evaluateStr(mContext.mVariables));
            if(true) goto _L4; else goto _L3
_L3:
        }

        public static final String TAG_NAME = "VariableCommand";
        private Expression mExpression;
        private IndexedNumberVariable mNumVariable;
        private IndexedStringVariable mStrVariable;

        public VariableAssignmentCommand(ScreenContext screencontext, Element element) {
            super(screencontext);
            String s = element.getAttribute("name");
            String s1 = element.getAttribute("expression");
            String s2 = element.getAttribute("type");
            Variable variable = new Variable(s);
            if(s2.equals("string"))
                mStrVariable = new IndexedStringVariable(variable.getObjName(), variable.getPropertyName(), screencontext.mVariables);
            else
                mNumVariable = new IndexedNumberVariable(variable.getObjName(), variable.getPropertyName(), screencontext.mVariables);
            mExpression = Expression.build(s1);
            if(mExpression == null)
                Log.e("ActionCommand", "invalid expression in VariableAssignmentCommand");
        }
    }

    private static class UsbStorageSwitchCommand extends NotificationReceiver {

        protected void doPerform() {
            if(mStorageManager != null) goto _L2; else goto _L1
_L1:
            return;
_L2:
            boolean flag;
            final boolean _on;
            flag = mStorageManager.isUsbMassStorageEnabled();
            if(!mOnOffHelper.mIsToggle)
                break; /* Loop/switch isn't completed */
            if(!flag)
                _on = true;
            else
                _on = false;
_L5:
            updateState(3);
            (new Thread() {

                public void run() {
                    UsbStorageSwitchCommand usbstorageswitchcommand;
                    byte byte0;
                    if(_on)
                        mStorageManager.enableUsbMassStorage();
                    else
                        mStorageManager.disableUsbMassStorage();
                    usbstorageswitchcommand = UsbStorageSwitchCommand.this;
                    if(_on)
                        byte0 = 2;
                    else
                        byte0 = 1;
                    usbstorageswitchcommand.updateState(byte0);
                }

                final UsbStorageSwitchCommand this$0;
                final boolean val$_on;

                 {
                    this$0 = UsbStorageSwitchCommand.this;
                    _on = flag;
                    super();
                }
            }).start();
            if(true) goto _L1; else goto _L3
_L3:
            if(mOnOffHelper.mIsOn == flag) goto _L1; else goto _L4
_L4:
            _on = mOnOffHelper.mIsOn;
              goto _L5
        }

        public void onNotify(Context context, Intent intent, Object obj) {
            mConnected = intent.getExtras().getBoolean("connected");
            super.onNotify(context, intent, obj);
        }

        protected void update() {
            if(mStorageManager != null) goto _L2; else goto _L1
_L1:
            mStorageManager = (StorageManager)mContext.mContext.getSystemService("storage");
            if(mStorageManager != null) goto _L2; else goto _L3
_L3:
            Log.w("ActionCommand", "Failed to get StorageManager");
_L5:
            return;
_L2:
            boolean flag = mStorageManager.isUsbMassStorageEnabled();
            byte byte0;
            if(mConnected) {
                if(flag)
                    byte0 = 2;
                else
                    byte0 = 1;
            } else {
                byte0 = 0;
            }
            updateState(byte0);
            if(true) goto _L5; else goto _L4
_L4:
        }

        private boolean mConnected;
        private OnOffCommandHelper mOnOffHelper;
        private StorageManager mStorageManager;


        public UsbStorageSwitchCommand(ScreenContext screencontext, String s) {
            super(screencontext, "usb_mode", NotifierManager.NotifierType.UsbState);
            mOnOffHelper = new OnOffCommandHelper(s);
        }
    }

    private static class BluetoothSwitchCommand extends NotificationReceiver {

        private boolean ensureBluetoothAdapter() {
            if(mBluetoothAdapter == null)
                mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
            boolean flag;
            if(mBluetoothAdapter != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        protected void doPerform() {
            if(ensureBluetoothAdapter()) goto _L2; else goto _L1
_L1:
            return;
_L2:
            if(!mOnOffHelper.mIsToggle)
                break; /* Loop/switch isn't completed */
            if(mBluetoothEnable) {
                mBluetoothAdapter.disable();
                mBluetoothEnabling = false;
            } else {
                mBluetoothAdapter.enable();
                mBluetoothEnabling = true;
            }
_L5:
            update();
            if(true) goto _L1; else goto _L3
_L3:
            if(mBluetoothEnabling || mBluetoothEnable == mOnOffHelper.mIsOn) goto _L5; else goto _L4
_L4:
            if(mOnOffHelper.mIsOn) {
                mBluetoothAdapter.enable();
                mBluetoothEnabling = true;
            } else {
                mBluetoothAdapter.disable();
                mBluetoothEnabling = false;
            }
              goto _L5
        }

        protected void update() {
            byte byte0 = 0;
            if(ensureBluetoothAdapter()) {
                mBluetoothEnable = mBluetoothAdapter.isEnabled();
                if(mBluetoothEnable) {
                    mBluetoothEnabling = false;
                    updateState(1);
                } else {
                    if(mBluetoothEnabling)
                        byte0 = 2;
                    updateState(byte0);
                }
            }
        }

        private BluetoothAdapter mBluetoothAdapter;
        private boolean mBluetoothEnable;
        private boolean mBluetoothEnabling;
        private OnOffCommandHelper mOnOffHelper;

        public BluetoothSwitchCommand(ScreenContext screencontext, String s) {
            super(screencontext, "bluetooth_state", NotifierManager.NotifierType.Bluetooth);
            mOnOffHelper = new OnOffCommandHelper(s);
        }
    }

    private static class DataSwitchCommand extends NotificationReceiver {

        private boolean ensureConnectivityManager() {
            if(mCm == null)
                mCm = (ConnectivityManager)mContext.mContext.getSystemService("connectivity");
            boolean flag;
            if(mCm != null)
                flag = true;
            else
                flag = false;
            return flag;
        }

        protected void doPerform() {
            if(ensureConnectivityManager()) goto _L2; else goto _L1
_L1:
            return;
_L2:
            mApnEnable;
            boolean flag;
            if(mOnOffHelper.mIsToggle) {
                if(!mApnEnable)
                    flag = true;
                else
                    flag = false;
            } else {
                flag = mOnOffHelper.mIsOn;
            }
            if(mApnEnable != flag)
                mCm.setMobileDataEnabled(flag);
            if(true) goto _L1; else goto _L3
_L3:
        }

        protected void update() {
            if(ensureConnectivityManager()) {
                mApnEnable = mCm.getMobileDataEnabled();
                int i;
                if(mApnEnable)
                    i = 1;
                else
                    i = 0;
                updateState(i);
            }
        }

        private boolean mApnEnable;
        private ConnectivityManager mCm;
        private OnOffCommandHelper mOnOffHelper;

        public DataSwitchCommand(ScreenContext screencontext, String s) {
            super(screencontext, "data_state", NotifierManager.NotifierType.MobileData);
            mOnOffHelper = new OnOffCommandHelper(s);
        }
    }

    private static class WifiSwitchCommand extends NotificationReceiver {

        protected void doPerform() {
            if(!mOnOffHelper.mIsToggle) goto _L2; else goto _L1
_L1:
            mWifiState.toggleState(mContext.mContext);
_L4:
            update();
            return;
_L2:
            boolean flag;
            flag = false;
            switch(mWifiState.getTriState(mContext.mContext)) {
            default:
                break;

            case 0: // '\0'
                break; /* Loop/switch isn't completed */

            case 1: // '\001'
                break;
            }
            break MISSING_BLOCK_LABEL_111;
_L5:
            if(flag)
                mWifiState.requestStateChange(mContext.mContext, mOnOffHelper.mIsOn);
            if(true) goto _L4; else goto _L3
_L3:
            if(mOnOffHelper.mIsOn)
                flag = true;
              goto _L5
            if(!mOnOffHelper.mIsOn)
                flag = true;
              goto _L5
        }

        public void onNotify(Context context, Intent intent, Object obj) {
            mWifiState.onActualStateChange(context, intent);
            super.onNotify(context, intent, obj);
        }

        protected void update() {
            byte byte0 = 0;
            mWifiState.getTriState(mContext.mContext);
            JVM INSTR tableswitch 0 5: default 56
        //                       0 57
        //                       1 65
        //                       2 56
        //                       3 56
        //                       4 56
        //                       5 93;
               goto _L1 _L2 _L3 _L1 _L1 _L1 _L4
_L1:
            return;
_L2:
            updateState(0);
            continue; /* Loop/switch isn't completed */
_L3:
            int i;
            if(((WifiStateTracker)mWifiState).zConnected)
                i = 1;
            else
                i = 2;
            updateState(i);
            continue; /* Loop/switch isn't completed */
_L4:
            if(mWifiState.isTurningOn())
                byte0 = 3;
            updateState(byte0);
            if(true) goto _L1; else goto _L5
_L5:
        }

        private OnOffCommandHelper mOnOffHelper;
        private final StateTracker mWifiState = new WifiStateTracker(null);

        public WifiSwitchCommand(ScreenContext screencontext, String s) {
            super(screencontext, "wifi_state", NotifierManager.NotifierType.WifiState);
            update();
            mOnOffHelper = new OnOffCommandHelper(s);
        }
    }

    private static final class WifiStateTracker extends StateTracker {

        private static int wifiStateToFiveState(int i) {
            i;
            JVM INSTR tableswitch 0 3: default 32
        //                       0 46
        //                       1 36
        //                       2 51
        //                       3 41;
               goto _L1 _L2 _L3 _L4 _L5
_L1:
            byte byte0 = 4;
_L7:
            return byte0;
_L3:
            byte0 = 0;
            continue; /* Loop/switch isn't completed */
_L5:
            byte0 = 1;
            continue; /* Loop/switch isn't completed */
_L2:
            byte0 = 3;
            continue; /* Loop/switch isn't completed */
_L4:
            byte0 = 2;
            if(true) goto _L7; else goto _L6
_L6:
        }

        public int getActualState(Context context) {
            WifiManager wifimanager = (WifiManager)context.getSystemService("wifi");
            int i;
            if(wifimanager != null)
                i = wifiStateToFiveState(wifimanager.getWifiState());
            else
                i = 4;
            return i;
        }

        public void onActualStateChange(Context context, Intent intent) {
            boolean flag = false;
            if(!"android.net.wifi.WIFI_STATE_CHANGED".equals(intent.getAction())) goto _L2; else goto _L1
_L1:
            int j = intent.getIntExtra("wifi_state", -1);
            setCurrentState(context, wifiStateToFiveState(j));
            if(3 == j) {
                zConnected = true;
                zScanAttempt = 0;
            }
_L4:
            return;
_L2:
            if("android.net.wifi.SCAN_RESULTS".equals(intent.getAction())) {
                if(zScanAttempt < 3) {
                    int i = 1 + zScanAttempt;
                    zScanAttempt = i;
                    if(i == 3)
                        zConnected = false;
                }
            } else
            if("android.net.wifi.STATE_CHANGE".equals(intent.getAction())) {
                zScanAttempt = 3;
                android.net.NetworkInfo.DetailedState detailedstate = ((NetworkInfo)intent.getParcelableExtra("networkInfo")).getDetailedState();
                if(android.net.NetworkInfo.DetailedState.SCANNING == detailedstate || android.net.NetworkInfo.DetailedState.CONNECTING == detailedstate || android.net.NetworkInfo.DetailedState.AUTHENTICATING == detailedstate || android.net.NetworkInfo.DetailedState.OBTAINING_IPADDR == detailedstate || android.net.NetworkInfo.DetailedState.CONNECTED == detailedstate)
                    flag = true;
                zConnected = flag;
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        protected void requestStateChange(Context context, final boolean desiredState) {
            final WifiManager wifiManager = (WifiManager)context.getSystemService("wifi");
            if(wifiManager == null)
                Log.d("ActionCommand", "No wifiManager.");
            else
                (new AsyncTask() {

                    protected volatile Object doInBackground(Object aobj[]) {
                        return doInBackground((Void[])aobj);
                    }

                    protected transient Void doInBackground(Void avoid[]) {
                        int i = wifiManager.getWifiApState();
                        if(desiredState && (i == 12 || i == 13))
                            wifiManager.setWifiApEnabled(null, false);
                        wifiManager.setWifiEnabled(desiredState);
                        return null;
                    }

                    final WifiStateTracker this$0;
                    final boolean val$desiredState;
                    final WifiManager val$wifiManager;

                 {
                    this$0 = WifiStateTracker.this;
                    wifiManager = wifimanager;
                    desiredState = flag;
                    super();
                }
                }).execute(new Void[0]);
        }

        private static final int MAX_SCAN_ATTEMPT = 3;
        public boolean zConnected;
        private int zScanAttempt;

        private WifiStateTracker() {
            zConnected = false;
            zScanAttempt = 0;
        }

    }

    public static abstract class StateTracker {

        public abstract int getActualState(Context context);

        public final int getTriState(Context context) {
            byte byte0 = 5;
            if(!mInTransition) goto _L2; else goto _L1
_L1:
            return byte0;
_L2:
            switch(getActualState(context)) {
            case 0: // '\0'
                byte0 = 0;
                break;

            case 1: // '\001'
                byte0 = 1;
                break;
            }
            if(true) goto _L1; else goto _L3
_L3:
        }

        public final boolean isTurningOn() {
            boolean flag;
            if(mIntendedState != null && mIntendedState.booleanValue())
                flag = true;
            else
                flag = false;
            return flag;
        }

        public abstract void onActualStateChange(Context context, Intent intent);

        protected abstract void requestStateChange(Context context, boolean flag);

        protected final void setCurrentState(Context context, int i) {
            boolean flag = mInTransition;
            i;
            JVM INSTR tableswitch 0 3: default 36
        //                       0 104
        //                       1 120
        //                       2 136
        //                       3 152;
               goto _L1 _L2 _L3 _L4 _L5
_L1:
            break; /* Loop/switch isn't completed */
_L5:
            break MISSING_BLOCK_LABEL_152;
_L6:
            if(flag && !mInTransition && mDeferredStateChangeRequestNeeded) {
                Log.v("ActionCommand", "processing deferred state change");
                if(mActualState != null && mIntendedState != null && mIntendedState.equals(mActualState))
                    Log.v("ActionCommand", "... but intended state matches, so no changes.");
                else
                if(mIntendedState != null) {
                    mInTransition = true;
                    requestStateChange(context, mIntendedState.booleanValue());
                }
                mDeferredStateChangeRequestNeeded = false;
            }
            return;
_L2:
            mInTransition = false;
            mActualState = Boolean.valueOf(false);
              goto _L6
_L3:
            mInTransition = false;
            mActualState = Boolean.valueOf(true);
              goto _L6
_L4:
            mInTransition = true;
            mActualState = Boolean.valueOf(false);
              goto _L6
            mInTransition = true;
            mActualState = Boolean.valueOf(true);
              goto _L6
        }

        public final void toggleState(Context context) {
            int i;
            boolean flag;
            i = getTriState(context);
            flag = false;
            i;
            JVM INSTR tableswitch 0 5: default 48
        //                       0 74
        //                       1 69
        //                       2 48
        //                       3 48
        //                       4 48
        //                       5 79;
               goto _L1 _L2 _L3 _L1 _L1 _L1 _L4
_L1:
            break; /* Loop/switch isn't completed */
_L4:
            break MISSING_BLOCK_LABEL_79;
_L5:
            mIntendedState = Boolean.valueOf(flag);
            if(mInTransition) {
                mDeferredStateChangeRequestNeeded = true;
            } else {
                mInTransition = true;
                requestStateChange(context, flag);
            }
            return;
_L3:
            flag = false;
              goto _L5
_L2:
            flag = true;
              goto _L5
            if(mIntendedState != null)
                if(!mIntendedState.booleanValue())
                    flag = true;
                else
                    flag = false;
              goto _L5
        }

        private Boolean mActualState;
        private boolean mDeferredStateChangeRequestNeeded;
        private boolean mInTransition;
        private Boolean mIntendedState;

        public StateTracker() {
            mInTransition = false;
            mActualState = null;
            mIntendedState = null;
            mDeferredStateChangeRequestNeeded = false;
        }
    }

    private static class OnOffCommandHelper {

        protected boolean mIsOn;
        protected boolean mIsToggle;

        public OnOffCommandHelper(String s) {
            if(!s.equalsIgnoreCase("toggle")) goto _L2; else goto _L1
_L1:
            mIsToggle = true;
_L4:
            return;
_L2:
            if(s.equalsIgnoreCase("on"))
                mIsOn = true;
            else
            if(s.equalsIgnoreCase("off"))
                mIsOn = false;
            if(true) goto _L4; else goto _L3
_L3:
        }
    }

    private static class RingModeCommand extends NotificationReceiver {

        protected void doPerform() {
            if(mAudioManager != null) {
                mToggleHelper.click();
                int i = mToggleHelper.getModeId();
                mAudioManager.setRingerMode(i);
                updateState(i);
            }
        }

        protected void update() {
            if(mAudioManager == null && mContext != null)
                mAudioManager = (AudioManager)mContext.mContext.getSystemService("audio");
            if(mAudioManager != null)
                updateState(mAudioManager.getRingerMode());
        }

        private AudioManager mAudioManager;
        private ModeToggleHelper mToggleHelper;

        public RingModeCommand(ScreenContext screencontext, String s) {
            super(screencontext, "ring_mode", NotifierManager.NotifierType.RingMode);
            mToggleHelper = new ModeToggleHelper();
            mToggleHelper.addMode("normal", 2);
            mToggleHelper.addMode("silent", 0);
            mToggleHelper.addMode("vibrate", 1);
            if(!mToggleHelper.build(s))
                Log.e("ActionCommand", (new StringBuilder()).append("invalid ring mode command value: ").append(s).toString());
        }
    }

    private static class ModeToggleHelper {

        private int findMode(String s) {
            int i = 0;
_L3:
            if(i >= mModeNames.size())
                break MISSING_BLOCK_LABEL_39;
            if(!((String)mModeNames.get(i)).equals(s)) goto _L2; else goto _L1
_L1:
            return i;
_L2:
            i++;
              goto _L3
            i = -1;
              goto _L1
        }

        public void addMode(String s, int i) {
            mModeNames.add(s);
            mModeIds.add(Integer.valueOf(i));
        }

        public boolean build(String s) {
            boolean flag;
            int i;
            flag = true;
            i = findMode(s);
            if(i < 0) goto _L2; else goto _L1
_L1:
            mCurModeIndex = i;
_L4:
            return flag;
_L2:
            if("toggle".equals(s)) {
                mToggleAll = flag;
                continue; /* Loop/switch isn't completed */
            }
            String as[] = s.split(",");
            int j = 0;
            do {
                if(j >= as.length)
                    break;
                int k = findMode(as[j]);
                if(k < 0) {
                    flag = false;
                    continue; /* Loop/switch isn't completed */
                }
                mToggleModes.add(Integer.valueOf(k));
                j++;
            } while(true);
            mToggle = flag;
            if(true) goto _L4; else goto _L3
_L3:
        }

        public void click() {
            if(!mToggle) goto _L2; else goto _L1
_L1:
            int j = 1 + mCurToggleIndex;
            mCurToggleIndex = j;
            mCurToggleIndex = j % mToggleModes.size();
            mCurModeIndex = ((Integer)mToggleModes.get(mCurToggleIndex)).intValue();
_L4:
            return;
_L2:
            if(mToggleAll) {
                int i = 1 + mCurModeIndex;
                mCurModeIndex = i;
                mCurModeIndex = i % mModeNames.size();
            }
            if(true) goto _L4; else goto _L3
_L3:
        }

        public int getModeId() {
            return ((Integer)mModeIds.get(mCurModeIndex)).intValue();
        }

        public String getModeName() {
            return (String)mModeNames.get(mCurModeIndex);
        }

        private int mCurModeIndex;
        private int mCurToggleIndex;
        private ArrayList mModeIds;
        private ArrayList mModeNames;
        private boolean mToggle;
        private boolean mToggleAll;
        private ArrayList mToggleModes;

        private ModeToggleHelper() {
            mModeNames = new ArrayList();
            mModeIds = new ArrayList();
            mToggleModes = new ArrayList();
        }

    }

    private static abstract class NotificationReceiver extends StatefulActionCommand
        implements NotifierManager.OnNotifyListener {

        protected void asyncUpdate() {
            ActionCommand.mHandler.post(new Runnable() {

                public void run() {
                    update();
                }

                final NotificationReceiver this$0;

                 {
                    this$0 = NotificationReceiver.this;
                    super();
                }
            });
        }

        public void finish() {
            NotifierManager.getInstance(mContext.getRawContext()).releaseNotifier(mType, this);
        }

        public void init() {
            update();
            mNotifierManager.acquireNotifier(mType, this);
        }

        public void onNotify(Context context, Intent intent, Object obj) {
            asyncUpdate();
        }

        public void pause() {
            mNotifierManager.pause(mType, this);
        }

        public void resume() {
            update();
            mNotifierManager.resume(mType, this);
        }

        protected abstract void update();

        private NotifierManager mNotifierManager;
        private NotifierManager.NotifierType mType;

        public NotificationReceiver(ScreenContext screencontext, String s, NotifierManager.NotifierType notifiertype) {
            super(screencontext, s);
            mType = notifiertype;
            mNotifierManager = NotifierManager.getInstance(mContext.getRawContext());
        }
    }

    private static abstract class StatefulActionCommand extends ActionCommand {

        protected final void updateState(int i) {
            if(mVar != null) {
                mVar.set(i);
                mContext.requestUpdate();
            }
        }

        private IndexedNumberVariable mVar;

        public StatefulActionCommand(ScreenContext screencontext, String s) {
            super(screencontext);
            mVar = new IndexedNumberVariable(s, mContext.mVariables);
        }
    }


    public ActionCommand(ScreenContext screencontext) {
        mContext = screencontext;
    }

    protected static ActionCommand create(ScreenContext screencontext, ScreenElementRoot screenelementroot, String s, String s1) {
        Object obj = null;
        if(!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s1)) goto _L2; else goto _L1
_L1:
        return ((ActionCommand) (obj));
_L2:
        Variable variable = new Variable(s);
        if(variable.getObjName() != null) {
            obj = PropertyCommand.create(screencontext, screenelementroot, s, s1);
        } else {
            String s2 = variable.getPropertyName();
            if("RingMode".equals(s2))
                obj = new RingModeCommand(screencontext, s1);
            else
            if("Wifi".equals(s2))
                obj = new WifiSwitchCommand(screencontext, s1);
            else
            if("Data".equals(s2))
                obj = new DataSwitchCommand(screencontext, s1);
            else
            if("Bluetooth".equals(s2))
                obj = new BluetoothSwitchCommand(screencontext, s1);
            else
            if("UsbStorage".equals(s2))
                obj = new UsbStorageSwitchCommand(screencontext, s1);
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public static ActionCommand create(ScreenContext screencontext, Element element, ScreenElementRoot screenelementroot) {
        if(element != null) goto _L2; else goto _L1
_L1:
        Object obj1 = null;
_L5:
        return ((ActionCommand) (obj1));
_L2:
        Expression expression;
        long l;
        String s;
        expression = Expression.build(element.getAttribute("condition"));
        l = Utils.getAttrAsLong(element, "delay", 0L);
        s = element.getNodeName();
        if(!s.equals("Command")) goto _L4; else goto _L3
_L3:
        Object obj = create(screencontext, screenelementroot, element.getAttribute("target"), element.getAttribute("value"));
_L6:
        if(l > 0L && obj != null)
            obj = new DelayCommand(((ActionCommand) (obj)), l);
        if(expression != null && obj != null)
            obj1 = new ConditionCommand(((ActionCommand) (obj)), expression);
        else
            obj1 = obj;
        if(true) goto _L5; else goto _L4
_L4:
        if(s.equals("VariableCommand"))
            obj = new VariableAssignmentCommand(screencontext, element);
        else
        if(s.equals("BinderCommand"))
            obj = new VariableBinderCommand(screencontext, screenelementroot, element);
        else
        if(s.equals("IntentCommand"))
            obj = new IntentCommand(screencontext, screenelementroot, element);
        else
            obj = null;
          goto _L6
    }

    protected abstract void doPerform();

    public void finish() {
    }

    protected ScreenContext getContext() {
        return mContext;
    }

    public void init() {
    }

    public void pause() {
    }

    public void perform() {
        doPerform();
        mContext.requestUpdate();
    }

    public void resume() {
    }

    private static final String COMMAND_BLUETOOTH = "Bluetooth";
    private static final String COMMAND_DATA = "Data";
    private static final String COMMAND_RING_MODE = "RingMode";
    private static final String COMMAND_USB_STORAGE = "UsbStorage";
    private static final String COMMAND_WIFI = "Wifi";
    private static final String LOG_TAG = "ActionCommand";
    private static final int STATE_DISABLED = 0;
    private static final int STATE_ENABLED = 1;
    private static final int STATE_INTERMEDIATE = 5;
    private static final int STATE_TURNING_OFF = 3;
    private static final int STATE_TURNING_ON = 2;
    private static final int STATE_UNKNOWN = 4;
    public static final String TAG_NAME = "Command";
    private static final Handler mHandler = new Handler();
    protected ScreenContext mContext;


}
