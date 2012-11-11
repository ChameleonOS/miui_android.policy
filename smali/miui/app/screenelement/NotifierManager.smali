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
    const/4 v0, 0x1

    sput-boolean v0, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "c"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    iput-object p1, p0, Lmiui/app/screenelement/NotifierManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000()Z
    .registers 1

    .prologue
    sget-boolean v0, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    return v0
.end method

.method private static createNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Landroid/content/Context;)Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    .registers 4
    .parameter "t"
    .parameter "c"

    .prologue
    sget-object v0, Lmiui/app/screenelement/NotifierManager$1;->$SwitchMap$miui$app$screenelement$NotifierManager$NotifierType:[I

    invoke-virtual {p0}, Lmiui/app/screenelement/NotifierManager$NotifierType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_38

    const/4 v0, 0x0

    :goto_c
    return-object v0

    :pswitch_d
    new-instance v0, Lmiui/app/screenelement/NotifierManager$BatteryNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$BatteryNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_13
    new-instance v0, Lmiui/app/screenelement/NotifierManager$UsbStateNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$UsbStateNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_19
    new-instance v0, Lmiui/app/screenelement/NotifierManager$BluetoothNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$BluetoothNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_1f
    new-instance v0, Lmiui/app/screenelement/NotifierManager$RingModeNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$RingModeNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_25
    new-instance v0, Lmiui/app/screenelement/NotifierManager$MobileDataNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$MobileDataNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_2b
    new-instance v0, Lmiui/app/screenelement/NotifierManager$WifiNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$WifiNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

    :pswitch_31
    new-instance v0, Lmiui/app/screenelement/NotifierManager$VolumeChangedNotifier;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/NotifierManager$VolumeChangedNotifier;-><init>(Landroid/content/Context;)V

    goto :goto_c

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
    const-class v1, Lmiui/app/screenelement/NotifierManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;

    if-nez v0, :cond_e

    new-instance v0, Lmiui/app/screenelement/NotifierManager;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/NotifierManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;

    :cond_e
    sget-object v0, Lmiui/app/screenelement/NotifierManager;->sInstance:Lmiui/app/screenelement/NotifierManager;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

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
    monitor-enter p0

    :try_start_1
    sget-boolean v1, Lmiui/app/screenelement/NotifierManager;->DBG:Z

    if-eqz v1, :cond_2f

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

    :cond_2f
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;

    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_4b

    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mContext:Landroid/content/Context;

    invoke-static {p1, v1}, Lmiui/app/screenelement/NotifierManager;->createNotifier(Lmiui/app/screenelement/NotifierManager$NotifierType;Landroid/content/Context;)Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_3e
    .catchall {:try_start_1 .. :try_end_3e} :catchall_55

    move-result-object v0

    if-nez v0, :cond_43

    :goto_41
    monitor-exit p0

    return-void

    :cond_43
    :try_start_43
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->init()V

    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4b
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addRef()I

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addActiveRef()I
    :try_end_54
    .catchall {:try_start_43 .. :try_end_54} :catchall_55

    goto :goto_41

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
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_1a

    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    :cond_d
    :try_start_d
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->removeListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseActiveRef()I

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->pause()V
    :try_end_19
    .catchall {:try_start_d .. :try_end_19} :catchall_1a

    goto :goto_b

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
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_22

    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    :cond_d
    :try_start_d
    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseActiveRef()I

    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->removeListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->releaseRef()I

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->finish()V

    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_22

    goto :goto_b

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
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lmiui/app/screenelement/NotifierManager;->mNotifiers:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_1b

    .local v0, notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    if-nez v0, :cond_d

    :cond_b
    :goto_b
    monitor-exit p0

    return-void

    :cond_d
    :try_start_d
    invoke-virtual {v0, p2}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addListener(Lmiui/app/screenelement/NotifierManager$OnNotifyListener;)V

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->addActiveRef()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_b

    invoke-virtual {v0}, Lmiui/app/screenelement/NotifierManager$BaseNotifier;->resume()V
    :try_end_1a
    .catchall {:try_start_d .. :try_end_1a} :catchall_1b

    goto :goto_b

    .end local v0           #notifier:Lmiui/app/screenelement/NotifierManager$BaseNotifier;
    :catchall_1b
    move-exception v1

    monitor-exit p0

    throw v1
.end method
