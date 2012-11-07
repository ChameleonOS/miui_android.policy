.class Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;
.super Ljava/lang/Object;
.source "AdvancedSlider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/AdvancedSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SliderPoint"
.end annotation


# instance fields
.field private mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

.field protected mCurrentX:F

.field protected mCurrentY:F

.field private mHeight:Lmiui/app/screenelement/data/Expression;

.field protected mName:Ljava/lang/String;

.field protected mNormalSound:Ljava/lang/String;

.field protected mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

.field protected mPressedSound:Ljava/lang/String;

.field protected mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

.field protected mReachedSound:Ljava/lang/String;

.field private mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

.field private mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

.field private mWidth:Lmiui/app/screenelement/data/Expression;

.field protected mX:Lmiui/app/screenelement/data/Expression;

.field protected mY:Lmiui/app/screenelement/data/Expression;

.field final synthetic this$0:Lmiui/app/screenelement/elements/AdvancedSlider;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .registers 5
    .parameter
    .parameter "node"
    .parameter "tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 338
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 322
    sget-object v0, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Invalid:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    .line 339
    invoke-virtual {p0, p2, p3}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->load(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 340
    return-void
.end method


# virtual methods
.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 4
    .parameter "name"

    .prologue
    .line 464
    const/4 v0, 0x0

    .line 465
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_f

    .line 466
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 467
    if-eqz v0, :cond_f

    move-object v1, v0

    .line 480
    :goto_e
    return-object v1

    .line 470
    :cond_f
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_1d

    .line 471
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 472
    if-eqz v0, :cond_1d

    move-object v1, v0

    .line 473
    goto :goto_e

    .line 475
    :cond_1d
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_2b

    .line 476
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 477
    if-eqz v0, :cond_2b

    move-object v1, v0

    .line 478
    goto :goto_e

    .line 480
    :cond_2b
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public finish()V
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 405
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    .line 406
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    .line 407
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    .line 408
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    .line 409
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    .line 410
    :cond_1b
    return-void
.end method

.method public getCurrentX()F
    .registers 2

    .prologue
    .line 492
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    return v0
.end method

.method public getCurrentY()F
    .registers 2

    .prologue
    .line 496
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    return v0
.end method

.method public getState()Lmiui/app/screenelement/elements/AdvancedSlider$State;
    .registers 2

    .prologue
    .line 533
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    return-object v0
.end method

.method public getX()F
    .registers 4

    .prologue
    .line 484
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    return v0
.end method

.method public getY()F
    .registers 4

    .prologue
    .line 488
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    return v0
.end method

.method public init()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 385
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    .line 386
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    .line 387
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_38

    .line 388
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    .line 389
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/elements/ElementGroup;->show(Z)V

    .line 391
    :cond_38
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_46

    .line 392
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    .line 393
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, v3}, Lmiui/app/screenelement/elements/ElementGroup;->show(Z)V

    .line 395
    :cond_46
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_54

    .line 396
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    .line 397
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, v3}, Lmiui/app/screenelement/elements/ElementGroup;->show(Z)V

    .line 400
    :cond_54
    sget-object v0, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Normal:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    .line 401
    return-void
.end method

.method public load(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .registers 7
    .parameter "node"
    .parameter "tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 343
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "wrong node name"

    invoke-static {v1, v2}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 344
    const-string v1, "name"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mName:Ljava/lang/String;

    .line 345
    const-string v1, "normalSound"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalSound:Ljava/lang/String;

    .line 346
    const-string v1, "pressedSound"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedSound:Ljava/lang/String;

    .line 347
    const-string v1, "reachedSound"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedSound:Ljava/lang/String;

    .line 349
    const-string v1, "x"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    .line 350
    const-string v1, "y"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    .line 351
    const-string v1, "w"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mWidth:Lmiui/app/screenelement/data/Expression;

    .line 352
    const-string v1, "h"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mHeight:Lmiui/app/screenelement/data/Expression;

    .line 354
    const-string v1, "NormalState"

    invoke-static {p1, v1}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 355
    .local v0, ele:Lorg/w3c/dom/Element;
    if-eqz v0, :cond_74

    .line 356
    new-instance v1, Lmiui/app/screenelement/elements/ElementGroup;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v3, v3, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-direct {v1, v0, v2, v3}, Lmiui/app/screenelement/elements/ElementGroup;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    .line 359
    :cond_74
    const-string v1, "PressedState"

    invoke-static {p1, v1}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 360
    if-eqz v0, :cond_8b

    .line 361
    new-instance v1, Lmiui/app/screenelement/elements/ElementGroup;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v3, v3, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-direct {v1, v0, v2, v3}, Lmiui/app/screenelement/elements/ElementGroup;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    .line 365
    :cond_8b
    const-string v1, "ReachedState"

    invoke-static {p1, v1}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 366
    if-eqz v0, :cond_a2

    .line 367
    new-instance v1, Lmiui/app/screenelement/elements/ElementGroup;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v3, v3, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-direct {v1, v0, v2, v3}, Lmiui/app/screenelement/elements/ElementGroup;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    .line 369
    :cond_a2
    return-void
.end method

.method public moveTo(FF)V
    .registers 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 380
    iput p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    .line 381
    iput p2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    .line 382
    return-void
.end method

.method protected onStateChange(Lmiui/app/screenelement/elements/AdvancedSlider$State;Lmiui/app/screenelement/elements/AdvancedSlider$State;)V
    .registers 3
    .parameter "pre"
    .parameter "s"

    .prologue
    .line 537
    return-void
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 413
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 414
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    .line 415
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    .line 416
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    .line 417
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    .line 418
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    .line 419
    :cond_1b
    return-void
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 8
    .parameter "c"

    .prologue
    .line 440
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, v5, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v5, v5, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v4, v5}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v1

    .line 441
    .local v1, x:F
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, v5, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v5, v5, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v4, v5}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v2

    .line 442
    .local v2, y:F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 443
    .local v0, rs:I
    iget v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    sub-float/2addr v3, v1

    iget v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    sub-float/2addr v4, v2

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 444
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eqz v3, :cond_3a

    .line 445
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/elements/ScreenElement;->render(Landroid/graphics/Canvas;)V

    .line 446
    :cond_3a
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 447
    return-void
.end method

.method public reset(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 431
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 432
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    .line 433
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    .line 434
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    .line 435
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    .line 436
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    .line 437
    :cond_1b
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 422
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 423
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    .line 424
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    .line 425
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    .line 426
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    .line 427
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    .line 428
    :cond_1b
    return-void
.end method

.method public setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V
    .registers 6
    .parameter "s"

    .prologue
    .line 500
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    if-ne v2, p1, :cond_5

    .line 530
    :goto_4
    return-void

    .line 502
    :cond_5
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    .line 503
    .local v1, preState:Lmiui/app/screenelement/elements/AdvancedSlider$State;
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    .line 504
    const/4 v0, 0x0

    .line 505
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    sget-object v2, Lmiui/app/screenelement/elements/AdvancedSlider$1;->$SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State:[I

    invoke-virtual {p1}, Lmiui/app/screenelement/elements/AdvancedSlider$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_60

    .line 518
    :goto_15
    if-eqz v0, :cond_26

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-ne v0, v2, :cond_23

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    #getter for: Lmiui/app/screenelement/elements/AdvancedSlider;->mPressed:Z
    invoke-static {v2}, Lmiui/app/screenelement/elements/AdvancedSlider;->access$500(Lmiui/app/screenelement/elements/AdvancedSlider;)Z

    move-result v2

    if-nez v2, :cond_26

    .line 519
    :cond_23
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->reset()V

    .line 521
    :cond_26
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eq v2, v0, :cond_3c

    .line 522
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eqz v2, :cond_34

    .line 523
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/elements/ScreenElement;->show(Z)V

    .line 524
    :cond_34
    if-eqz v0, :cond_3a

    .line 525
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lmiui/app/screenelement/elements/ElementGroup;->show(Z)V

    .line 526
    :cond_3a
    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    .line 529
    :cond_3c
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p0, v1, v2}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->onStateChange(Lmiui/app/screenelement/elements/AdvancedSlider$State;Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_4

    .line 507
    :pswitch_42
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    .line 508
    goto :goto_15

    .line 510
    :pswitch_45
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v2, :cond_4c

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    .line 511
    :goto_4b
    goto :goto_15

    .line 510
    :cond_4c
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_4b

    .line 513
    :pswitch_4f
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v2, :cond_56

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    :goto_55
    goto :goto_15

    :cond_56
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v2, :cond_5d

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_55

    :cond_5d
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_55

    .line 505
    :pswitch_data_60
    .packed-switch 0x1
        :pswitch_42
        :pswitch_45
        :pswitch_4f
    .end packed-switch
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 4
    .parameter "category"
    .parameter "show"

    .prologue
    .line 455
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 456
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    .line 457
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    .line 458
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    .line 459
    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    .line 460
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    .line 461
    :cond_1b
    return-void
.end method

.method public tick(J)V
    .registers 4
    .parameter "currentTime"

    .prologue
    .line 450
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eqz v0, :cond_9

    .line 451
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    .line 452
    :cond_9
    return-void
.end method

.method public touched(FF)Z
    .registers 10
    .parameter "x"
    .parameter "y"

    .prologue
    .line 372
    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v6, v6, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v6, v6, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v2

    .line 373
    .local v2, cx:F
    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mWidth:Lmiui/app/screenelement/data/Expression;

    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v6, v6, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v6, v6, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v1

    .line 374
    .local v1, cw:F
    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v6, v6, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v6, v6, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v3

    .line 375
    .local v3, cy:F
    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mHeight:Lmiui/app/screenelement/data/Expression;

    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v6, v6, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v6, v6, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    .line 376
    .local v0, ch:F
    cmpl-float v4, p1, v2

    if-ltz v4, :cond_5e

    add-float v4, v2, v1

    cmpg-float v4, p1, v4

    if-gtz v4, :cond_5e

    cmpl-float v4, p2, v3

    if-ltz v4, :cond_5e

    add-float v4, v3, v0

    cmpg-float v4, p2, v4

    if-gtz v4, :cond_5e

    const/4 v4, 0x1

    :goto_5d
    return v4

    :cond_5e
    const/4 v4, 0x0

    goto :goto_5d
.end method
