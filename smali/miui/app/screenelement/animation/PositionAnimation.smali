.class public Lmiui/app/screenelement/animation/PositionAnimation;
.super Lmiui/app/screenelement/animation/BaseAnimation;
.source "PositionAnimation.java"


# static fields
.field public static final INNER_TAG_NAME:Ljava/lang/String; = "Position"

.field public static final TAG_NAME:Ljava/lang/String; = "PositionAnimation"


# instance fields
.field protected mCurrentX:D

.field protected mCurrentY:D

.field protected mDelayX:D

.field protected mDelayY:D


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V
    .registers 7
    .parameter "node"
    .parameter "tagName"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/animation/BaseAnimation;-><init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    .line 32
    invoke-virtual {p0, v1}, Lmiui/app/screenelement/animation/PositionAnimation;->getItem(I)Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    move-result-object v0

    .line 33
    .local v0, ai:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    invoke-virtual {v0, v1}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v1

    iput-wide v1, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mDelayX:D

    .line 34
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v1

    iput-wide v1, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mDelayY:D

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V
    .registers 6
    .parameter "node"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 24
    const-string v0, "Position"

    invoke-direct {p0, p1, v0, p2}, Lmiui/app/screenelement/animation/BaseAnimation;-><init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    .line 25
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PositionAnimation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wrong tag name:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 26
    return-void
.end method


# virtual methods
.method public final getX()D
    .registers 3

    .prologue
    .line 38
    iget-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentX:D

    return-wide v0
.end method

.method public final getY()D
    .registers 3

    .prologue
    .line 42
    iget-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentY:D

    return-wide v0
.end method

.method protected onCreateItem()Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    .registers 5

    .prologue
    .line 47
    new-instance v0, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "x"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "y"

    aput-object v3, v1, v2

    iget-object v2, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;-><init>([Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    return-object v0
.end method

.method protected onTick(Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;F)V
    .registers 13
    .parameter "item1"
    .parameter "item2"
    .parameter "ratio"

    .prologue
    const/4 v8, 0x1

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 61
    if-nez p1, :cond_9

    if-nez p2, :cond_9

    .line 69
    :goto_8
    return-void

    .line 65
    :cond_9
    if-nez p1, :cond_23

    move-wide v0, v2

    .line 66
    .local v0, x1:D
    :goto_c
    if-nez p1, :cond_28

    .line 67
    .local v2, y1:D
    :goto_e
    invoke-virtual {p2, v4}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v4

    sub-double/2addr v4, v0

    float-to-double v6, p3

    mul-double/2addr v4, v6

    add-double/2addr v4, v0

    iput-wide v4, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentX:D

    .line 68
    invoke-virtual {p2, v8}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v4

    sub-double/2addr v4, v2

    float-to-double v6, p3

    mul-double/2addr v4, v6

    add-double/2addr v4, v2

    iput-wide v4, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentY:D

    goto :goto_8

    .line 65
    .end local v0           #x1:D
    .end local v2           #y1:D
    :cond_23
    invoke-virtual {p1, v4}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v0

    goto :goto_c

    .line 66
    .restart local v0       #x1:D
    :cond_28
    invoke-virtual {p1, v8}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v2

    goto :goto_e
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 53
    invoke-super {p0}, Lmiui/app/screenelement/animation/BaseAnimation;->reset()V

    .line 54
    iget-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mDelayX:D

    iput-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentX:D

    .line 55
    iget-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mDelayY:D

    iput-wide v0, p0, Lmiui/app/screenelement/animation/PositionAnimation;->mCurrentY:D

    .line 56
    return-void
.end method
