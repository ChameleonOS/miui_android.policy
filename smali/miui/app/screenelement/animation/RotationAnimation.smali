.class public Lmiui/app/screenelement/animation/RotationAnimation;
.super Lmiui/app/screenelement/animation/BaseAnimation;
.source "RotationAnimation.java"


# static fields
.field public static final INNER_TAG_NAME:Ljava/lang/String; = "Rotation"

.field public static final TAG_NAME:Ljava/lang/String; = "RotationAnimation"


# instance fields
.field private mCurrentAngle:F


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V
    .registers 4
    .parameter "node"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 17
    const-string v0, "Rotation"

    invoke-direct {p0, p1, v0, p2}, Lmiui/app/screenelement/animation/BaseAnimation;-><init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V

    .line 18
    return-void
.end method


# virtual methods
.method public final getAngle()F
    .registers 2

    .prologue
    .line 21
    iget v0, p0, Lmiui/app/screenelement/animation/RotationAnimation;->mCurrentAngle:F

    return v0
.end method

.method protected onCreateItem()Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    .registers 5

    .prologue
    .line 26
    new-instance v0, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "angle"

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

    .line 34
    if-nez p1, :cond_9

    if-nez p2, :cond_9

    .line 35
    const/4 v2, 0x0

    iput v2, p0, Lmiui/app/screenelement/animation/RotationAnimation;->mCurrentAngle:F

    .line 41
    :goto_8
    return-void

    .line 39
    :cond_9
    if-nez p1, :cond_19

    const-wide/16 v0, 0x0

    .line 40
    .local v0, a1:D
    :goto_d
    invoke-virtual {p2, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v2

    sub-double/2addr v2, v0

    float-to-double v4, p3

    mul-double/2addr v2, v4

    add-double/2addr v2, v0

    double-to-float v2, v2

    iput v2, p0, Lmiui/app/screenelement/animation/RotationAnimation;->mCurrentAngle:F

    goto :goto_8

    .line 39
    .end local v0           #a1:D
    :cond_19
    invoke-virtual {p1, v2}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->get(I)D

    move-result-wide v0

    goto :goto_d
.end method
