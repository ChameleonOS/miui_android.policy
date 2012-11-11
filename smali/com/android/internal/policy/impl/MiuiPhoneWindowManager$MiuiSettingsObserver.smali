.class Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;
.super Landroid/database/ContentObserver;
.source "MiuiPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MiuiSettingsObserver"
.end annotation


# instance fields
.field private mScreenButtonNotification:Landroid/app/Notification;

.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "handler"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method observe()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "trackball_wake_screen"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const-string v1, "camera_key_preferred_action_type"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const-string v1, "camera_key_preferred_action_shortcut_id"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const-string v1, "volumekey_wake_screen"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const-string v1, "screen_buttons_state"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->onChange(Z)V

    return-void
.end method

.method public onChange(Z)V
    .registers 14
    .parameter "selfChange"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v8, v7, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLock:Ljava/lang/Object;

    monitor-enter v8

    :try_start_7
    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v7, v7, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .local v4, resolver:Landroid/content/ContentResolver;
    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v7, "screen_buttons_state"

    const/4 v10, 0x0

    invoke-static {v4, v7, v10}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_cc

    move v7, v5

    :goto_1b
    iput-boolean v7, v9, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    if-nez v7, :cond_cf

    move v2, v5

    .local v2, isFirst:Z
    :goto_22
    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    if-nez v7, :cond_7c

    new-instance v1, Landroid/content/Intent;

    const-string v7, "com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_SCREEN_BUTTONS"

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v1, intent:Landroid/content/Intent;
    new-instance v7, Landroid/app/Notification$Builder;

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v9, v9, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v7, v9}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v7, v9, v10}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v7

    const v9, 0x60201f0

    invoke-virtual {v7, v9}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v7

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v9, v9, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    const v10, 0x60c022c

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v9, v9, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    const v10, 0x60c022d

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v7

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v9, v9, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v1, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    .end local v1           #intent:Landroid/content/Intent;
    :cond_7c
    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v7, v7, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    const-string v9, "notification"

    invoke-virtual {v7, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .local v3, notificationManager:Landroid/app/NotificationManager;
    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-boolean v7, v7, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    if-eqz v7, :cond_d2

    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    iget v7, v7, Landroid/app/Notification;->icon:I

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    invoke-virtual {v3, v7, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_97
    :goto_97
    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v7, "trackball_wake_screen"

    const/4 v10, 0x0

    invoke-static {v4, v7, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_df

    move v7, v5

    :goto_a3
    iput-boolean v7, v9, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTrackballWakeScreen:Z

    iget-object v9, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v7, "volumekey_wake_screen"

    const/4 v10, 0x0

    invoke-static {v4, v7, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_e1

    move v7, v5

    :goto_b1
    iput-boolean v7, v9, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeKeyWakeScreen:Z

    const-string v7, "camera_key_preferred_action_type"

    const/4 v9, 0x0

    invoke-static {v4, v7, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, cameraKeyActionType:I
    if-ne v5, v0, :cond_e5

    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v9, 0x4

    const-string v10, "camera_key_preferred_action_shortcut_id"

    const/4 v11, -0x1

    invoke-static {v4, v10, v11}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    if-ne v9, v10, :cond_e3

    :goto_c8
    iput-boolean v5, v7, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    :goto_ca
    monitor-exit v8

    return-void

    .end local v0           #cameraKeyActionType:I
    .end local v2           #isFirst:Z
    .end local v3           #notificationManager:Landroid/app/NotificationManager;
    :cond_cc
    move v7, v6

    goto/16 :goto_1b

    :cond_cf
    move v2, v6

    goto/16 :goto_22

    .restart local v2       #isFirst:Z
    .restart local v3       #notificationManager:Landroid/app/NotificationManager;
    :cond_d2
    if-nez v2, :cond_97

    iget-object v7, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->mScreenButtonNotification:Landroid/app/Notification;

    iget v7, v7, Landroid/app/Notification;->icon:I

    invoke-virtual {v3, v7}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_97

    .end local v2           #isFirst:Z
    .end local v3           #notificationManager:Landroid/app/NotificationManager;
    .end local v4           #resolver:Landroid/content/ContentResolver;
    :catchall_dc
    move-exception v5

    monitor-exit v8
    :try_end_de
    .catchall {:try_start_7 .. :try_end_de} :catchall_dc

    throw v5

    .restart local v2       #isFirst:Z
    .restart local v3       #notificationManager:Landroid/app/NotificationManager;
    .restart local v4       #resolver:Landroid/content/ContentResolver;
    :cond_df
    move v7, v6

    goto :goto_a3

    :cond_e1
    move v7, v6

    goto :goto_b1

    .restart local v0       #cameraKeyActionType:I
    :cond_e3
    move v5, v6

    goto :goto_c8

    :cond_e5
    :try_start_e5
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z
    :try_end_ea
    .catchall {:try_start_e5 .. :try_end_ea} :catchall_dc

    goto :goto_ca
.end method
