// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) nonlb 

package com.android.internal.policy.impl;

import android.content.*;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.Handler;
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyCharacterMap;
import java.net.URISyntaxException;

class ShortcutManager extends ContentObserver {

    public ShortcutManager(Context context, Handler handler) {
        super(handler);
        mContext = context;
        mShortcutIntents = new SparseArray();
    }

    private void updateShortcuts() {
        Cursor cursor = mCursor;
        if(cursor.requery()) goto _L2; else goto _L1
_L1:
        Log.e("ShortcutManager", "ShortcutObserver could not re-query shortcuts.");
_L4:
        return;
_L2:
        mShortcutIntents.clear();
_L6:
        if(!cursor.moveToNext()) goto _L4; else goto _L3
_L3:
        int i = cursor.getInt(0);
        if(i == 0) goto _L6; else goto _L5
_L5:
        String s;
        Intent intent;
        s = cursor.getString(1);
        intent = null;
        Intent intent1 = Intent.getIntent(s);
        intent = intent1;
_L7:
        if(intent != null)
            mShortcutIntents.put(i, intent);
          goto _L6
          goto _L4
        URISyntaxException urisyntaxexception;
        urisyntaxexception;
        Log.w("ShortcutManager", "Intent URI for shortcut invalid.", urisyntaxexception);
          goto _L7
    }

    public Intent getIntent(KeyCharacterMap keycharactermap, int i, int j) {
        Intent intent = null;
        int k = keycharactermap.get(i, j);
        if(k != 0)
            intent = (Intent)mShortcutIntents.get(k);
        if(intent == null) {
            char c = Character.toLowerCase(keycharactermap.getDisplayLabel(i));
            if(c != 0)
                intent = (Intent)mShortcutIntents.get(c);
        }
        return intent;
    }

    public void observe() {
        mCursor = mContext.getContentResolver().query(android.provider.Settings.Bookmarks.CONTENT_URI, sProjection, null, null, null);
        mCursor.registerContentObserver(this);
        updateShortcuts();
    }

    public void onChange(boolean flag) {
        updateShortcuts();
    }

    private static final int COLUMN_INTENT = 1;
    private static final int COLUMN_SHORTCUT = 0;
    private static final String TAG = "ShortcutManager";
    private static final String sProjection[];
    private Context mContext;
    private Cursor mCursor;
    private SparseArray mShortcutIntents;

    static  {
        String as[] = new String[2];
        as[0] = "shortcut";
        as[1] = "intent";
        sProjection = as;
    }
}
