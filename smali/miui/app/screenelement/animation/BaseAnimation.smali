.class public abstract Lmiui/app/screenelement/animation/BaseAnimation;
.super Ljava/lang/Object;
.source "BaseAnimation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    }
.end annotation


# static fields
.field private static final INFINITE_TIME:J = 0xe8d4a51000L

.field private static final LOG_TAG:Ljava/lang/String; = "BaseAnimation"


# instance fields
.field protected mContext:Lmiui/app/screenelement/ScreenContext;

.field private mDelay:J

.field protected mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLastFrame:Z

.field private mRealTimeRange:J

.field private mStartTime:J

.field private mTimeRange:J


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Ljava/lang/String;Lmiui/app/screenelement/ScreenContext;)V
    .registers 5
    .parameter "node"
    .parameter "tag"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    .line 74
    iput-object p3, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mContext:Lmiui/app/screenelement/ScreenContext;

    .line 75
    invoke-direct {p0, p1, p2}, Lmiui/app/screenelement/animation/BaseAnimation;->load(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method private load(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .registers 12
    .parameter "node"
    .parameter "tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 79
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 80
    const-string v5, "delay"

    invoke-interface {p1, v5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, strDelay:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 84
    :try_start_12
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    iput-wide v7, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mDelay:J
    :try_end_18
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_18} :catch_39

    .line 90
    :cond_18
    :goto_18
    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 91
    .local v3, nodeList:Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1d
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_42

    .line 92
    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 93
    .local v1, ele:Lorg/w3c/dom/Element;
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lmiui/app/screenelement/animation/BaseAnimation;->onCreateItem()Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    move-result-object v7

    invoke-virtual {v7, v1}, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->load(Lorg/w3c/dom/Element;)Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 85
    .end local v1           #ele:Lorg/w3c/dom/Element;
    .end local v2           #i:I
    .end local v3           #nodeList:Lorg/w3c/dom/NodeList;
    :catch_39
    move-exception v0

    .line 86
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v5, "BaseAnimation"

    const-string v7, "invalid delay attribute"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 95
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .restart local v2       #i:I
    .restart local v3       #nodeList:Lorg/w3c/dom/NodeList;
    :cond_42
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_81

    move v5, v6

    :goto_4b
    const-string v7, "BaseAnimation: empty items"

    invoke-static {v5, v7}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 96
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    iget-object v7, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    iget-wide v7, v5, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    iput-wide v7, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mTimeRange:J

    .line 98
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v5, v6, :cond_80

    .line 99
    iget-object v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    iget-object v6, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    iget-wide v5, v5, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    iput-wide v5, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mRealTimeRange:J

    .line 100
    :cond_80
    return-void

    .line 95
    :cond_81
    const/4 v5, 0x0

    goto :goto_4b
.end method


# virtual methods
.method protected getItem(I)Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    .registers 3
    .parameter "index"

    .prologue
    .line 103
    if-ltz p1, :cond_a

    iget-object v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_c

    .line 104
    :cond_a
    const/4 v0, 0x0

    .line 105
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    goto :goto_b
.end method

.method public init()V
    .registers 1

    .prologue
    .line 111
    invoke-virtual {p0}, Lmiui/app/screenelement/animation/BaseAnimation;->reset()V

    .line 112
    return-void
.end method

.method protected abstract onCreateItem()Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
.end method

.method protected abstract onTick(Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;F)V
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 115
    iget-object v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-virtual {v0}, Lmiui/app/screenelement/ScreenContext;->getRenderController()Lmiui/app/screenelement/RendererController;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/screenelement/RendererController;->getLastUpdateTime()J

    move-result-wide v0

    iput-wide v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mStartTime:J

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/animation/BaseAnimation;->mLastFrame:Z

    .line 117
    return-void
.end method

.method public final tick(J)V
    .registers 24
    .parameter "currentTime"

    .prologue
    .line 120
    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mStartTime:J

    move-wide/from16 v17, v0

    sub-long v6, p1, v17

    .line 121
    .local v6, elapsedTime:J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mDelay:J

    move-wide/from16 v17, v0

    cmp-long v17, v6, v17

    if-gez v17, :cond_24

    .line 122
    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lmiui/app/screenelement/animation/BaseAnimation;->onTick(Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;F)V

    .line 153
    :cond_23
    :goto_23
    return-void

    .line 126
    :cond_24
    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mDelay:J

    move-wide/from16 v17, v0

    sub-long v6, v6, v17

    .line 127
    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mTimeRange:J

    move-wide/from16 v17, v0

    const-wide v19, 0xe8d4a51000L

    cmp-long v17, v17, v19

    if-ltz v17, :cond_4d

    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mRealTimeRange:J

    move-wide/from16 v17, v0

    cmp-long v17, v6, v17

    if-lez v17, :cond_4d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mLastFrame:Z

    move/from16 v17, v0

    if-nez v17, :cond_23

    .line 132
    :cond_4d
    move-object/from16 v0, p0

    iget-wide v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mTimeRange:J

    move-wide/from16 v17, v0

    rem-long v15, v6, v17

    .line 133
    .local v15, time:J
    const/4 v9, 0x0

    .local v9, item1:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    const/4 v10, 0x0

    .line 134
    .local v10, item2:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    const/4 v8, 0x0

    .local v8, i:I
    :goto_58
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_23

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    .line 136
    .local v11, pos:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    iget-wide v0, v11, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    move-wide/from16 v17, v0

    cmp-long v17, v15, v17

    if-gtz v17, :cond_d8

    .line 137
    move-object v10, v11

    .line 139
    const-wide/16 v4, 0x0

    .line 140
    .local v4, base:J
    if-nez v8, :cond_ac

    .line 141
    iget-wide v13, v11, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    .line 148
    .local v13, range:J
    :goto_83
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    if-ne v8, v0, :cond_c8

    const/16 v17, 0x1

    :goto_95
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lmiui/app/screenelement/animation/BaseAnimation;->mLastFrame:Z

    .line 149
    const-wide/16 v17, 0x0

    cmp-long v17, v13, v17

    if-nez v17, :cond_cb

    const/high16 v17, 0x3f80

    :goto_a3
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v9, v10, v1}, Lmiui/app/screenelement/animation/BaseAnimation;->onTick(Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;F)V

    goto/16 :goto_23

    .line 143
    .end local v13           #range:J
    :cond_ac
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/animation/BaseAnimation;->mItems:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    add-int/lit8 v18, v8, -0x1

    invoke-virtual/range {v17 .. v18}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;

    .line 144
    .local v12, pos1:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    move-object v9, v12

    .line 145
    iget-wide v0, v11, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    move-wide/from16 v17, v0

    iget-wide v0, v12, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    move-wide/from16 v19, v0

    sub-long v13, v17, v19

    .line 146
    .restart local v13       #range:J
    iget-wide v4, v12, Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;->mTime:J

    goto :goto_83

    .line 148
    .end local v12           #pos1:Lmiui/app/screenelement/animation/BaseAnimation$AnimationItem;
    :cond_c8
    const/16 v17, 0x0

    goto :goto_95

    .line 149
    :cond_cb
    sub-long v17, v15, v4

    move-wide/from16 v0, v17

    long-to-float v0, v0

    move/from16 v17, v0

    long-to-float v0, v13

    move/from16 v18, v0

    div-float v17, v17, v18

    goto :goto_a3

    .line 134
    .end local v4           #base:J
    .end local v13           #range:J
    :cond_d8
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_58
.end method
