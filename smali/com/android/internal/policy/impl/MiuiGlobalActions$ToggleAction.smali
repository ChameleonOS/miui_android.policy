.class abstract Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;
.super Ljava/lang/Object;
.source "MiuiGlobalActions.java"

# interfaces
.implements Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiGlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ToggleAction"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;
    }
.end annotation


# instance fields
.field protected mDisabledIconResid:I

.field protected mDisabledStatusMessageResId:I

.field protected mEnabledIconResId:I

.field protected mEnabledStatusMessageResId:I

.field protected mMessageResId:I

.field protected mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;


# direct methods
.method public constructor <init>(IIIII)V
    .registers 7
    .parameter "enabledIconResId"
    .parameter "disabledIconResid"
    .parameter "essage"
    .parameter "enabledStatusMessageResId"
    .parameter "disabledStatusMessageResId"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    iput p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledIconResId:I

    iput p2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledIconResid:I

    iput p3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mMessageResId:I

    iput p4, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledStatusMessageResId:I

    iput p5, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledStatusMessageResId:I

    return-void
.end method


# virtual methods
.method protected changeStateFromPress(Z)V
    .registers 3
    .parameter "buttonOn"

    .prologue
    if-eqz p1, :cond_7

    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    :goto_4
    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    return-void

    :cond_7
    sget-object v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->Off:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    goto :goto_4
.end method

.method public create(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 13
    .parameter "context"
    .parameter "convertView"
    .parameter "parent"
    .parameter "inflater"

    .prologue
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->willCreate()V

    const v6, 0x6030021

    invoke-virtual {p4, v6, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .local v5, v:Landroid/view/View;
    const v6, 0x60b0027

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .local v1, icon:Landroid/widget/ImageView;
    const v6, 0x60b0028

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .local v2, messageView:Landroid/widget/TextView;
    const v6, 0x60b0026

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .local v4, statusView:Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->isEnabled()Z

    move-result v0

    .local v0, enabled:Z
    if-eqz v2, :cond_34

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mMessageResId:I

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_34
    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v7, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-eq v6, v7, :cond_40

    iget-object v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v7, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->TurningOn:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-ne v6, v7, :cond_41

    :cond_40
    const/4 v3, 0x1

    .local v3, on:Z
    :cond_41
    if-eqz v1, :cond_55

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    if-eqz v3, :cond_6a

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledIconResId:I

    :goto_4b
    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    :cond_55
    if-eqz v4, :cond_66

    if-eqz v3, :cond_6d

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mEnabledStatusMessageResId:I

    :goto_5b
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(I)V

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_66
    invoke-virtual {v5, v0}, Landroid/view/View;->setEnabled(Z)V

    return-object v5

    :cond_6a
    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledIconResid:I

    goto :goto_4b

    :cond_6d
    iget v6, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mDisabledStatusMessageResId:I

    goto :goto_5b
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->inTransition()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public final onPress()V
    .registers 4

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->inTransition()Z

    move-result v1

    if-eqz v1, :cond_10

    const-string v1, "GlobalActions"

    const-string v2, "shouldn\'t be able to toggle when in transition"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_f
    return-void

    :cond_10
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    sget-object v2, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;->On:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    if-eq v1, v2, :cond_1e

    const/4 v0, 0x1

    .local v0, nowOn:Z
    :goto_17
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->onToggle(Z)V

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->changeStateFromPress(Z)V

    goto :goto_f

    .end local v0           #nowOn:Z
    :cond_1e
    const/4 v0, 0x0

    goto :goto_17
.end method

.method abstract onToggle(Z)V
.end method

.method public updateState(Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;)V
    .registers 2
    .parameter "state"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction;->mState:Lcom/android/internal/policy/impl/MiuiGlobalActions$ToggleAction$State;

    return-void
.end method

.method willCreate()V
    .registers 1

    .prologue
    return-void
.end method
