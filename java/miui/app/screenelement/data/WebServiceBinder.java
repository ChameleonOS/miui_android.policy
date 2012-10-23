// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.data;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import javax.xml.parsers.*;
import javax.xml.xpath.*;
import miui.app.screenelement.ScreenContext;
import miui.app.screenelement.ScreenElementLoadException;
import miui.app.screenelement.util.*;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

// Referenced classes of package miui.app.screenelement.data:
//            VariableBinder, Variables

public class WebServiceBinder
    implements VariableBinder {
    private class QueryThread extends Thread {

        public void run() {
            Log.i("WebServiceBinder", "QueryThread start");
            HttpPost httppost = new HttpPost(Uri.parse(mUriFormatter.getText(mContext.mVariables)).toString());
            String s = mParamsFormatter.getText(mContext.mVariables);
            ArrayList arraylist = null;
            if(!TextUtils.isEmpty(s)) {
                arraylist = new ArrayList();
                String as[] = s.split(",");
                int i = as.length;
                int j = 0;
                while(j < i)  {
                    String as1[] = as[j].split(":");
                    if(as1.length == 2)
                        arraylist.add(new BasicNameValuePair(as1[0], as1[1]));
                    j++;
                }
            }
            try {
                httppost.setEntity(new UrlEncodedFormEntity(arraylist, "UTF-8"));
                HttpResponse httpresponse = (new DefaultHttpClient()).execute(httppost);
                String s1 = null;
                int k = httpresponse.getStatusLine().getStatusCode();
                if(k == 200)
                    s1 = EntityUtils.toString(httpresponse.getEntity());
                Log.i("WebServiceBinder", (new StringBuilder()).append("QueryThread get result: ").append(k).append(" \n").append(s1).toString());
                onQueryComplete(s1);
                mLastQueryTime = System.currentTimeMillis();
            }
            catch(UnsupportedEncodingException unsupportedencodingexception) {
                Log.e("WebServiceBinder", (new StringBuilder()).append("fail to run query, ").append(unsupportedencodingexception.toString()).toString());
            }
            catch(ClientProtocolException clientprotocolexception) {
                Log.e("WebServiceBinder", (new StringBuilder()).append("fail to run query, ").append(clientprotocolexception.toString()).toString());
            }
            catch(IOException ioexception) {
                Log.e("WebServiceBinder", (new StringBuilder()).append("fail to run query, ").append(ioexception.toString()).toString());
            }
            mQueryInProgress = false;
            Log.i("WebServiceBinder", "QueryThread end");
        }

        final WebServiceBinder this$0;

        public QueryThread() {
            this$0 = WebServiceBinder.this;
            super("WebServiceBinder QueryThread");
        }
    }

    public static class Variable {

        private void createVar() {
            if(!"string".equalsIgnoreCase(mType)) goto _L2; else goto _L1
_L1:
            mStringVar = new IndexedStringVariable(mName, mVar);
_L4:
            return;
_L2:
            if("number".equalsIgnoreCase(mType))
                mNumberVar = new IndexedNumberVariable(mName, mVar);
            if(true) goto _L4; else goto _L3
_L3:
        }

        private void load(Element element) throws ScreenElementLoadException {
            if(element == null) {
                Log.e("WebServiceBinder", "Variable node is null");
                throw new ScreenElementLoadException("node is null");
            } else {
                mName = element.getAttribute("name");
                mType = element.getAttribute("type");
                mXPath = element.getAttribute("xpath");
                mPersist = Boolean.parseBoolean(element.getAttribute("persist"));
                createVar();
                return;
            }
        }

        public static final String TAG_NAME = "Variable";
        private static final String TYPE_NUMBER = "number";
        private static final String TYPE_STRING = "string";
        public String mName;
        public IndexedNumberVariable mNumberVar;
        public boolean mPersist;
        public IndexedStringVariable mStringVar;
        public String mType;
        private Variables mVar;
        public String mXPath;

        public Variable() {
        }

        public Variable(Element element, Variables variables) throws ScreenElementLoadException {
            mVar = variables;
            load(element);
        }
    }


    public WebServiceBinder(Element element, ScreenContext screencontext) throws ScreenElementLoadException {
        mVariables = new ArrayList();
        mUpdateInterval = -1;
        mUpdateIntervalFail = -1;
        mQuerySuccessful = true;
        mContext = screencontext;
        load(element);
    }

    private void load(Element element) throws ScreenElementLoadException {
        if(element == null) {
            Log.e("WebServiceBinder", "WebServiceBinder node is null");
            throw new ScreenElementLoadException("node is null");
        } else {
            mName = element.getAttribute("name");
            mUriFormatter = new TextFormatter(element.getAttribute("uri"), element.getAttribute("uriFormat"), element.getAttribute("uriParas"));
            mParamsFormatter = new TextFormatter(element.getAttribute("params"), element.getAttribute("paramsFormat"), element.getAttribute("paramsParas"));
            mUpdateInterval = Utils.getAttrAsInt(element, "updateInterval", -1);
            mUpdateIntervalFail = Utils.getAttrAsInt(element, "updateIntervalFail", -1);
            loadVariables(element);
            return;
        }
    }

    private void loadVariables(Element element) throws ScreenElementLoadException {
        NodeList nodelist = element.getElementsByTagName("Variable");
        for(int i = 0; i < nodelist.getLength(); i++)
            addVariable(new Variable((Element)nodelist.item(i), mContext.mVariables));

    }

    private void onQueryComplete(String s) {
        if(s == null) goto _L2; else goto _L1
_L1:
        XPath xpath;
        DocumentBuilderFactory documentbuilderfactory;
        ByteArrayInputStream bytearrayinputstream;
        xpath = XPathFactory.newInstance().newXPath();
        documentbuilderfactory = DocumentBuilderFactory.newInstance();
        bytearrayinputstream = null;
        DocumentBuilder documentbuilder;
        ByteArrayInputStream bytearrayinputstream1;
        documentbuilder = documentbuilderfactory.newDocumentBuilder();
        bytearrayinputstream1 = new ByteArrayInputStream(s.getBytes("utf-8"));
        org.w3c.dom.Document document;
        Iterator iterator;
        document = documentbuilder.parse(bytearrayinputstream1);
        iterator = mVariables.iterator();
_L7:
        if(!iterator.hasNext()) goto _L4; else goto _L3
_L3:
        Variable variable;
        IndexedStringVariable indexedstringvariable;
        variable = (Variable)iterator.next();
        indexedstringvariable = variable.mStringVar;
        if(indexedstringvariable == null) goto _L6; else goto _L5
_L5:
        String s1 = (String)xpath.evaluate(variable.mXPath, document, XPathConstants.STRING);
        variable.mStringVar.set(s1);
          goto _L7
        XPathExpressionException xpathexpressionexception1;
        xpathexpressionexception1;
        variable.mStringVar.set(null);
        Log.e("WebServiceBinder", (new StringBuilder()).append("fail to get variable: ").append(variable.mName).append(" :").append(xpathexpressionexception1.toString()).toString());
          goto _L7
        ParserConfigurationException parserconfigurationexception;
        parserconfigurationexception;
        bytearrayinputstream = bytearrayinputstream1;
_L15:
        Log.e("WebServiceBinder", parserconfigurationexception.toString());
        if(bytearrayinputstream == null) goto _L2; else goto _L8
_L8:
        bytearrayinputstream.close();
_L2:
        return;
_L6:
        IndexedNumberVariable indexednumbervariable = variable.mNumberVar;
        if(indexednumbervariable == null) goto _L7; else goto _L9
_L9:
        Double double1 = (Double)xpath.evaluate(variable.mXPath, document, XPathConstants.NUMBER);
        variable.mNumberVar.set(double1);
          goto _L7
        XPathExpressionException xpathexpressionexception;
        xpathexpressionexception;
        variable.mNumberVar.set(null);
        Log.e("WebServiceBinder", (new StringBuilder()).append("fail to get variable: ").append(variable.mName).append(" :").append(xpathexpressionexception.toString()).toString());
          goto _L7
        SAXException saxexception;
        saxexception;
        bytearrayinputstream = bytearrayinputstream1;
_L14:
        Log.e("WebServiceBinder", saxexception.toString());
        if(bytearrayinputstream != null)
            try {
                bytearrayinputstream.close();
            }
            catch(IOException ioexception2) { }
          goto _L2
_L4:
        mQuerySuccessful = true;
        if(bytearrayinputstream1 != null)
            try {
                bytearrayinputstream1.close();
            }
            catch(IOException ioexception7) { }
          goto _L2
        UnsupportedEncodingException unsupportedencodingexception;
        unsupportedencodingexception;
_L13:
        Log.e("WebServiceBinder", unsupportedencodingexception.toString());
        if(bytearrayinputstream != null)
            try {
                bytearrayinputstream.close();
            }
            catch(IOException ioexception6) { }
          goto _L2
        IOException ioexception4;
        ioexception4;
_L12:
        Log.e("WebServiceBinder", ioexception4.toString());
        if(bytearrayinputstream != null)
            try {
                bytearrayinputstream.close();
            }
            catch(IOException ioexception5) { }
          goto _L2
        Exception exception1;
        exception1;
_L11:
        Log.e("WebServiceBinder", exception1.toString());
        if(bytearrayinputstream != null)
            try {
                bytearrayinputstream.close();
            }
            catch(IOException ioexception3) { }
          goto _L2
        Exception exception;
        exception;
_L10:
        IOException ioexception1;
        if(bytearrayinputstream != null)
            try {
                bytearrayinputstream.close();
            }
            catch(IOException ioexception) { }
        throw exception;
        ioexception1;
          goto _L2
        exception;
        bytearrayinputstream = bytearrayinputstream1;
          goto _L10
        exception1;
        bytearrayinputstream = bytearrayinputstream1;
          goto _L11
        ioexception4;
        bytearrayinputstream = bytearrayinputstream1;
          goto _L12
        unsupportedencodingexception;
        bytearrayinputstream = bytearrayinputstream1;
          goto _L13
        saxexception;
          goto _L14
        parserconfigurationexception;
          goto _L15
    }

    private void tryStartQuery() {
        long l = System.currentTimeMillis() - mLastQueryTime;
        if(l < 0L)
            mLastQueryTime = 0L;
        if(mLastQueryTime == 0L || mUpdateInterval > 0 && l > (long)(1000 * mUpdateInterval) || !mQuerySuccessful && mUpdateIntervalFail > 0 && l > (long)(1000 * mUpdateIntervalFail))
            startQuery();
    }

    protected void addVariable(Variable variable) {
        mVariables.add(variable);
    }

    public void finish() {
        android.content.SharedPreferences.Editor editor = mContext.mContext.getSharedPreferences("MamlPreferences", 0).edit();
        editor.putLong((new StringBuilder()).append(mName).append("LastQueryTime").toString(), mLastQueryTime);
        Log.i("WebServiceBinder", (new StringBuilder()).append("persist mLastQueryTime: ").append(mLastQueryTime).toString());
        Iterator iterator = mVariables.iterator();
        do {
            if(!iterator.hasNext())
                break;
            Variable variable = (Variable)iterator.next();
            if(variable.mPersist)
                if(variable.mStringVar != null)
                    editor.putString((new StringBuilder()).append(mName).append(variable.mName).toString(), variable.mStringVar.get());
                else
                if(variable.mNumberVar != null)
                    editor.putFloat((new StringBuilder()).append(mName).append(variable.mName).toString(), variable.mNumberVar.get().floatValue());
        } while(true);
        editor.commit();
    }

    public volatile CharSequence getName() {
        return getName();
    }

    public String getName() {
        return mName;
    }

    public void init() {
        mQuerySuccessful = true;
        SharedPreferences sharedpreferences = mContext.mContext.getSharedPreferences("MamlPreferences", 0);
        mLastQueryTime = sharedpreferences.getLong((new StringBuilder()).append(mName).append("LastQueryTime").toString(), 0L);
        Log.i("WebServiceBinder", (new StringBuilder()).append("get persisted mLastQueryTime: ").append(mLastQueryTime).toString());
        Iterator iterator = mVariables.iterator();
        do {
            if(!iterator.hasNext())
                break;
            Variable variable = (Variable)iterator.next();
            if(variable.mPersist)
                if(variable.mStringVar != null)
                    variable.mStringVar.set(sharedpreferences.getString((new StringBuilder()).append(mName).append(variable.mName).toString(), null));
                else
                if(variable.mNumberVar != null)
                    variable.mNumberVar.set(sharedpreferences.getFloat((new StringBuilder()).append(mName).append(variable.mName).toString(), 0.0F));
        } while(true);
        tryStartQuery();
    }

    public void pause() {
    }

    public void refresh() {
        startQuery();
    }

    public void resume() {
        tryStartQuery();
    }

    public void startQuery() {
        if(!mQueryInProgress) {
            mQueryInProgress = true;
            mQuerySuccessful = false;
            mQueryThread = new QueryThread();
            mQueryThread.start();
        }
    }

    private static final String LOG_TAG = "WebServiceBinder";
    private static final String PREF_LAST_QUERY_TIME = "LastQueryTime";
    public static final String TAG_NAME = "WebServiceBinder";
    private ScreenContext mContext;
    private long mLastQueryTime;
    protected String mName;
    private TextFormatter mParamsFormatter;
    private boolean mQueryInProgress;
    private boolean mQuerySuccessful;
    private Thread mQueryThread;
    private int mUpdateInterval;
    private int mUpdateIntervalFail;
    protected TextFormatter mUriFormatter;
    private ArrayList mVariables;





/*
    static long access$302(WebServiceBinder webservicebinder, long l) {
        webservicebinder.mLastQueryTime = l;
        return l;
    }

*/


/*
    static boolean access$402(WebServiceBinder webservicebinder, boolean flag) {
        webservicebinder.mQueryInProgress = flag;
        return flag;
    }

*/
}
