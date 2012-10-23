.class Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;
.super Landroid/widget/BaseAdapter;
.source "MiuiGlobalActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiGlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;


# direct methods
.method private constructor <init>(Lcom/android/internal/policy/impl/MiuiGlobalActions;)V
    .registers 2
    .parameter

    .prologue
    .line 316
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/policy/impl/MiuiGlobalActions;Lcom/android/internal/policy/impl/MiuiGlobalActions$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 316
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;-><init>(Lcom/android/internal/policy/impl/MiuiGlobalActions;)V

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 342
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .registers 5

    .prologue
    .line 319
    const/4 v1, 0x0

    .line 321
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mItems:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$700(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_3c

    .line 322
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mItems:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$700(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;

    .line 324
    .local v0, action:Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mKeyguardShowing:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$800(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->showDuringKeyguard()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 321
    :cond_28
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 327
    :cond_2b
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mDeviceProvisioned:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$900(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v3

    if-nez v3, :cond_39

    invoke-interface {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->showBeforeProvisioning()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 330
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 332
    .end local v0           #action:Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    :cond_3c
    return v1
.end method

.method public getItem(I)Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    .registers 8
    .parameter "position"

    .prologue
    .line 347
    const/4 v1, 0x0

    .line 348
    .local v1, filteredPos:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mItems:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$700(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_3f

    .line 349
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mItems:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$700(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;

    .line 350
    .local v0, action:Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mKeyguardShowing:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$800(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->showDuringKeyguard()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 348
    :cond_28
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 353
    :cond_2b
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mDeviceProvisioned:Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$900(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v3

    if-nez v3, :cond_39

    invoke-interface {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->showBeforeProvisioning()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 356
    :cond_39
    if-ne v1, p1, :cond_3c

    .line 357
    return-object v0

    .line 359
    :cond_3c
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 362
    .end local v0           #action:Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    :cond_3f
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " out of range of showable actions"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", filtered count="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->getCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", keyguardshowing="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mKeyguardShowing:Z
    invoke-static {v5}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$800(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", provisioned="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mDeviceProvisioned:Z
    invoke-static {v5}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$900(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .parameter "x0"

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->getItem(I)Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .parameter "position"

    .prologue
    .line 371
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 375
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->getItem(I)Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;

    move-result-object v0

    .line 376
    .local v0, action:Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$100(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->this$0:Lcom/android/internal/policy/impl/MiuiGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/MiuiGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MiuiGlobalActions;->access$100(Lcom/android/internal/policy/impl/MiuiGlobalActions;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-interface {v0, v1, p2, p3, v2}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->create(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method public isEnabled(I)Z
    .registers 3
    .parameter "position"

    .prologue
    .line 337
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/MiuiGlobalActions$MyAdapter;->getItem(I)Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/policy/impl/MiuiGlobalActions$Action;->isEnabled()Z

    move-result v0

    return v0
.end method
