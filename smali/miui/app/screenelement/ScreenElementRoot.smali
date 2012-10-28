.class public Lmiui/app/screenelement/ScreenElementRoot;
.super Lmiui/app/screenelement/elements/ScreenElement;
.source "ScreenElementRoot.java"

# interfaces
.implements Lmiui/app/screenelement/InteractiveListener;


# static fields
.field private static final CALCULATE_FRAME_RATE:Z = true

.field private static final DEFAULT_SCREEN_WIDTH:I = 0x1e0

.field private static final LOG_TAG:Ljava/lang/String; = "ScreenElementRoot"

.field private static final RES_DENSITY:I = 0xf0

.field private static final ROOT_NAME:Ljava/lang/String; = "__root"


# instance fields
.field private DEFAULT_FRAME_RATE:F

.field private mCheckPoint:J

.field private mDefaultResourceDensity:I

.field private mDefaultScreenWidth:I

.field protected mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

.field private mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

.field private mFinished:Z

.field protected mFrameRate:F

.field private mFrameRateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mFramerateControllers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/FramerateController;",
            ">;"
        }
    .end annotation
.end field

.field private mFrames:I

.field private mNeedDisallowInterceptTouchEvent:Z

.field private mNeedDisallowInterceptTouchEventVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field protected mNormalFrameRate:F

.field private mScale:F

.field private mSoundManager:Lmiui/app/screenelement/SoundManager;

.field private mTargetDensity:I

.field private mTouchBeginTime:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mTouchBeginX:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mTouchBeginY:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mTouchX:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mTouchY:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field protected mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

.field private mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;)V
    .registers 5
    .parameter "c"

    .prologue
    const/4 v0, 0x0

    .line 95
    invoke-direct {p0, v0, p1, v0}, Lmiui/app/screenelement/elements/ScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 47
    const/high16 v0, 0x41f0

    iput v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->DEFAULT_FRAME_RATE:F

    .line 51
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->DEFAULT_FRAME_RATE:F

    iput v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNormalFrameRate:F

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFramerateControllers:Ljava/util/ArrayList;

    .line 96
    iput-object p0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    .line 97
    new-instance v0, Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/data/VariableUpdaterManager;-><init>(Lmiui/app/screenelement/ScreenContext;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    .line 98
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "touch_x"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchX:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 99
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "touch_y"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchY:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 100
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "touch_begin_x"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginX:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 101
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "touch_begin_y"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginY:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 102
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "touch_begin_time"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginTime:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 103
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v1, "intercept_sys_touch"

    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->getContext()Lmiui/app/screenelement/ScreenContext;

    move-result-object v2

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEventVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 105
    return-void
.end method

.method private processUseVariableUpdater(Lorg/w3c/dom/Element;)V
    .registers 11
    .parameter "root"

    .prologue
    .line 318
    const-string v6, "useVariableUpdater"

    invoke-interface {p1, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 319
    .local v4, updater:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 320
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {p0, v6}, Lmiui/app/screenelement/ScreenElementRoot;->onAddVariableUpdater(Lmiui/app/screenelement/data/VariableUpdaterManager;)V

    .line 331
    :cond_11
    return-void

    .line 322
    :cond_12
    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 323
    .local v5, updaters:[Ljava/lang/String;
    move-object v0, v5

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1b
    if-ge v1, v2, :cond_11

    aget-object v3, v0, v1

    .line 324
    .local v3, s:Ljava/lang/String;
    const-string v6, "DateTime"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_36

    .line 325
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    new-instance v7, Lmiui/app/screenelement/data/DateTimeVariableUpdater;

    iget-object v8, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-direct {v7, v8}, Lmiui/app/screenelement/data/DateTimeVariableUpdater;-><init>(Lmiui/app/screenelement/data/VariableUpdaterManager;)V

    invoke-virtual {v6, v7}, Lmiui/app/screenelement/data/VariableUpdaterManager;->add(Lmiui/app/screenelement/data/VariableUpdater;)V

    .line 323
    :cond_33
    :goto_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 326
    :cond_36
    const-string v6, "Battery"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_33

    .line 327
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    new-instance v7, Lmiui/app/screenelement/data/BatteryVariableUpdater;

    iget-object v8, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-direct {v7, v8}, Lmiui/app/screenelement/data/BatteryVariableUpdater;-><init>(Lmiui/app/screenelement/data/VariableUpdaterManager;)V

    invoke-virtual {v6, v7}, Lmiui/app/screenelement/data/VariableUpdaterManager;->add(Lmiui/app/screenelement/data/VariableUpdater;)V

    goto :goto_33
.end method

.method private resolveResource(Lorg/w3c/dom/Element;I)V
    .registers 15
    .parameter "root"
    .parameter "screenWidth"

    .prologue
    .line 335
    iget v11, p0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    if-eq p2, v11, :cond_40

    .line 337
    const-string v11, "extraResourcesScreenWidth"

    invoke-interface {p1, v11}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 338
    .local v4, extraResources:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_40

    .line 339
    const-string v11, ","

    invoke-virtual {v4, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 340
    .local v8, resources:[Ljava/lang/String;
    const v7, 0x7fffffff

    .line 341
    .local v7, minDiff:I
    const/4 v1, 0x0

    .line 342
    .local v1, closestSw:I
    move-object v0, v8

    .local v0, arr$:[Ljava/lang/String;
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1d
    if-ge v5, v6, :cond_31

    aget-object v10, v0, v5

    .line 344
    .local v10, swStr:Ljava/lang/String;
    :try_start_21
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 345
    .local v9, sw:I
    sub-int v11, p2, v9

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_21 .. :try_end_2a} :catch_41

    move-result v3

    .line 346
    .local v3, diff:I
    if-ge v3, v7, :cond_42

    .line 347
    move v7, v3

    .line 348
    move v1, v9

    .line 349
    if-nez v3, :cond_42

    .line 356
    .end local v3           #diff:I
    .end local v9           #sw:I
    .end local v10           #swStr:Ljava/lang/String;
    :cond_31
    iget v11, p0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    sub-int v11, p2, v11

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 357
    .local v2, defaultDiff:I
    if-lt v2, v7, :cond_40

    .line 358
    iget-object v11, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v11, v1}, Lmiui/app/screenelement/ScreenContext;->setExtraResource(I)V

    .line 362
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #closestSw:I
    .end local v2           #defaultDiff:I
    .end local v4           #extraResources:Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v7           #minDiff:I
    .end local v8           #resources:[Ljava/lang/String;
    :cond_40
    return-void

    .line 352
    .restart local v0       #arr$:[Ljava/lang/String;
    .restart local v1       #closestSw:I
    .restart local v4       #extraResources:Ljava/lang/String;
    .restart local v5       #i$:I
    .restart local v6       #len$:I
    .restart local v7       #minDiff:I
    .restart local v8       #resources:[Ljava/lang/String;
    .restart local v10       #swStr:Ljava/lang/String;
    :catch_41
    move-exception v11

    .line 342
    :cond_42
    add-int/lit8 v5, v5, 0x1

    goto :goto_1d
.end method


# virtual methods
.method public addFramerateController(Lmiui/app/screenelement/elements/FramerateController;)V
    .registers 3
    .parameter "framerateController"

    .prologue
    .line 494
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFramerateControllers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 495
    return-void
.end method

.method protected createElementGroup(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)Lmiui/app/screenelement/elements/ElementGroup;
    .registers 4
    .parameter "root"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 395
    new-instance v0, Lmiui/app/screenelement/elements/ElementGroup;

    invoke-direct {v0, p1, p2, p0}, Lmiui/app/screenelement/elements/ElementGroup;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    return-object v0
.end method

.method public createFramerateToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;
    .registers 3
    .parameter "name"

    .prologue
    .line 108
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ScreenContext;->createToken(Ljava/lang/String;)Lmiui/app/screenelement/FramerateTokenList$FramerateToken;

    move-result-object v0

    return-object v0
.end method

.method public doneRender()V
    .registers 2

    .prologue
    .line 502
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->doneRender()V

    .line 503
    return-void
.end method

.method public findBinder(Ljava/lang/String;)Lmiui/app/screenelement/data/VariableBinder;
    .registers 3
    .parameter "name"

    .prologue
    .line 144
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/VariableBinderManager;->findBinder(Ljava/lang/String;)Lmiui/app/screenelement/data/VariableBinder;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 3
    .parameter "name"

    .prologue
    .line 137
    const-string v0, "__root"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 140
    .end local p0
    :goto_8
    return-object p0

    .restart local p0
    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ElementGroup;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    :goto_13
    move-object p0, v0

    goto :goto_8

    :cond_15
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public findTask(Ljava/lang/String;)Lmiui/app/screenelement/util/Task;
    .registers 3
    .parameter "id"

    .prologue
    .line 382
    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized finish()V
    .registers 2

    .prologue
    .line 426
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFinished:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_4e

    if-eqz v0, :cond_7

    .line 451
    :goto_5
    monitor-exit p0

    return-void

    .line 429
    :cond_7
    :try_start_7
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_13

    .line 430
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->finish()V

    .line 431
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    .line 433
    :cond_13
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    if-eqz v0, :cond_1f

    .line 434
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableBinderManager;->finish()V

    .line 435
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    .line 437
    :cond_1f
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    if-eqz v0, :cond_2b

    .line 438
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/ExternalCommandManager;->finish()V

    .line 439
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    .line 441
    :cond_2b
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    if-eqz v0, :cond_37

    .line 442
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->finish()V

    .line 443
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    .line 445
    :cond_37
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/ResourceManager;->clear()V

    .line 446
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    if-eqz v0, :cond_4a

    .line 447
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/SoundManager;->release()V

    .line 448
    const/4 v0, 0x0

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    .line 450
    :cond_4a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFinished:Z
    :try_end_4d
    .catchall {:try_start_7 .. :try_end_4d} :catchall_4e

    goto :goto_5

    .line 426
    :catchall_4e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getContext()Lmiui/app/screenelement/ScreenContext;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    return-object v0
.end method

.method public getDefaultScreenWidth()I
    .registers 2

    .prologue
    .line 421
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    return v0
.end method

.method public getResourceDensity()I
    .registers 2

    .prologue
    .line 413
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultResourceDensity:I

    return v0
.end method

.method public getScale()F
    .registers 3

    .prologue
    .line 404
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_11

    .line 405
    const-string v0, "ScreenElementRoot"

    const-string v1, "scale not initialized!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    const/high16 v0, 0x3f80

    .line 409
    :goto_10
    return v0

    :cond_11
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    goto :goto_10
.end method

.method public getTargetDensity()I
    .registers 2

    .prologue
    .line 417
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    return v0
.end method

.method public haptic(I)V
    .registers 2
    .parameter "effectId"

    .prologue
    .line 378
    return-void
.end method

.method public init()V
    .registers 2

    .prologue
    .line 158
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->init()V

    .line 161
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    if-eqz v0, :cond_c

    .line 162
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->init()V

    .line 165
    :cond_c
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    if-eqz v0, :cond_15

    .line 166
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableBinderManager;->init()V

    .line 169
    :cond_15
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    if-eqz v0, :cond_1e

    .line 170
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/ExternalCommandManager;->init()V

    .line 173
    :cond_1e
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_27

    .line 174
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->init()V

    .line 176
    :cond_27
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrameRate:F

    invoke-virtual {p0, v0}, Lmiui/app/screenelement/ScreenElementRoot;->requestFramerate(F)V

    .line 177
    return-void
.end method

.method public load()Z
    .registers 20

    .prologue
    .line 257
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v15, v15, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v15}, Lmiui/app/screenelement/ResourceManager;->getManifestRoot()Lorg/w3c/dom/Element;

    move-result-object v6

    .line 258
    .local v6, root:Lorg/w3c/dom/Element;
    if-nez v6, :cond_e

    .line 259
    const/4 v15, 0x0

    .line 312
    .end local v6           #root:Lorg/w3c/dom/Element;
    :goto_d
    return v15

    .line 262
    .restart local v6       #root:Lorg/w3c/dom/Element;
    :cond_e
    const-string v15, "frameRate"

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->DEFAULT_FRAME_RATE:F

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v6, v15, v0}, Lmiui/app/screenelement/util/Utils;->getAttrAsFloat(Lorg/w3c/dom/Element;Ljava/lang/String;F)F

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mNormalFrameRate:F

    .line 263
    move-object/from16 v0, p0

    iget v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mNormalFrameRate:F

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mFrameRate:F

    .line 264
    const-string v15, "screenWidth"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v6, v15, v0}, Lmiui/app/screenelement/util/Utils;->getAttrAsInt(Lorg/w3c/dom/Element;Ljava/lang/String;I)I

    move-result v13

    .line 265
    .local v13, width:I
    if-lez v13, :cond_1a0

    .end local v13           #width:I
    :goto_34
    move-object/from16 v0, p0

    iput v13, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    .line 266
    move-object/from16 v0, p0

    iget v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    mul-int/lit16 v15, v15, 0xf0

    div-int/lit16 v15, v15, 0x1e0

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultResourceDensity:I

    .line 267
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultResourceDensity:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lmiui/app/screenelement/ScreenContext;->setResourceDensity(I)V

    .line 268
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v15}, Lmiui/app/screenelement/ScreenElementRoot;->createElementGroup(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)Lmiui/app/screenelement/elements/ElementGroup;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    .line 270
    const-string v15, "VariableBinders"

    invoke-static {v6, v15}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 272
    .local v2, binders:Lorg/w3c/dom/Element;
    new-instance v15, Lmiui/app/screenelement/data/VariableBinderManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v15, v2, v0}, Lmiui/app/screenelement/data/VariableBinderManager;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    .line 274
    const-string v15, "ExternalCommands"

    invoke-static {v6, v15}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 275
    .local v3, commands:Lorg/w3c/dom/Element;
    if-eqz v3, :cond_91

    .line 276
    new-instance v15, Lmiui/app/screenelement/ExternalCommandManager;

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v15, v3, v0, v1}, Lmiui/app/screenelement/ExternalCommandManager;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    .line 280
    :cond_91
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v15, v15, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    const-string v16, "window"

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/WindowManager;

    .line 281
    .local v14, wm:Landroid/view/WindowManager;
    invoke-interface {v14}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    .line 283
    .local v4, display:Landroid/view/Display;
    invoke-virtual {v4}, Landroid/view/Display;->getWidth()I

    move-result v12

    .line 284
    .local v12, tmpW:I
    invoke-virtual {v4}, Landroid/view/Display;->getHeight()I

    move-result v11

    .line 285
    .local v11, tmpH:I
    invoke-virtual {v4}, Landroid/view/Display;->getRotation()I

    move-result v8

    .line 286
    .local v8, rotation:I
    const/4 v15, 0x1

    if-eq v8, v15, :cond_b5

    const/4 v15, 0x3

    if-ne v8, v15, :cond_1a4

    :cond_b5
    const/4 v7, 0x1

    .line 287
    .local v7, rotated:Z
    :goto_b6
    if-eqz v7, :cond_1a7

    move v10, v11

    .line 288
    .local v10, screenWidth:I
    :goto_b9
    if-eqz v7, :cond_1aa

    move v9, v12

    .line 289
    .local v9, screenHeight:I
    :goto_bc
    move-object/from16 v0, p0

    iget v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    if-nez v15, :cond_1ad

    .line 290
    int-to-float v15, v10

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultScreenWidth:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    div-float v15, v15, v16

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    .line 291
    move-object/from16 v0, p0

    iget v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultResourceDensity:I

    int-to-float v15, v15

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    move/from16 v16, v0

    mul-float v15, v15, v16

    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    .line 295
    :goto_e9
    const-string v15, "ScreenElementRoot"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "init target density: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lmiui/app/screenelement/ScreenContext;->setTargetDensity(I)V

    .line 297
    const-string v15, "raw_screen_width"

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    int-to-double v0, v10

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 298
    const-string v15, "raw_screen_height"

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    int-to-double v0, v9

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 299
    const-string v15, "screen_width"

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    int-to-float v0, v10

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    move/from16 v18, v0

    div-float v17, v17, v18

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 301
    const-string v15, "screen_height"

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    int-to-float v0, v9

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F

    move/from16 v18, v0

    div-float v17, v17, v18

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lmiui/app/screenelement/util/Utils;->putVariableNumber(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;Ljava/lang/Double;)V

    .line 304
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v10}, Lmiui/app/screenelement/ScreenElementRoot;->resolveResource(Lorg/w3c/dom/Element;I)V

    .line 305
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lmiui/app/screenelement/ScreenElementRoot;->processUseVariableUpdater(Lorg/w3c/dom/Element;)V

    .line 306
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lmiui/app/screenelement/ScreenElementRoot;->onLoad(Lorg/w3c/dom/Element;)Z

    move-result v15

    goto/16 :goto_d

    .line 265
    .end local v2           #binders:Lorg/w3c/dom/Element;
    .end local v3           #commands:Lorg/w3c/dom/Element;
    .end local v4           #display:Landroid/view/Display;
    .end local v7           #rotated:Z
    .end local v8           #rotation:I
    .end local v9           #screenHeight:I
    .end local v10           #screenWidth:I
    .end local v11           #tmpH:I
    .end local v12           #tmpW:I
    .end local v14           #wm:Landroid/view/WindowManager;
    .restart local v13       #width:I
    :cond_1a0
    const/16 v13, 0x1e0

    goto/16 :goto_34

    .line 286
    .end local v13           #width:I
    .restart local v2       #binders:Lorg/w3c/dom/Element;
    .restart local v3       #commands:Lorg/w3c/dom/Element;
    .restart local v4       #display:Landroid/view/Display;
    .restart local v8       #rotation:I
    .restart local v11       #tmpH:I
    .restart local v12       #tmpW:I
    .restart local v14       #wm:Landroid/view/WindowManager;
    :cond_1a4
    const/4 v7, 0x0

    goto/16 :goto_b6

    .restart local v7       #rotated:Z
    :cond_1a7
    move v10, v12

    .line 287
    goto/16 :goto_b9

    .restart local v10       #screenWidth:I
    :cond_1aa
    move v9, v11

    .line 288
    goto/16 :goto_bc

    .line 293
    .restart local v9       #screenHeight:I
    :cond_1ad
    move-object/from16 v0, p0

    iget v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    int-to-float v15, v15

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/ScreenElementRoot;->mDefaultResourceDensity:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    div-float v15, v15, v16

    move-object/from16 v0, p0

    iput v15, v0, Lmiui/app/screenelement/ScreenElementRoot;->mScale:F
    :try_end_1c3
    .catch Lmiui/app/screenelement/ScreenElementLoadException; {:try_start_0 .. :try_end_1c3} :catch_1c5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1c3} :catch_1cc

    goto/16 :goto_e9

    .line 307
    .end local v2           #binders:Lorg/w3c/dom/Element;
    .end local v3           #commands:Lorg/w3c/dom/Element;
    .end local v4           #display:Landroid/view/Display;
    .end local v6           #root:Lorg/w3c/dom/Element;
    .end local v7           #rotated:Z
    .end local v8           #rotation:I
    .end local v9           #screenHeight:I
    .end local v10           #screenWidth:I
    .end local v11           #tmpH:I
    .end local v12           #tmpW:I
    .end local v14           #wm:Landroid/view/WindowManager;
    :catch_1c5
    move-exception v5

    .line 308
    .local v5, e:Lmiui/app/screenelement/ScreenElementLoadException;
    invoke-virtual {v5}, Lmiui/app/screenelement/ScreenElementLoadException;->printStackTrace()V

    .line 312
    .end local v5           #e:Lmiui/app/screenelement/ScreenElementLoadException;
    :goto_1c9
    const/4 v15, 0x0

    goto/16 :goto_d

    .line 309
    :catch_1cc
    move-exception v5

    .line 310
    .local v5, e:Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1c9
.end method

.method public needDisallowInterceptTouchEvent()Z
    .registers 2

    .prologue
    .line 252
    iget-boolean v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEvent:Z

    return v0
.end method

.method protected onAddVariableUpdater(Lmiui/app/screenelement/data/VariableUpdaterManager;)V
    .registers 3
    .parameter "m"

    .prologue
    .line 112
    new-instance v0, Lmiui/app/screenelement/data/DateTimeVariableUpdater;

    invoke-direct {v0, p1}, Lmiui/app/screenelement/data/DateTimeVariableUpdater;-><init>(Lmiui/app/screenelement/data/VariableUpdaterManager;)V

    invoke-virtual {p1, v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->add(Lmiui/app/screenelement/data/VariableUpdater;)V

    .line 113
    return-void
.end method

.method public onButtonInteractive(Lmiui/app/screenelement/elements/ButtonScreenElement;Lmiui/app/screenelement/elements/ButtonScreenElement$ButtonAction;)V
    .registers 3
    .parameter "e"
    .parameter "a"

    .prologue
    .line 491
    return-void
.end method

.method public onCommand(Ljava/lang/String;)V
    .registers 5
    .parameter "command"

    .prologue
    .line 479
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    if-eqz v1, :cond_9

    .line 481
    :try_start_4
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    invoke-virtual {v1, p1}, Lmiui/app/screenelement/ExternalCommandManager;->onCommand(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_a

    .line 487
    :cond_9
    :goto_9
    return-void

    .line 482
    :catch_a
    move-exception v0

    .line 483
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "ScreenElementRoot"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_9
.end method

.method protected onLoad(Lorg/w3c/dom/Element;)Z
    .registers 3
    .parameter "root"

    .prologue
    .line 391
    const/4 v0, 0x1

    return v0
.end method

.method public onTouch(Landroid/view/MotionEvent;)Z
    .registers 8
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    .line 223
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-nez v3, :cond_6

    .line 248
    :goto_5
    return v0

    .line 227
    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p0, v3}, Lmiui/app/screenelement/ScreenElementRoot;->descale(F)F

    move-result v1

    .line 228
    .local v1, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v3}, Lmiui/app/screenelement/ScreenElementRoot;->descale(F)F

    move-result v2

    .line 230
    .local v2, y:F
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchX:Lmiui/app/screenelement/util/IndexedNumberVariable;

    float-to-double v4, v1

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 231
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchY:Lmiui/app/screenelement/util/IndexedNumberVariable;

    float-to-double v4, v2

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 232
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    packed-switch v3, :pswitch_data_50

    .line 246
    :goto_29
    :pswitch_29
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/elements/ElementGroup;->onTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 247
    .local v0, ret:Z
    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->requestUpdate()V

    goto :goto_5

    .line 234
    .end local v0           #ret:Z
    :pswitch_33
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginX:Lmiui/app/screenelement/util/IndexedNumberVariable;

    float-to-double v4, v1

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 235
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginY:Lmiui/app/screenelement/util/IndexedNumberVariable;

    float-to-double v4, v2

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 236
    iget-object v3, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTouchBeginTime:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-virtual {v3, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 238
    iput-boolean v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEvent:Z

    goto :goto_29

    .line 243
    :pswitch_4c
    iput-boolean v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEvent:Z

    goto :goto_29

    .line 232
    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_33
        :pswitch_4c
        :pswitch_29
    .end packed-switch
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 188
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->pause()V

    .line 189
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_c

    .line 190
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->pause()V

    .line 192
    :cond_c
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    if-eqz v0, :cond_15

    .line 193
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableBinderManager;->pause()V

    .line 195
    :cond_15
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    if-eqz v0, :cond_1e

    .line 196
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/ExternalCommandManager;->pause()V

    .line 198
    :cond_1e
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    if-eqz v0, :cond_27

    .line 199
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->pause()V

    .line 200
    :cond_27
    return-void
.end method

.method public playSound(Ljava/lang/String;)V
    .registers 5
    .parameter "sound"

    .prologue
    .line 365
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 374
    :cond_6
    :goto_6
    return-void

    .line 368
    :cond_7
    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->shouldPlaySound()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 369
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    if-nez v0, :cond_20

    .line 370
    new-instance v0, Lmiui/app/screenelement/SoundManager;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/SoundManager;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ResourceManager;)V

    iput-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    .line 372
    :cond_20
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mSoundManager:Lmiui/app/screenelement/SoundManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lmiui/app/screenelement/SoundManager;->playSound(Ljava/lang/String;Z)V

    goto :goto_6
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 3
    .parameter "c"

    .prologue
    .line 149
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_9

    .line 150
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/ElementGroup;->render(Landroid/graphics/Canvas;)V

    .line 152
    :cond_9
    iget v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrames:I

    .line 153
    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->doneRender()V

    .line 154
    return-void
.end method

.method public reset(J)V
    .registers 4
    .parameter "time"

    .prologue
    .line 181
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->reset(J)V

    .line 182
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_c

    .line 183
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->reset(J)V

    .line 185
    :cond_c
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 203
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->resume()V

    .line 204
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v0, :cond_c

    .line 205
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v0}, Lmiui/app/screenelement/elements/ElementGroup;->resume()V

    .line 207
    :cond_c
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    if-eqz v0, :cond_15

    .line 208
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableBinderManager:Lmiui/app/screenelement/data/VariableBinderManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableBinderManager;->resume()V

    .line 210
    :cond_15
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    if-eqz v0, :cond_1e

    .line 211
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mExternalCommandManager:Lmiui/app/screenelement/ExternalCommandManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/ExternalCommandManager;->resume()V

    .line 213
    :cond_1e
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    if-eqz v0, :cond_27

    .line 214
    iget-object v0, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v0}, Lmiui/app/screenelement/data/VariableUpdaterManager;->resume()V

    .line 218
    :cond_27
    invoke-virtual {p0}, Lmiui/app/screenelement/ScreenElementRoot;->requestUpdate()V

    .line 219
    return-void
.end method

.method public setDefaultFramerate(F)V
    .registers 2
    .parameter "f"

    .prologue
    .line 129
    iput p1, p0, Lmiui/app/screenelement/ScreenElementRoot;->DEFAULT_FRAME_RATE:F

    .line 130
    return-void
.end method

.method public setRenderController(Lmiui/app/screenelement/RendererController;)V
    .registers 3
    .parameter "controller"

    .prologue
    .line 506
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ScreenContext;->setRenderController(Lmiui/app/screenelement/RendererController;)V

    .line 507
    return-void
.end method

.method public setTargetDensity(I)V
    .registers 3
    .parameter "targetDensity"

    .prologue
    .line 399
    iput p1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mTargetDensity:I

    .line 400
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/ScreenContext;->setTargetDensity(I)V

    .line 401
    return-void
.end method

.method protected shouldPlaySound()Z
    .registers 2

    .prologue
    .line 386
    const/4 v0, 0x1

    return v0
.end method

.method public shouldUpdate()Z
    .registers 2

    .prologue
    .line 498
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->shouldUpdate()Z

    move-result v0

    return v0
.end method

.method public tick(J)V
    .registers 8
    .parameter "currentTime"

    .prologue
    .line 117
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mVariableUpdaterManager:Lmiui/app/screenelement/data/VariableUpdaterManager;

    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/data/VariableUpdaterManager;->tick(J)V

    .line 118
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    if-eqz v1, :cond_e

    .line 119
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mElementGroup:Lmiui/app/screenelement/elements/ElementGroup;

    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/elements/ElementGroup;->tick(J)V

    .line 122
    :cond_e
    iget-object v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEventVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v1}, Lmiui/app/screenelement/util/IndexedNumberVariable;->get()Ljava/lang/Double;

    move-result-object v0

    .line 123
    .local v0, d:Ljava/lang/Double;
    if-eqz v0, :cond_23

    .line 124
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmpl-double v1, v1, v3

    if-lez v1, :cond_24

    const/4 v1, 0x1

    :goto_21
    iput-boolean v1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mNeedDisallowInterceptTouchEvent:Z

    .line 126
    :cond_23
    return-void

    .line 124
    :cond_24
    const/4 v1, 0x0

    goto :goto_21
.end method

.method public updateFramerate(J)V
    .registers 14
    .parameter "time"

    .prologue
    const-wide/16 v9, 0x0

    .line 454
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFramerateControllers:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/FramerateController;

    .line 455
    .local v0, f:Lmiui/app/screenelement/elements/FramerateController;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/FramerateController;->updateFramerate(J)V

    goto :goto_8

    .line 459
    .end local v0           #f:Lmiui/app/screenelement/elements/FramerateController;
    :cond_18
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrameRateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-nez v6, :cond_2b

    .line 460
    new-instance v6, Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-string v7, "frame_rate"

    iget-object v8, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v8, v8, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v6, v7, v8}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrameRateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 461
    iput-wide v9, p0, Lmiui/app/screenelement/ScreenElementRoot;->mCheckPoint:J

    .line 464
    :cond_2b
    iget-wide v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mCheckPoint:J

    cmp-long v6, v6, v9

    if-nez v6, :cond_34

    .line 465
    iput-wide p1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mCheckPoint:J

    .line 476
    :cond_33
    :goto_33
    return-void

    .line 467
    :cond_34
    iget-wide v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mCheckPoint:J

    sub-long v4, p1, v6

    .line 468
    .local v4, t:J
    const-wide/16 v6, 0x3e8

    cmp-long v6, v4, v6

    if-ltz v6, :cond_33

    .line 469
    iget v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrames:I

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    div-long v1, v6, v4

    .line 470
    .local v1, frameRate:J
    iget-object v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrameRateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    long-to-double v7, v1

    invoke-virtual {v6, v7, v8}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 471
    const/4 v6, 0x0

    iput v6, p0, Lmiui/app/screenelement/ScreenElementRoot;->mFrames:I

    .line 472
    iput-wide p1, p0, Lmiui/app/screenelement/ScreenElementRoot;->mCheckPoint:J

    goto :goto_33
.end method
