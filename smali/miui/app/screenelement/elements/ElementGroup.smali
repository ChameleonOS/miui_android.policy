.class public Lmiui/app/screenelement/elements/ElementGroup;
.super Lmiui/app/screenelement/elements/AnimatedScreenElement;
.source "ElementGroup.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "LockScreen_ElementGroup"

.field public static final TAG_NAME:Ljava/lang/String; = "ElementGroup"

.field public static final TAG_NAME1:Ljava/lang/String; = "Group"


# instance fields
.field private mClip:Z

.field protected mElements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/ScreenElement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 5
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/AnimatedScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    .line 28
    const-string v0, "clip"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lmiui/app/screenelement/elements/ElementGroup;->mClip:Z

    .line 29
    invoke-virtual {p0, p1, p3}, Lmiui/app/screenelement/elements/ElementGroup;->load(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 30
    return-void
.end method


# virtual methods
.method public doRender(Landroid/graphics/Canvas;)V
    .registers 11
    .parameter "c"

    .prologue
    const/4 v8, 0x0

    .line 83
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ElementGroup;->getX()F

    move-result v5

    .line 84
    .local v5, x:F
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ElementGroup;->getY()F

    move-result v6

    .line 85
    .local v6, y:F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 86
    .local v3, rs:I
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 87
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ElementGroup;->getWidth()F

    move-result v4

    .line 88
    .local v4, w:F
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ElementGroup;->getHeight()F

    move-result v1

    .line 89
    .local v1, h:F
    cmpl-float v7, v4, v8

    if-lez v7, :cond_27

    cmpl-float v7, v1, v8

    if-lez v7, :cond_27

    iget-boolean v7, p0, Lmiui/app/screenelement/elements/ElementGroup;->mClip:Z

    if-eqz v7, :cond_27

    .line 90
    invoke-virtual {p1, v8, v8, v4, v1}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 92
    :cond_27
    iget-object v7, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 93
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->render(Landroid/graphics/Canvas;)V

    goto :goto_2d

    .line 95
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_3d
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 96
    return-void
.end method

.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 6
    .parameter "name"

    .prologue
    .line 146
    invoke-super {p0, p1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v1

    .line 147
    .local v1, ele:Lmiui/app/screenelement/elements/ScreenElement;
    if-eqz v1, :cond_8

    move-object v3, v1

    .line 156
    :goto_7
    return-object v3

    .line 150
    :cond_8
    iget-object v3, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 151
    .local v0, e:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v1

    .line 152
    if-eqz v1, :cond_e

    move-object v3, v1

    .line 153
    goto :goto_7

    .line 156
    .end local v0           #e:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_22
    const/4 v3, 0x0

    goto :goto_7
.end method

.method public finish()V
    .registers 6

    .prologue
    .line 124
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->finish()V

    .line 125
    iget-object v3, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/ScreenElement;

    .line 128
    .local v1, ele:Lmiui/app/screenelement/elements/ScreenElement;
    :try_start_15
    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ScreenElement;->finish()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_19

    goto :goto_9

    .line 129
    :catch_19
    move-exception v0

    .line 130
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "LockScreen_ElementGroup"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_9

    .line 134
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_27
    return-void
.end method

.method public getElements()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/ScreenElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    return-object v0
.end method

.method public init()V
    .registers 4

    .prologue
    .line 53
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->init()V

    .line 54
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 55
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ScreenElement;->init()V

    goto :goto_9

    .line 57
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public load(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 10
    .parameter "node"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 33
    if-nez p1, :cond_11

    .line 34
    const-string v5, "LockScreen_ElementGroup"

    const-string v6, "node is null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    new-instance v5, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v6, "node is null"

    invoke-direct {v5, v6}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 37
    :cond_11
    iget-object v5, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v1, v5, Lmiui/app/screenelement/ScreenContext;->mFactory:Lmiui/app/screenelement/elements/ScreenElementFactory;

    .line 38
    .local v1, factory:Lmiui/app/screenelement/elements/ScreenElementFactory;
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 39
    .local v0, children:Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1a
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_44

    .line 40
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_41

    .line 41
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 42
    .local v3, item:Lorg/w3c/dom/Element;
    iget-object v5, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v1, v3, v5, p2}, Lmiui/app/screenelement/elements/ScreenElementFactory;->createInstance(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v4

    .line 43
    .local v4, newElement:Lmiui/app/screenelement/elements/ScreenElement;
    if-eqz v4, :cond_41

    .line 44
    invoke-virtual {v4, p0}, Lmiui/app/screenelement/elements/ScreenElement;->setParent(Lmiui/app/screenelement/elements/ElementGroup;)V

    .line 45
    iget-object v5, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .end local v3           #item:Lorg/w3c/dom/Element;
    .end local v4           #newElement:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 49
    :cond_44
    return-void
.end method

.method public onTouch(Landroid/view/MotionEvent;)Z
    .registers 6
    .parameter "event"

    .prologue
    .line 111
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ElementGroup;->isVisible()Z

    move-result v3

    if-nez v3, :cond_8

    .line 112
    const/4 v2, 0x0

    .line 119
    :cond_7
    return v2

    .line 114
    :cond_8
    invoke-super {p0, p1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->onTouch(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 115
    .local v2, ret:Z
    iget-object v3, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 116
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->onTouch(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 117
    const/4 v2, 0x1

    goto :goto_12
.end method

.method protected onVisibilityChange(Z)V
    .registers 5
    .parameter "visible"

    .prologue
    .line 165
    invoke-super {p0, p1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->onVisibilityChange(Z)V

    .line 166
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 167
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->onVisibilityChange(Z)V

    goto :goto_9

    .line 169
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public pause()V
    .registers 4

    .prologue
    .line 68
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->pause()V

    .line 69
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 70
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ScreenElement;->pause()V

    goto :goto_9

    .line 72
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public reset(J)V
    .registers 6
    .parameter "time"

    .prologue
    .line 61
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->reset(J)V

    .line 62
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 63
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->reset(J)V

    goto :goto_9

    .line 65
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public resume()V
    .registers 4

    .prologue
    .line 75
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->resume()V

    .line 76
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 77
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ScreenElement;->resume()V

    goto :goto_9

    .line 79
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 6
    .parameter "category"
    .parameter "show"

    .prologue
    .line 138
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->showCategory(Ljava/lang/String;Z)V

    .line 139
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 140
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->showCategory(Ljava/lang/String;Z)V

    goto :goto_9

    .line 142
    .end local v0           #ele:Lmiui/app/screenelement/elements/ScreenElement;
    :cond_19
    return-void
.end method

.method public tick(J)V
    .registers 6
    .parameter "currentTime"

    .prologue
    .line 100
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->tick(J)V

    .line 101
    iget-boolean v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-nez v2, :cond_8

    .line 107
    :cond_7
    return-void

    .line 104
    :cond_8
    iget-object v2, p0, Lmiui/app/screenelement/elements/ElementGroup;->mElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/ScreenElement;

    .line 105
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    goto :goto_e
.end method
