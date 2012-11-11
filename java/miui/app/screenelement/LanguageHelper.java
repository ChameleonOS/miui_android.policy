// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.os.MemoryFile;
import android.util.Log;
import java.util.Locale;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import miui.app.screenelement.data.Variables;
import miui.app.screenelement.util.IndexedStringVariable;
import miui.app.screenelement.util.Utils;
import org.w3c.dom.*;

// Referenced classes of package miui.app.screenelement:
//            ResourceManager

public class LanguageHelper {

    public LanguageHelper() {
    }

    public static boolean load(Locale locale, ResourceManager resourcemanager, Variables variables) {
        boolean flag;
        MemoryFile memoryfile;
        flag = false;
        memoryfile = null;
        if(locale != null) {
            memoryfile = resourcemanager.getFile(Utils.addFileNameSuffix("strings/strings.xml", locale.toString()));
            if(memoryfile == null)
                memoryfile = resourcemanager.getFile(Utils.addFileNameSuffix("strings/strings.xml", locale.getLanguage()));
        }
        if(memoryfile != null) goto _L2; else goto _L1
_L1:
        memoryfile = resourcemanager.getFile("strings/strings.xml");
        if(memoryfile != null) goto _L2; else goto _L3
_L3:
        Log.w("LanguageHelper", "no available string resources to load.");
_L5:
        return flag;
_L2:
        DocumentBuilderFactory documentbuilderfactory = DocumentBuilderFactory.newInstance();
        Document document = documentbuilderfactory.newDocumentBuilder().parse(memoryfile.getInputStream());
        flag = setVariables(document, variables);
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        Log.e("LanguageHelper", exception.getMessage());
        if(true) goto _L5; else goto _L4
_L4:
    }

    private static boolean setVariables(Document document, Variables variables) {
        boolean flag = false;
        NodeList nodelist = document.getElementsByTagName("strings");
        if(nodelist.getLength() > 0) {
            NodeList nodelist1 = ((Element)nodelist.item(0)).getElementsByTagName("string");
            for(int i = 0; i < nodelist1.getLength(); i++) {
                Element element = (Element)nodelist1.item(i);
                (new IndexedStringVariable(element.getAttribute("name"), variables)).set(element.getAttribute("value"));
            }

            flag = true;
        }
        return flag;
    }

    private static final String DEFAULT_STRING_FILE_PATH = "strings/strings.xml";
    private static final String LOG_TAG = "LanguageHelper";
    private static final String STRING_FILE_PATH = "strings/strings.xml";
    private static final String STRING_ROOT_TAG = "strings";
    private static final String STRING_TAG = "string";
}
