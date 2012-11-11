.class Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;
.super Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;
.source "MiuiLockScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiLockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SmsPreviewListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 5
    .parameter
    .parameter "context"
    .parameter "c"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    const v0, 0x6030015

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;ILandroid/database/Cursor;)V

    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 20
    .parameter "view"
    .parameter "context"
    .parameter "c"

    .prologue
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;

    .local v12, views:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;
    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .local v1, address:Ljava/lang/String;
    const/4 v13, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .local v3, date:J
    const/4 v13, 0x3

    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .local v10, type:I
    const/4 v13, 0x4

    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .local v9, text:Ljava/lang/String;
    if-nez v9, :cond_26

    const-string v9, ""

    :cond_26
    const/4 v13, 0x7

    if-le v10, v13, :cond_4f

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_4f

    const/4 v13, 0x5

    :try_start_30
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .local v2, charset:Ljava/lang/Integer;
    if-eqz v2, :cond_4f

    new-instance v11, Lcom/google/android/mms/pdu/EncodedStringValue;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const-string v14, "iso-8859-1"

    invoke-virtual {v9, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v14

    invoke-direct {v11, v13, v14}, Lcom/google/android/mms/pdu/EncodedStringValue;-><init>(I[B)V

    .local v11, value:Lcom/google/android/mms/pdu/EncodedStringValue;
    invoke-virtual {v11}, Lcom/google/android/mms/pdu/EncodedStringValue;->getString()Ljava/lang/String;
    :try_end_4e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_30 .. :try_end_4e} :catch_ff

    move-result-object v9

    .end local v2           #charset:Ljava/lang/Integer;
    .end local v11           #value:Lcom/google/android/mms/pdu/EncodedStringValue;
    :cond_4f
    :goto_4f
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getContact(Ljava/lang/String;)Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;

    move-result-object v6

    .local v6, info:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;
    if-eqz v6, :cond_c2

    iget-object v13, v6, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_c2

    iget-object v13, v12, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->line1View:Landroid/widget/TextView;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v6, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getValidatedNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_83
    new-instance v5, Lmiui/security/ChooseLockSettingsHelper;

    move-object/from16 v0, p2

    invoke-direct {v5, v0}, Lmiui/security/ChooseLockSettingsHelper;-><init>(Landroid/content/Context;)V

    .local v5, helper:Lmiui/security/ChooseLockSettingsHelper;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const-string v14, "pref_key_enable_notification_body"

    const/4 v15, 0x1

    invoke-static {v13, v14, v15}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_fa

    const-string v13, "com.android.mms"

    move-object/from16 v0, p2

    invoke-static {v0, v13}, Lmiui/net/FirewallManager;->isAccessControlProtected(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_a8

    invoke-virtual {v5}, Lmiui/security/ChooseLockSettingsHelper;->isACLockEnabled()Z

    move-result v13

    if-nez v13, :cond_fa

    :cond_a8
    invoke-virtual {v5}, Lmiui/security/ChooseLockSettingsHelper;->isPrivacyModeEnabled()Z

    move-result v13

    if-nez v13, :cond_fa

    const/4 v8, 0x1

    .local v8, showBodySetting:Z
    :goto_af
    iget-object v13, v12, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->textView:Landroid/widget/TextView;

    if-eqz v8, :cond_fc

    .end local v9           #text:Ljava/lang/String;
    :goto_b3
    invoke-virtual {v13, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v13, v12, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->dateView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->formatDate(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .end local v5           #helper:Lmiui/security/ChooseLockSettingsHelper;
    .end local v8           #showBodySetting:Z
    .restart local v9       #text:Ljava/lang/String;
    :cond_c2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->mContext:Landroid/content/Context;

    invoke-static {v13, v1}, Lmiui/telephony/PhoneNumberUtils;->parseTelocationString(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .local v7, location:Ljava/lang/String;
    iget-object v14, v12, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->line1View:Landroid/widget/TextView;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_dc

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getValidatedNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :goto_d8
    invoke-virtual {v14, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_83

    :cond_dc
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getValidatedNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v15, "  "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_d8

    .end local v7           #location:Ljava/lang/String;
    .restart local v5       #helper:Lmiui/security/ChooseLockSettingsHelper;
    :cond_fa
    const/4 v8, 0x0

    goto :goto_af

    .restart local v8       #showBodySetting:Z
    :cond_fc
    const-string v9, ""

    goto :goto_b3

    .end local v5           #helper:Lmiui/security/ChooseLockSettingsHelper;
    .end local v6           #info:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;
    .end local v8           #showBodySetting:Z
    :catch_ff
    move-exception v13

    goto/16 :goto_4f
.end method

.method public markRead(Landroid/content/Context;I)V
    .registers 14
    .parameter "context"
    .parameter "position"

    .prologue
    const/4 v10, 0x0

    const/4 v8, 0x1

    invoke-virtual {p0, p2}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .local v0, c:Landroid/database/Cursor;
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .local v1, id:J
    const/4 v5, 0x3

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .local v3, type:I
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .local v4, values:Landroid/content/ContentValues;
    const/4 v5, 0x7

    if-ge v3, v5, :cond_36

    const-string v5, "seen"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Telephony$Sms$Inbox;->CONTENT_URI:Landroid/net/Uri;

    const-string v7, "_id=?"

    new-array v8, v8, [Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v5, v6, v4, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_35
    return-void

    :cond_36
    const-string v5, "seen"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/Telephony$Mms$Inbox;->CONTENT_URI:Landroid/net/Uri;

    const-string v7, "_id=?"

    new-array v8, v8, [Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v5, v6, v4, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_35
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .local v0, view:Landroid/view/View;
    new-instance v1, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;)V

    .local v1, views:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;
    const v2, 0x60b0033

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->line1View:Landroid/widget/TextView;

    const v2, 0x60b0037

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->textView:Landroid/widget/TextView;

    const v2, 0x60b0035

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter$ListItemViews;->dateView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object v0
.end method

.method protected onContentChanged()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    invoke-super {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->onContentChanged()V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_31

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pref_key_enable_notification"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v2, :cond_31

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "pref_key_enable_wake_up_screen"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v2, :cond_31

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$000(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    move-result-object v0

    const/16 v1, 0x61a8

    invoke-interface {v0, v1}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock(I)V

    :cond_31
    return-void
.end method

.method protected onQueryResultCount(I)V
    .registers 6
    .parameter "count"

    .prologue
    const/4 v3, 0x2

    if-lez p1, :cond_11

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->setSliderText(ILjava/lang/String;)V

    :cond_10
    :goto_10
    return-void

    :cond_11
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miui/internal/policy/impl/SlidingPanel;->getSliderTextVisibility(I)I

    move-result v1

    if-nez v1, :cond_10

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiLockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->setSliderText(ILjava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.DISMISS_NEW_MESSAGE_NOTIFICATION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, i:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_10
.end method
