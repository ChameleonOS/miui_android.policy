.class Lcom/miui/internal/policy/impl/SlidingPanel$Slider;
.super Landroid/widget/FrameLayout;
.source "SlidingPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/policy/impl/SlidingPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Slider"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

.field private zImageBackground:Landroid/widget/FrameLayout;

.field private zText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/miui/internal/policy/impl/SlidingPanel;Landroid/content/Context;)V
    .registers 10
    .parameter
    .parameter "context"

    .prologue
    const/16 v3, 0x11

    const/16 v6, 0x8

    const/4 v5, 0x0

    const/4 v4, -0x2

    iput-object p1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->this$0:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v4, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v1, v2}, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    const v2, 0x60200bc

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    const/high16 v2, -0x4080

    const/high16 v3, -0x6000

    invoke-virtual {v1, v5, v5, v2, v3}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    const/4 v2, 0x2

    const/high16 v3, 0x4140

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .local v0, layoutParams:Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x35

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public getTextVisibility()I
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    return v0
.end method

.method public setImage(I)V
    .registers 4
    .parameter "resId"

    .prologue
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zImageBackground:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 4
    .parameter "text"

    .prologue
    iget-object v0, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/internal/policy/impl/SlidingPanel$Slider;->zText:Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method
