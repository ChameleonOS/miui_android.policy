.class public Lmiui/app/screenelement/RendererController;
.super Ljava/lang/Object;
.source "RendererController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/RendererController$Listener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "RendererController"


# instance fields
.field private mCurFramerate:F

.field private mFrameTime:I

.field private mFramerateTokenList:Lmiui/app/screenelement/FramerateTokenList;

.field private mLastUpdateSystemTime:J

.field private mListener:Lmiui/app/screenelement/RendererController$Listener;

.field private mLock:Ljava/lang/Object;

.field private mPaused:Z

.field private mPendingRender:Z

.field private mRenderThread:Lmiui/app/screenelement/RenderThread;

.field private mSelfPaused:Z

.field private mShouldUpdate:Z


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/RendererController$Listener;)V
    .registers 3
    .parameter "l"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/app/screenelement/FramerateTokenList;

    invoke-direct {v0}, Lmiui/app/screenelement/FramerateTokenList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RendererController;->mFramerateTokenList:Lmiui/app/screenelement/FramerateTokenList;

    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/RendererController;->mLock:Ljava/lang/Object;

    const v0, 0x7fffffff

    iput v0, p0, Lmiui/app/screenelement/RendererController;->mFrameTime:I

    iput-object p1, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    return-void
.end method


# virtual methods
.method public createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;
    .registers 3
    .parameter "name"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mFramerateTokenList:Lmiui/app/screenelement/FramerateTokenList;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/FramerateTokenList;->createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    move-result-object v0

    return-object v0
.end method

.method public doRender()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPendingRender:Z

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0}, Lmiui/app/screenelement/RendererController$Listener;->doRender()V

    return-void
.end method

.method public doneRender()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPendingRender:Z

    return-void
.end method

.method public finish()V
    .registers 4

    .prologue
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v1}, Lmiui/app/screenelement/RendererController$Listener;->finish()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    :goto_5
    return-void

    :catch_6
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v1, "RendererController"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method public getCurFramerate()F
    .registers 2

    .prologue
    iget v0, p0, Lmiui/app/screenelement/RendererController;->mCurFramerate:F

    return v0
.end method

.method public getFrameTime()I
    .registers 2

    .prologue
    iget v0, p0, Lmiui/app/screenelement/RendererController;->mFrameTime:I

    return v0
.end method

.method public getFramerate()F
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mFramerateTokenList:Lmiui/app/screenelement/FramerateTokenList;

    invoke-virtual {v0}, Lmiui/app/screenelement/FramerateTokenList;->getFramerate()F

    move-result v0

    return v0
.end method

.method public getLastUpdateTime()J
    .registers 3

    .prologue
    iget-wide v0, p0, Lmiui/app/screenelement/RendererController;->mLastUpdateSystemTime:J

    return-wide v0
.end method

.method public init()V
    .registers 4

    .prologue
    :try_start_0
    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v1}, Lmiui/app/screenelement/RendererController$Listener;->init()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    :goto_5
    return-void

    :catch_6
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v1, "RendererController"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method public isSelfPaused()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mSelfPaused:Z

    return v0
.end method

.method public pause()V
    .registers 3

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPaused:Z

    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mSelfPaused:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0}, Lmiui/app/screenelement/RendererController$Listener;->pause()V

    :cond_f
    monitor-exit v1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public pendingRender()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPendingRender:Z

    return v0
.end method

.method public requestUpdate()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mShouldUpdate:Z

    return-void
.end method

.method public resume()V
    .registers 3

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPaused:Z

    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mSelfPaused:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0}, Lmiui/app/screenelement/RendererController$Listener;->resume()V

    :cond_f
    monitor-exit v1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public selfPause()V
    .registers 3

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mSelfPaused:Z

    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPaused:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0}, Lmiui/app/screenelement/RendererController$Listener;->pause()V

    :cond_f
    monitor-exit v1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_4 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public selfResume()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    iget-object v1, p0, Lmiui/app/screenelement/RendererController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_5
    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mSelfPaused:Z

    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mPaused:Z

    if-nez v0, :cond_10

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0}, Lmiui/app/screenelement/RendererController$Listener;->resume()V

    :cond_10
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_1b

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mRenderThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mRenderThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0, v2}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    :cond_1a
    return-void

    :catchall_1b
    move-exception v0

    :try_start_1c
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public setCurFramerate(F)V
    .registers 2
    .parameter "f"

    .prologue
    iput p1, p0, Lmiui/app/screenelement/RendererController;->mCurFramerate:F

    return-void
.end method

.method public setFrameTime(I)V
    .registers 2
    .parameter "frameTime"

    .prologue
    iput p1, p0, Lmiui/app/screenelement/RendererController;->mFrameTime:I

    return-void
.end method

.method public setLastUpdateTime(J)V
    .registers 3
    .parameter "t"

    .prologue
    iput-wide p1, p0, Lmiui/app/screenelement/RendererController;->mLastUpdateSystemTime:J

    return-void
.end method

.method public setRenderThread(Lmiui/app/screenelement/RenderThread;)V
    .registers 2
    .parameter "renderThread"

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/RendererController;->mRenderThread:Lmiui/app/screenelement/RenderThread;

    return-void
.end method

.method public shouldUpdate()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mShouldUpdate:Z

    return v0
.end method

.method public tick(J)V
    .registers 4
    .parameter "currentTime"

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/RendererController;->mShouldUpdate:Z

    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0, p1, p2}, Lmiui/app/screenelement/RendererController$Listener;->tick(J)V

    return-void
.end method

.method public updateFramerate(J)V
    .registers 4
    .parameter "time"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/RendererController;->mListener:Lmiui/app/screenelement/RendererController$Listener;

    invoke-interface {v0, p1, p2}, Lmiui/app/screenelement/RendererController$Listener;->updateFramerate(J)V

    return-void
.end method
