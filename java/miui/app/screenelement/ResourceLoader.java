// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.os.MemoryFile;
import android.text.TextUtils;
import java.util.Locale;
import org.w3c.dom.Element;

public abstract class ResourceLoader {

    public ResourceLoader() {
    }

    public abstract ResourceManager.BitmapInfo getBitmapInfo(String s, android.graphics.BitmapFactory.Options options);

    public abstract MemoryFile getFile(String s);

    public abstract Element getManifestRoot();

    public ResourceLoader setLocal(Locale locale) {
        if(locale != null) {
            mLanguageSuffix = locale.getLanguage();
            mLanguageCountrySuffix = locale.toString();
            if(TextUtils.equals(mLanguageSuffix, mLanguageCountrySuffix))
                mLanguageSuffix = null;
        }
        return this;
    }

    protected String mLanguageCountrySuffix;
    protected String mLanguageSuffix;
}
