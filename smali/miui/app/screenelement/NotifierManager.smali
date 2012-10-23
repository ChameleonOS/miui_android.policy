.class public final Lmiui/app/screenelement/NotifierManager;
.super Ljava/lang/Object;
.source "NotifierManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/NotifierManager$1;,
        Lmiui/app/screenelement/NotifierManager$VolumeChangedNotifier;,
        Lmiui/app/screenelement/NotifierManager$RingModeNotifier;,
        Lmiui/app/screenelement/NotifierManager$WifiNotifier;,
        Lmiui/app/screenelement/NotifierManager$MobileDataNotifier;,
        Lmiui/app/screenelement/NotifierManager$BluetoothNotifier;,
        Lmiui/app/screenelement/NotifierManager$UsbStateNotifier;,
        Lmiui/app/screenelement/NotifierManager$BatteryNotifier;,
        Lmiui/app/screenelement/NotifierManager$BroadcastNotifier;,
        Lmiui/app/screenelement/NotifierManager$BaseNotifier;,
        Lmiui/app/screenelement/NotifierManager$OnNotifyListener;,
        Lmiui/app/screenelement/NotifierManager$NotifierType;
    }
.end annotation


# static fields
.field private static DBG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "NotifierManager"

.field private static sInstance:Lmiui/app/screenelement/NotifierManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mNotifiers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lmiui/app/screenelement/NotifierManager$NotifierType;",
            "Lmiui/app/screenelement/NotifierManager$BaseNotifier;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    const/4 v0, 0x1

    sput-boolean v0, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "c"

    .prologue
    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    .line 39
    iput-object p1, p0, Lmiui/app/screenelement/NotifierManager;->mContext:Landroid/content/Context;

    .line 40
    return-void
.end method

.method static synthetic access$000()Z
    .registers 1

    .prologue
    .line 19
    sget-boolean v0, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    return v0
.end method

.method private static createNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Landroid/content/Context;)Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    .registers 4
    .parameter "t"
    .parameter "c"

    .prologue
    .line 43
    sget-object v0, Lmiui/app/screenelement/NotifierManager$1;->$SwitchMap$miui$app$screenelement$NotifierManager$NotifierType:[I

    invoke-virtual {p0}, Lmiui/app/screenelement/NotifierManager$NotifierType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_38

    .line 59
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 45
    :pswitch_d
    new-instance v0, Lmiui/app/screenelement/NotifierManager$BatteryNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$BatteryNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 47
    :pswitch_13
    new-instance v0, Lmiui/app/screenelement/NotifierManager$UsbStateNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$UsbStateNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 49
    :pswitch_19
    new-instance v0, Lmiui/app/screenelement/NotifierManager$BluetoothNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$BluetoothNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 51
    :pswitch_1f
    new-instance v0, Lmiui/app/screenelement/NotifierManager$RingModeNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$RingModeNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 53
    :pswitch_25
    new-instance v0, Lmiui/app/screenelement/NotifierManager$MobileDataNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$MobileDataNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 55
    :pswitch_2b
    new-instance v0, Lmiui/app/screenelement/NotifierManager$WifiNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$WifiNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 57
    :pswitch_31
    new-instance v0, Lmiui/app/screenelement/NotifierManager$VolumeChangedNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$VolumeChangedNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    .line 43
    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_d
        :pswitch_13
        :pswitch_19
        :pswitch_1f
        :pswitch_25
        :pswitch_2b
        :pswitch_31
    .end packed-switch
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lmiui/app/screenelement/NotifierManager;
    .registers 3
    .parameter "c"

    .prologue
    .line 63
    const-class v1, Lmiui/app/screenelement/NotifierManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;

    if-nez v0, :cond_e

    .line 64
    new-instance v0, Lmiui/app/screenelement/NotifierManager;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/NotifierManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;

    .line 66
    :cond_e
    sget-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 63
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized acquireNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V
    .registers 7
    .parameter "t"
    .parameter "l"

    .prologue
    .line 74
    monitor-enter p0

    :try_start_1
    sget-boolean v1, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    if-eqz v1, :cond_2f

    .line 75
    const-string v1, "NotifierManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "acquireNotifier:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lmiui/app/screenelement/NotifierManager$NotifierType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :cond_2f
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;

    .line 78
    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_4b

    .line 79
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mContext:Landroid/content/Context;

    invoke-static {p1, v1}, Lmiui/app/screenelement/NotifierManager;->createNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Landroid/content/Context;)Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_3e
    .catchall {:try_start_1 .. :try_end_3e} :catchall_55

    move-result-object v0

    .line 80
    if-nez v0, :cond_43

    .line 89
    :goto_41
    monitor-exit p0

    return-void

    .line 83
    :cond_43
    :try_start_43
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->init()V

    .line 84
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    :cond_4b
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    .line 87
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addRef()I

    .line 88
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addActiveRef()I
    :try_end_54
    .catchall {:try_start_43 .. :try_end_54} :catchall_55

    goto :goto_41

    .line 74
    .end local v0           #notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :catchall_55
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized pause(Lmiui/app/screenelement/NotifierManager$NotifierType;Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V
    .registers 5
    .parameter "t"
    .parameter "l"

    .prologue
    .line 105
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_1a

    .line 106
    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    .line 111
    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    .line 108
    :cond_d
    :try_start_d
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->removeListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    .line 109
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseActiveRef()I

    move-result v1

    if-nez v1, :cond_b

    .line 110
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->pause()V
    :try_end_19
    .catchall {:try_start_d .. :try_end_19} :catchall_1a

    goto :goto_b

    .line 105
    .end local v0           #notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :catchall_1a
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized releaseNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V
    .registers 5
    .parameter "t"
    .parameter "l"

    .prologue
    .line 92
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_22

    .line 93
    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    .line 102
    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    .line 96
    :cond_d
    :try_start_d
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseActiveRef()I

    .line 97
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->removeListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    .line 98
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseRef()I

    move-result v1

    if-nez v1, :cond_b

    .line 99
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->finish()V

    .line 100
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_22

    goto :goto_b

    .line 92
    .end local v0           #notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized resume(Lmiui/app/screenelement/NotifierManager$NotifierType;Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V
    .registers 6
    .parameter "t"
    .parameter "l"

    .prologue
    .line 114
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_1b

    .line 115
    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    .line 120
    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    .line 117
    :cond_d
    :try_start_d
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    .line 118
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addActiveRef()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_b

    .line 119
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->resume()V
    :try_end_1a
    .catchall {:try_start_d .. :try_end_1a} :catchall_1b

    goto :goto_b

    .line 114
    .end local v0           #notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :catchall_1b
    move-exception v1

    monitor-exit p0

    throw v1
.end method
