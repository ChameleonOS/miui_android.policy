.class public Lmiui/app/screenelement/LifecycleResourceManager;
.super Lmiui/app/screenelement/ResourceManager;
.source "LifecycleResourceManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "LifecycleResourceManager"

.field private static mLastCheckCacheTime:J


# instance fields
.field private mCheckTime:J

.field private mInactiveTime:J


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ResourceLoader;JJ)V
    .registers 6
    .parameter "resourceLoader"
    .parameter "inactiveTime"
    .parameter "checkTime"

    .prologue
    invoke-direct {p0, p1}, Lmiui/app/screenelement/ResourceManager;-><init>(Lmiui/app/screenelement/ResourceLoader;)V

    iput-wide p2, p0, Lmiui/app/screenelement/LifecycleResourceManager;->mInactiveTime:J

    iput-wide p4, p0, Lmiui/app/screenelement/LifecycleResourceManager;->mCheckTime:J

    return-void
.end method


# virtual methods
.method public checkCache()V
    .registers 12

    .prologue
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .local v1, currentTimeMillis:J
    sget-wide v7, Lmiui/app/screenelement/LifecycleResourceManager;->mLastCheckCacheTime:J

    sub-long v7, v1, v7

    iget-wide v9, p0, Lmiui/app/screenelement/LifecycleResourceManager;->mCheckTime:J

    cmp-long v7, v7, v9

    if-gez v7, :cond_f

    :goto_e
    return-void

    :cond_f
    const-string v7, "LifecycleResourceManager"

    const-string v8, "beging check cache... "

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .local v5, mToBeRemoved:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v7, p0, Lmiui/app/screenelement/ResourceManager;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_25
    :goto_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_47

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .local v4, key:Ljava/lang/String;
    iget-object v7, p0, Lmiui/app/screenelement/ResourceManager;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/ResourceManager$BitmapInfo;

    .local v0, bi:Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    iget-wide v7, v0, Lmiui/app/screenelement/ResourceManager$BitmapInfo;->mLastVisitTime:J

    sub-long v7, v1, v7

    iget-wide v9, p0, Lmiui/app/screenelement/LifecycleResourceManager;->mInactiveTime:J

    cmp-long v7, v7, v9

    if-lez v7, :cond_25

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .end local v0           #bi:Lmiui/app/screenelement/ResourceManager$BitmapInfo;
    .end local v4           #key:Ljava/lang/String;
    :cond_47
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_75

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .local v6, s:Ljava/lang/String;
    const-string v7, "LifecycleResourceManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "remove cache: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v7, p0, Lmiui/app/screenelement/ResourceManager;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4b

    .end local v6           #s:Ljava/lang/String;
    :cond_75
    sput-wide v1, Lmiui/app/screenelement/LifecycleResourceManager;->mLastCheckCacheTime:J

    goto :goto_e
.end method
