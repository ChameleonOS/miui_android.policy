.class Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;
.super Landroid/view/animation/Animation;
.source "SlidingPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/policy/impl/SlidingPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlidingPanelAnimation"
.end annotation


# instance fields
.field private mDeltaY:I

.field private mInitBottom:I

.field private mMode:I

.field private mPanel:Lcom/miui/internal/policy/impl/SlidingPanel;

.field final synthetic this$0:Lcom/miui/internal/policy/impl/SlidingPanel;


# direct methods
.method public constructor <init>(Lcom/miui/internal/policy/impl/SlidingPanel;Lcom/miui/internal/policy/impl/SlidingPanel;I)V
    .registers 5
    .parameter
    .parameter "panel"
    .parameter "mode"

    .prologue
    iput-object p1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mMode:I

    iput-object p2, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mPanel:Lcom/miui/internal/policy/impl/SlidingPanel;

    iput p3, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mMode:I

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 7
    .parameter "interpolatedTime"
    .parameter "t"

    .prologue
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mPanel:Lcom/miui/internal/policy/impl/SlidingPanel;

    const/4 v1, 0x0

    iget v2, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mInitBottom:I

    iget v3, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mDeltaY:I

    int-to-float v3, v3

    mul-float/2addr v3, p1

    float-to-int v3, v3

    add-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->scrollTo(II)V

    return-void
.end method

.method public reset()V
    .registers 3

    .prologue
    invoke-super {p0}, Landroid/view/animation/Animation;->reset()V

    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    #getter for: Lcom/miui/internal/policy/impl/SlidingPanel;->mScrollY:I
    invoke-static {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$000(Lcom/miui/internal/policy/impl/SlidingPanel;)I

    move-result v0

    iput v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mInitBottom:I

    iget v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mMode:I

    if-nez v0, :cond_15

    iget v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mInitBottom:I

    neg-int v0, v0

    iput v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mDeltaY:I

    :cond_14
    :goto_14
    return-void

    :cond_15
    iget v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    #getter for: Lcom/miui/internal/policy/impl/SlidingPanel;->mDisplayHeight:I
    invoke-static {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->access$100(Lcom/miui/internal/policy/impl/SlidingPanel;)I

    move-result v0

    neg-int v0, v0

    iget v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mInitBottom:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$SlidingPanelAnimation;->mDeltaY:I

    goto :goto_14
.end method
