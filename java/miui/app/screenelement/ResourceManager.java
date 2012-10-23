// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package miui.app.screenelement;

import android.graphics.*;
import android.graphics.drawable.*;
import android.os.MemoryFile;
import android.text.TextUtils;
import android.util.Log;
import java.util.*;
import org.w3c.dom.Element;

public class ResourceManager {
    public static interface ResourceLoader {

        public abstract BitmapInfo getBitmapInfo(String s, android.graphics.BitmapFactory.Options options);

        public abstract MemoryFile getFile(String s);

        public abstract Element getManifestRoot();

        public abstract Element getManifestRoot(String s);
    }

    public static class BitmapInfo {

        public final Bitmap mBitmap;
        public long mLastVisitTime;
        public final Rect mPadding;

        public BitmapInfo(Bitmap bitmap, Rect rect) {
            mBitmap = bitmap;
            mPadding = rect;
        }
    }


    public ResourceManager(ResourceLoader resourceloader) {
        mResourceLoader = resourceloader;
    }

    private BitmapInfo getBitmapInfo(String s) {
        BitmapInfo bitmapinfo;
        if(TextUtils.isEmpty(s)) {
            bitmapinfo = null;
        } else {
            bitmapinfo = (BitmapInfo)mBitmaps.get(s);
            if(bitmapinfo != null)
                bitmapinfo.mLastVisitTime = System.currentTimeMillis();
            else
            if(mFailedBitmaps.contains(s)) {
                bitmapinfo = null;
            } else {
                Log.i("ResourceManager", (new StringBuilder()).append("load image ").append(s).toString());
                boolean flag = true;
                android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
                options.inScaled = true;
                options.inTargetDensity = mTargetDensity;
                if(mExtraResourceScreenWidth != 0) {
                    options.inDensity = mExtraResourceDensity;
                    bitmapinfo = mResourceLoader.getBitmapInfo((new StringBuilder()).append(mExtraResourceFolder).append("/").append(s).toString(), options);
                    if(bitmapinfo != null)
                        flag = false;
                }
                if(bitmapinfo == null) {
                    options.inDensity = mResourceDensity;
                    bitmapinfo = mResourceLoader.getBitmapInfo(s, options);
                }
                if(bitmapinfo != null) {
                    if(!flag)
                        Log.i("ResourceManager", (new StringBuilder()).append("load image from extra resource: ").append(mExtraResourceFolder).toString());
                    bitmapinfo.mBitmap.setDensity(mTargetDensity);
                    bitmapinfo.mLastVisitTime = System.currentTimeMillis();
                    mBitmaps.put(s, bitmapinfo);
                } else {
                    mFailedBitmaps.add(s);
                    Log.e("ResourceManager", (new StringBuilder()).append("fail to load image: ").append(s).toString());
                }
            }
        }
        return bitmapinfo;
    }

    public void clear() {
        Iterator iterator = mBitmaps.values().iterator();
        do {
            if(!iterator.hasNext())
                break;
            BitmapInfo bitmapinfo = (BitmapInfo)iterator.next();
            if(bitmapinfo.mBitmap != null)
                bitmapinfo.mBitmap.recycle();
        } while(true);
        if(mMaskBitmaps != null) {
            Iterator iterator1 = mMaskBitmaps.values().iterator();
            do {
                if(!iterator1.hasNext())
                    break;
                Bitmap bitmap = (Bitmap)iterator1.next();
                if(!bitmap.isRecycled())
                    bitmap.recycle();
            } while(true);
        }
        if(mMaskBitmap != null && !mMaskBitmap.isRecycled()) {
            mMaskBitmap.recycle();
            mMaskBitmap = null;
        }
        mBitmaps.clear();
        mNinePatches.clear();
    }

    public Bitmap getBitmap(String s) {
        BitmapInfo bitmapinfo = getBitmapInfo(s);
        Bitmap bitmap;
        if(bitmapinfo != null)
            bitmap = bitmapinfo.mBitmap;
        else
            bitmap = null;
        return bitmap;
    }

    public Drawable getDrawable(String s) {
        BitmapInfo bitmapinfo = getBitmapInfo(s);
        Object obj;
        if(bitmapinfo == null || bitmapinfo.mBitmap == null) {
            obj = null;
        } else {
            Bitmap bitmap = bitmapinfo.mBitmap;
            if(bitmap.getNinePatchChunk() != null) {
                obj = new NinePatchDrawable(bitmap, bitmap.getNinePatchChunk(), bitmapinfo.mPadding, s);
                ((NinePatchDrawable) (obj)).setTargetDensity(mTargetDensity);
            } else {
                BitmapDrawable bitmapdrawable = new BitmapDrawable(bitmap);
                bitmapdrawable.setTargetDensity(mTargetDensity);
                obj = bitmapdrawable;
            }
        }
        return ((Drawable) (obj));
    }

    public MemoryFile getFile(String s) {
        return mResourceLoader.getFile(s);
    }

    public Element getManifestRoot() {
        return mResourceLoader.getManifestRoot();
    }

    public Element getManifestRoot(String s) {
        return mResourceLoader.getManifestRoot(s);
    }

    public Bitmap getMaskBufferBitmap(int i, int j, String s, boolean flag) {
        if(flag && mMaskBitmaps == null)
            mMaskBitmaps = new HashMap();
        Bitmap bitmap;
        if(flag)
            bitmap = (Bitmap)mMaskBitmaps.get(s);
        else
            bitmap = mMaskBitmap;
        if(bitmap == null || bitmap.getHeight() < j || bitmap.getWidth() < i) {
            if(bitmap != null) {
                int k = bitmap.getWidth();
                int l = bitmap.getHeight();
                i = Math.max(k, i);
                j = Math.max(l, j);
                if(!bitmap.isRecycled())
                    bitmap.recycle();
            }
            bitmap = Bitmap.createBitmap(i, j, android.graphics.Bitmap.Config.ARGB_8888);
            bitmap.setDensity(mResourceDensity);
            if(flag)
                mMaskBitmaps.put(s, bitmap);
            else
                mMaskBitmap = bitmap;
        }
        return bitmap;
    }

    public NinePatch getNinePatch(String s) {
        NinePatch ninepatch = (NinePatch)mNinePatches.get(s);
        if(ninepatch == null) {
            Bitmap bitmap = getBitmap(s);
            if(bitmap != null && bitmap.getNinePatchChunk() != null) {
                ninepatch = new NinePatch(bitmap, bitmap.getNinePatchChunk(), null);
                mNinePatches.put(s, ninepatch);
            }
        }
        return ninepatch;
    }

    public void setExtraResource(int i) {
        mExtraResourceScreenWidth = i;
        mExtraResourceFolder = (new StringBuilder()).append("sw").append(i).toString();
        mExtraResourceDensity = (i * 240) / 480;
    }

    public void setResourceDensity(int i) {
        mResourceDensity = i;
    }

    public void setTargetDensity(int i) {
        mTargetDensity = i;
    }

    private static final int DEFAULT_DENSITY = 240;
    private static final int DEFAULT_SCREEN_WIDTH = 480;
    private static final String LOG_TAG = "ResourceManager";
    protected final HashMap mBitmaps = new HashMap();
    private int mExtraResourceDensity;
    private String mExtraResourceFolder;
    private int mExtraResourceScreenWidth;
    private final HashSet mFailedBitmaps = new HashSet();
    private Bitmap mMaskBitmap;
    private HashMap mMaskBitmaps;
    private final HashMap mNinePatches = new HashMap();
    private int mResourceDensity;
    private final ResourceLoader mResourceLoader;
    private int mTargetDensity;
}
