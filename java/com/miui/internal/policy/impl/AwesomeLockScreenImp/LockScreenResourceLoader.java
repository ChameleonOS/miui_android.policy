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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import miui.content.res.ThemeResources;
import miui.content.res.ThemeResourcesSystem;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class LockScreenResourceLoader
    implements miui.app.screenelement.ResourceManager.ResourceLoader {

    public LockScreenResourceLoader() {
    }

    private boolean containsFile(String s) {
        return ThemeResources.getSystem().containsAwesomeLockscreenEntry(s);
    }

    public miui.app.screenelement.ResourceManager.BitmapInfo getBitmapInfo(String s, android.graphics.BitmapFactory.Options options) {
        miui.content.res.ThemeZipFile.ThemeFileInfo themefileinfo;
        themefileinfo = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s);
        if(themefileinfo == null)
            break MISSING_BLOCK_LABEL_87;
        miui.app.screenelement.ResourceManager.BitmapInfo bitmapinfo;
        if(themefileinfo.mDensity != 0)
            options.inDensity = themefileinfo.mDensity;
        Rect rect = new Rect();
        bitmapinfo = new miui.app.screenelement.ResourceManager.BitmapInfo(BitmapFactory.decodeStream(themefileinfo.mInput, rect, options), rect);
        Exception exception;
        OutOfMemoryError outofmemoryerror;
        try {
            themefileinfo.mInput.close();
        }
        catch(IOException ioexception2) { }
        return bitmapinfo;
        outofmemoryerror;
        Log.e("ResourceManager", outofmemoryerror.toString());
        try {
            themefileinfo.mInput.close();
        }
        catch(IOException ioexception1) { }
        bitmapinfo = null;
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_64;
        exception;
        try {
            themefileinfo.mInput.close();
        }
        catch(IOException ioexception) { }
        throw exception;
    }

    public MemoryFile getFile(String s) {
        miui.content.res.ThemeZipFile.ThemeFileInfo themefileinfo;
        byte abyte0[];
        themefileinfo = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s);
        if(themefileinfo == null)
            break MISSING_BLOCK_LABEL_102;
        abyte0 = new byte[0x10000];
        MemoryFile memoryfile;
        int k;
        memoryfile = new MemoryFile(null, (int)themefileinfo.mSize);
        int i = 0;
        do {
            int j = themefileinfo.mInput.read(abyte0, 0, 0x10000);
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
                IOException ioexception;
                IOException ioexception1;
                IOException ioexception2;
                OutOfMemoryError outofmemoryerror;
                IOException ioexception3;
                IOException ioexception4;
                try {
                    themefileinfo.mInput.close();
                }
                catch(IOException ioexception5) { }
            }
            return memoryfile;
        }
        try {
            themefileinfo.mInput.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception4) { }
        memoryfile = null;
        if(true)
            break MISSING_BLOCK_LABEL_93;
        outofmemoryerror;
        Log.e("ResourceManager", outofmemoryerror.toString());
        try {
            themefileinfo.mInput.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_102;
        ioexception1;
        Log.e("ResourceManager", ioexception1.toString());
        try {
            themefileinfo.mInput.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception2) { }
        if(false)
            ;
        else
            break MISSING_BLOCK_LABEL_102;
        exception;
        try {
            themefileinfo.mInput.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception) { }
        throw exception;
    }

    public Element getManifestRoot() {
        return getManifestRoot(null);
    }

    public Element getManifestRoot(String s) {
        DocumentBuilderFactory documentbuilderfactory;
        miui.content.res.ThemeZipFile.ThemeFileInfo themefileinfo;
        Log.i("LockScreenResourceLoader", (new StringBuilder()).append("getManifestRoot:").append(s).toString());
        documentbuilderfactory = DocumentBuilderFactory.newInstance();
        themefileinfo = null;
        Element element;
        boolean flag;
        DocumentBuilder documentbuilder = documentbuilderfactory.newDocumentBuilder();
        String s1 = "manifest.xml";
        if(!TextUtils.isEmpty(s)) {
            s1 = (new StringBuilder()).append("manifest_").append(s).append(".xml").toString();
            if(!containsFile(s1))
                s1 = "manifest.xml";
        }
        themefileinfo = ThemeResources.getSystem().getAwesomeLockscreenFileStream(s1);
        element = documentbuilder.parse(themefileinfo.mInput).getDocumentElement();
        Log.i("LockScreenResourceLoader", (new StringBuilder()).append("load root:").append(element.getNodeName()).append(" from: ").append(s1).toString());
        flag = element.getNodeName().equals("Lockscreen");
        {
label0:
            {
                {
                    if(!flag)
                        break label0;
                    Exception exception;
                    IOException ioexception;
                    Exception exception1;
                    IOException ioexception1;
                    IOException ioexception2;
                    if(themefileinfo != null)
                        try {
                            themefileinfo.mInput.close();
                        }
                        catch(IOException ioexception3) { }
                }
                return element;
            }
            if(themefileinfo != null)
                try {
                    themefileinfo.mInput.close();
                }
                // Misplaced declaration of an exception variable
                catch(IOException ioexception2) { }
        }
        element = null;
        if(true)
            break MISSING_BLOCK_LABEL_188;
        exception1;
        exception1.printStackTrace();
        if(themefileinfo != null)
            try {
                themefileinfo.mInput.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception1) { }
        break MISSING_BLOCK_LABEL_204;
        exception;
        if(themefileinfo != null)
            try {
                themefileinfo.mInput.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception) { }
        throw exception;
    }

    private static final String LOG_TAG = "LockScreenResourceLoader";
}
