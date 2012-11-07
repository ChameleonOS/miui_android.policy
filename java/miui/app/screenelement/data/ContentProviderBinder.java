// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.AsyncQueryHandler;
import android.content.Context;
import android.database.*;
import android.database.sqlite.*;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.*;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

// Referenced classes of package miui.app.screenelement.data:
//            VariableBinder, Variables

public class ContentProviderBinder
    implements VariableBinder {
    private class MyDataSetObserver extends DataSetObserver {

        public void onChanged() {
            if(!mFinished) goto _L2; else goto _L1
_L1:
            return;
_L2:
            updateVariables();
            if(mQueryCompletedListener != null)
                mQueryCompletedListener.onQueryCompleted(mName);
            if(true) goto _L1; else goto _L3
_L3:
        }

        public void onInvalidated() {
            if(!mFinished) goto _L2; else goto _L1
_L1:
            return;
_L2:
            updateVariables();
            if(mQueryCompletedListener != null)
                mQueryCompletedListener.onQueryCompleted(mName);
            if(true) goto _L1; else goto _L3
_L3:
        }

        final ContentProviderBinder this$0;

        private MyDataSetObserver() {
            this$0 = ContentProviderBinder.this;
            super();
        }

    }

    private class ChangeObserver extends ContentObserver {

        public boolean deliverSelfNotifications() {
            return true;
        }

        public void onChange(boolean flag) {
            onContentChanged();
        }

        final ContentProviderBinder this$0;

        public ChangeObserver() {
            this$0 = ContentProviderBinder.this;
            super(new Handler());
        }
    }

    private final class QueryHandler extends AsyncQueryHandler {
        protected class CatchingWorkerHandler extends android.content.AsyncQueryHandler.WorkerHandler {

            public void handleMessage(Message message) {
                super.handleMessage(message);
_L1:
                return;
                SQLiteDiskIOException sqlitediskioexception;
                sqlitediskioexception;
                Log.w("ContentProviderBinder", "Exception on background worker thread", sqlitediskioexception);
                  goto _L1
                SQLiteFullException sqlitefullexception;
                sqlitefullexception;
                Log.w("ContentProviderBinder", "Exception on background worker thread", sqlitefullexception);
                  goto _L1
                SQLiteDatabaseCorruptException sqlitedatabasecorruptexception;
                sqlitedatabasecorruptexception;
                Log.w("ContentProviderBinder", "Exception on background worker thread", sqlitedatabasecorruptexception);
                  goto _L1
            }

            final QueryHandler this$1;

            public CatchingWorkerHandler(Looper looper) {
                this$1 = QueryHandler.this;
                super(QueryHandler.this, looper);
            }
        }


        protected Handler createHandler(Looper looper) {
            return new CatchingWorkerHandler(looper);
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor) {
            ContentProviderBinder.this.onQueryComplete(cursor);
        }

        final ContentProviderBinder this$0;

        public QueryHandler(Context context) {
            this$0 = ContentProviderBinder.this;
            super(context.getContentResolver());
        }
    }

    public static class Variable {

        private void createVar() {
            if("string".equalsIgnoreCase(mType))
                mStringVar = new IndexedStringVariable(mName, mVar);
            else
                mNumberVar = new IndexedNumberVariable(mName, mVar);
        }

        private void load(Element element) throws ScreenElementLoadException {
            if(element == null) {
                Log.e("ContentProviderBinder", "Variable node is null");
                throw new ScreenElementLoadException("node is null");
            } else {
                mName = element.getAttribute("name");
                mType = element.getAttribute("type");
                mColumn = element.getAttribute("column");
                mRow = Utils.getAttrAsInt(element, "row", 0);
                createVar();
                return;
            }
        }

        public static final String TAG_NAME = "Variable";
        public String mColumn;
        public String mName;
        public IndexedNumberVariable mNumberVar;
        public int mRow;
        public IndexedStringVariable mStringVar;
        public String mType;
        private Variables mVar;


        public Variable() {
        }

        public Variable(Element element, Variables variables) throws ScreenElementLoadException {
            mVar = variables;
            load(element);
        }
    }

    public static class Builder {

        public void addVariable(String s, String s1, String s2, int i) {
            Variable variable = new Variable();
            variable.mName = s;
            variable.mType = s1;
            variable.mColumn = s2;
            variable.mRow = i;
            variable.createVar();
            mBinder.addVariable(variable);
        }

        public Builder setArgs(String as[]) {
            mBinder.mArgs = as;
            return this;
        }

        public Builder setColumns(String as[]) {
            mBinder.mColumns = as;
            return this;
        }

        public Builder setCountName(String s) {
            mBinder.mCountName = s;
            mBinder.createCountVar();
            return this;
        }

        public Builder setName(String s) {
            mBinder.mName = s;
            return this;
        }

        public Builder setOrder(String s) {
            mBinder.mOrder = s;
            return this;
        }

        public Builder setWhere(String s) {
            mBinder.mWhereFormatter = new TextFormatter(s);
            return this;
        }

        public Builder setWhere(String s, String s1) {
            mBinder.mWhereFormatter = new TextFormatter(s, s1);
            return this;
        }

        private ContentProviderBinder mBinder;

        protected Builder(ContentProviderBinder contentproviderbinder) {
            mBinder = contentproviderbinder;
        }
    }

    public static interface QueryCompleteListener {

        public abstract void onQueryCompleted(String s);
    }


    public ContentProviderBinder(ScreenContext screencontext) {
        this(screencontext, ((QueryCompleteListener) (null)));
    }

    public ContentProviderBinder(ScreenContext screencontext, QueryCompleteListener querycompletelistener) {
        mVariables = new ArrayList();
        mChangeObserver = new ChangeObserver();
        mDataSetObserver = new MyDataSetObserver();
        mCursorLock = new Object();
        mUpdateInterval = -1;
        mContext = screencontext;
        mQueryHandler = new QueryHandler(screencontext.mContext);
        mQueryCompletedListener = querycompletelistener;
    }

    public ContentProviderBinder(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        this(element, screencontext, null);
    }

    public ContentProviderBinder(Element element, ScreenContext screencontext, QueryCompleteListener querycompletelistener) throws ScreenElementLoadException {
        mVariables = new ArrayList();
        mChangeObserver = new ChangeObserver();
        mDataSetObserver = new MyDataSetObserver();
        mCursorLock = new Object();
        mUpdateInterval = -1;
        mContext = screencontext;
        mQueryHandler = new QueryHandler(screencontext.mContext);
        mQueryCompletedListener = querycompletelistener;
        load(element);
    }

    private void closeCursor() {
        Object obj = mCursorLock;
        obj;
        JVM INSTR monitorenter ;
        if(mCursor != null) {
            if(mUpdateInterval == -1) {
                mCursor.unregisterContentObserver(mChangeObserver);
                mCursor.unregisterDataSetObserver(mDataSetObserver);
            }
            mCursor.close();
            mCursor = null;
        }
        return;
    }

    private void load(Element element) throws ScreenElementLoadException {
        String s = null;
        if(element == null) {
            Log.e("ContentProviderBinder", "ContentProviderBinder node is null");
            throw new ScreenElementLoadException("node is null");
        }
        mName = element.getAttribute("name");
        mDependency = element.getAttribute("dependency");
        mUriFormatter = new TextFormatter(element.getAttribute("uri"), element.getAttribute("uriFormat"), element.getAttribute("uriParas"));
        String s1 = element.getAttribute("columns");
        String as[];
        String s2;
        String as1[];
        String s3;
        String s4;
        if(TextUtils.isEmpty(s1))
            as = null;
        else
            as = s1.split(",");
        mColumns = as;
        mWhereFormatter = new TextFormatter(element.getAttribute("where"), element.getAttribute("whereFormat"), element.getAttribute("whereParas"));
        s2 = element.getAttribute("args");
        if(TextUtils.isEmpty(s2))
            as1 = null;
        else
            as1 = s2.split(",");
        mArgs = as1;
        s3 = element.getAttribute("order");
        if(TextUtils.isEmpty(s3))
            s3 = null;
        mOrder = s3;
        s4 = element.getAttribute("countName");
        if(!TextUtils.isEmpty(s4))
            s = s4;
        mCountName = s;
        if(mCountName != null)
            mCountVar = new IndexedNumberVariable(mCountName, mContext.mVariables);
        mUpdateInterval = Utils.getAttrAsInt(element, "updateInterval", -1);
        loadVariables(element);
    }

    private void loadVariables(Element element) throws ScreenElementLoadException {
        NodeList nodelist = element.getElementsByTagName("Variable");
        for(int i = 0; i < nodelist.getLength(); i++)
            addVariable(new Variable((Element)nodelist.item(i), mContext.mVariables));

    }

    private void onQueryComplete(Cursor cursor) {
        closeCursor();
        if(!mFinished) goto _L2; else goto _L1
_L1:
        return;
_L2:
        mCursor = cursor;
        synchronized(mCursorLock) {
            if(mCursor != null) {
                if(mUpdateInterval == -1) {
                    mCursor.registerContentObserver(mChangeObserver);
                    mCursor.registerDataSetObserver(mDataSetObserver);
                }
                updateVariables();
                if(mUpdateInterval != -1) {
                    mCursor.close();
                    mCursor = null;
                }
                mContext.requestUpdate();
            }
        }
        if(mQueryCompletedListener != null)
            mQueryCompletedListener.onQueryCompleted(mName);
        if(true) goto _L1; else goto _L3
_L3:
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void setNull(Variable variable) {
        if("string".equalsIgnoreCase(variable.mType))
            variable.mStringVar.set(null);
        else
            variable.mNumberVar.set(null);
    }

    private void updateVariables() {
        int i = 0;
        Object obj = mCursorLock;
        obj;
        JVM INSTR monitorenter ;
        if(mCursor != null) goto _L2; else goto _L1
_L1:
        if(mCountVar != null)
            mCountVar.set(i);
        Log.i("ContentProviderBinder", (new StringBuilder()).append("query result count: ").append(i).append(" ").append(mLastUri).toString());
        if(mCursor != null && i != 0) goto _L4; else goto _L3
_L3:
        for(Iterator iterator = mVariables.iterator(); iterator.hasNext(); setNull((Variable)iterator.next()));
          goto _L5
        Exception exception;
        exception;
        throw exception;
_L2:
        i = mCursor.getCount();
          goto _L1
_L4:
        Iterator iterator1;
        Log.i("ContentProviderBinder", (new StringBuilder()).append("updateVariables: ").append(mLastUri).toString());
        iterator1 = mVariables.iterator();
_L15:
        if(!iterator1.hasNext()) goto _L7; else goto _L6
_L6:
        Variable variable;
        boolean flag;
        boolean flag1;
        variable = (Variable)iterator1.next();
        flag = true;
        flag1 = mCursor.moveToPosition(variable.mRow);
        if(!flag1) goto _L9; else goto _L8
_L8:
        int j;
        String s = variable.mColumn;
        j = mCursor.getColumnIndexOrThrow(s);
        if(mCursor.isNull(j)) goto _L9; else goto _L10
_L10:
        if(!"string".equalsIgnoreCase(variable.mType)) goto _L12; else goto _L11
_L11:
        String s1 = mCursor.getString(j);
        variable.mStringVar.set(s1);
_L13:
        flag = false;
_L9:
        if(!flag)
            continue; /* Loop/switch isn't completed */
        setNull(variable);
        continue; /* Loop/switch isn't completed */
_L12:
        if(!"double".equalsIgnoreCase(variable.mType))
            break MISSING_BLOCK_LABEL_373;
        double d = mCursor.getDouble(j);
        variable.mNumberVar.set(d);
          goto _L13
        NumberFormatException numberformatexception;
        numberformatexception;
        Log.w("ContentProviderBinder", String.format("failed to get value from cursor", new Object[0]));
          goto _L9
        if(!"float".equalsIgnoreCase(variable.mType))
            break MISSING_BLOCK_LABEL_449;
        float f = mCursor.getFloat(j);
        variable.mNumberVar.set(f);
          goto _L13
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        Log.e("ContentProviderBinder", (new StringBuilder()).append("column does not exist: ").append(variable.mColumn).toString());
          goto _L9
        if("int".equalsIgnoreCase(variable.mType)) {
            int k = mCursor.getInt(j);
            variable.mNumberVar.set(k);
        } else
        if("long".equalsIgnoreCase(variable.mType)) {
            long l = mCursor.getLong(j);
            variable.mNumberVar.set(l);
        }
          goto _L13
_L7:
        obj;
        JVM INSTR monitorexit ;
_L5:
        return;
        if(true) goto _L15; else goto _L14
_L14:
    }

    protected void addVariable(Variable variable) {
        mVariables.add(variable);
    }

    public void createCountVar() {
        if(mCountName == null)
            mCountVar = null;
        else
            mCountVar = new IndexedNumberVariable(mCountName, mContext.mVariables);
    }

    public void finish() {
        closeCursor();
        mFinished = true;
    }

    public String getDependency() {
        return mDependency;
    }

    public volatile CharSequence getName() {
        return getName();
    }

    public String getName() {
        return mName;
    }

    public void init() {
        if(TextUtils.isEmpty(getDependency()))
            startQuery();
    }

    public void onContentChanged() {
        Log.i("ContentProviderBinder", "ChangeObserver: content changed.");
        if(!mFinished)
            startQuery();
    }

    public void pause() {
    }

    public void refresh() {
        startQuery();
    }

    public void resume() {
        if(mUpdateInterval > 0 && System.currentTimeMillis() - mLastQueryTime > (long)(1000 * mUpdateInterval))
            startQuery();
    }

    public void startQuery() {
        mQueryHandler.cancelOperation(100);
        Uri uri = Uri.parse(mUriFormatter.getText(mContext.mVariables));
        mLastUri = uri.toString();
        String s = mWhereFormatter.getText(mContext.mVariables);
        mQueryHandler.startQuery(100, null, uri, mColumns, s, mArgs, mOrder);
        mLastQueryTime = System.currentTimeMillis();
    }

    private static final boolean DBG = false;
    private static final String LOG_TAG = "ContentProviderBinder";
    private static final int QUERY_TOKEN = 100;
    public static final String TAG_NAME = "ContentProviderBinder";
    private static final String TYPE_STRING = "string";
    protected String mArgs[];
    public ChangeObserver mChangeObserver;
    protected String mColumns[];
    private ScreenContext mContext;
    protected String mCountName;
    private IndexedNumberVariable mCountVar;
    private Cursor mCursor;
    private Object mCursorLock;
    private DataSetObserver mDataSetObserver;
    private String mDependency;
    private boolean mFinished;
    private long mLastQueryTime;
    private String mLastUri;
    protected String mName;
    protected String mOrder;
    private QueryCompleteListener mQueryCompletedListener;
    private QueryHandler mQueryHandler;
    private int mUpdateInterval;
    protected TextFormatter mUriFormatter;
    private ArrayList mVariables;
    protected TextFormatter mWhereFormatter;




}
