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

    .line 73
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    .line 57
    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    .line 74
    iput-object p2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    .line 75
    iput-object p3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    .line 76
    if-eqz p1, :cond_6c

    .line 77
    const-string v2, "category"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mCategory:Ljava/lang/String;

    .line 78
    const-string v2, "name"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    .line 79
    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6d

    move v2, v3

    :goto_28
    iput-boolean v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    .line 80
    const-string v2, "visibility"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, vis:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_40

    .line 82
    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 83
    iput-boolean v4, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    .line 90
    :cond_40
    :goto_40
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->LEFT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    .line 91
    const-string v2, "align"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, align:Ljava/lang/String;
    const-string v2, "right"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 93
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->RIGHT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    .line 100
    :cond_56
    :goto_56
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->TOP:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    .line 101
    const-string v2, "alignV"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    const-string v2, "bottom"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9b

    .line 103
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->BOTTOM:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    .line 110
    .end local v0           #align:Ljava/lang/String;
    .end local v1           #vis:Ljava/lang/String;
    :cond_6c
    :goto_6c
    return-void

    :cond_6d
    move v2, v4

    .line 79
    goto :goto_28

    .line 84
    .restart local v1       #vis:Ljava/lang/String;
    :cond_6f
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7a

    .line 85
    iput-boolean v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    goto :goto_40

    .line 87
    :cond_7a
    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityExpression:Lmiui/app/screenelement/data/Expression;

    goto :goto_40

    .line 94
    .restart local v0       #align:Ljava/lang/String;
    :cond_81
    const-string v2, "left"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8e

    .line 95
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->LEFT:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    goto :goto_56

    .line 96
    :cond_8e
    const-string v2, "center"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 97
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$Align;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$Align;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    goto :goto_56

    .line 104
    :cond_9b
    const-string v2, "top"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a8

    .line 105
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->TOP:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    goto :goto_6c

    .line 106
    :cond_a8
    const-string v2, "center"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6c

    .line 107
    sget-object v2, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->CENTER:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    iput-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    goto :goto_6c
.end method


# virtual methods
.method protected descale(F)F
    .registers 3
    .parameter "v"

    .prologue
    .line 255
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v0

    div-float v0, p1, v0

    return v0
.end method

.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 3
    .parameter "name"

    .prologue
    .line 127
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
    .line 173
    return-void
.end method

.method protected getFramerate()F
    .registers 2

    .prologue
    .line 259
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
    .line 231
    const/4 v1, 0x0

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_6

    .line 242
    .end local p1
    :goto_5
    return p1

    .line 233
    .restart local p1
    :cond_6
    move v0, p1

    .line 234
    .local v0, x:F
    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$Align:[I

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlign:Lmiui/app/screenelement/elements/ScreenElement$Align;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/ScreenElement$Align;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    :goto_14
    move p1, v0

    .line 242
    goto :goto_5

    .line 236
    :pswitch_16
    const/high16 v1, 0x4000

    div-float v1, p2, v1

    sub-float/2addr v0, v1

    .line 237
    goto :goto_14

    .line 239
    :pswitch_1c
    sub-float/2addr v0, p2

    goto :goto_14

    .line 234
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_1c
    .end packed-switch
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    return-object v0
.end method

.method protected getTop(FF)F
    .registers 6
    .parameter "pos"
    .parameter "height"

    .prologue
    .line 216
    const/4 v1, 0x0

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_6

    .line 227
    .end local p1
    :goto_5
    return p1

    .line 218
    .restart local p1
    :cond_6
    move v0, p1

    .line 219
    .local v0, y:F
    sget-object v1, Lmiui/app/screenelement/elements/ScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ScreenElement$AlignV:[I

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mAlignV:Lmiui/app/screenelement/elements/ScreenElement$AlignV;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/ScreenElement$AlignV;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    :goto_14
    move p1, v0

    .line 227
    goto :goto_5

    .line 221
    :pswitch_16
    const/high16 v1, 0x4000

    div-float v1, p2, v1

    sub-float/2addr v0, v1

    .line 222
    goto :goto_14

    .line 224
    :pswitch_1c
    sub-float/2addr v0, p2

    goto :goto_14

    .line 219
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_1c
    .end packed-switch
.end method

.method public init()V
    .registers 2

    .prologue
    .line 139
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->reset()V

    .line 140
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    .line 141
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 143
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/elements/ScreenElement;->onVisibilityChange(Z)V

    .line 145
    :cond_10
    return-void
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 118
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    return v0
.end method

.method protected isVisibleInner()Z
    .registers 5

    .prologue
    .line 184
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
    .line 191
    const/4 v0, 0x0

    return v0
.end method

.method protected onVisibilityChange(Z)V
    .registers 6
    .parameter "visible"

    .prologue
    .line 157
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_20

    .line 158
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_17

    .line 159
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "visibility"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 161
    :cond_17
    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mVisibilityVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-eqz p1, :cond_21

    const-wide/high16 v0, 0x3ff0

    :goto_1d
    invoke-virtual {v2, v0, v1}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 163
    :cond_20
    return-void

    .line 161
    :cond_21
    const-wide/16 v0, 0x0

    goto :goto_1d
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 166
    return-void
.end method

.method public abstract render(Landroid/graphics/Canvas;)V
.end method

.method protected requestFramerate(F)V
    .registers 4
    .parameter "f"

    .prologue
    const/4 v1, 0x0

    .line 263
    cmpg-float v0, p1, v1

    if-gez v0, :cond_6

    .line 274
    :cond_5
    :goto_5
    return-void

    .line 266
    :cond_6
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    if-nez v0, :cond_1a

    .line 268
    cmpl-float v0, p1, v1

    if-eqz v0, :cond_5

    .line 270
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenContext;->createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    .line 272
    :cond_1a
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    if-eqz v0, :cond_5

    .line 273
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mFramerateToken:Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/FramerateTokenList$FramerateToken;->requestFramerate(F)V

    goto :goto_5
.end method

.method public requestUpdate()V
    .registers 2

    .prologue
    .line 246
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->requestUpdate()V

    .line 247
    return-void
.end method

.method public reset()V
    .registers 1

    .prologue
    .line 177
    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    .line 169
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    .line 170
    return-void
.end method

.method protected scale(D)F
    .registers 5
    .parameter "v"

    .prologue
    .line 251
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
    .line 205
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-nez v0, :cond_5

    .line 213
    :goto_4
    return-void

    .line 208
    :cond_5
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_18

    .line 209
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_h"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 211
    :cond_18
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    goto :goto_4
.end method

.method protected setActualWidth(D)V
    .registers 7
    .parameter "value"

    .prologue
    .line 195
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-nez v0, :cond_5

    .line 202
    :goto_4
    return-void

    .line 198
    :cond_5
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v0, :cond_18

    .line 199
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "actual_w"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 201
    :cond_18
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mActualWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    goto :goto_4
.end method

.method public setParent(Lmiui/app/screenelement/elements/ElementGroup;)V
    .registers 2
    .parameter "parent"

    .prologue
    .line 135
    iput-object p1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mParent:Lmiui/app/screenelement/elements/ElementGroup;

    .line 136
    return-void
.end method

.method public show(Z)V
    .registers 2
    .parameter "show"

    .prologue
    .line 113
    iput-boolean p1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mShow:Z

    .line 114
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    .line 115
    return-void
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 4
    .parameter "category"
    .parameter "show"

    .prologue
    .line 122
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 123
    invoke-virtual {p0, p2}, Lmiui/app/screenelement/elements/ScreenElement;->show(Z)V

    .line 124
    :cond_b
    return-void
.end method

.method public tick(J)V
    .registers 3
    .parameter "currentTime"

    .prologue
    .line 180
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->updateVisibility()V

    .line 181
    return-void
.end method

.method protected updateVisibility()V
    .registers 3

    .prologue
    .line 148
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisibleInner()Z

    move-result v0

    .line 150
    .local v0, v:Z
    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    if-eq v1, v0, :cond_f

    .line 151
    iput-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    .line 152
    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mIsVisible:Z

    invoke-virtual {p0, v1}, Lmiui/app/screenelement/elements/ScreenElement;->onVisibilityChange(Z)V

    .line 154
    :cond_f
    return-void
.end method
