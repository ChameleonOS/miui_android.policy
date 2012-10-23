// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.miui.internal.policy.impl.AwesomeLockScreenImp;

import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.os.MemoryFile;
import android.text.TextUtils;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.*;
import miui.content.res.ThemeResources;
import miui.content.res.ThemeResourcesSystem;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

public class LockScreenResourceLoader
    implements miui.app.screenelement.ResourceManager.ResourceLoader {

    public LockScreenResourceLoader() {
    }

    private boolean containsFile(String s) {
        return ThemeResources.getSystem().containsAwesomeLockscreenEntry(s);
    }

    public miui.app.screenelement.ResourceManager.BitmapInfo getBitmapInfo(String s, android.graphics.BitmapFactory.Options options) {
        InputStream inputstream;
        inputstream = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s, null);
        if(inputstream == null)
            break MISSING_BLOCK_LABEL_64;
        miui.app.screenelement.ResourceManager.BitmapInfo bitmapinfo;
        Rect rect = new Rect();
        bitmapinfo = new miui.app.screenelement.ResourceManager.BitmapInfo(BitmapFactory.decodeStream(inputstream, rect, options), rect);
        Exception exception;
        OutOfMemoryError outofmemoryerror;
        try {
            inputstream.close();
        }
        catch(IOException ioexception) { }
        return bitmapinfo;
        outofmemoryerror;
        Log.e("ResourceManager", outofmemoryerror.toString());
        try {
            inputstream.close();
        }
        catch(IOException ioexception2) { }
        bitmapinfo = null;
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_44;
        exception;
        try {
            inputstream.close();
        }
        catch(IOException ioexception1) { }
        throw exception;
    }

    public MemoryFile getFile(String s) {
        int ai[];
        InputStream inputstream;
        byte abyte0[];
        ai = new int[1];
        inputstream = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s, ai);
        if(inputstream == null)
            break MISSING_BLOCK_LABEL_100;
        abyte0 = new byte[0x10000];
        MemoryFile memoryfile;
        int k;
        memoryfile = new MemoryFile(null, ai[0]);
        int i = 0;
        do {
            int j = inputstream.read(abyte0, 0, 0x10000);
            if(j <= 0)
                break;
            memoryfile.writeBytes(abyte0, 0, i, j);
            i += j;
        } while(true);
        k = memoryfile.length();
label0:
        {
            {
                if(k <= 0)
                    break label0;
                Exception exception;
                IOException ioexception1;
                IOException ioexception2;
                OutOfMemoryError outofmemoryerror;
                IOException ioexception3;
                try {
                    inputstream.close();
                }
                catch(IOException ioexception5) { }
            }
            return memoryfile;
        }
        try {
            inputstream.close();
        }
        catch(IOException ioexception4) { }
        memoryfile = null;
        if(true)
            break MISSING_BLOCK_LABEL_93;
        outofmemoryerror;
        Log.e("ResourceManager", outofmemoryerror.toString());
        try {
            inputstream.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_100;
        ioexception1;
        Log.e("ResourceManager", ioexception1.toString());
        try {
            inputstream.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception2) { }
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_100;
        exception;
        try {
            inputstream.close();
        }
        catch(IOException ioexception) { }
        throw exception;
    }

    public Element getManifestRoot() {
        return getManifestRoot(null);
    }

    public Element getManifestRoot(String s) {
        DocumentBuilderFactory documentbuilderfactory;
        InputStream inputstream;
        Log.i("LockScreenResourceLoader", (new StringBuilder()).append("getManifestRoot:").append(s).toString());
        documentbuilderfactory = DocumentBuilderFactory.newInstance();
        inputstream = null;
        Element element;
        boolean flag;
        DocumentBuilder documentbuilder = documentbuilderfactory.newDocumentBuilder();
        String s1 = "manifest.xml";
        if(!TextUtils.isEmpty(s)) {
            s1 = (new StringBuilder()).append("manifest_").append(s).append(".xml").toString();
            if(!containsFile(s1))
                s1 = "manifest.xml";
        }
        inputstream = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s1, null);
        element = documentbuilder.parse(inputstream).getDocumentElement();
        Log.i("LockScreenResourceLoader", (new StringBuilder()).append("load root:").append(element.getNodeName()).append(" from: ").append(s1).toString());
        flag = element.getNodeName().equals("Lockscreen");
        {
label0:
            {
                {
                    if(!flag)
                        break label0;
                    Exception exception;
                    Exception exception1;
                    IOException ioexception1;
                    IOException ioexception2;
                    IOException ioexception3;
                    SAXException saxexception;
                    IOException ioexception4;
                    ParserConfigurationException parserconfigurationexception;
                    IOException ioexception5;
                    if(inputstream != null)
                        try {
                            inputstream.close();
                        }
                        catch(IOException ioexception7) { }
                }
                return element;
            }
            if(inputstream != null)
                try {
                    inputstream.close();
                }
                catch(IOException ioexception6) { }
        }
        element = null;
        if(true)
            break MISSING_BLOCK_LABEL_183;
        parserconfigurationexception;
        parserconfigurationexception.printStackTrace();
        if(inputstream != null)
            try {
                inputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception5) { }
        break MISSING_BLOCK_LABEL_196;
        saxexception;
        saxexception.printStackTrace();
        if(inputstream != null)
            try {
                inputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception4) { }
        break MISSING_BLOCK_LABEL_196;
        ioexception2;
        ioexception2.printStackTrace();
        if(inputstream != null)
            try {
                inputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_196;
        exception1;
        exception1.printStackTrace();
        if(inputstream != null)
            try {
                inputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception1) { }
        break MISSING_BLOCK_LABEL_196;
        exception;
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception) { }
        throw exception;
    }

    private static final String LOG_TAG = "LockScreenResourceLoader";
}
