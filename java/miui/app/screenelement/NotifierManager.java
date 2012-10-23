// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.content.*;
import android.database.ContentObserver;
import android.os.Handler;
import android.util.Log;
import java.util.*;

public final class NotifierManager {
    public static class VolumeChangedNotifier extends BroadcastNotifier {

        protected String getIntentAction() {
            return "android.media.VOLUME_CHANGED_ACTION";
        }

        public VolumeChangedNotifier(Context context) {
            super(context);
        }
    }

    public static class RingModeNotifier extends BroadcastNotifier {

        protected String getIntentAction() {
            return "android.media.RINGER_MODE_CHANGED";
        }

        public RingModeNotifier(Context context) {
            super(context);
        }
    }

    public static class WifiNotifier extends BroadcastNotifier {

        protected IntentFilter createIntentFilter() {
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
            intentfilter.addAction("android.net.wifi.SCAN_RESULTS");
            intentfilter.addAction("android.net.wifi.STATE_CHANGE");
            return intentfilter;
        }

        public WifiNotifier(Context context) {
            super(context);
        }
    }

    public static class MobileDataNotifier extends BaseNotifier {

        protected void onRegister() {
            super.mContext.getContentResolver().registerContentObserver(android.provider.Settings.Secure.getUriFor("mobile_data"), false, mMobileDataEnableObserver);
        }

        protected void onUnregister() {
            super.mContext.getContentResolver().unregisterContentObserver(mMobileDataEnableObserver);
        }

        private final ContentObserver mMobileDataEnableObserver = new ContentObserver(null) {

            public void onChange(boolean flag) {
                if(NotifierManager.DBG)
                    Log.i("NotifierManager", (new StringBuilder()).append("onNotify: ").append(toString()).toString());
                onNotify(null, null, Boolean.valueOf(flag));
            }

            final MobileDataNotifier this$0;

                 {
                    this$0 = MobileDataNotifier.this;
                    super(handler);
                }
        };

        public MobileDataNotifier(Context context) {
            super(context);
        }
    }

    public static class BluetoothNotifier extends BroadcastNotifier {

        protected String getIntentAction() {
            return "android.bluetooth.adapter.action.STATE_CHANGED";
        }

        public BluetoothNotifier(Context context) {
            super(context);
        }
    }

    public static class UsbStateNotifier extends BroadcastNotifier {

        protected String getIntentAction() {
            return "android.hardware.usb.action.USB_STATE";
        }

        public UsbStateNotifier(Context context) {
            super(context);
        }
    }

    public static class BatteryNotifier extends BroadcastNotifier {

        protected String getIntentAction() {
            return "android.intent.action.BATTERY_CHANGED";
        }

        public BatteryNotifier(Context context) {
            super(context);
        }
    }

    public static abstract class BroadcastNotifier extends BaseNotifier {

        protected IntentFilter createIntentFilter() {
            String s = getIntentAction();
            IntentFilter intentfilter;
            if(s == null)
                intentfilter = null;
            else
                intentfilter = new IntentFilter(s);
            return intentfilter;
        }

        protected String getIntentAction() {
            throw new IllegalStateException("no intent filter action");
        }

        protected void onRegister() {
            if(mIntentFilter == null)
                mIntentFilter = createIntentFilter();
            super.mContext.registerReceiver(mIntentReceiver, mIntentFilter);
        }

        protected void onUnregister() {
            super.mContext.unregisterReceiver(mIntentReceiver);
        }

        private IntentFilter mIntentFilter;
        private final BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {

            public void onReceive(Context context1, Intent intent) {
                if(NotifierManager.DBG)
                    Log.i("NotifierManager", (new StringBuilder()).append("onNotify: ").append(toString()).toString());
                onNotify(context1, intent, null);
            }

            final BroadcastNotifier this$0;

                 {
                    this$0 = BroadcastNotifier.this;
                    super();
                }
        };

        public BroadcastNotifier(Context context) {
            super(context);
        }
    }

    public static abstract class BaseNotifier {

        public final int addActiveRef() {
            int i = 1 + mActiveReference;
            mActiveReference = i;
            return i;
        }

        public final void addListener(OnNotifyListener onnotifylistener) {
            ArrayList arraylist = mListeners;
            arraylist;
            JVM INSTR monitorenter ;
            mListeners.add(onnotifylistener);
            return;
        }

        public final int addRef() {
            int i = 1 + mReference;
            mReference = i;
            return i;
        }

        public void finish() {
            unregister();
        }

        public void init() {
            register();
        }

        protected void onNotify(Context context, Intent intent, Object obj) {
            ArrayList arraylist = mListeners;
            arraylist;
            JVM INSTR monitorenter ;
            for(Iterator iterator = mListeners.iterator(); iterator.hasNext(); ((OnNotifyListener)iterator.next()).onNotify(context, intent, obj));
            break MISSING_BLOCK_LABEL_57;
            Exception exception;
            exception;
            throw exception;
            arraylist;
            JVM INSTR monitorexit ;
        }

        protected abstract void onRegister();

        protected abstract void onUnregister();

        public void pause() {
            unregister();
        }

        protected void register() {
            if(!mRegistered) goto _L2; else goto _L1
_L1:
            return;
_L2:
            onRegister();
            mRegistered = true;
            if(NotifierManager.DBG)
                Log.i("NotifierManager", (new StringBuilder()).append("onRegister: ").append(toString()).toString());
            if(true) goto _L1; else goto _L3
_L3:
        }

        public final int releaseActiveRef() {
            int i;
            if(mActiveReference > 0) {
                i = -1 + mActiveReference;
                mActiveReference = i;
            } else {
                i = 0;
            }
            return i;
        }

        public final int releaseRef() {
            int i;
            if(mReference > 0) {
                i = -1 + mReference;
                mReference = i;
            } else {
                i = 0;
            }
            return i;
        }

        public final void removeListener(OnNotifyListener onnotifylistener) {
            ArrayList arraylist = mListeners;
            arraylist;
            JVM INSTR monitorenter ;
            mListeners.remove(onnotifylistener);
            return;
        }

        public void resume() {
            register();
        }

        protected void unregister() {
            if(mRegistered) goto _L2; else goto _L1
_L1:
            return;
_L2:
            try {
                onUnregister();
            }
            catch(IllegalArgumentException illegalargumentexception) {
                Log.w("NotifierManager", illegalargumentexception.toString());
            }
            mRegistered = false;
            if(NotifierManager.DBG)
                Log.i("NotifierManager", (new StringBuilder()).append("onUnregister: ").append(toString()).toString());
            if(true) goto _L1; else goto _L3
_L3:
        }

        private int mActiveReference;
        protected Context mContext;
        private ArrayList mListeners;
        private int mReference;
        private boolean mRegistered;

        public BaseNotifier(Context context) {
            mListeners = new ArrayList();
            mContext = context;
        }
    }

    public static interface OnNotifyListener {

        public abstract void onNotify(Context context, Intent intent, Object obj);
    }

    public static final class NotifierType extends Enum {

        public static NotifierType valueOf(String s) {
            return (NotifierType)Enum.valueOf(miui/app/screenelement/NotifierManager$NotifierType, s);
        }

        public static NotifierType[] values() {
            return (NotifierType[])$VALUES.clone();
        }

        private static final NotifierType $VALUES[];
        public static final NotifierType Battery;
        public static final NotifierType Bluetooth;
        public static final NotifierType MobileData;
        public static final NotifierType RingMode;
        public static final NotifierType UsbState;
        public static final NotifierType VolumeChanged;
        public static final NotifierType WifiState;

        static  {
            Battery = new NotifierType("Battery", 0);
            UsbState = new NotifierType("UsbState", 1);
            Bluetooth = new NotifierType("Bluetooth", 2);
            WifiState = new NotifierType("WifiState", 3);
            RingMode = new NotifierType("RingMode", 4);
            MobileData = new NotifierType("MobileData", 5);
            VolumeChanged = new NotifierType("VolumeChanged", 6);
            NotifierType anotifiertype[] = new NotifierType[7];
            anotifiertype[0] = Battery;
            anotifiertype[1] = UsbState;
            anotifiertype[2] = Bluetooth;
            anotifiertype[3] = WifiState;
            anotifiertype[4] = RingMode;
            anotifiertype[5] = MobileData;
            anotifiertype[6] = VolumeChanged;
            $VALUES = anotifiertype;
        }

        private NotifierType(String s, int i) {
            super(s, i);
        }
    }


    private NotifierManager(Context context) {
        mNotifiers = new HashMap();
        mContext = context;
    }

    private static BaseNotifier createNotifier(NotifierType notifiertype, Context context) {
        class _cls1 {

            static final int $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[];

            static  {
                $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType = new int[NotifierType.values().length];
                NoSuchFieldError nosuchfielderror6;
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.Battery.ordinal()] = 1;
                }
                catch(NoSuchFieldError nosuchfielderror) { }
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.UsbState.ordinal()] = 2;
                }
                catch(NoSuchFieldError nosuchfielderror1) { }
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.Bluetooth.ordinal()] = 3;
                }
                catch(NoSuchFieldError nosuchfielderror2) { }
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.RingMode.ordinal()] = 4;
                }
                catch(NoSuchFieldError nosuchfielderror3) { }
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.MobileData.ordinal()] = 5;
                }
                catch(NoSuchFieldError nosuchfielderror4) { }
                try {
                    $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.WifiState.ordinal()] = 6;
                }
                catch(NoSuchFieldError nosuchfielderror5) { }
                $SwitchMap$miui$app$screenelement$NotifierManager$NotifierType[NotifierType.VolumeChanged.ordinal()] = 7;
_L2:
                return;
                nosuchfielderror6;
                if(true) goto _L2; else goto _L1
_L1:
            }
        }

        _cls1..SwitchMap.miui.app.screenelement.NotifierManager.NotifierType[notifiertype.ordinal()];
        JVM INSTR tableswitch 1 7: default 52
    //                   1 56
    //                   2 68
    //                   3 80
    //                   4 92
    //                   5 104
    //                   6 116
    //                   7 128;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8
_L1:
        Object obj = null;
_L10:
        return ((BaseNotifier) (obj));
_L2:
        obj = new BatteryNotifier(context);
        continue; /* Loop/switch isn't completed */
_L3:
        obj = new UsbStateNotifier(context);
        continue; /* Loop/switch isn't completed */
_L4:
        obj = new BluetoothNotifier(context);
        continue; /* Loop/switch isn't completed */
_L5:
        obj = new RingModeNotifier(context);
        continue; /* Loop/switch isn't completed */
_L6:
        obj = new MobileDataNotifier(context);
        continue; /* Loop/switch isn't completed */
_L7:
        obj = new WifiNotifier(context);
        continue; /* Loop/switch isn't completed */
_L8:
        obj = new VolumeChangedNotifier(context);
        if(true) goto _L10; else goto _L9
_L9:
    }

    /**
     * @deprecated Method getInstance is deprecated
     */

    public static NotifierManager getInstance(Context context) {
        miui/app/screenelement/NotifierManager;
        JVM INSTR monitorenter ;
        NotifierManager notifiermanager;
        if(sInstance == null)
            sInstance = new NotifierManager(context);
        notifiermanager = sInstance;
        miui/app/screenelement/NotifierManager;
        JVM INSTR monitorexit ;
        return notifiermanager;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method acquireNotifier is deprecated
     */

    public void acquireNotifier(NotifierType notifiertype, OnNotifyListener onnotifylistener) {
        this;
        JVM INSTR monitorenter ;
        BaseNotifier basenotifier;
        if(DBG)
            Log.i("NotifierManager", (new StringBuilder()).append("acquireNotifier:").append(notifiertype.toString()).append("  ").append(onnotifylistener.toString()).toString());
        basenotifier = (BaseNotifier)mNotifiers.get(notifiertype);
        if(basenotifier != null) goto _L2; else goto _L1
_L1:
        BaseNotifier basenotifier1 = createNotifier(notifiertype, mContext);
        basenotifier = basenotifier1;
        if(basenotifier != null) goto _L4; else goto _L3
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        basenotifier.init();
        mNotifiers.put(notifiertype, basenotifier);
_L2:
        basenotifier.addListener(onnotifylistener);
        basenotifier.addRef();
        basenotifier.addActiveRef();
        if(true) goto _L3; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method pause is deprecated
     */

    public void pause(NotifierType notifiertype, OnNotifyListener onnotifylistener) {
        this;
        JVM INSTR monitorenter ;
        BaseNotifier basenotifier = (BaseNotifier)mNotifiers.get(notifiertype);
        if(basenotifier != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        basenotifier.removeListener(onnotifylistener);
        if(basenotifier.releaseActiveRef() == 0)
            basenotifier.pause();
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method releaseNotifier is deprecated
     */

    public void releaseNotifier(NotifierType notifiertype, OnNotifyListener onnotifylistener) {
        this;
        JVM INSTR monitorenter ;
        BaseNotifier basenotifier = (BaseNotifier)mNotifiers.get(notifiertype);
        if(basenotifier != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        basenotifier.releaseActiveRef();
        basenotifier.removeListener(onnotifylistener);
        if(basenotifier.releaseRef() == 0) {
            basenotifier.finish();
            mNotifiers.remove(notifiertype);
        }
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method resume is deprecated
     */

    public void resume(NotifierType notifiertype, OnNotifyListener onnotifylistener) {
        this;
        JVM INSTR monitorenter ;
        BaseNotifier basenotifier = (BaseNotifier)mNotifiers.get(notifiertype);
        if(basenotifier != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        basenotifier.addListener(onnotifylistener);
        if(basenotifier.addActiveRef() == 1)
            basenotifier.resume();
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    private static boolean DBG = false;
    private static final String LOG_TAG = "NotifierManager";
    private static NotifierManager sInstance;
    private Context mContext;
    private HashMap mNotifiers;

    static  {
        DBG = true;
    }

}
