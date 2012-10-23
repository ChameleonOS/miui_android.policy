// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;
import java.util.Calendar;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.util.IndexedNumberVariable;
import miui.app.screenelement.util.IndexedStringVariable;

// Referenced classes of package miui.app.screenelement.data:
//            VariableUpdater, VariableUpdaterManager

public class DateTimeVariableUpdater extends VariableUpdater {

    public DateTimeVariableUpdater(VariableUpdaterManager variableupdatermanager) {
        super(variableupdatermanager);
        mCalendar = Calendar.getInstance();
        mHandler = new Handler();
        mAmPm = new IndexedNumberVariable("ampm", getContext().mVariables);
        mHour12 = new IndexedNumberVariable("hour12", getContext().mVariables);
        mHour24 = new IndexedNumberVariable("hour24", getContext().mVariables);
        mMinute = new IndexedNumberVariable("minute", getContext().mVariables);
        mSecond = new IndexedNumberVariable("second", getContext().mVariables);
        mYear = new IndexedNumberVariable("year", getContext().mVariables);
        mMonth = new IndexedNumberVariable("month", getContext().mVariables);
        mDate = new IndexedNumberVariable("date", getContext().mVariables);
        mDayOfWeek = new IndexedNumberVariable("day_of_week", getContext().mVariables);
        mTime = new IndexedNumberVariable("time", getContext().mVariables);
        mTimeSys = new IndexedNumberVariable("time_sys", getContext().mVariables);
        mTimeSys.set(System.currentTimeMillis());
        mNextAlarm = new IndexedStringVariable("next_alarm_time", getContext().mVariables);
    }

    private void refreshAlarm() {
        String s = android.provider.Settings.System.getString(getContext().mContext.getContentResolver(), "next_alarm_formatted");
        mNextAlarm.set(s);
    }

    private void updateTime() {
        long l = SystemClock.elapsedRealtime();
        if(l - mLastUpdatedTime >= 500L) {
            mCalendar.setTimeInMillis(System.currentTimeMillis());
            mAmPm.set(mCalendar.get(9));
            mHour12.set(mCalendar.get(10));
            mHour24.set(mCalendar.get(11));
            mMinute.set(mCalendar.get(12));
            mYear.set(mCalendar.get(1));
            mMonth.set(mCalendar.get(2));
            mDate.set(mCalendar.get(5));
            mDayOfWeek.set(mCalendar.get(7));
            mSecond.set(mCalendar.get(13));
            mLastUpdatedTime = l;
        }
    }

    public void finish() {
        super.finish();
        mHandler.removeCallbacks(mTimeUpdater);
    }

    public void init() {
        super.init();
        refreshAlarm();
        updateTime();
        mHandler.postDelayed(mTimeUpdater, 500L);
    }

    public void pause() {
        super.pause();
        mHandler.removeCallbacks(mTimeUpdater);
    }

    public void resume() {
        super.resume();
        refreshAlarm();
        mCalendar = Calendar.getInstance();
        updateTime();
        mHandler.post(mTimeUpdater);
    }

    public void tick(long l) {
        super.tick(l);
        mTime.set(l);
        mTimeSys.set(System.currentTimeMillis());
        updateTime();
    }

    private IndexedNumberVariable mAmPm;
    protected Calendar mCalendar;
    private IndexedNumberVariable mDate;
    private IndexedNumberVariable mDayOfWeek;
    private Handler mHandler;
    private IndexedNumberVariable mHour12;
    private IndexedNumberVariable mHour24;
    private long mLastUpdatedTime;
    private IndexedNumberVariable mMinute;
    private IndexedNumberVariable mMonth;
    private IndexedStringVariable mNextAlarm;
    private IndexedNumberVariable mSecond;
    private IndexedNumberVariable mTime;
    private IndexedNumberVariable mTimeSys;
    private final Runnable mTimeUpdater = new Runnable() {

        public void run() {
            updateTime();
            mHandler.postDelayed(this, 500L);
        }

        final DateTimeVariableUpdater this$0;

             {
                this$0 = DateTimeVariableUpdater.this;
                super();
            }
    };
    private IndexedNumberVariable mYear;


}
