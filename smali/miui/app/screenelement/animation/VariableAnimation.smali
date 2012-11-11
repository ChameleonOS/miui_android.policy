.class public Lmiui/app/screenelement/animation/VariableAnimation;
.super Lmiui/app/screenelement/animation/BaseAnimation;
.source "VariableAnimation.java"


# static fields
.field public static final INNER_TAG_NAME:Ljava/lang/String; = "AniFrame"

.field public static final TAG_NAME:Ljava/lang/String; = "VariableAnimation"


# instance fields
.field private mCurrentValue:D

.field private mDelayValue:D


# direct methods
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
    const/4 v2, 0x0

    const-string v1, "AniFrame"

    invoke-direct {p0, p1, v1, p2}, Lmiui/app/screenelement/animation/BaseAnimation;-><init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    invoke-virtual {p0, v2}, Lmiui/app/screenelement/animation/VariableAnimation;->getItem(I)Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    move-result-object v0

    .local v0, ai:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    invoke-virtual {v0, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v1

    iput-wide v1, p0, Lmiui/app/screenelement/animation/VariableAnimation;->mDelayValue:D

    return-void
.end method


# virtual methods
.method public final getValue()D
    .registers 3

    .prologue
    iget-wide v0, p0, Lmiui/app/screenelement/animation/VariableAnimation;->mCurrentValue:D

    return-wide v0
.end method

.method protected onCreateItem()Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    .registers 5

    .prologue
    new-instance v0, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "value"

    aput-object v3, v1, v2

    iget-object v2, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;-><init>([Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    return-object v0
.end method

.method protected onTick(Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;F)V
    .registers 10
    .parameter "item1"
    .parameter "item2"
    .parameter "ratio"

    .prologue
    const/4 v2, 0x0

    if-nez p1, :cond_6

    if-nez p2, :cond_6

    :goto_5
    return-void

    :cond_6
    if-nez p1, :cond_15

    const-wide/16 v0, 0x0

    .local v0, a1:D
    :goto_a
    invoke-virtual {p2, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v2

    sub-double/2addr v2, v0

    float-to-double v4, p3

    mul-double/2addr v2, v4

    add-double/2addr v2, v0

    iput-wide v2, p0, Lmiui/app/screenelement/animation/VariableAnimation;->mCurrentValue:D

    goto :goto_5

    .end local v0           #a1:D
    :cond_15
    invoke-virtual {p1, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v0

    goto :goto_a
.end method

.method public reset(J)V
    .registers 5
    .parameter "time"

    .prologue
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/animation/BaseAnimation;->reset(J)V

    iget-wide v0, p0, Lmiui/app/screenelement/animation/VariableAnimation;->mDelayValue:D

    iput-wide v0, p0, Lmiui/app/screenelement/animation/VariableAnimation;->mCurrentValue:D

    return-void
.end method
