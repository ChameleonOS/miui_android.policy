.class final Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;
.super Ljava/lang/Object;
.source "PhoneWindow.java"

# interfaces
.implements Lcom/android/internal/view/menu/MenuBuilder$Callback;
.implements Lcom/android/internal/view/menu/MenuPresenter$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/PhoneWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DialogMenuCallback"
.end annotation


# instance fields
.field private mFeatureId:I

.field private mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

.field final synthetic this$0:Lcom/android/internal/policy/impl/PhoneWindow;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/PhoneWindow;I)V
    .registers 3
    .parameter
    .parameter "featureId"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mFeatureId:I

    return-void
.end method


# virtual methods
.method public onCloseMenu(Lcom/android/internal/view/menu/MenuBuilder;Z)V
    .registers 5
    .parameter "menu"
    .parameter "allMenusAreClosing"

    .prologue
    invoke-virtual {p1}, Lcom/android/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/android/internal/view/menu/MenuBuilder;

    move-result-object v1

    if-eq v1, p1, :cond_9

    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->onCloseSubMenu(Lcom/android/internal/view/menu/MenuBuilder;)V

    :cond_9
    if-eqz p2, :cond_39

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    .local v0, callback:Landroid/view/Window$Callback;
    if-eqz v0, :cond_20

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_20

    iget v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mFeatureId:I

    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    :cond_20
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    #getter for: Lcom/android/internal/policy/impl/PhoneWindow;->mContextMenu:Lcom/android/internal/view/menu/ContextMenuBuilder;
    invoke-static {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->access$900(Lcom/android/internal/policy/impl/PhoneWindow;)Lcom/android/internal/view/menu/ContextMenuBuilder;

    move-result-object v1

    if-ne p1, v1, :cond_2d

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    #calls: Lcom/android/internal/policy/impl/PhoneWindow;->dismissContextMenu()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->access$1800(Lcom/android/internal/policy/impl/PhoneWindow;)V

    :cond_2d
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

    if-eqz v1, :cond_39

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

    invoke-virtual {v1}, Lcom/android/internal/view/menu/MenuDialogHelper;->dismiss()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

    .end local v0           #callback:Landroid/view/Window$Callback;
    :cond_39
    return-void
.end method

.method public onCloseSubMenu(Lcom/android/internal/view/menu/MenuBuilder;)V
    .registers 5
    .parameter "menu"

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    .local v0, callback:Landroid/view/Window$Callback;
    if-eqz v0, :cond_19

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_19

    iget v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mFeatureId:I

    invoke-virtual {p1}, Lcom/android/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/android/internal/view/menu/MenuBuilder;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    :cond_19
    return-void
.end method

.method public onMenuItemSelected(Lcom/android/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 5
    .parameter "menu"
    .parameter "item"

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    .local v0, callback:Landroid/view/Window$Callback;
    if-eqz v0, :cond_1a

    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->this$0:Lcom/android/internal/policy/impl/PhoneWindow;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindow;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1a

    iget v1, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mFeatureId:I

    invoke-interface {v0, v1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method public onMenuModeChange(Lcom/android/internal/view/menu/MenuBuilder;)V
    .registers 2
    .parameter "menu"

    .prologue
    return-void
.end method

.method public onOpenSubMenu(Lcom/android/internal/view/menu/MenuBuilder;)Z
    .registers 4
    .parameter "subMenu"

    .prologue
    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1, p0}, Lcom/android/internal/view/menu/MenuBuilder;->setCallback(Lcom/android/internal/view/menu/MenuBuilder$Callback;)V

    new-instance v0, Lcom/android/internal/view/menu/MenuDialogHelper;

    invoke-direct {v0, p1}, Lcom/android/internal/view/menu/MenuDialogHelper;-><init>(Lcom/android/internal/view/menu/MenuBuilder;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

    iget-object v0, p0, Lcom/android/internal/policy/impl/PhoneWindow$DialogMenuCallback;->mSubMenuHelper:Lcom/android/internal/view/menu/MenuDialogHelper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/view/menu/MenuDialogHelper;->show(Landroid/os/IBinder;)V

    const/4 v0, 0x1

    goto :goto_3
.end method
