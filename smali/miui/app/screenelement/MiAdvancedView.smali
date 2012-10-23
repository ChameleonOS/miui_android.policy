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
.field private mLoggedHardwareRender:Z

.field private mNeedDisallowInterceptTouchEvent:Z

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

    .line 33
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    iput-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 34
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setFocusable(Z)V

    .line 35
    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setFocusableInTouchMode(Z)V

    .line 36
    iput-object p2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    .line 37
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0, p0}, Lmiui/app/screenelement/ScreenElementRoot;->setView(Landroid/view/View;)V

    .line 38
    new-instance v0, Lmiui/app/screenelement/RendererController;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/RendererController;-><init>(Lmiui/app/screenelement/RendererController$Listener;)V

    iput-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    .line 39
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->setRenderController(Lmiui/app/screenelement/RendererController;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;Lmiui/app/screenelement/RenderThread;)V
    .registers 6
    .parameter "context"
    .parameter "root"
    .parameter "t"

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lmiui/app/screenelement/MiAdvancedView;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 45
    if-eqz p3, :cond_16

    .line 46
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->init()V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    .line 48
    iput-object p3, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    .line 49
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->addRendererController(Lmiui/app/screenelement/RendererController;)V

    .line 51
    :cond_16
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .registers 3

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/MiAdvancedView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 55
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_11

    .line 56
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_12

    .line 57
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0}, Lmiui/app/screenelement/RenderThread;->setStop()V

    .line 63
    :cond_11
    :goto_11
    return-void

    .line 59
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->removeRendererController(Lmiui/app/screenelement/RendererController;)V

    .line 60
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->finish()V

    goto :goto_11
.end method

.method public doRender()V
    .registers 1

    .prologue
    .line 170
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->postInvalidate()V

    .line 171
    return-void
.end method

.method public finish()V
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->finish()V

    .line 181
    return-void
.end method

.method public final getRoot()Lmiui/app/screenelement/ScreenElementRoot;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    return-object v0
.end method

.method public init()V
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->init()V

    .line 176
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 125
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 127
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-nez v0, :cond_20

    .line 128
    new-instance v0, Lmiui/app/screenelement/RenderThread;

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-direct {v0, v1}, Lmiui/app/screenelement/RenderThread;-><init>(Lmiui/app/screenelement/RendererController;)V

    iput-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    .line 129
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    iget-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 130
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0}, Lmiui/app/screenelement/RenderThread;->start()V

    .line 132
    :cond_20
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .prologue
    .line 136
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 137
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .parameter "canvas"

    .prologue
    .line 104
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v1}, Lmiui/app/screenelement/RenderThread;->isStarted()Z

    move-result v1

    if-nez v1, :cond_d

    .line 121
    :cond_c
    :goto_c
    return-void

    .line 107
    :cond_d
    iget-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mLoggedHardwareRender:Z

    if-nez v1, :cond_30

    .line 108
    const-string v1, "MiAdvancedView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "canvas hardware render: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mLoggedHardwareRender:Z

    .line 113
    :cond_30
    :try_start_30
    iget-object v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v2}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p1}, Lmiui/app/screenelement/ScreenElementRoot;->update(JLandroid/graphics/Canvas;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3b} :catch_3c
    .catch Ljava/lang/OutOfMemoryError; {:try_start_30 .. :try_end_3b} :catch_4a

    goto :goto_c

    .line 114
    :catch_3c
    move-exception v0

    .line 115
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 116
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 117
    .end local v0           #e:Ljava/lang/Exception;
    :catch_4a
    move-exception v0

    .line 118
    .local v0, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 119
    const-string v1, "MiAdvancedView"

    invoke-virtual {v0}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 151
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

    .line 153
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

    .line 155
    return-void
.end method

.method public onPause()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 140
    iput-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 141
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_10

    .line 142
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_11

    .line 143
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 148
    :cond_10
    :goto_10
    return-void

    .line 145
    :cond_11
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->selfPause()V

    goto :goto_10
.end method

.method public onResume()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 158
    iput-boolean v1, p0, Lmiui/app/screenelement/MiAdvancedView;->mPaused:Z

    .line 159
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    if-eqz v0, :cond_10

    .line 160
    iget-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mUseExternalRenderThread:Z

    if-nez v0, :cond_11

    .line 161
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mThread:Lmiui/app/screenelement/RenderThread;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/RenderThread;->setPaused(Z)V

    .line 166
    :cond_10
    :goto_10
    return-void

    .line 163
    :cond_11
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRendererController:Lmiui/app/screenelement/RendererController;

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->selfResume()V

    goto :goto_10
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .parameter "event"

    .prologue
    .line 81
    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    if-eqz v2, :cond_36

    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_f

    .line 83
    const/4 v2, 0x4

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 85
    :cond_f
    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v2}, Lmiui/app/screenelement/ScreenElementRoot;->needDisallowInterceptTouchEvent()Z

    move-result v0

    .line 86
    .local v0, b:Z
    iget-boolean v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mNeedDisallowInterceptTouchEvent:Z

    if-eq v2, v0, :cond_22

    .line 87
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 88
    iput-boolean v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mNeedDisallowInterceptTouchEvent:Z

    .line 91
    :cond_22
    :try_start_22
    iget-object v2, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/ScreenElementRoot;->onTouch(Landroid/view/MotionEvent;)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_27} :catch_29
    .catch Ljava/lang/OutOfMemoryError; {:try_start_22 .. :try_end_27} :catch_38

    move-result v2

    .line 100
    .end local v0           #b:Z
    :goto_28
    return v2

    .line 92
    .restart local v0       #b:Z
    :catch_29
    move-exception v1

    .line 93
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 94
    const-string v2, "MiAdvancedView"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .end local v0           #b:Z
    .end local v1           #e:Ljava/lang/Exception;
    :cond_36
    :goto_36
    const/4 v2, 0x0

    goto :goto_28

    .line 95
    .restart local v0       #b:Z
    :catch_38
    move-exception v1

    .line 96
    .local v1, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->printStackTrace()V

    .line 97
    const-string v2, "MiAdvancedView"

    invoke-virtual {v1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_36
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->pause()V

    .line 186
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->resume()V

    .line 191
    return-void
.end method

.method public setVisibility(I)V
    .registers 3
    .parameter "visibility"

    .prologue
    .line 71
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    if-nez p1, :cond_9

    .line 73
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->onResume()V

    .line 77
    :cond_8
    :goto_8
    return-void

    .line 74
    :cond_9
    const/4 v0, 0x4

    if-eq p1, v0, :cond_10

    const/16 v0, 0x8

    if-ne p1, v0, :cond_8

    .line 75
    :cond_10
    invoke-virtual {p0}, Lmiui/app/screenelement/MiAdvancedView;->onPause()V

    goto :goto_8
.end method

.method public updateFramerate(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 195
    iget-object v0, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/ScreenElementRoot;->updateFramerate(J)V

    .line 196
    return-void
.end method
