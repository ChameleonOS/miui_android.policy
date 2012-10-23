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
    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThreadLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    const-string v0, "MAML RenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public constructor <init>(Lmiui/app/screenelement/RendererController;)V
    .registers 3
    .parameter "c"

    .prologue
    .line 27
    const-string v0, "MAML RenderThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    .line 28
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/RenderThread;->addRendererController(Lmiui/app/screenelement/RendererController;)V

    .line 29
    return-void
.end method

.method private doFinish()V
    .registers 5

    .prologue
    .line 247
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 255
    :goto_8
    return-void

    .line 250
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 251
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

    .line 252
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->finish()V

    goto :goto_12

    .line 254
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
    .line 183
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_9

    .line 193
    :goto_8
    return-void

    .line 186
    :cond_9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 187
    .local v1, currentTime:J
    iget-object v5, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v5

    .line 188
    :try_start_10
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .line 189
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/RendererController;->setLastUpdateTime(J)V

    .line 190
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->init()V

    goto :goto_16

    .line 192
    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v3           #i$:Ljava/util/Iterator;
    :catchall_29
    move-exception v4

    monitor-exit v5
    :try_end_2b
    .catchall {:try_start_10 .. :try_end_2b} :catchall_29

    throw v4

    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_2c
    :try_start_2c
    monitor-exit v5
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_29

    goto :goto_8
.end method

.method private doPause()V
    .registers 5

    .prologue
    .line 208
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 216
    :goto_8
    return-void

    .line 211
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 212
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

    .line 213
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->pause()V

    goto :goto_12

    .line 215
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
    .line 219
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 227
    :goto_8
    return-void

    .line 222
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 223
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

    .line 224
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->resume()V

    goto :goto_12

    .line 226
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
    .line 231
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_a

    .line 232
    const/4 v0, 0x1

    .line 243
    :goto_9
    return v0

    .line 234
    :cond_a
    const/4 v0, 0x1

    .line 235
    .local v0, allPaused:Z
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v4

    .line 236
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

    .line 237
    .local v1, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v3

    if-nez v3, :cond_14

    .line 238
    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/RendererController;->updateFramerate(J)V

    .line 239
    const/4 v0, 0x0

    goto :goto_14

    .line 242
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
    .line 39
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_13

    .line 40
    sget-object v1, Lmiui/app/screenelement/RenderThread;->sGlobalThreadLock:Ljava/lang/Object;

    monitor-enter v1

    .line 41
    :try_start_7
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_12

    .line 42
    new-instance v0, Lmiui/app/screenelement/RenderThread;

    invoke-direct {v0}, Lmiui/app/screenelement/RenderThread;-><init>()V

    sput-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    .line 44
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 46
    :cond_13
    sget-object v0, Lmiui/app/screenelement/RenderThread;->sGlobalThread:Lmiui/app/screenelement/RenderThread;

    return-object v0

    .line 44
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private postInit()V
    .registers 5

    .prologue
    .line 196
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 205
    :goto_8
    return-void

    .line 199
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 200
    :try_start_c
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .line 201
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->doRender()V

    .line 202
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->requestUpdate()V

    goto :goto_12

    .line 204
    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_25
    move-exception v2

    monitor-exit v3
    :try_end_27
    .catchall {:try_start_c .. :try_end_27} :catchall_25

    throw v2

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_28
    :try_start_28
    monitor-exit v3
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_25

    goto :goto_8
.end method

.method private sleepForFramerate(F)V
    .registers 5
    .parameter "framerate"

    .prologue
    .line 167
    const/high16 v2, 0x4248

    cmpl-float v2, p1, v2

    if-lez v2, :cond_7

    .line 180
    :goto_6
    return-void

    .line 171
    :cond_7
    const-wide/16 v0, 0x32

    .line 173
    .local v0, sleepTime:J
    const/high16 v2, 0x4120

    cmpl-float v2, p1, v2

    if-lez v2, :cond_13

    .line 174
    const/high16 v2, 0x43fa

    div-float/2addr v2, p1

    float-to-long v0, v2

    .line 177
    :cond_13
    :try_start_13
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_6

    .line 178
    :catch_17
    move-exception v2

    goto :goto_6
.end method

.method private waiteForResume()V
    .registers 3

    .prologue
    .line 259
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_6

    .line 263
    :goto_5
    return-void

    .line 260
    :catch_6
    move-exception v0

    .line 261
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_5
.end method


# virtual methods
.method public addRendererController(Lmiui/app/screenelement/RendererController;)V
    .registers 4
    .parameter "c"

    .prologue
    .line 51
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v1

    .line 52
    :try_start_3
    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-virtual {p1, p0}, Lmiui/app/screenelement/RendererController;->setRenderThread(Lmiui/app/screenelement/RenderThread;)V

    .line 54
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_11

    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 57
    return-void

    .line 54
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
    .line 68
    iget-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mStarted:Z

    return v0
.end method

.method public removeRendererController(Lmiui/app/screenelement/RendererController;)V
    .registers 4
    .parameter "c"

    .prologue
    .line 61
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v1

    .line 62
    :try_start_3
    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 63
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/screenelement/RendererController;->setRenderThread(Lmiui/app/screenelement/RenderThread;)V

    .line 64
    monitor-exit v1

    .line 65
    return-void

    .line 64
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
    .line 87
    const-string v11, "RenderThread"

    const-string v12, "RenderThread started"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doInit()V

    .line 92
    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStarted:Z

    .line 93
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->postInit()V

    .line 94
    :cond_12
    :goto_12
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStop:Z

    if-nez v11, :cond_47

    .line 95
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v11, :cond_41

    .line 96
    move-object/from16 v0, p0

    iget-object v12, v0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    monitor-enter v12
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_23} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_23} :catch_75

    .line 97
    :try_start_23
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v11, :cond_40

    .line 98
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doPause()V

    .line 99
    const-string v11, "RenderThread"

    const-string v13, "RenderThread paused, waiting for signal"

    invoke-static {v11, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->waiteForResume()V

    .line 101
    const-string v11, "RenderThread"

    const-string v13, "RenderThread resumed"

    invoke-static {v11, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doResume()V

    .line 104
    :cond_40
    monitor-exit v12
    :try_end_41
    .catchall {:try_start_23 .. :try_end_41} :catchall_52

    .line 106
    :cond_41
    :try_start_41
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mStop:Z
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_45} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_41 .. :try_end_45} :catch_75

    if-eqz v11, :cond_63

    .line 161
    :cond_47
    :goto_47
    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/RenderThread;->doFinish()V

    .line 162
    const-string v11, "RenderThread"

    const-string v12, "RenderThread stopped"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return-void

    .line 104
    :catchall_52
    move-exception v11

    :try_start_53
    monitor-exit v12
    :try_end_54
    .catchall {:try_start_53 .. :try_end_54} :catchall_52

    :try_start_54
    throw v11
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_55} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_54 .. :try_end_55} :catch_75

    .line 153
    :catch_55
    move-exception v4

    .line 154
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 155
    const-string v11, "RenderThread"

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_47

    .line 109
    .end local v4           #e:Ljava/lang/Exception;
    :cond_63
    :try_start_63
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 111
    .local v2, currentTime:J
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lmiui/app/screenelement/RenderThread;->doUpdateFramerate(J)Z

    move-result v11

    if-eqz v11, :cond_83

    .line 112
    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lmiui/app/screenelement/RenderThread;->mPaused:Z
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_74} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_63 .. :try_end_74} :catch_75

    goto :goto_12

    .line 156
    .end local v2           #currentTime:J
    :catch_75
    move-exception v4

    .line 157
    .local v4, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v4}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 158
    const-string v11, "RenderThread"

    invoke-virtual {v4}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_47

    .line 116
    .end local v4           #e:Ljava/lang/OutOfMemoryError;
    .restart local v2       #currentTime:J
    :cond_83
    const/4 v10, 0x0

    .line 117
    .local v10, maxFramerate:F
    const/4 v9, 0x0

    .line 118
    .local v9, issuedUpdate:Z
    :try_start_85
    move-object/from16 v0, p0

    iget-object v12, v0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v12
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_8a} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_85 .. :try_end_8a} :catch_75

    .line 119
    :try_start_8a
    move-object/from16 v0, p0

    iget-object v11, v0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_92
    :goto_92
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_121

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/RendererController;

    .line 120
    .local v1, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v11

    if-nez v11, :cond_92

    .line 123
    const/4 v8, 0x0

    .line 124
    .local v8, isFramerateDive:Z
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getFramerate()F

    move-result v6

    .line 125
    .local v6, framerate:F
    cmpl-float v11, v6, v10

    if-lez v11, :cond_ae

    .line 126
    move v10, v6

    .line 127
    :cond_ae
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getCurFramerate()F

    move-result v11

    cmpl-float v11, v11, v6

    if-eqz v11, :cond_f8

    .line 133
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getCurFramerate()F

    move-result v11

    const/high16 v13, 0x3f80

    cmpl-float v11, v11, v13

    if-lez v11, :cond_c7

    const/high16 v11, 0x3f80

    cmpg-float v11, v6, v11

    if-gez v11, :cond_c7

    .line 134
    const/4 v8, 0x1

    .line 136
    :cond_c7
    invoke-virtual {v1, v6}, Lmiui/app/screenelement/RendererController;->setCurFramerate(F)V

    .line 137
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

    .line 138
    const/4 v11, 0x0

    cmpl-float v11, v6, v11

    if-eqz v11, :cond_11e

    const/high16 v11, 0x447a

    div-float/2addr v11, v6

    :goto_f4
    float-to-int v5, v11

    .line 139
    .local v5, frameTime:I
    invoke-virtual {v1, v5}, Lmiui/app/screenelement/RendererController;->setFrameTime(I)V

    .line 141
    .end local v5           #frameTime:I
    :cond_f8
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->pendingRender()Z

    move-result v11

    if-nez v11, :cond_92

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v13

    sub-long v13, v2, v13

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->getFrameTime()I

    move-result v11

    int-to-long v15, v11

    cmp-long v11, v13, v15

    if-gtz v11, :cond_115

    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->shouldUpdate()Z

    move-result v11

    if-nez v11, :cond_115

    if-eqz v8, :cond_92

    .line 143
    :cond_115
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->doRender()V

    .line 144
    invoke-virtual {v1, v2, v3}, Lmiui/app/screenelement/RendererController;->setLastUpdateTime(J)V

    .line 145
    const/4 v9, 0x1

    goto/16 :goto_92

    .line 138
    :cond_11e
    const/high16 v11, 0x4f00

    goto :goto_f4

    .line 148
    .end local v1           #c:Lmiui/app/screenelement/RendererController;
    .end local v6           #framerate:F
    .end local v8           #isFramerateDive:Z
    :cond_121
    monitor-exit v12
    :try_end_122
    .catchall {:try_start_8a .. :try_end_122} :catchall_12b

    .line 150
    if-nez v9, :cond_12

    .line 151
    :try_start_124
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lmiui/app/screenelement/RenderThread;->sleepForFramerate(F)V
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_124 .. :try_end_129} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_124 .. :try_end_129} :catch_75

    goto/16 :goto_12

    .line 148
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
    .catch Ljava/lang/Exception; {:try_start_12d .. :try_end_12e} :catch_55
    .catch Ljava/lang/OutOfMemoryError; {:try_start_12d .. :try_end_12e} :catch_75
.end method

.method public setPaused(Z)V
    .registers 4
    .parameter "pause"

    .prologue
    .line 72
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    monitor-enter v1

    .line 73
    :try_start_3
    iput-boolean p1, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    .line 74
    if-nez p1, :cond_c

    .line 75
    iget-object v0, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 77
    :cond_c
    monitor-exit v1

    .line 78
    return-void

    .line 77
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
    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RenderThread;->mStop:Z

    .line 82
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 83
    return-void
.end method
