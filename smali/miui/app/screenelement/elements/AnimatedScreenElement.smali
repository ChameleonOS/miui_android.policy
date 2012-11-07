.class public abstract Lmiui/app/screenelement/elements/AnimatedScreenElement;
.super Lmiui/app/screenelement/elements/ScreenElement;
.source "AnimatedScreenElement.java"


# instance fields
.field private mActualXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mActualYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field protected mAni:Lmiui/app/screenelement/animation/AnimatedElement;

.field private mCamera:Landroid/graphics/Camera;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPivotZ:Lmiui/app/screenelement/data/Expression;

.field private mRotationX:Lmiui/app/screenelement/data/Expression;

.field private mRotationY:Lmiui/app/screenelement/data/Expression;

.field private mRotationZ:Lmiui/app/screenelement/data/Expression;

.field private mScaleExpression:Lmiui/app/screenelement/data/Expression;

.field private mScaleXExpression:Lmiui/app/screenelement/data/Expression;

.field private mScaleYExpression:Lmiui/app/screenelement/data/Expression;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 9
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 26
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    .line 47
    new-instance v0, Lmiui/app/screenelement/animation/AnimatedElement;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v0, p1, v1}, Lmiui/app/screenelement/animation/AnimatedElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    .line 48
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_32

    .line 49
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_x"

    iget-object v3, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mActualXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 50
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_y"

    iget-object v3, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mActualYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 53
    :cond_32
    const-string v0, "scale"

    invoke-direct {p0, p1, v0, v4}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleExpression:Lmiui/app/screenelement/data/Expression;

    .line 54
    const-string v0, "scaleX"

    invoke-direct {p0, p1, v0, v4}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleXExpression:Lmiui/app/screenelement/data/Expression;

    .line 55
    const-string v0, "scaleY"

    invoke-direct {p0, p1, v0, v4}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleYExpression:Lmiui/app/screenelement/data/Expression;

    .line 57
    const-string v0, "angleX"

    const-string v1, "rotationX"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationX:Lmiui/app/screenelement/data/Expression;

    .line 58
    const-string v0, "angleY"

    const-string v1, "rotationY"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationY:Lmiui/app/screenelement/data/Expression;

    .line 59
    const-string v0, "angleZ"

    const-string v1, "rotationZ"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationZ:Lmiui/app/screenelement/data/Expression;

    .line 60
    const-string v0, "centerZ"

    const-string v1, "pivotZ"

    invoke-direct {p0, p1, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mPivotZ:Lmiui/app/screenelement/data/Expression;

    .line 61
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationX:Lmiui/app/screenelement/data/Expression;

    if-nez v0, :cond_7e

    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationY:Lmiui/app/screenelement/data/Expression;

    if-nez v0, :cond_7e

    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationZ:Lmiui/app/screenelement/data/Expression;

    if-eqz v0, :cond_85

    .line 62
    :cond_7e
    new-instance v0, Landroid/graphics/Camera;

    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    .line 64
    :cond_85
    return-void
.end method

.method private createExp(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;
    .registers 6
    .parameter "node"
    .parameter "name"
    .parameter "compatibleName"

    .prologue
    .line 67
    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    .line 68
    .local v0, exp:Lmiui/app/screenelement/data/Expression;
    if-nez v0, :cond_18

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 69
    invoke-interface {p1, p3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    .line 71
    :cond_18
    return-object v0
.end method


# virtual methods
.method public getAlpha()I
    .registers 3

    .prologue
    .line 215
    iget-object v1, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v1}, Lmiui/app/screenelement/animation/AnimatedElement;->getAlpha()I

    move-result v0

    .line 216
    .local v0, a:I
    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mParent:Lmiui/app/screenelement/elements/ElementGroup;

    if-nez v1, :cond_b

    .end local v0           #a:I
    :goto_a
    return v0

    .restart local v0       #a:I
    :cond_b
    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mParent:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/ElementGroup;->getAlpha()I

    move-result v1

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->mixAlpha(II)I

    move-result v0

    goto :goto_a
.end method

.method public getHeight()F
    .registers 3

    .prologue
    .line 191
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getHeight()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method protected getLeft()F
    .registers 3

    .prologue
    .line 144
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getX()F

    move-result v0

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getWidth()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getLeft(FF)F

    move-result v0

    return v0
.end method

.method public getMaxHeight()F
    .registers 3

    .prologue
    .line 199
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getMaxHeight()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getMaxWidth()F
    .registers 3

    .prologue
    .line 195
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getMaxWidth()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getPivotX()F
    .registers 3

    .prologue
    .line 203
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotX()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getPivotY()F
    .registers 3

    .prologue
    .line 207
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotY()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getRotation()F
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getRotationAngle()F

    move-result v0

    return v0
.end method

.method protected getTop()F
    .registers 3

    .prologue
    .line 148
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getY()F

    move-result v0

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getHeight()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getTop(FF)F

    move-result v0

    return v0
.end method

.method public getWidth()F
    .registers 3

    .prologue
    .line 187
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getWidth()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getX()F
    .registers 3

    .prologue
    .line 179
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getX()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public getY()F
    .registers 3

    .prologue
    .line 183
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->getY()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->scale(D)F

    move-result v0

    return v0
.end method

.method public init()V
    .registers 2

    .prologue
    .line 153
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->init()V

    .line 154
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0}, Lmiui/app/screenelement/animation/AnimatedElement;->init()V

    .line 155
    return-void
.end method

.method protected isVisibleInner()Z
    .registers 2

    .prologue
    .line 175
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisibleInner()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getAlpha()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 16
    .parameter "c"

    .prologue
    const/high16 v9, 0x3f80

    const/4 v13, 0x0

    .line 76
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->updateVisibility()V

    .line 77
    iget-boolean v10, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-nez v10, :cond_b

    .line 141
    :cond_a
    :goto_a
    return-void

    .line 80
    :cond_b
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 81
    const/4 v7, 0x0

    .line 82
    .local v7, set:Z
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getLeft()F

    move-result v10

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getPivotX()F

    move-result v11

    add-float v0, v10, v11

    .line 83
    .local v0, pivotX:F
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getTop()F

    move-result v10

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getPivotY()F

    move-result v11

    add-float v1, v10, v11

    .line 85
    .local v1, pivotY:F
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    if-eqz v10, :cond_99

    .line 86
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v10}, Landroid/graphics/Camera;->save()V

    .line 87
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationX:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_43

    .line 88
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    iget-object v11, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationX:Lmiui/app/screenelement/data/Expression;

    iget-object v12, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v12, v12, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v11, v12}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v11

    double-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/Camera;->rotateX(F)V

    .line 89
    const/4 v7, 0x1

    .line 91
    :cond_43
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationY:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_58

    .line 92
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    iget-object v11, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationY:Lmiui/app/screenelement/data/Expression;

    iget-object v12, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v12, v12, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v11, v12}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v11

    double-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/Camera;->rotateY(F)V

    .line 93
    const/4 v7, 0x1

    .line 95
    :cond_58
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationZ:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_6d

    .line 96
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    iget-object v11, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mRotationZ:Lmiui/app/screenelement/data/Expression;

    iget-object v12, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v12, v12, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v11, v12}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v11

    double-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/Camera;->rotateZ(F)V

    .line 97
    const/4 v7, 0x1

    .line 99
    :cond_6d
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mPivotZ:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_81

    .line 100
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    iget-object v11, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mPivotZ:Lmiui/app/screenelement/data/Expression;

    iget-object v12, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v12, v12, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v11, v12}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v11

    double-to-float v11, v11

    invoke-virtual {v10, v13, v13, v11}, Landroid/graphics/Camera;->translate(FFF)V

    .line 102
    :cond_81
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    iget-object v11, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v11}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 103
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    neg-float v11, v0

    neg-float v12, v1

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 104
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 105
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mCamera:Landroid/graphics/Camera;

    invoke-virtual {v10}, Landroid/graphics/Camera;->restore()V

    .line 107
    :cond_99
    const/4 v3, 0x0

    .line 108
    .local v3, sc:I
    if-eqz v7, :cond_aa

    .line 109
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 110
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 111
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 114
    :cond_aa
    const/4 v8, 0x0

    .line 115
    .local v8, set1:Z
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getRotation()F

    move-result v2

    .line 116
    .local v2, rotation:F
    cmpl-float v10, v2, v13

    if-eqz v10, :cond_b9

    .line 117
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v2, v0, v1}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 118
    const/4 v8, 0x1

    .line 120
    :cond_b9
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_e7

    .line 121
    iget-object v9, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleExpression:Lmiui/app/screenelement/data/Expression;

    iget-object v10, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v10, v10, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v9, v10}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v9

    double-to-float v4, v9

    .line 122
    .local v4, scale:F
    iget-object v9, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v9, v4, v4, v0, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 123
    const/4 v8, 0x1

    .line 131
    .end local v4           #scale:F
    :cond_ce
    :goto_ce
    if-eqz v8, :cond_db

    .line 132
    if-nez v7, :cond_d6

    .line 133
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    .line 135
    :cond_d6
    iget-object v9, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 137
    :cond_db
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->doRender(Landroid/graphics/Canvas;)V

    .line 138
    if-nez v7, :cond_e2

    if-eqz v8, :cond_a

    .line 139
    :cond_e2
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_a

    .line 124
    :cond_e7
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleXExpression:Lmiui/app/screenelement/data/Expression;

    if-nez v10, :cond_ef

    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleYExpression:Lmiui/app/screenelement/data/Expression;

    if-eqz v10, :cond_ce

    .line 125
    :cond_ef
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleXExpression:Lmiui/app/screenelement/data/Expression;

    if-nez v10, :cond_100

    move v5, v9

    .line 126
    .local v5, scaleX:F
    :goto_f4
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleYExpression:Lmiui/app/screenelement/data/Expression;

    if-nez v10, :cond_10c

    move v6, v9

    .line 127
    .local v6, scaleY:F
    :goto_f9
    iget-object v9, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v9, v5, v6, v0, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 128
    const/4 v8, 0x1

    goto :goto_ce

    .line 125
    .end local v5           #scaleX:F
    .end local v6           #scaleY:F
    :cond_100
    iget-object v10, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleXExpression:Lmiui/app/screenelement/data/Expression;

    iget-object v11, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v11, v11, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v10, v11}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v10

    double-to-float v5, v10

    goto :goto_f4

    .line 126
    .restart local v5       #scaleX:F
    :cond_10c
    iget-object v9, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mScaleYExpression:Lmiui/app/screenelement/data/Expression;

    iget-object v10, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v10, v10, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v9, v10}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v9

    double-to-float v6, v9

    goto :goto_f9
.end method

.method public reset(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 159
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->reset(J)V

    .line 160
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/animation/AnimatedElement;->reset(J)V

    .line 161
    return-void
.end method

.method public tick(J)V
    .registers 6
    .parameter "currentTime"

    .prologue
    .line 165
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    .line 166
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/animation/AnimatedElement;->tick(J)V

    .line 167
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_24

    .line 168
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mActualXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v1}, Lmiui/app/screenelement/animation/AnimatedElement;->getX()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 169
    iget-object v0, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mActualYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v1}, Lmiui/app/screenelement/animation/AnimatedElement;->getY()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 171
    :cond_24
    return-void
.end method
