// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;

public class Variables {

    public Variables() {
        mNextDoubleIndex = 0;
        mNextStringIndex = 0;
        mNumObjects = new HashMap();
        mStrObjects = new HashMap();
        mDoubleArray = new ArrayList();
        mStringArray = new ArrayList();
        mNumLock = new Object();
        mStrLock = new Object();
    }

    private int getIndex(HashMap hashmap, String s, String s1, int i) {
        if(s == null)
            s = "__global";
        HashMap hashmap1 = (HashMap)hashmap.get(s);
        if(hashmap1 == null) {
            hashmap1 = new HashMap();
            hashmap.put(s, hashmap1);
        }
        Integer integer = (Integer)hashmap1.get(s1);
        if(integer == null) {
            integer = Integer.valueOf(i);
            hashmap1.put(s1, integer);
        }
        return integer.intValue();
    }

    public Double getNum(int i) {
        Object obj = mNumLock;
        obj;
        JVM INSTR monitorenter ;
        Double double1;
        if(i < -1 || i > -1 + mDoubleArray.size())
            double1 = null;
        else
            double1 = (Double)mDoubleArray.get(i);
        return double1;
    }

    public String getStr(int i) {
        Object obj = mStrLock;
        obj;
        JVM INSTR monitorenter ;
        String s;
        if(i < -1 || i > -1 + mStringArray.size())
            s = null;
        else
            s = (String)mStringArray.get(i);
        return s;
    }

    public void putNum(int i, double d) {
        putNum(i, Double.valueOf(d));
    }

    public void putNum(int i, Double double1) {
        if(i >= 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Object obj = mNumLock;
        obj;
        JVM INSTR monitorenter ;
        for(; i > -1 + mDoubleArray.size(); mDoubleArray.add(null));
        break MISSING_BLOCK_LABEL_45;
        Exception exception;
        exception;
        throw exception;
        mDoubleArray.set(i, double1);
        obj;
        JVM INSTR monitorexit ;
          goto _L1
    }

    public void putStr(int i, String s) {
        if(i >= 0) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Object obj = mStrLock;
        obj;
        JVM INSTR monitorenter ;
        for(; i > -1 + mStringArray.size(); mStringArray.add(null));
        break MISSING_BLOCK_LABEL_45;
        Exception exception;
        exception;
        throw exception;
        mStringArray.set(i, s);
        obj;
        JVM INSTR monitorexit ;
          goto _L1
    }

    public int registerNumberVariable(String s, String s1) {
        Object obj = mNumLock;
        obj;
        JVM INSTR monitorenter ;
        int i = getIndex(mNumObjects, s, s1, mNextDoubleIndex);
        if(i == mNextDoubleIndex)
            mNextDoubleIndex = 1 + mNextDoubleIndex;
        if(DBG)
            Log.d("Variables", (new StringBuilder()).append("registerNumberVariable: ").append(s).append(".").append(s1).append("  index:").append(i).toString());
        return i;
    }

    public int registerStringVariable(String s, String s1) {
        Object obj = mStrLock;
        obj;
        JVM INSTR monitorenter ;
        int i = getIndex(mStrObjects, s, s1, mNextStringIndex);
        if(i == mNextStringIndex)
            mNextStringIndex = 1 + mNextStringIndex;
        if(DBG)
            Log.d("Variables", (new StringBuilder()).append("registerStringVariable: ").append(s).append(".").append(s1).append("  index:").append(i).toString());
        return i;
    }

    public static final String AMPM = "ampm";
    public static final String BATTERY_LEVEL = "battery_level";
    public static final String BATTERY_STATE = "battery_state";
    public static final int BATTERY_STATE_CHARGING = 1;
    public static final int BATTERY_STATE_FULL = 3;
    public static final int BATTERY_STATE_LOW = 2;
    public static final int BATTERY_STATE_UNPLUGGED = 0;
    public static final String BLUETOOTH_STATE = "bluetooth_state";
    public static final String BOUNCE_PROGRESS = "bounce_progress";
    public static final String CALL_MISSED_COUNT = "call_missed_count";
    public static final String DATA_STATE = "data_state";
    public static final String DATE = "date";
    public static final String DAY_OF_WEEK = "day_of_week";
    private static boolean DBG = false;
    public static final String FRAME_RATE = "frame_rate";
    private static final String GLOBAL = "__global";
    public static final String HOUR12 = "hour12";
    public static final String HOUR24 = "hour24";
    private static final String LOG_TAG = "Variables";
    public static final String MILLISECOND = "msec";
    public static final String MINUTE = "minute";
    public static final String MONTH = "month";
    public static final String MUSIC_STATE = "music_state";
    public static final int MUSIC_STATE_PLAY = 1;
    public static final int MUSIC_STATE_STOP = 0;
    public static final String NEXT_ALARM_TIME = "next_alarm_time";
    public static final String PLMN = "plmn";
    public static final String RING_MODE = "ring_mode";
    public static final String SCREEN_HEIGHT = "screen_height";
    public static final String SCREEN_WIDTH = "screen_width";
    public static final String SECOND = "second";
    public static final String SMS_UNREAD_COUNT = "sms_unread_count";
    public static final String SPN = "spn";
    public static final String TIME = "time";
    public static final String TIME_SYS = "time_sys";
    public static final String TOUCH_BEGIN_TIME = "touch_begin_time";
    public static final String TOUCH_BEGIN_X = "touch_begin_x";
    public static final String TOUCH_BEGIN_Y = "touch_begin_y";
    public static final String TOUCH_X = "touch_x";
    public static final String TOUCH_Y = "touch_y";
    public static final String USB_MODE = "usb_mode";
    public static final String WIFI_STATE = "wifi_state";
    public static final String YEAR = "year";
    private ArrayList mDoubleArray;
    private int mNextDoubleIndex;
    private int mNextStringIndex;
    private Object mNumLock;
    private HashMap mNumObjects;
    private Object mStrLock;
    private HashMap mStrObjects;
    private ArrayList mStringArray;

    static  {
        DBG = false;
    }
}
