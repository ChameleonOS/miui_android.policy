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
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Invalid:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p0, p2, p3}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->load(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    return-void
.end method

.method private loadGroup(Lorg/w3c/dom/Element;Ljava/lang/String;)Lmiui/app/screenelement/elements/ElementGroup;
    .registers 7
    .parameter "node"
    .parameter "tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    invoke-static {p1, p2}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .local v0, ele:Lorg/w3c/dom/Element;
    if-eqz v0, :cond_14

    new-instance v1, Lmiui/app/screenelement/elements/ElementGroup;

    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v3, v3, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-direct {v1, v0, v2, v3}, Lmiui/app/screenelement/elements/ElementGroup;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    :goto_13
    return-object v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method


# virtual methods
.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 4
    .parameter "name"

    .prologue
    const/4 v0, 0x0

    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    if-eqz v0, :cond_f

    move-object v1, v0

    :goto_e
    return-object v1

    :cond_f
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_1d

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    if-eqz v0, :cond_1d

    move-object v1, v0

    goto :goto_e

    :cond_1d
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    if-eqz v0, :cond_2b

    move-object v1, v0

    goto :goto_e

    :cond_2b
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public finish()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    :cond_1b
    return-void
.end method

.method public getCurrentX()F
    .registers 2

    .prologue
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    return v0
.end method

.method public getCurrentY()F
    .registers 2

    .prologue
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    return v0
.end method

.method public getState()Lmiui/app/screenelement/elements/AdvancedSlider$State;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    return-object v0
.end method

.method public getX()F
    .registers 4

    .prologue
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
    .registers 4

    .prologue
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

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_31

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    :cond_31
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    :cond_3a
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_43

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    :cond_43
    sget-object v0, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Normal:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    return-void
.end method

.method public load(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .registers 5
    .parameter "node"
    .parameter "tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "wrong node name"

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    const-string v0, "name"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mName:Ljava/lang/String;

    const-string v0, "normalSound"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalSound:Ljava/lang/String;

    const-string v0, "pressedSound"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedSound:Ljava/lang/String;

    const-string v0, "reachedSound"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedSound:Ljava/lang/String;

    const-string v0, "x"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    const-string v0, "y"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    const-string v0, "w"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mWidth:Lmiui/app/screenelement/data/Expression;

    const-string v0, "h"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mHeight:Lmiui/app/screenelement/data/Expression;

    const-string v0, "NormalState"

    invoke-direct {p0, p1, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->loadGroup(Lorg/w3c/dom/Element;Ljava/lang/String;)Lmiui/app/screenelement/elements/ElementGroup;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    const-string v0, "PressedState"

    invoke-direct {p0, p1, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->loadGroup(Lorg/w3c/dom/Element;Ljava/lang/String;)Lmiui/app/screenelement/elements/ElementGroup;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    const-string v0, "ReachedState"

    invoke-direct {p0, p1, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->loadGroup(Lorg/w3c/dom/Element;Ljava/lang/String;)Lmiui/app/screenelement/elements/ElementGroup;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    return-void
.end method

.method public moveTo(FF)V
    .registers 3
    .parameter "x"
    .parameter "y"

    .prologue
    iput p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    iput p2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    return-void
.end method

.method protected onStateChange(Lmiui/app/screenelement/elements/AdvancedSlider$State;Lmiui/app/screenelement/elements/AdvancedSlider$State;)V
    .registers 3
    .parameter "pre"
    .parameter "s"

    .prologue
    return-void
.end method

.method public pause()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    :cond_1b
    return-void
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 8
    .parameter "c"

    .prologue
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, v5, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v5, v5, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v4, v5}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v1

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

    .local v2, y:F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .local v0, rs:I
    iget v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    sub-float/2addr v3, v1

    iget v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    sub-float/2addr v4, v2

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/elements/ScreenElement;->render(Landroid/graphics/Canvas;)V

    :cond_3a
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public reset(J)V
    .registers 4
    .parameter "time"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    :cond_1b
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    :cond_1b
    return-void
.end method

.method public setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V
    .registers 9
    .parameter "s"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    if-ne v5, p1, :cond_7

    :goto_6
    return-void

    :cond_7
    iget-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    .local v1, preState:Lmiui/app/screenelement/elements/AdvancedSlider$State;
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    const/4 v0, 0x0

    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    const/4 v2, 0x0

    .local v2, reset:Z
    sget-object v5, Lmiui/app/screenelement/elements/AdvancedSlider$1;->$SwitchMap$miui$app$screenelement$elements$AdvancedSlider$State:[I

    invoke-virtual {p1}, Lmiui/app/screenelement/elements/AdvancedSlider$State;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_62

    :goto_18
    if-eqz v0, :cond_1f

    if-eqz v2, :cond_1f

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->reset()V

    :cond_1f
    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mState:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p0, v1, v3}, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->onStateChange(Lmiui/app/screenelement/elements/AdvancedSlider$State;Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_6

    :pswitch_27
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_2f

    move v2, v3

    :goto_2e
    goto :goto_18

    :cond_2f
    move v2, v4

    goto :goto_2e

    :pswitch_31
    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_45

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    :goto_37
    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_48

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    #getter for: Lmiui/app/screenelement/elements/AdvancedSlider;->mPressed:Z
    invoke-static {v5}, Lmiui/app/screenelement/elements/AdvancedSlider;->access$500(Lmiui/app/screenelement/elements/AdvancedSlider;)Z

    move-result v5

    if-nez v5, :cond_48

    move v2, v3

    :goto_44
    goto :goto_18

    :cond_45
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_37

    :cond_48
    move v2, v4

    goto :goto_44

    :pswitch_4a
    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_56

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    :goto_50
    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_60

    move v2, v3

    :goto_55
    goto :goto_18

    :cond_56
    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v5, :cond_5d

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_50

    :cond_5d
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    goto :goto_50

    :cond_60
    move v2, v4

    goto :goto_55

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_27
        :pswitch_31
        :pswitch_4a
    .end packed-switch
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 4
    .parameter "category"
    .parameter "show"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mPressedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mNormalStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    :cond_12
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mReachedStateElements:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->showCategory(Ljava/lang/String;Z)V

    :cond_1b
    return-void
.end method

.method public tick(J)V
    .registers 4
    .parameter "currentTime"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentStateElements:Lmiui/app/screenelement/elements/ScreenElement;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    :cond_9
    return-void
.end method

.method public touched(FF)Z
    .registers 10
    .parameter "x"
    .parameter "y"

    .prologue
    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v5, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v6, v6, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v6, v6, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v5, v6}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v2

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
