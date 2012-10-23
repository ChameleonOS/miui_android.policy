// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement.util;

import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.os.MemoryFile;
import android.text.TextUtils;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import javax.xml.parsers.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

// Referenced classes of package miui.app.screenelement.util:
//            Utils

public class ZipResourceLoader
    implements miui.app.screenelement.ResourceManager.ResourceLoader {

    public ZipResourceLoader(String s) {
        this(s, null, "manifest.xml");
    }

    public ZipResourceLoader(String s, String s1) {
        this(s, s1, "manifest.xml");
    }

    public ZipResourceLoader(String s, String s1, String s2) {
        if(TextUtils.isEmpty(s))
            throw new IllegalArgumentException("empty zip path");
        mResourcePath = s;
        if(s1 == null)
            s1 = "";
        mInnerPath = s1;
        mManifestName = s2;
    }

    public miui.app.screenelement.ResourceManager.BitmapInfo getBitmapInfo(String s, android.graphics.BitmapFactory.Options options) {
        miui.app.screenelement.ResourceManager.BitmapInfo bitmapinfo;
        ZipFile zipfile;
        InputStream inputstream;
        bitmapinfo = null;
        zipfile = null;
        inputstream = null;
        ZipFile zipfile1 = new ZipFile(mResourcePath);
        Rect rect;
        android.graphics.Bitmap bitmap;
        ZipEntry zipentry = zipfile1.getEntry((new StringBuilder()).append(mInnerPath).append(s).toString());
        if(zipentry == null)
            break MISSING_BLOCK_LABEL_148;
        inputstream = zipfile1.getInputStream(zipentry);
        rect = new Rect();
        bitmap = BitmapFactory.decodeStream(inputstream, rect, options);
        IOException ioexception;
        Exception exception;
        OutOfMemoryError outofmemoryerror;
label0:
        {
            {
                if(bitmap != null)
                    break label0;
                IOException ioexception3;
                IOException ioexception5;
                IOException ioexception7;
                miui.app.screenelement.ResourceManager.BitmapInfo bitmapinfo1;
                if(inputstream != null)
                    try {
                        inputstream.close();
                    }
                    catch(IOException ioexception12) { }
                if(zipfile1 != null)
                    try {
                        zipfile1.close();
                    }
                    catch(IOException ioexception11) { }
            }
            return bitmapinfo;
        }
        bitmapinfo1 = new miui.app.screenelement.ResourceManager.BitmapInfo(bitmap, rect);
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception10) { }
        if(zipfile1 != null)
            try {
                zipfile1.close();
            }
            catch(IOException ioexception9) { }
        bitmapinfo = bitmapinfo1;
        break MISSING_BLOCK_LABEL_107;
        if(false)
            try {
                throw null;
            }
            catch(IOException ioexception8) { }
        if(zipfile1 != null)
            try {
                zipfile1.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception7) { }
        break MISSING_BLOCK_LABEL_107;
        ioexception;
_L6:
        Log.e("MAML_ZipResourceLoader", ioexception.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception4) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_107;
        outofmemoryerror;
_L4:
        Log.e("MAML_ZipResourceLoader", outofmemoryerror.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception6) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception5) { }
        break MISSING_BLOCK_LABEL_107;
        exception;
_L2:
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception2) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            catch(IOException ioexception1) { }
        throw exception;
        exception;
        zipfile = zipfile1;
        if(true) goto _L2; else goto _L1
_L1:
        outofmemoryerror;
        zipfile = zipfile1;
        if(true) goto _L4; else goto _L3
_L3:
        ioexception;
        zipfile = zipfile1;
        if(true) goto _L6; else goto _L5
_L5:
    }

    public MemoryFile getFile(String s) {
        ZipFile zipfile;
        InputStream inputstream;
        zipfile = null;
        inputstream = null;
        ZipFile zipfile1 = new ZipFile(mResourcePath);
        int i;
        InputStream inputstream1;
        ZipEntry zipentry = zipfile1.getEntry((new StringBuilder()).append(mInnerPath).append(s).toString());
        if(zipentry == null)
            break MISSING_BLOCK_LABEL_190;
        i = (int)zipentry.getSize();
        inputstream1 = zipfile1.getInputStream(zipentry);
        IOException ioexception;
        Exception exception;
        OutOfMemoryError outofmemoryerror;
label0:
        {
            {
                inputstream = inputstream1;
                if(inputstream != null)
                    break label0;
                IOException ioexception3;
                MemoryFile memoryfile;
                IOException ioexception5;
                IOException ioexception7;
                byte abyte0[];
                int j;
                int k;
                int l;
                if(inputstream != null)
                    try {
                        inputstream.close();
                    }
                    catch(IOException ioexception12) { }
                if(zipfile1 != null)
                    try {
                        zipfile1.close();
                    }
                    catch(IOException ioexception11) { }
                memoryfile = null;
            }
            return memoryfile;
        }
        abyte0 = new byte[0x10000];
        memoryfile = new MemoryFile(null, i);
        j = 0;
        do {
            k = inputstream.read(abyte0, 0, 0x10000);
            if(k <= 0)
                break;
            memoryfile.writeBytes(abyte0, 0, j, k);
            j += k;
        } while(true);
        l = memoryfile.length();
        if(l > 0) {
            if(inputstream != null)
                try {
                    inputstream.close();
                }
                catch(IOException ioexception10) { }
            if(zipfile1 != null)
                try {
                    zipfile1.close();
                }
                catch(IOException ioexception9) { }
            continue; /* Loop/switch isn't completed */
        }
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception8) { }
        if(zipfile1 != null)
            try {
                zipfile1.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception7) { }
        memoryfile = null;
        if(true) goto _L2; else goto _L1
_L1:
        break MISSING_BLOCK_LABEL_219;
_L2:
        break MISSING_BLOCK_LABEL_95;
        ioexception;
_L8:
        Log.e("MAML_ZipResourceLoader", ioexception.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception4) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_208;
        outofmemoryerror;
_L6:
        Log.e("MAML_ZipResourceLoader", outofmemoryerror.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception6) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception5) { }
        break MISSING_BLOCK_LABEL_208;
        exception;
_L4:
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception2) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            catch(IOException ioexception1) { }
        throw exception;
        exception;
        zipfile = zipfile1;
        if(true) goto _L4; else goto _L3
_L3:
        outofmemoryerror;
        zipfile = zipfile1;
        if(true) goto _L6; else goto _L5
_L5:
        ioexception;
        zipfile = zipfile1;
        if(true) goto _L8; else goto _L7
_L7:
    }

    public Element getManifestRoot() {
        return getManifestRoot(null);
    }

    public Element getManifestRoot(String s) {
        Element element;
        ZipFile zipfile;
        InputStream inputstream;
        element = null;
        zipfile = null;
        inputstream = null;
        ZipFile zipfile1 = new ZipFile(mResourcePath);
        InputStream inputstream1;
        mManifestName;
        if(!TextUtils.isEmpty(s)) {
            String s1 = Utils.addFileNameSuffix(mManifestName, s);
            if(zipfile1.getEntry((new StringBuilder()).append(mInnerPath).append(s1).toString()) != null) {
                mManifestName;
            }
        }
        ZipEntry zipentry = zipfile1.getEntry((new StringBuilder()).append(mInnerPath).append(mManifestName).toString());
        if(zipentry == null)
            break MISSING_BLOCK_LABEL_197;
        inputstream1 = zipfile1.getInputStream(zipentry);
        IOException ioexception;
        Exception exception;
        OutOfMemoryError outofmemoryerror;
        ParserConfigurationException parserconfigurationexception;
        SAXException saxexception;
        Exception exception1;
label0:
        {
            {
                inputstream = inputstream1;
                if(inputstream != null)
                    break label0;
                IOException ioexception3;
                IOException ioexception5;
                IOException ioexception7;
                IOException ioexception9;
                IOException ioexception11;
                IOException ioexception13;
                Element element1;
                if(inputstream != null)
                    try {
                        inputstream.close();
                    }
                    catch(IOException ioexception18) { }
                if(zipfile1 != null)
                    try {
                        zipfile1.close();
                    }
                    catch(IOException ioexception17) { }
            }
            return element;
        }
        element1 = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(inputstream).getDocumentElement();
        element = element1;
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception16) { }
        if(zipfile1 != null)
            try {
                zipfile1.close();
            }
            catch(IOException ioexception15) { }
        break MISSING_BLOCK_LABEL_151;
        if(false)
            try {
                throw null;
            }
            catch(IOException ioexception14) { }
        if(zipfile1 != null)
            try {
                zipfile1.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception13) { }
        break MISSING_BLOCK_LABEL_151;
        ioexception;
_L12:
        Log.e("MAML_ZipResourceLoader", ioexception.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception4) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception3) { }
        break MISSING_BLOCK_LABEL_151;
        outofmemoryerror;
_L10:
        Log.e("MAML_ZipResourceLoader", outofmemoryerror.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception6) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception5) { }
        break MISSING_BLOCK_LABEL_151;
        parserconfigurationexception;
_L8:
        Log.e("MAML_ZipResourceLoader", parserconfigurationexception.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception8) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception7) { }
        break MISSING_BLOCK_LABEL_151;
        saxexception;
_L6:
        Log.e("MAML_ZipResourceLoader", saxexception.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception10) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception9) { }
        break MISSING_BLOCK_LABEL_151;
        exception1;
_L4:
        Log.e("MAML_ZipResourceLoader", exception1.toString());
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception12) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception11) { }
        break MISSING_BLOCK_LABEL_151;
        exception;
_L2:
        if(inputstream != null)
            try {
                inputstream.close();
            }
            catch(IOException ioexception2) { }
        if(zipfile != null)
            try {
                zipfile.close();
            }
            catch(IOException ioexception1) { }
        throw exception;
        exception;
        zipfile = zipfile1;
        if(true) goto _L2; else goto _L1
_L1:
        exception1;
        zipfile = zipfile1;
        if(true) goto _L4; else goto _L3
_L3:
        saxexception;
        zipfile = zipfile1;
        if(true) goto _L6; else goto _L5
_L5:
        parserconfigurationexception;
        zipfile = zipfile1;
        if(true) goto _L8; else goto _L7
_L7:
        outofmemoryerror;
        zipfile = zipfile1;
        if(true) goto _L10; else goto _L9
_L9:
        ioexception;
        zipfile = zipfile1;
        if(true) goto _L12; else goto _L11
_L11:
    }

    private static final String MANIFEST_FILE_NAME = "manifest.xml";
    private static final String TAG = "MAML_ZipResourceLoader";
    private String mInnerPath;
    private String mManifestName;
    private String mResourcePath;
}
