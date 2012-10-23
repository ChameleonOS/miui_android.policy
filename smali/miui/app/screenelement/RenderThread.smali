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
    .line 235
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 243
    :goto_8
    return-void

    .line 238
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 239
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

    .line 240
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->finish()V

    goto :goto_12

    .line 242
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
    .registers 5

    .prologue
    .line 173
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 181
    :goto_8
    return-void

    .line 176
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 177
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

    .line 178
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->init()V

    goto :goto_12

    .line 180
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

.method private doPause()V
    .registers 5

    .prologue
    .line 196
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 204
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

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .line 201
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->pause()V

    goto :goto_12

    .line 203
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
    .line 207
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 215
    :goto_8
    return-void

    .line 210
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 211
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

    .line 212
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->resume()V

    goto :goto_12

    .line 214
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
    .line 219
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_a

    .line 220
    const/4 v0, 0x1

    .line 231
    :goto_9
    return v0

    .line 222
    :cond_a
    const/4 v0, 0x1

    .line 223
    .local v0, allPaused:Z
    iget-object v4, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v4

    .line 224
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

    .line 225
    .local v1, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v1}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v3

    if-nez v3, :cond_14

    .line 226
    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/RendererController;->updateFramerate(J)V

    .line 227
    const/4 v0, 0x0

    goto :goto_14

    .line 230
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
    .line 184
    iget-object v2, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_9

    .line 193
    :goto_8
    return-void

    .line 187
    :cond_9
    iget-object v3, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    monitor-enter v3

    .line 188
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

    .line 189
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->doRender()V

    .line 190
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->requestUpdate()V

    goto :goto_12

    .line 192
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
    .line 157
    const/high16 v2, 0x4248

    cmpl-float v2, p1, v2

    if-lez v2, :cond_7

    .line 170
    :goto_6
    return-void

    .line 161
    :cond_7
    const-wide/16 v0, 0x32

    .line 163
    .local v0, sleepTime:J
    const/high16 v2, 0x4120

    cmpl-float v2, p1, v2

    if-lez v2, :cond_13

    .line 164
    const/high16 v2, 0x43fa

    div-float/2addr v2, p1

    float-to-long v0, v2

    .line 167
    :cond_13
    :try_start_13
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_6

    .line 168
    :catch_17
    move-exception v2

    goto :goto_6
.end method

.method private waiteForResume()V
    .registers 3

    .prologue
    .line 247
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_6

    .line 251
    :goto_5
    return-void

    .line 248
    :catch_6
    move-exception v0

    .line 249
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
    .registers 14

    .prologue
    .line 87
    const-string v9, "RenderThread"

    const-string v10, "RenderThread started"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :try_start_7
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->doInit()V

    .line 92
    const/4 v9, 0x1

    iput-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mStarted:Z

    .line 93
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->postInit()V

    .line 94
    :cond_10
    :goto_10
    iget-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mStop:Z

    if-nez v9, :cond_3b

    .line 95
    iget-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v9, :cond_37

    .line 96
    iget-object v10, p0, Lmiui/app/screenelement/RenderThread;->mResumeSignal:Ljava/lang/Object;

    monitor-enter v10
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_1b} :catch_49
    .catch Ljava/lang/OutOfMemoryError; {:try_start_7 .. :try_end_1b} :catch_65

    .line 97
    :try_start_1b
    iget-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z

    if-eqz v9, :cond_36

    .line 98
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->doPause()V

    .line 99
    const-string v9, "RenderThread"

    const-string v11, "RenderThread paused, waiting for signal"

    invoke-static {v9, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->waiteForResume()V

    .line 101
    const-string v9, "RenderThread"

    const-string v11, "RenderThread resumed"

    invoke-static {v9, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->doResume()V

    .line 104
    :cond_36
    monitor-exit v10
    :try_end_37
    .catchall {:try_start_1b .. :try_end_37} :catchall_46

    .line 106
    :cond_37
    :try_start_37
    iget-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mStop:Z
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_39} :catch_49
    .catch Ljava/lang/OutOfMemoryError; {:try_start_37 .. :try_end_39} :catch_65

    if-eqz v9, :cond_57

    .line 151
    :cond_3b
    :goto_3b
    invoke-direct {p0}, Lmiui/app/screenelement/RenderThread;->doFinish()V

    .line 152
    const-string v9, "RenderThread"

    const-string v10, "RenderThread stopped"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    return-void

    .line 104
    :catchall_46
    move-exception v9

    :try_start_47
    monitor-exit v10
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_46

    :try_start_48
    throw v9
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_49} :catch_49
    .catch Ljava/lang/OutOfMemoryError; {:try_start_48 .. :try_end_49} :catch_65

    .line 143
    :catch_49
    move-exception v3

    .line 144
    .local v3, e:Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 145
    const-string v9, "RenderThread"

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3b

    .line 109
    .end local v3           #e:Ljava/lang/Exception;
    :cond_57
    :try_start_57
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 111
    .local v1, currentTime:J
    invoke-direct {p0, v1, v2}, Lmiui/app/screenelement/RenderThread;->doUpdateFramerate(J)Z

    move-result v9

    if-eqz v9, :cond_73

    .line 112
    const/4 v9, 0x1

    iput-boolean v9, p0, Lmiui/app/screenelement/RenderThread;->mPaused:Z
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_64} :catch_49
    .catch Ljava/lang/OutOfMemoryError; {:try_start_57 .. :try_end_64} :catch_65

    goto :goto_10

    .line 146
    .end local v1           #currentTime:J
    :catch_65
    move-exception v3

    .line 147
    .local v3, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v3}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 148
    const-string v9, "RenderThread"

    invoke-virtual {v3}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3b

    .line 116
    .end local v3           #e:Ljava/lang/OutOfMemoryError;
    .restart local v1       #currentTime:J
    :cond_73
    const/4 v8, 0x0

    .line 117
    .local v8, maxFramerate:F
    const/4 v7, 0x0

    .line 118
    .local v7, issuedUpdate:Z
    :try_start_75
    iget-object v9, p0, Lmiui/app/screenelement/RenderThread;->mRendererControllerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :cond_7b
    :goto_7b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_f5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/RendererController;

    .line 119
    .local v0, c:Lmiui/app/screenelement/RendererController;
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->isSelfPaused()Z

    move-result v9

    if-nez v9, :cond_7b

    .line 122
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->getFramerate()F

    move-result v5

    .line 123
    .local v5, framerate:F
    cmpl-float v9, v5, v8

    if-lez v9, :cond_96

    .line 124
    move v8, v5

    .line 125
    :cond_96
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->getCurFramerate()F

    move-result v9

    cmpl-float v9, v9, v5

    if-eqz v9, :cond_cf

    .line 126
    invoke-virtual {v0, v5}, Lmiui/app/screenelement/RendererController;->setCurFramerate(F)V

    .line 127
    const-string v9, "RenderThread"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "framerate changed: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " at time: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const/4 v9, 0x0

    cmpl-float v9, v5, v9

    if-eqz v9, :cond_f2

    const/high16 v9, 0x447a

    div-float/2addr v9, v5

    :goto_cb
    float-to-int v4, v9

    .line 129
    .local v4, frameTime:I
    invoke-virtual {v0, v4}, Lmiui/app/screenelement/RendererController;->setFrameTime(I)V

    .line 132
    .end local v4           #frameTime:I
    :cond_cf
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->pendingRender()Z

    move-result v9

    if-nez v9, :cond_7b

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v9

    sub-long v9, v1, v9

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->getFrameTime()I

    move-result v11

    int-to-long v11, v11

    cmp-long v9, v9, v11

    if-gtz v9, :cond_ea

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->shouldUpdate()Z

    move-result v9

    if-eqz v9, :cond_7b

    .line 134
    :cond_ea
    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->doRender()V

    .line 135
    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/RendererController;->setLastUpdateTime(J)V

    .line 136
    const/4 v7, 0x1

    goto :goto_7b

    .line 128
    :cond_f2
    const/high16 v9, 0x4f00

    goto :goto_cb

    .line 140
    .end local v0           #c:Lmiui/app/screenelement/RendererController;
    .end local v5           #framerate:F
    :cond_f5
    if-nez v7, :cond_10

    .line 141
    invoke-direct {p0, v8}, Lmiui/app/screenelement/RenderThread;->sleepForFramerate(F)V
    :try_end_fa
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_fa} :catch_49
    .catch Ljava/lang/OutOfMemoryError; {:try_start_75 .. :try_end_fa} :catch_65

    goto/16 :goto_10
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
