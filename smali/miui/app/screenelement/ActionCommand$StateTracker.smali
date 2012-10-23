.class public abstract Lmiui/app/screenelement/ActionCommand$StateTracker;
.super Ljava/lang/Object;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "StateTracker"
.end annotation


# instance fields
.field private mActualState:Ljava/lang/Boolean;

.field private mDeferredStateChangeRequestNeeded:Z

.field private mInTransition:Z

.field private mIntendedState:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 280
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 282
    iput-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 284
    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    .line 286
    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    .line 292
    iput-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mDeferredStateChangeRequestNeeded:Z

    return-void
.end method


# virtual methods
.method public abstract getActualState(Landroid/content/Context;)I
.end method

.method public final getTriState(Landroid/content/Context;)I
    .registers 4
    .parameter "context"

    .prologue
    const/4 v0, 0x5

    .line 386
    iget-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    if-eqz v1, :cond_6

    .line 402
    :goto_5
    return v0

    .line 396
    :cond_6
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/ActionCommand$StateTracker;->getActualState(Landroid/content/Context;)I

    move-result v1

    packed-switch v1, :pswitch_data_12

    goto :goto_5

    .line 398
    :pswitch_e
    const/4 v0, 0x0

    goto :goto_5

    .line 400
    :pswitch_10
    const/4 v0, 0x1

    goto :goto_5

    .line 396
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
        :pswitch_10
    .end packed-switch
.end method

.method public final isTurningOn()Z
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public abstract onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method protected abstract requestStateChange(Landroid/content/Context;Z)V
.end method

.method protected final setCurrentState(Landroid/content/Context;I)V
    .registers 8
    .parameter "context"
    .parameter "newState"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 338
    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 339
    .local v0, wasInTransition:Z
    packed-switch p2, :pswitch_data_68

    .line 358
    :goto_7
    if-eqz v0, :cond_33

    iget-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    if-nez v1, :cond_33

    .line 359
    iget-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mDeferredStateChangeRequestNeeded:Z

    if-eqz v1, :cond_33

    .line 360
    const-string v1, "ActionCommand"

    const-string v2, "processing deferred state change"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 362
    const-string v1, "ActionCommand"

    const-string v2, "... but intended state matches, so no changes."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_31
    :goto_31
    iput-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mDeferredStateChangeRequestNeeded:Z

    .line 370
    :cond_33
    return-void

    .line 341
    :pswitch_34
    iput-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 342
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_7

    .line 345
    :pswitch_3d
    iput-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 346
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_7

    .line 349
    :pswitch_46
    iput-boolean v4, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 350
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_7

    .line 353
    :pswitch_4f
    iput-boolean v4, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 354
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mActualState:Ljava/lang/Boolean;

    goto :goto_7

    .line 363
    :cond_58
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v1, :cond_31

    .line 364
    iput-boolean v4, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 365
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p0, p1, v1}, Lmiui/app/screenelement/ActionCommand$StateTracker;->requestStateChange(Landroid/content/Context;Z)V

    goto :goto_31

    .line 339
    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_34
        :pswitch_3d
        :pswitch_46
        :pswitch_4f
    .end packed-switch
.end method

.method public final toggleState(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 299
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/ActionCommand$StateTracker;->getTriState(Landroid/content/Context;)I

    move-result v0

    .line 300
    .local v0, currentState:I
    const/4 v1, 0x0

    .line 301
    .local v1, newState:Z
    packed-switch v0, :pswitch_data_30

    .line 314
    :cond_9
    :goto_9
    :pswitch_9
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    .line 315
    iget-boolean v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    if-eqz v3, :cond_2a

    .line 320
    iput-boolean v2, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mDeferredStateChangeRequestNeeded:Z

    .line 325
    :goto_15
    return-void

    .line 303
    :pswitch_16
    const/4 v1, 0x0

    .line 304
    goto :goto_9

    .line 306
    :pswitch_18
    const/4 v1, 0x1

    .line 307
    goto :goto_9

    .line 309
    :pswitch_1a
    iget-object v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    if-eqz v3, :cond_9

    .line 310
    iget-object v3, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mIntendedState:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_28

    move v1, v2

    :goto_27
    goto :goto_9

    :cond_28
    const/4 v1, 0x0

    goto :goto_27

    .line 322
    :cond_2a
    iput-boolean v2, p0, Lmiui/app/screenelement/ActionCommand$StateTracker;->mInTransition:Z

    .line 323
    invoke-virtual {p0, p1, v1}, Lmiui/app/screenelement/ActionCommand$StateTracker;->requestStateChange(Landroid/content/Context;Z)V

    goto :goto_15

    .line 301
    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_18
        :pswitch_16
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_1a
    .end packed-switch
.end method
