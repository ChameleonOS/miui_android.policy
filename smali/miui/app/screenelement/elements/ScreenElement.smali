.class public abstract Lmiui/app/screenelement/elements/ScreenElement;
.super Ljava/lang/Object;
.source "ScreenElement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/elements/ScreenElement$1;,
        Lmiui/app/screenelement/elements/ScreenElement$Align;,
        Lmiui/app/screenelement/elements/ScreenElement$AlignV;
    }
.end annotation


# static fields
.field public static final ACTUAL_H:Ljava/lang/String; = "actual_h"

.field public static final ACTUAL_W:Ljava/lang/String; = "actual_w"

.field public static final ACTUAL_X:Ljava/lang/String; = "actual_x"

.field public static final ACTUAL_Y:Ljava/lang/String; = "actual_y"

.field public static final VISIBILITY:Ljava/lang/String; = "visibility"

.field public static final VISIBILITY_FALSE:I = 0x0

.field public static final VISIBILITY_TRUE:I = 0x1


# instance fields
.field private mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field protected mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

.field protected mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

.field protected mCategory:Ljava/lang/String;

.field protected mContext:Lmiui/app/screenelement/ScreenContext;

.field private mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

.field protected mHasName:Z

.field protected mIsVisible:Z

.field protected mName:Ljava/lang/String;

.field protected mParent:Lmiui/app/screenelement/elements/ElementGroup;

.field protected mRoot:Lmiui/app/screenelement/ScreenElementRoot;

.field private mShow:Z

.field private mVisibilityExpression:Lmiui/app/screenelement/data/Expression;

.field private mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 9
    .parameter "ele"
    .parameter "c"
    .parameter "root"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    iput-object p2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iput-object p3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    if-eqz p1, :cond_6c

    const-string v2, "category"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mCategory:Ljava/lang/String;

    const-string v2, "name"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6d

    move v2, v3

    :goto_28
    iput-boolean v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    const-string v2, "visibility"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, vis:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_40

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6f

    iput-boolean v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    :cond_40
    :goto_40
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->LEFT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    const-string v2, "align"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, align:Ljava/lang/String;
    const-string v2, "right"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_81

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->RIGHT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    :cond_56
    :goto_56
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->TOP:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    const-string v2, "alignV"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "bottom"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9b

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->BOTTOM:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    .end local v0           #align:Ljava/lang/String;
    .end local v1           #vis:Ljava/lang/String;
    :cond_6c
    :goto_6c
    return-void

    :cond_6d
    move v2, v4

    goto :goto_28

    .restart local v1       #vis:Ljava/lang/String;
    :cond_6f
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7a

    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    goto :goto_40

    :cond_7a
    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityExpression:Lmiui/app/screenelement/data/Expression;

    goto :goto_40

    .restart local v0       #align:Ljava/lang/String;
    :cond_81
    const-string v2, "left"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8e

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->LEFT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    goto :goto_56

    :cond_8e
    const-string v2, "center"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    goto :goto_56

    :cond_9b
    const-string v2, "top"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a8

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->TOP:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    goto :goto_6c

    :cond_a8
    const-string v2, "center"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6c

    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    goto :goto_6c
.end method


# virtual methods
.method protected descale(F)F
    .registers 3
    .parameter "v"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v0

    div-float v0, p1, v0

    return v0
.end method

.method public abstract doRender(Landroid/graphics/Canvas;)V
.end method

.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 3
    .parameter "name"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .end local p0
    :goto_8
    return-object p0

    .restart local p0
    :cond_9
    const/4 p0, 0x0

    goto :goto_8
.end method

.method public finish()V
    .registers 1

    .prologue
    return-void
.end method

.method protected getFramerate()F
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    invoke-virtual {v0}, Lmiui/app/screenelement/FramerateTokenList$FramerateToken;->getFramerate()F

    move-result v0

    goto :goto_5
.end method

.method protected getLeft(FF)F
    .registers 6
    .parameter "pos"
    .parameter "width"

    .prologue
    const/4 v1, 0x0

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_6

    .end local p1
    :goto_5
    return p1

    .restart local p1
    :cond_6
    move v0, p1

    .local v0, x:F
    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/ScreenElement$Align;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    :goto_14
    move p1, v0

    goto :goto_5

    :pswitch_16
    const/high16 v1, 0x4000

    div-float v1, p2, v1

    sub-float/2addr v0, v1

    goto :goto_14

    :pswitch_1c
    sub-float/2addr v0, p2

    goto :goto_14

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_1c
    .end packed-switch
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    return-object v0
.end method

.method protected getTop(FF)F
    .registers 6
    .parameter "pos"
    .parameter "height"

    .prologue
    const/4 v1, 0x0

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_6

    .end local p1
    :goto_5
    return p1

    .restart local p1
    :cond_6
    move v0, p1

    .local v0, y:F
    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    :goto_14
    move p1, v0

    goto :goto_5

    :pswitch_16
    const/high16 v1, 0x4000

    div-float v1, p2, v1

    sub-float/2addr v0, v1

    goto :goto_14

    :pswitch_1c
    sub-float/2addr v0, p2

    goto :goto_14

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_1c
    .end packed-switch
.end method

.method public init()V
    .registers 2

    .prologue
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/elements/ScreenElement;->onVisibilityChange(Z)V

    :cond_d
    return-void
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    return v0
.end method

.method protected isVisibleInner()Z
    .registers 5

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityExpression:Lmiui/app/screenelement/data/Expression;

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityExpression:Lmiui/app/screenelement/data/Expression;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_8

    :cond_1a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public onTouch(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method protected onVisibilityChange(Z)V
    .registers 6
    .parameter "visible"

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_20

    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_17

    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "visibility"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    :cond_17
    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-eqz p1, :cond_21

    const-wide/high16 v0, 0x3ff0

    :goto_1d
    invoke-virtual {v2, v0, v1}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    :cond_20
    return-void

    :cond_21
    const-wide/16 v0, 0x0

    goto :goto_1d
.end method

.method public pause()V
    .registers 1

    .prologue
    return-void
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 3
    .parameter "c"

    .prologue
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-nez v0, :cond_8

    :goto_7
    return-void

    :cond_8
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->doRender(Landroid/graphics/Canvas;)V

    goto :goto_7
.end method

.method protected requestFramerate(F)V
    .registers 4
    .parameter "f"

    .prologue
    const/4 v1, 0x0

    cmpg-float v0, p1, v1

    if-gez v0, :cond_6

    :cond_5
    :goto_5
    return-void

    :cond_6
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    if-nez v0, :cond_1a

    cmpl-float v0, p1, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenContext;->createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    :cond_1a
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/FramerateTokenList$FramerateToken;->requestFramerate(F)V

    goto :goto_5
.end method

.method public requestUpdate()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->requestUpdate()V

    return-void
.end method

.method public final reset()V
    .registers 3

    .prologue
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lmiui/app/screenelement/elements/ScreenElement;->reset(J)V

    return-void
.end method

.method public reset(J)V
    .registers 3
    .parameter "time"

    .prologue
    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    return-void
.end method

.method protected scale(D)F
    .registers 5
    .parameter "v"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v0

    float-to-double v0, v0

    mul-double/2addr v0, p1

    double-to-float v0, v0

    return v0
.end method

.method protected setActualHeight(D)V
    .registers 7
    .parameter "value"

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_18

    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_h"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    :cond_18
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    goto :goto_4
.end method

.method protected setActualWidth(D)V
    .registers 7
    .parameter "value"

    .prologue
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_18

    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_w"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    :cond_18
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    goto :goto_4
.end method

.method public setParent(Lmiui/app/screenelement/elements/ElementGroup;)V
    .registers 2
    .parameter "parent"

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mParent:Lmiui/app/screenelement/elements/ElementGroup;

    return-void
.end method

.method public show(Z)V
    .registers 2
    .parameter "show"

    .prologue
    iput-boolean p1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    return-void
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 4
    .parameter "category"
    .parameter "show"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0, p2}, Lmiui/app/screenelement/elements/ScreenElement;->show(Z)V

    :cond_b
    return-void
.end method

.method public tick(J)V
    .registers 3
    .parameter "currentTime"

    .prologue
    return-void
.end method

.method protected updateVisibility()V
    .registers 3

    .prologue
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisibleInner()Z

    move-result v0

    .local v0, v:Z
    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-eq v1, v0, :cond_f

    iput-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    invoke-virtual {p0, v1}, Lmiui/app/screenelement/elements/ScreenElement;->onVisibilityChange(Z)V

    :cond_f
    return-void
.end method
