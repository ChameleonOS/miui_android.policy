// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.os.FileUtils;
import android.text.TextUtils;
import java.io.*;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

// Referenced classes of package miui.app.screenelement.util:
//            Utils, Task

public class LockscreenConfigFile {
    private static interface OnLoadElementListener {

        public abstract void OnLoadElement(Element element);
    }

    public class Variable {

        public String name;
        final LockscreenConfigFile this$0;
        public String type;
        public String value;

        public Variable() {
            this$0 = LockscreenConfigFile.this;
            super();
        }
    }


    public LockscreenConfigFile() {
        mVariables = new HashMap();
        mTasks = new HashMap();
    }

    private void loadList(Element element, String s, String s1, OnLoadElementListener onloadelementlistener) {
        Element element1 = Utils.getChild(element, s);
        if(element1 != null) {
            NodeList nodelist = element1.getChildNodes();
            int i = 0;
            while(i < nodelist.getLength())  {
                Node node = nodelist.item(i);
                if(node.getNodeType() == 1 && node.getNodeName().equals(s1))
                    onloadelementlistener.OnLoadElement((Element)node);
                i++;
            }
        }
    }

    private void loadTasks(Element element) {
        loadList(element, "Tasks", "Intent", new OnLoadElementListener() {

            public void OnLoadElement(Element element1) {
                putTask(Task.load(element1));
            }

            final LockscreenConfigFile this$0;

             {
                this$0 = LockscreenConfigFile.this;
                super();
            }
        });
    }

    private void loadVariables(Element element) {
        loadList(element, "Variables", "Variable", new OnLoadElementListener() {

            public void OnLoadElement(Element element1) {
                put(element1.getAttribute("name"), element1.getAttribute("value"), element1.getAttribute("type"));
            }

            final LockscreenConfigFile this$0;

             {
                this$0 = LockscreenConfigFile.this;
                super();
            }
        });
    }

    private void put(String s, String s1, String s2) {
        if(!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s2) && ("string".equals(s2) || "number".equals(s2))) {
            Variable variable = (Variable)mVariables.get(s);
            if(variable == null) {
                variable = new Variable();
                variable.name = s;
                mVariables.put(s, variable);
            }
            variable.type = s2;
            variable.value = s1;
        }
    }

    private static void writeTag(FileWriter filewriter, String s, boolean flag) throws IOException {
        filewriter.write("<");
        if(flag)
            filewriter.write("/");
        filewriter.write(s);
        filewriter.write(">\n");
    }

    private static void writeTag(FileWriter filewriter, String s, String as[], String as1[]) throws IOException {
        writeTag(filewriter, s, as, as1, false);
    }

    private static void writeTag(FileWriter filewriter, String s, String as[], String as1[], boolean flag) throws IOException {
        filewriter.write("<");
        filewriter.write(s);
        int i = 0;
        while(i < as.length)  {
            if(!flag || !TextUtils.isEmpty(as1[i])) {
                filewriter.write(" ");
                filewriter.write(as[i]);
                filewriter.write("=\"");
                filewriter.write(as1[i]);
                filewriter.write("\"");
            }
            i++;
        }
        filewriter.write("/>\n");
    }

    private void writeTasks(FileWriter filewriter) throws IOException {
        if(mTasks.size() != 0) {
            writeTag(filewriter, "Tasks", false);
            String as[] = new String[7];
            as[0] = Task.TAG_ID;
            as[1] = Task.TAG_ACTION;
            as[2] = Task.TAG_TYPE;
            as[3] = Task.TAG_CATEGORY;
            as[4] = Task.TAG_PACKAGE;
            as[5] = Task.TAG_CLASS;
            as[6] = Task.TAG_NAME;
            String as1[];
            for(Iterator iterator = mTasks.values().iterator(); iterator.hasNext(); writeTag(filewriter, "Intent", as, as1, true)) {
                Task task = (Task)iterator.next();
                as1 = new String[7];
                as1[0] = task.id;
                as1[1] = task.action;
                as1[2] = task.type;
                as1[3] = task.category;
                as1[4] = task.packageName;
                as1[5] = task.className;
                as1[6] = task.name;
            }

            writeTag(filewriter, "Tasks", true);
        }
    }

    private void writeVariables(FileWriter filewriter) throws IOException {
        if(mVariables.size() != 0) {
            writeTag(filewriter, "Variables", false);
            String as[] = new String[3];
            as[0] = "name";
            as[1] = "type";
            as[2] = "value";
            String as1[];
            for(Iterator iterator = mVariables.values().iterator(); iterator.hasNext(); writeTag(filewriter, "Variable", as, as1)) {
                Variable variable = (Variable)iterator.next();
                as1 = new String[3];
                as1[0] = variable.name;
                as1[1] = variable.type;
                as1[2] = variable.value;
            }

            writeTag(filewriter, "Variables", true);
        }
    }

    public Task getTask(String s) {
        return (Task)mTasks.get(s);
    }

    public Collection getTasks() {
        return mTasks.values();
    }

    public String getVariable(String s) {
        Variable variable = (Variable)mVariables.get(s);
        String s1;
        if(variable == null)
            s1 = null;
        else
            s1 = variable.value;
        return s1;
    }

    public Collection getVariables() {
        return mVariables.values();
    }

    public boolean load(String s) {
        boolean flag;
        DocumentBuilderFactory documentbuilderfactory;
        flag = false;
        mFilePath = s;
        mVariables.clear();
        mTasks.clear();
        documentbuilderfactory = DocumentBuilderFactory.newInstance();
        Element element = documentbuilderfactory.newDocumentBuilder().parse(new FileInputStream(s)).getDocumentElement();
        if(element == null || !element.getNodeName().equals("Config"))
            break MISSING_BLOCK_LABEL_129;
        loadVariables(element);
        loadTasks(element);
        flag = true;
        break MISSING_BLOCK_LABEL_129;
        ParserConfigurationException parserconfigurationexception;
        parserconfigurationexception;
        parserconfigurationexception.printStackTrace();
        break MISSING_BLOCK_LABEL_129;
        SAXException saxexception;
        saxexception;
        saxexception.printStackTrace();
        break MISSING_BLOCK_LABEL_129;
        IOException ioexception;
        ioexception;
        ioexception.printStackTrace();
        break MISSING_BLOCK_LABEL_129;
        Exception exception;
        exception;
        exception.printStackTrace();
        break MISSING_BLOCK_LABEL_129;
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        return flag;
    }

    public void putNumber(String s, double d) {
        putNumber(s, Utils.doubleToString(d));
    }

    public void putNumber(String s, String s1) {
        put(s, s1, "number");
    }

    public void putString(String s, String s1) {
        put(s, s1, "string");
    }

    public void putTask(Task task) {
        if(task != null && !TextUtils.isEmpty(task.id))
            mTasks.put(task.id, task);
    }

    public boolean save() {
        return save(mFilePath);
    }

    public boolean save(String s) {
        boolean flag = true;
        try {
            FileWriter filewriter = new FileWriter(s);
            writeTag(filewriter, "Config", false);
            writeVariables(filewriter);
            writeTasks(filewriter);
            writeTag(filewriter, "Config", true);
            filewriter.flush();
            filewriter.close();
            FileUtils.setPermissions(s, 511, -1, -1);
        }
        catch(IOException ioexception) {
            ioexception.printStackTrace();
            flag = false;
        }
        return flag;
    }

    private static final String TAG_ROOT = "Config";
    private static final String TAG_TASK = "Intent";
    private static final String TAG_TASKS = "Tasks";
    private static final String TAG_VARIABLE = "Variable";
    private static final String TAG_VARIABLES = "Variables";
    private String mFilePath;
    private HashMap mTasks;
    private HashMap mVariables;

}
