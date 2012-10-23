.class public Lmiui/app/screenelement/MiAdvancedView;
.super Landroid/view/View;
.source "MiAdvancedView.java"

# interfaces
.implements Lmiui/app/screenelement/RendererController$Listener;


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "MiAdvancedView"

.field private static final VARIABLE_VIEW_HEIGHT:Ljava/lang/String; = "view_height"

.field private static final VARIABLE_VIEW_WIDTH:Ljava/lang/String; = "view_width"


# instance fields
.field private mPaused:Z

.field private mRendererController:Lmiui/app/screenelement/RendererController;

.field protected mRoot:Lmiui/app/screenelement/ScreenElementRoot;

.field private mThread:Lmiui/app/screenelement/RenderThread;

.field private mUseExternalRenderThread:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 5
    .parameter "context"
    .parameter "root"

    .prologue
    const/4 v0, 0x1

    .line 29
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    iput-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 30
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setFocusable(Z)V

    .line 31
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setFocusableInTouchMode(Z)V

    .line 32
    iput-object p2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    .line 33
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0, p0}, Lmiui/app/screenelement/ScreenElementRoot;->setView(Landroid/view/View;)V

    .line 34
    new-instance v0, Lmiui/app/screenelement/RendererController;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/RendererController;-><init>(Lmiui/app/screenelement/RendererController$Listener;)V

    iput-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    .line 35
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->setRenderController(Lmiui/app/screenelement/RendererController;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;Lmiui/app/screenelement/RenderThread;)V
    .registers 6
    .parameter "context"
    .parameter "root"
    .parameter "t"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lmiui/app/screenelement/MiAdvancedView;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 41
    if-eqz p3, :cond_16

    .line 42
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->init()V

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    .line 44
    iput-object p3, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    .line 45
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->addRendererController(Lmiui/app/screenelement/RendererController;)V

    .line 47
    :cond_16
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .registers 3

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 51
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_11

    .line 52
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_12

    .line 53
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0}, Lmiui/app/screenelement/RenderThread;->setStop()V

    .line 59
    :cond_11
    :goto_11
    return-void

    .line 55
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->removeRendererController(Lmiui/app/screenelement/RendererController;)V

    .line 56
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->finish()V

    goto :goto_11
.end method

.method public doRender()V
    .registers 1

    .prologue
    .line 160
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->postInvalidate()V

    .line 161
    return-void
.end method

.method public finish()V
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->finish()V

    .line 171
    return-void
.end method

.method public final getRoot()Lmiui/app/screenelement/ScreenElementRoot;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    return-object v0
.end method

.method public init()V
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->init()V

    .line 166
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 115
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 117
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_20

    .line 118
    new-instance v0, Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-direct {v0, v1}, Lmiui/app/screenelement/RenderThread;-><init>(Lmiui/app/screenelement/RendererController;)V

    iput-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    .line 119
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 120
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0}, Lmiui/app/screenelement/RenderThread;->start()V

    .line 122
    :cond_20
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .prologue
    .line 126
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 127
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 7
    .parameter "canvas"

    .prologue
    .line 97
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v1}, Lmiui/app/screenelement/RenderThread;->isStarted()Z

    move-result v1

    if-nez v1, :cond_d

    .line 111
    :cond_c
    :goto_c
    return-void

    .line 100
    :cond_d
    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    monitor-enter v2

    .line 102
    :try_start_10
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v3, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v3}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4, p1}, Lmiui/app/screenelement/ScreenElementRoot;->update(JLandroid/graphics/Canvas;)V
    :try_end_1b
    .catchall {:try_start_10 .. :try_end_1b} :catchall_1d
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_1b} :catch_20
    .catch Ljava/lang/OutOfMemoryError; {:try_start_10 .. :try_end_1b} :catch_2e

    .line 110
    :goto_1b
    :try_start_1b
    monitor-exit v2

    goto :goto_c

    :catchall_1d
    move-exception v1

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_1b .. :try_end_1f} :catchall_1d

    throw v1

    .line 103
    :catch_20
    move-exception v0

    .line 104
    .local v0, e:Ljava/lang/Exception;
    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 105
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b

    .line 106
    .end local v0           #e:Ljava/lang/Exception;
    :catch_2e
    move-exception v0

    .line 107
    .local v0, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 108
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3b
    .catchall {:try_start_21 .. :try_end_3b} :catchall_1d

    goto :goto_1b
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 141
    const-string v0, "view_width"

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v1}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v1

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    sub-int v2, p4, p2

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v4, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v4}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v4

    float-to-double v4, v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 143
    const-string v0, "view_height"

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v1}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v1

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    sub-int v2, p5, p3

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v4, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v4}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v4

    float-to-double v4, v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 145
    return-void
.end method

.method public onPause()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 130
    iput-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 131
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_10

    .line 132
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_11

    .line 133
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 138
    :cond_10
    :goto_10
    return-void

    .line 135
    :cond_11
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->selfPause()V

    goto :goto_10
.end method

.method public onResume()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 148
    iput-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 149
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_10

    .line 150
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_11

    .line 151
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 156
    :cond_10
    :goto_10
    return-void

    .line 153
    :cond_11
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->selfResume()V

    goto :goto_10
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .parameter "event"

    .prologue
    .line 77
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    if-eqz v1, :cond_28

    .line 78
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_f

    .line 79
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 81
    :cond_f
    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    monitor-enter v2

    .line 83
    :try_start_12
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/ScreenElementRoot;->onTouch(Landroid/view/MotionEvent;)Z
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_38
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_17} :catch_1a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_12 .. :try_end_17} :catch_2a

    move-result v1

    :try_start_18
    monitor-exit v2

    .line 93
    :goto_19
    return v1

    .line 84
    :catch_1a
    move-exception v0

    .line 85
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 86
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .end local v0           #e:Ljava/lang/Exception;
    :goto_27
    monitor-exit v2

    .line 93
    :cond_28
    const/4 v1, 0x0

    goto :goto_19

    .line 87
    :catch_2a
    move-exception v0

    .line 88
    .local v0, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 89
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_27

    .line 91
    .end local v0           #e:Ljava/lang/OutOfMemoryError;
    :catchall_38
    move-exception v1

    monitor-exit v2
    :try_end_3a
    .catchall {:try_start_18 .. :try_end_3a} :catchall_38

    throw v1
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->pause()V

    .line 176
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->resume()V

    .line 181
    return-void
.end method

.method public setVisibility(I)V
    .registers 3
    .parameter "visibility"

    .prologue
    .line 67
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    if-nez p1, :cond_9

    .line 69
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->onResume()V

    .line 73
    :cond_8
    :goto_8
    return-void

    .line 70
    :cond_9
    const/4 v0, 0x4

    if-eq p1, v0, :cond_10

    const/16 v0, 0x8

    if-ne p1, v0, :cond_8

    .line 71
    :cond_10
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->onPause()V

    goto :goto_8
.end method

.method public updateFramerate(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 185
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/ScreenElementRoot;->updateFramerate(J)V

    .line 186
    return-void
.end method
