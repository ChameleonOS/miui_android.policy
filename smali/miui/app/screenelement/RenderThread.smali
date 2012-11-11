.class public Lmiui/app/screenelement/RenderThread;
.super Ljava/lang/Thread;
.source "RenderThread.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "RenderThread"

.field private static sGlobalThread:Lmiui/app/screenelement/RenderThread;

.field private static sGlobalThreadLock:Ljava/lang/Object;


# instance fields
.field private mPaused:Z

.field private mRendererControllerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/RendererController;",
            ">;"
        }
    .end annotation
.end field

.field private mResumeSignal:Ljava/lang/Object;

.field private mStarted:Z

.field private mStop:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThreadLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const-string v0, "MAML RenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmiui/app/screenelement/RendererController;)V
    .registers 3
    .parameter "c"

    .prologue
    const-string v0, "MAML RenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lmiui/app/screenelement/RenderThread;->addRendererController(Lmiui/app/screenelement/RendererController;)V

    return-void
.end method

.method private doFinish()V
    .registers 5

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    :goto_8
    return-void

    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_c
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->finish()V

    goto :goto_12

    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_22
    move-exception v2

    monitor-exit v3
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_22

    throw v2

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_25
    :try_start_25
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_22

    goto :goto_8
.end method

.method private doInit()V
    .registers 7

    .prologue
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_9

    :goto_8
    return-void

    :cond_9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .local v1, currentTime:J
    iget-object v5, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v5

    :try_start_10
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_36

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/RendererController;->setLastUpdateTime(J)V

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->init()V

    iget-boolean v4, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v4, :cond_2f

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/RendererController;->tick(J)V

    :cond_2f
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->requestUpdate()V

    goto :goto_16

    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v3           #i$:Ljava/util/Iterator;
    :catchall_33
    move-exception v4

    monitor-exit v5
    :try_end_35
    .catchall {:try_start_10 .. :try_end_35} :catchall_33

    throw v4

    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_36
    :try_start_36
    monitor-exit v5
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_33

    goto :goto_8
.end method

.method private doPause()V
    .registers 5

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    :goto_8
    return-void

    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_c
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->pause()V

    goto :goto_12

    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_22
    move-exception v2

    monitor-exit v3
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_22

    throw v2

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_25
    :try_start_25
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_22

    goto :goto_8
.end method

.method private doResume()V
    .registers 5

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    :goto_8
    return-void

    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_c
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->resume()V

    goto :goto_12

    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_22
    move-exception v2

    monitor-exit v3
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_22

    throw v2

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_25
    :try_start_25
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_22

    goto :goto_8
.end method

.method private doUpdateFramerate(J)Z
    .registers 8
    .parameter "time"

    .prologue
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x1

    .local v0, allPaused:Z
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_e
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_14
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/RendererController;

    .local v1, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v3

    if-nez v3, :cond_14

    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/RendererController;->updateFramerate(J)V

    const/4 v0, 0x0

    goto :goto_14

    .end local v1           #c:Lmiui/app/screenelement/RendererController;
    :cond_2b
    monitor-exit v4

    goto :goto_9

    .end local v2           #i$:Ljava/util/Iterator;
    :catchall_2d
    move-exception v3

    monitor-exit v4
    :try_end_2f
    .catchall {:try_start_e .. :try_end_2f} :catchall_2d

    throw v3
.end method

.method public static globalThread()Lmiui/app/screenelement/RenderThread;
    .registers 2

    .prologue
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_13

    sget-object v1, Lmiui/app/screenelement/RenderThread;->sGlobalThreadLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_7
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_12

    new-instance v0, Lmiui/app/screenelement/RenderThread;

    invoke-direct {v0}, Lmiui/app/screenelement/RenderThread;-><init>()V

    sput-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    :cond_13
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    return-object v0

    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private sleepForFramerate(F)V
    .registers 5
    .parameter "framerate"

    .prologue
    const/high16 v2, 0x4248

    cmpl-float v2, p1, v2

    if-lez v2, :cond_7

    :goto_6
    return-void

    :cond_7
    const-wide/16 v0, 0x32

    .local v0, sleepTime:J
    const/high16 v2, 0x4120

    cmpl-float v2, p1, v2

    if-lez v2, :cond_13

    const/high16 v2, 0x43fa

    div-float/2addr v2, p1

    float-to-long v0, v2

    :cond_13
    :try_start_13
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_6

    :catch_17
    move-exception v2

    goto :goto_6
.end method

.method private waiteForResume()V
    .registers 3

    .prologue
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_6

    :goto_5
    return-void

    :catch_6
    move-exception v0

    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_5
.end method


# virtual methods
.method public addRendererController(Lmiui/app/screenelement/RendererController;)V
    .registers 4
    .parameter "c"

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, p0}, Lmiui/app/screenelement/RendererController;->setRenderThread(Lmiui/app/screenelement/RenderThread;)V

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_11

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    return-void

    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mStarted:Z

    return v0
.end method

.method public removeRendererController(Lmiui/app/screenelement/RendererController;)V
    .registers 4
    .parameter "c"

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/screenelement/RendererController;->setRenderThread(Lmiui/app/screenelement/RenderThread;)V

    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public run()V
    .registers 18

    .prologue
    const-string v11, "RenderThread"

    const-string v12, "RenderThread started"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_7
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doInit()V

    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStarted:Z

    :cond_f
    :goto_f
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStop:Z

    if-nez v11, :cond_44

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v11, :cond_3e

    move-object/from16 v0, p0

    iget-object v12, v0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    monitor-enter v12
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_20} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_20} :catch_72

    :try_start_20
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v11, :cond_3d

    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doPause()V

    const-string v11, "RenderThread"

    const-string v13, "RenderThread paused, waiting for signal"

    invoke-static {v11, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->waiteForResume()V

    const-string v11, "RenderThread"

    const-string v13, "RenderThread resumed"

    invoke-static {v11, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doResume()V

    :cond_3d
    monitor-exit v12
    :try_end_3e
    .catchall {:try_start_20 .. :try_end_3e} :catchall_4f

    :cond_3e
    :try_start_3e
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStop:Z
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_42} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3e .. :try_end_42} :catch_72

    if-eqz v11, :cond_60

    :cond_44
    :goto_44
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doFinish()V

    const-string v11, "RenderThread"

    const-string v12, "RenderThread stopped"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_4f
    move-exception v11

    :try_start_50
    monitor-exit v12
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    :try_start_51
    throw v11
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_52} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_51 .. :try_end_52} :catch_72

    :catch_52
    move-exception v4

    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    const-string v11, "RenderThread"

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_44

    .end local v4           #e:Ljava/lang/Exception;
    :cond_60
    :try_start_60
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .local v2, currentTime:J
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lmiui/app/screenelement/RenderThread;->doUpdateFramerate(J)Z

    move-result v11

    if-eqz v11, :cond_80

    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_71} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_60 .. :try_end_71} :catch_72

    goto :goto_f

    .end local v2           #currentTime:J
    :catch_72
    move-exception v4

    .local v4, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v4}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    const-string v11, "RenderThread"

    invoke-virtual {v4}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_44

    .end local v4           #e:Ljava/lang/OutOfMemoryError;
    .restart local v2       #currentTime:J
    :cond_80
    const/4 v10, 0x0

    .local v10, maxFramerate:F
    const/4 v9, 0x0

    .local v9, issuedUpdate:Z
    :try_start_82
    move-object/from16 v0, p0

    iget-object v12, v0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v12
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_87} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_82 .. :try_end_87} :catch_72

    :try_start_87
    move-object/from16 v0, p0

    iget-object v11, v0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_8f
    :goto_8f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_121

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/RendererController;

    .local v1, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v11

    if-nez v11, :cond_8f

    const/4 v8, 0x0

    .local v8, isFramerateDive:Z
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getFramerate()F

    move-result v6

    .local v6, framerate:F
    cmpl-float v11, v6, v10

    if-lez v11, :cond_ab

    move v10, v6

    :cond_ab
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getCurFramerate()F

    move-result v11

    cmpl-float v11, v11, v6

    if-eqz v11, :cond_f5

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getCurFramerate()F

    move-result v11

    const/high16 v13, 0x3f80

    cmpl-float v11, v11, v13

    if-lez v11, :cond_c4

    const/high16 v11, 0x3f80

    cmpg-float v11, v6, v11

    if-gez v11, :cond_c4

    const/4 v8, 0x1

    :cond_c4
    invoke-virtual {v1, v6}, Lmiui/app/screenelement/RendererController;->setCurFramerate(F)V

    const-string v11, "RenderThread"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "framerate changed: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " at time: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v11, 0x0

    cmpl-float v11, v6, v11

    if-eqz v11, :cond_11e

    const/high16 v11, 0x447a

    div-float/2addr v11, v6

    :goto_f1
    float-to-int v5, v11

    .local v5, frameTime:I
    invoke-virtual {v1, v5}, Lmiui/app/screenelement/RendererController;->setFrameTime(I)V

    .end local v5           #frameTime:I
    :cond_f5
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->pendingRender()Z

    move-result v11

    if-nez v11, :cond_8f

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v13

    sub-long v13, v2, v13

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getFrameTime()I

    move-result v11

    int-to-long v15, v11

    cmp-long v11, v13, v15

    if-gtz v11, :cond_112

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->shouldUpdate()Z

    move-result v11

    if-nez v11, :cond_112

    if-eqz v8, :cond_8f

    :cond_112
    invoke-virtual {v1, v2, v3}, Lmiui/app/screenelement/RendererController;->tick(J)V

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->doRender()V

    invoke-virtual {v1, v2, v3}, Lmiui/app/screenelement/RendererController;->setLastUpdateTime(J)V

    const/4 v9, 0x1

    goto/16 :goto_8f

    :cond_11e
    const/high16 v11, 0x4f00

    goto :goto_f1

    .end local v1           #c:Lmiui/app/screenelement/RendererController;
    .end local v6           #framerate:F
    .end local v8           #isFramerateDive:Z
    :cond_121
    monitor-exit v12
    :try_end_122
    .catchall {:try_start_87 .. :try_end_122} :catchall_12b

    if-nez v9, :cond_f

    :try_start_124
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lmiui/app/screenelement/RenderThread;->sleepForFramerate(F)V
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_124 .. :try_end_129} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_124 .. :try_end_129} :catch_72

    goto/16 :goto_f

    .end local v7           #i$:Ljava/util/Iterator;
    :catchall_12b
    move-exception v11

    :try_start_12c
    monitor-exit v12
    :try_end_12d
    .catchall {:try_start_12c .. :try_end_12d} :catchall_12b

    :try_start_12d
    throw v11
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_12d .. :try_end_12e} :catch_52
    .catch Ljava/lang/OutOfMemoryError; {:try_start_12d .. :try_end_12e} :catch_72
.end method

.method public setPaused(Z)V
    .registers 4
    .parameter "pause"

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-boolean p1, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-nez p1, :cond_c

    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    :cond_c
    monitor-exit v1

    return-void

    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public setStop()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mStop:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    return-void
.end method
