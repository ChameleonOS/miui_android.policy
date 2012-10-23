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
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "handler"

    .prologue
    .line 791
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    .line 792
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 793
    return-void
.end method


# virtual methods
.method observe()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 796
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 797
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "trackball_wake_screen"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 799
    const-string v1, "camera_key_preferred_action_type"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 801
    const-string v1, "camera_key_preferred_action_shortcut_id"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 803
    const-string v1, "volumekey_wake_screen"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 805
    const-string v1, "screen_buttons_state"

    invoke-static {v1}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 808
    invoke-virtual {p0, v2}, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->onChange(Z)V

    .line 809
    return-void
.end method

.method public onChange(Z)V
    .registers 11
    .parameter "selfChange"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 812
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v5, v4, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 813
    :try_start_7
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    iget-object v4, v4, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 814
    .local v1, resolver:Landroid/content/ContentResolver;
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v4, "screen_buttons_state"

    const/4 v7, 0x0

    invoke-static {v1, v4, v7}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_52

    move v4, v2

    :goto_1b
    iput-boolean v4, v6, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mScreenButtonsDisabled:Z

    .line 817
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v4, "trackball_wake_screen"

    const/4 v7, 0x0

    invoke-static {v1, v4, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_54

    move v4, v2

    :goto_29
    iput-boolean v4, v6, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mTrackballWakeScreen:Z

    .line 819
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const-string v4, "volumekey_wake_screen"

    const/4 v7, 0x0

    invoke-static {v1, v4, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_56

    move v4, v2

    :goto_37
    iput-boolean v4, v6, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mVolumeKeyWakeScreen:Z

    .line 822
    const-string v4, "camera_key_preferred_action_type"

    const/4 v6, 0x0

    invoke-static {v1, v4, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 825
    .local v0, cameraKeyActionType:I
    if-ne v2, v0, :cond_5a

    .line 826
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v6, 0x4

    const-string v7, "camera_key_preferred_action_shortcut_id"

    const/4 v8, -0x1

    invoke-static {v1, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-ne v6, v7, :cond_58

    :goto_4e
    iput-boolean v2, v4, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    .line 835
    :goto_50
    monitor-exit v5

    .line 836
    return-void

    .end local v0           #cameraKeyActionType:I
    :cond_52
    move v4, v3

    .line 814
    goto :goto_1b

    :cond_54
    move v4, v3

    .line 817
    goto :goto_29

    :cond_56
    move v4, v3

    .line 819
    goto :goto_37

    .restart local v0       #cameraKeyActionType:I
    :cond_58
    move v2, v3

    .line 826
    goto :goto_4e

    .line 833
    :cond_5a
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager$MiuiSettingsObserver;->this$0:Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/android/internal/policy/impl/MiuiPhoneWindowManager;->mCameraKeyWakeScreen:Z

    goto :goto_50

    .line 835
    .end local v0           #cameraKeyActionType:I
    .end local v1           #resolver:Landroid/content/ContentResolver;
    :catchall_60
    move-exception v2

    monitor-exit v5
    :try_end_62
    .catchall {:try_start_7 .. :try_end_62} :catchall_60

    throw v2
.end method
