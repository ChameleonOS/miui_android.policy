.class Lmiui/app/screenelement/elements/AdvancedSlider$Position;
.super Ljava/lang/Object;
.source "AdvancedSlider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/AdvancedSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Position"
.end annotation


# static fields
.field public static final TAG_NAME:Ljava/lang/String; = "Position"


# instance fields
.field private mBaseX:Lmiui/app/screenelement/data/Expression;

.field private mBaseY:Lmiui/app/screenelement/data/Expression;

.field final synthetic this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

.field private x:I

.field private y:I


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lorg/w3c/dom/Element;Lmiui/app/screenelement/data/Expression;Lmiui/app/screenelement/data/Expression;)V
    .registers 5
    .parameter
    .parameter "node"
    .parameter "baseX"
    .parameter "baseY"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 583
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 584
    iput-object p3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseX:Lmiui/app/screenelement/data/Expression;

    .line 585
    iput-object p4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseY:Lmiui/app/screenelement/data/Expression;

    .line 586
    invoke-virtual {p0, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->load(Lorg/w3c/dom/Element;)V

    .line 587
    return-void
.end method


# virtual methods
.method public getX()F
    .registers 6

    .prologue
    .line 590
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseX:Lmiui/app/screenelement/data/Expression;

    if-nez v0, :cond_e

    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->x:I

    int-to-double v0, v0

    :goto_9
    invoke-virtual {v2, v0, v1}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    return v0

    :cond_e
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->x:I

    int-to-double v0, v0

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseX:Lmiui/app/screenelement/data/Expression;

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v4, v4, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v4, v4, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v3, v4}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v3

    add-double/2addr v0, v3

    goto :goto_9
.end method

.method public getY()F
    .registers 6

    .prologue
    .line 594
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseY:Lmiui/app/screenelement/data/Expression;

    if-nez v0, :cond_e

    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->y:I

    int-to-double v0, v0

    :goto_9
    invoke-virtual {v2, v0, v1}, Lmiui/app/screenelement/elements/AdvancedSlider;->scale(D)F

    move-result v0

    return v0

    :cond_e
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->y:I

    int-to-double v0, v0

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->mBaseY:Lmiui/app/screenelement/data/Expression;

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->this$0:Lmiui/app/screenelement/elements/AdvancedSlider;

    iget-object v4, v4, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v4, v4, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v3, v4}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v3

    add-double/2addr v0, v3

    goto :goto_9
.end method

.method public load(Lorg/w3c/dom/Element;)V
    .registers 5
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 598
    if-nez p1, :cond_12

    .line 599
    const-string v0, "LockScreen_AdvancedSlider"

    const-string v1, "node is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    new-instance v0, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v1, "node is null"

    invoke-direct {v0, v1}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 603
    :cond_12
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Position"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "wrong node tag"

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 604
    const-string v0, "x"

    invoke-static {p1, v0, v2}, Lmiui/app/screenelement/util/Utils;->getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->x:I

    .line 605
    const-string v0, "y"

    invoke-static {p1, v0, v2}, Lmiui/app/screenelement/util/Utils;->getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider$Position;->y:I

    .line 606
    return-void
.end method
