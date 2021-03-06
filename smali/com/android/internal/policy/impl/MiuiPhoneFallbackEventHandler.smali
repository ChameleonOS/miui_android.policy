.class public Lcom/android/internal/policy/impl/MiuiPhoneFallbackEventHandler;
.super Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;
.source "MiuiPhoneFallbackEventHandler.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected handleCameraKeyEvent()V
    .registers 10

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v0, 0x0

    .local v0, id:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "camera_key_preferred_action_type"

    invoke-static {v4, v5, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .local v3, type:I
    if-ne v8, v3, :cond_1e

    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "camera_key_preferred_action_shortcut_id"

    const/4 v6, -0x1

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    :cond_1e
    const/4 v2, 0x0

    .local v2, mappedKeyCode:I
    packed-switch v0, :pswitch_data_58

    :goto_22
    if-eqz v2, :cond_4a

    new-instance v1, Landroid/view/KeyEvent;

    invoke-direct {v1, v7, v2}, Landroid/view/KeyEvent;-><init>(II)V

    .local v1, mappedEvent:Landroid/view/KeyEvent;
    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;->mView:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v4

    if-nez v4, :cond_34

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneFallbackEventHandler;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    :cond_34
    new-instance v1, Landroid/view/KeyEvent;

    .end local v1           #mappedEvent:Landroid/view/KeyEvent;
    invoke-direct {v1, v8, v2}, Landroid/view/KeyEvent;-><init>(II)V

    .restart local v1       #mappedEvent:Landroid/view/KeyEvent;
    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;->mView:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v4

    if-nez v4, :cond_44

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiPhoneFallbackEventHandler;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .end local v1           #mappedEvent:Landroid/view/KeyEvent;
    :cond_44
    :goto_44
    return-void

    :pswitch_45
    const/4 v2, 0x5

    goto :goto_22

    :pswitch_47
    const/16 v2, 0x54

    goto :goto_22

    :cond_4a
    iget-object v4, p0, Lcom/android/internal/policy/impl/PhoneFallbackEventHandler;->mContext:Landroid/content/Context;

    new-instance v5, Landroid/content/Intent;

    const-string v6, "com.miui.app.ExtraStatusBarManager.TRIGGER_CAMERA_KEY"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_44

    nop

    :pswitch_data_58
    .packed-switch 0x2
        :pswitch_47
        :pswitch_45
    .end packed-switch
.end method
