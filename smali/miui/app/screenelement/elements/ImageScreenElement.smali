.class public Lmiui/app/screenelement/elements/ImageScreenElement;
.super Lmiui/app/screenelement/elements/AnimatedScreenElement;
.source "ImageScreenElement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/elements/ImageScreenElement$1;,
        Lmiui/app/screenelement/elements/ImageScreenElement$pair;,
        Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "ImageScreenElement"

.field public static final MASK_TAG_NAME:Ljava/lang/String; = "Mask"

.field public static final TAG_NAME:Ljava/lang/String; = "Image"

.field private static final VAR_BMP_HEIGHT:Ljava/lang/String; = "bmp_height"

.field private static final VAR_BMP_WIDTH:Ljava/lang/String; = "bmp_width"


# instance fields
.field private mAniHeight:F

.field private mAniWidth:F

.field private mAntiAlias:Z

.field protected mBitmap:Landroid/graphics/Bitmap;

.field protected mBitmapChanged:Z

.field private mBmpHeight:F

.field private mBmpSizeHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mBmpSizeWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mBmpWidth:F

.field private mBufferCanvas:Landroid/graphics/Canvas;

.field private mCachedBitmap:Landroid/graphics/Bitmap;

.field private mCachedBitmapName:Ljava/lang/String;

.field protected mCurrentBitmap:Landroid/graphics/Bitmap;

.field private mDesRect:Landroid/graphics/Rect;

.field private mHeight:F

.field private mKey:Ljava/lang/String;

.field private mMaskBuffer:Landroid/graphics/Bitmap;

.field private mMaskPaint:Landroid/graphics/Paint;

.field private mMasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/animation/AnimatedElement;",
            ">;"
        }
    .end annotation
.end field

.field private mPaint:Landroid/graphics/Paint;

.field private mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/app/screenelement/elements/ImageScreenElement$pair",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mSrcH:Lmiui/app/screenelement/data/Expression;

.field private mSrcRect:Landroid/graphics/Rect;

.field private mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

.field private mSrcW:Lmiui/app/screenelement/data/Expression;

.field private mSrcX:Lmiui/app/screenelement/data/Expression;

.field private mSrcY:Lmiui/app/screenelement/data/Expression;

.field private mUseVirtualScreen:Z

.field private mVirtualScreen:Lmiui/app/screenelement/elements/VirtualScreen;

.field private mWidth:F

.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 9
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/AnimatedScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 44
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskPaint:Landroid/graphics/Paint;

    .line 46
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    .line 52
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    .line 81
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ResourceImage:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    .line 115
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/elements/ImageScreenElement;->load(Lorg/w3c/dom/Element;)V

    .line 117
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAntiAlias:Z

    .line 118
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    iget-boolean v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAntiAlias:Z

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 119
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 120
    const-string v1, "srcX"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcX:Lmiui/app/screenelement/data/Expression;

    .line 121
    const-string v1, "srcY"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcY:Lmiui/app/screenelement/data/Expression;

    .line 122
    const-string v1, "srcW"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcW:Lmiui/app/screenelement/data/Expression;

    .line 123
    const-string v1, "srcH"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lmiui/app/screenelement/data/Expression;->build(Ljava/lang/String;)Lmiui/app/screenelement/data/Expression;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcH:Lmiui/app/screenelement/data/Expression;

    .line 124
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcX:Lmiui/app/screenelement/data/Expression;

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcY:Lmiui/app/screenelement/data/Expression;

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcW:Lmiui/app/screenelement/data/Expression;

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcH:Lmiui/app/screenelement/data/Expression;

    if-eqz v1, :cond_7c

    .line 125
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    .line 128
    :cond_7c
    const-string v1, "useVirtualScreen"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mUseVirtualScreen:Z

    .line 129
    const-string v1, "srcType"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, srcType:Ljava/lang/String;
    const-string v1, "ResourceImage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b9

    .line 131
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ResourceImage:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    .line 141
    :goto_9a
    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v1, :cond_b8

    .line 142
    new-instance v1, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v3, "bmp_width"

    iget-object v4, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v1, v2, v3, v4}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpSizeWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 143
    new-instance v1, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v3, "bmp_height"

    iget-object v4, p2, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v1, v2, v3, v4}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpSizeHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 145
    :cond_b8
    return-void

    .line 132
    :cond_b9
    iget-boolean v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mUseVirtualScreen:Z

    if-nez v1, :cond_c5

    const-string v1, "VirtualScreen"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ca

    .line 133
    :cond_c5
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->VirtualScreen:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    goto :goto_9a

    .line 134
    :cond_ca
    const-string v1, "ApplicationIcon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d7

    .line 135
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ApplicationIcon:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    goto :goto_9a

    .line 138
    :cond_d7
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ResourceImage:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    goto :goto_9a
.end method

.method private getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mKey:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 358
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mKey:Ljava/lang/String;

    .line 359
    :cond_e
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method private loadMask(Lorg/w3c/dom/Element;)V
    .registers 8
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    if-nez v2, :cond_b

    .line 158
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    .line 160
    :cond_b
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 162
    const-string v2, "Mask"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 163
    .local v1, images:Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_17
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_32

    .line 164
    iget-object v3, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    new-instance v4, Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    iget-object v5, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    invoke-direct {v4, v2, v5}, Lmiui/app/screenelement/animation/AnimatedElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 166
    :cond_32
    return-void
.end method

.method private renderWithMask(Landroid/graphics/Canvas;Lmiui/app/screenelement/animation/AnimatedElement;FF)V
    .registers 51
    .parameter "bufferCanvas"
    .parameter "mask"
    .parameter "x"
    .parameter "y"

    .prologue
    .line 383
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 384
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Lmiui/app/screenelement/ResourceManager;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v38

    .line 385
    .local v38, rawMask:Landroid/graphics/Bitmap;
    if-nez v38, :cond_14

    .line 437
    :goto_13
    return-void

    .line 388
    :cond_14
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getX()F

    move-result v2

    float-to-double v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    float-to-double v0, v2

    move-wide/from16 v30, v0

    .line 389
    .local v30, maskX:D
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getY()F

    move-result v2

    float-to-double v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    float-to-double v0, v2

    move-wide/from16 v32, v0

    .line 390
    .local v32, maskY:D
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getRotationAngle()F

    move-result v29

    .line 391
    .local v29, maskAngle:F
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->isAlignAbsolute()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 392
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getRotation()F

    move-result v17

    .line 393
    .local v17, angle:F
    const/4 v2, 0x0

    cmpl-float v2, v17, v2

    if-nez v2, :cond_d5

    .line 394
    move/from16 v0, p3

    float-to-double v9, v0

    sub-double v30, v30, v9

    .line 395
    move/from16 v0, p4

    float-to-double v9, v0

    sub-double v32, v32, v9

    .line 423
    .end local v17           #angle:F
    :cond_4d
    :goto_4d
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotX()F

    move-result v2

    float-to-double v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    float-to-double v9, v2

    add-double v9, v9, v30

    double-to-float v2, v9

    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotY()F

    move-result v9

    float-to-double v9, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v9

    float-to-double v9, v9

    add-double v9, v9, v32

    double-to-float v9, v9

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1, v2, v9}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 425
    move-wide/from16 v0, v30

    double-to-int v0, v0

    move/from16 v34, v0

    .line 426
    .local v34, mx:I
    move-wide/from16 v0, v32

    double-to-int v0, v0

    move/from16 v35, v0

    .line 427
    .local v35, my:I
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getWidth()F

    move-result v2

    float-to-double v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v43

    .line 428
    .local v43, width:I
    if-gez v43, :cond_91

    .line 429
    invoke-virtual/range {v38 .. v38}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v43

    .line 430
    :cond_91
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getHeight()F

    move-result v2

    float-to-double v9, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v28

    .line 431
    .local v28, height:I
    if-gez v28, :cond_a6

    .line 432
    invoke-virtual/range {v38 .. v38}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v28

    .line 433
    :cond_a6
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    add-int v9, v34, v43

    add-int v10, v35, v28

    move/from16 v0, v34

    move/from16 v1, v35

    invoke-virtual {v2, v0, v1, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 434
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskPaint:Landroid/graphics/Paint;

    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getAlpha()I

    move-result v9

    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 435
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v10, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v38

    invoke-virtual {v0, v1, v2, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 436
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_13

    .line 397
    .end local v28           #height:I
    .end local v34           #mx:I
    .end local v35           #my:I
    .end local v43           #width:I
    .restart local v17       #angle:F
    :cond_d5
    sub-float v29, v29, v17

    .line 398
    const-wide v36, 0x400921fb54442c46L

    .line 399
    .local v36, pi:D
    move/from16 v0, v17

    float-to-double v9, v0

    const-wide v11, 0x400921fb54442c46L

    mul-double/2addr v9, v11

    const-wide v11, 0x4066800000000000L

    div-double v7, v9, v11

    .line 400
    .local v7, angleA:D
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getPivotX()F

    move-result v2

    float-to-double v3, v2

    .line 401
    .local v3, cx:D
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getPivotY()F

    move-result v2

    float-to-double v5, v2

    .line 402
    .local v5, cy:D
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    if-nez v2, :cond_106

    .line 403
    new-instance v2, Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    const/4 v9, 0x0

    invoke-direct {v2, v9}, Lmiui/app/screenelement/elements/ImageScreenElement$pair;-><init>(Lmiui/app/screenelement/elements/ImageScreenElement$1;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    .line 405
    :cond_106
    move-object/from16 v0, p0

    iget-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lmiui/app/screenelement/elements/ImageScreenElement;->rotateXY(DDDLmiui/app/screenelement/elements/ImageScreenElement$pair;)V

    .line 407
    move/from16 v0, p3

    float-to-double v9, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p1:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    add-double v39, v9, v11

    .line 408
    .local v39, rx:D
    move/from16 v0, p4

    float-to-double v9, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p2:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    add-double v41, v9, v11

    .line 411
    .local v41, ry:D
    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotX()F

    move-result v2

    float-to-double v10, v2

    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getPivotY()F

    move-result v2

    float-to-double v12, v2

    invoke-virtual/range {p2 .. p2}, Lmiui/app/screenelement/animation/AnimatedElement;->getRotationAngle()F

    move-result v2

    float-to-double v14, v2

    const-wide v44, 0x400921fb54442c46L

    mul-double v14, v14, v44

    const-wide v44, 0x4066800000000000L

    div-double v14, v14, v44

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    move-object/from16 v16, v0

    move-object/from16 v9, p0

    invoke-direct/range {v9 .. v16}, Lmiui/app/screenelement/elements/ImageScreenElement;->rotateXY(DDDLmiui/app/screenelement/elements/ImageScreenElement$pair;)V

    .line 412
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p1:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    float-to-double v9, v2

    add-double v30, v30, v9

    .line 413
    move-object/from16 v0, p0

    iget-object v2, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mRotateXYpair:Lmiui/app/screenelement/elements/ImageScreenElement$pair;

    iget-object v2, v2, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p2:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v2

    float-to-double v9, v2

    add-double v32, v32, v9

    .line 414
    sub-double v24, v30, v39

    .line 415
    .local v24, dx:D
    sub-double v26, v32, v41

    .line 416
    .local v26, dy:D
    mul-double v9, v24, v24

    mul-double v11, v26, v26

    add-double/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v22

    .line 417
    .local v22, dm:D
    div-double v9, v24, v22

    invoke-static {v9, v10}, Ljava/lang/Math;->asin(D)D

    move-result-wide v18

    .line 418
    .local v18, angleB:D
    const-wide/16 v9, 0x0

    cmpl-double v2, v26, v9

    if-lez v2, :cond_1ac

    add-double v20, v7, v18

    .line 419
    .local v20, angleC:D
    :goto_19e
    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    mul-double v30, v22, v9

    .line 420
    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    mul-double v32, v22, v9

    goto/16 :goto_4d

    .line 418
    .end local v20           #angleC:D
    :cond_1ac
    const-wide v9, 0x400921fb54442c46L

    add-double/2addr v9, v7

    sub-double v20, v9, v18

    goto :goto_19e
.end method

.method private rotateXY(DDDLmiui/app/screenelement/elements/ImageScreenElement$pair;)V
    .registers 21
    .parameter "centerX"
    .parameter "centerY"
    .parameter "angle"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDD",
            "Lmiui/app/screenelement/elements/ImageScreenElement$pair",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 368
    .local p7, pr:Lmiui/app/screenelement/elements/ImageScreenElement$pair;,"Lmiui/app/screenelement/elements/ImageScreenElement$pair<Ljava/lang/Double;Ljava/lang/Double;>;"
    mul-double v9, p1, p1

    mul-double v11, p3, p3

    add-double/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    .line 370
    .local v5, cm:D
    const-wide/16 v9, 0x0

    cmpl-double v9, v5, v9

    if-lez v9, :cond_40

    .line 371
    const-wide v7, 0x400921fb54442c46L

    .line 372
    .local v7, pi:D
    div-double v9, p1, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->acos(D)D

    move-result-wide v1

    .line 373
    .local v1, angle1:D
    const-wide v9, 0x400921fb54442c46L

    sub-double/2addr v9, v1

    sub-double v3, v9, p5

    .line 374
    .local v3, angle2:D
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    mul-double/2addr v9, v5

    add-double/2addr v9, p1

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    move-object/from16 v0, p7

    iput-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p1:Ljava/lang/Object;

    .line 375
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    mul-double/2addr v9, v5

    sub-double v9, p3, v9

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    move-object/from16 v0, p7

    iput-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p2:Ljava/lang/Object;

    .line 380
    .end local v1           #angle1:D
    .end local v3           #angle2:D
    .end local v7           #pi:D
    :goto_3f
    return-void

    .line 377
    :cond_40
    const-wide/16 v9, 0x0

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    move-object/from16 v0, p7

    iput-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p1:Ljava/lang/Object;

    .line 378
    const-wide/16 v9, 0x0

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    move-object/from16 v0, p7

    iput-object v9, v0, Lmiui/app/screenelement/elements/ImageScreenElement$pair;->p2:Ljava/lang/Object;

    goto :goto_3f
.end method

.method private updateBmpSizeVar()V
    .registers 4

    .prologue
    .line 327
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_29

    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmapChanged:Z

    if-eqz v0, :cond_29

    .line 330
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpSizeWidthVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getBitmapWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lmiui/app/screenelement/elements/ImageScreenElement;->descale(F)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 331
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpSizeHeightVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getBitmapHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lmiui/app/screenelement/elements/ImageScreenElement;->descale(F)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 332
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmapChanged:Z

    .line 334
    :cond_29
    return-void
.end method


# virtual methods
.method public doRender(Landroid/graphics/Canvas;)V
    .registers 30
    .parameter "c"

    .prologue
    .line 239
    move-object/from16 v0, p0

    iget-object v6, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 240
    .local v6, bmp:Landroid/graphics/Bitmap;
    if-nez v6, :cond_7

    .line 320
    :cond_6
    :goto_6
    return-void

    .line 243
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v10

    .line 244
    .local v10, isHardwareAccelerated:Z
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getAlpha()I

    move-result v5

    .line 245
    .local v5, alpha:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 246
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getDensity()I

    move-result v15

    .line 247
    .local v15, oldDensity:I
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setDensity(I)V

    .line 249
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-eqz v23, :cond_6

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-eqz v23, :cond_6

    .line 252
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mX:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->getLeft(FF)F

    move-result v21

    .line 253
    .local v21, x:F
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mY:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->getTop(FF)F

    move-result v22

    .line 254
    .local v22, y:F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 256
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v23

    if-nez v23, :cond_235

    .line 257
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getNinePatchChunk()[B

    move-result-object v23

    if-eqz v23, :cond_10b

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lmiui/app/screenelement/ResourceManager;->getNinePatch(Ljava/lang/String;)Landroid/graphics/NinePatch;

    move-result-object v14

    .line 259
    .local v14, np:Landroid/graphics/NinePatch;
    if-eqz v14, :cond_e8

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v26, v0

    add-float v26, v26, v21

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v27, v0

    add-float v27, v27, v22

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    invoke-virtual/range {v23 .. v27}, Landroid/graphics/Rect;->set(IIII)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v24, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v14, v0, v1, v2}, Landroid/graphics/NinePatch;->draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 318
    .end local v14           #np:Landroid/graphics/NinePatch;
    :goto_de
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 319
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/graphics/Canvas;->setDensity(I)V

    goto/16 :goto_6

    .line 263
    .restart local v14       #np:Landroid/graphics/NinePatch;
    :cond_e8
    const-string v23, "ImageScreenElement"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "the image contains ninepatch chunk but couldn\'t get NinePatch object: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_de

    .line 267
    .end local v14           #np:Landroid/graphics/NinePatch;
    :cond_10b
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniWidth:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-gtz v23, :cond_12b

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniHeight:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-gtz v23, :cond_12b

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    if-eqz v23, :cond_222

    .line 268
    :cond_12b
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v26, v0

    add-float v26, v26, v21

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v27, v0

    add-float v27, v27, v22

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    invoke-virtual/range {v23 .. v27}, Landroid/graphics/Rect;->set(IIII)V

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    if-eqz v23, :cond_203

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcX:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v23

    move-object/from16 v0, p0

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v18, v0

    .line 271
    .local v18, sX:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcY:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v23

    move-object/from16 v0, p0

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v19, v0

    .line 272
    .local v19, sY:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcW:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v23

    move-object/from16 v0, p0

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v17, v0

    .line 273
    .local v17, sW:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcH:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v23

    move-object/from16 v0, p0

    move-wide/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/elements/ImageScreenElement;->scale(D)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v16, v0

    .line 274
    .local v16, sH:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    add-int v24, v18, v17

    add-int v25, v19, v16

    move-object/from16 v0, v23

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 276
    .end local v16           #sH:I
    .end local v17           #sW:I
    .end local v18           #sX:I
    .end local v19           #sY:I
    :cond_203
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_de

    .line 278
    :cond_222
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto/16 :goto_de

    .line 282
    :cond_235
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getMaxWidth()F

    move-result v13

    .line 283
    .local v13, maxWidth:F
    invoke-virtual/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getMaxHeight()F

    move-result v12

    .line 284
    .local v12, maxHeight:F
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-static {v13, v0}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 285
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-static {v12, v0}, Ljava/lang/Math;->max(FF)F

    move-result v12

    .line 286
    float-to-double v0, v13

    move-wide/from16 v23, v0

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v23

    move-wide/from16 v0, v23

    double-to-int v8, v0

    .line 287
    .local v8, bufferWidth:I
    float-to-double v0, v12

    move-wide/from16 v23, v0

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v23

    move-wide/from16 v0, v23

    double-to-int v7, v0

    .line 288
    .local v7, bufferHeight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    if-eqz v23, :cond_28f

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v23

    move/from16 v0, v23

    if-gt v8, v0, :cond_28f

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v23

    move/from16 v0, v23

    if-gt v7, v0, :cond_28f

    if-nez v10, :cond_2cb

    .line 290
    :cond_28f
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    move-object/from16 v23, v0

    invoke-direct/range {p0 .. p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getKey()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v0, v8, v7, v1, v10}, Lmiui/app/screenelement/ResourceManager;->getMaskBufferBitmap(IILjava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Landroid/graphics/Bitmap;->setDensity(I)V

    .line 293
    new-instance v23, Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lmiui/app/screenelement/elements/ImageScreenElement;->mBufferCanvas:Landroid/graphics/Canvas;

    .line 295
    :cond_2cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBufferCanvas:Landroid/graphics/Canvas;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    sget-object v25, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual/range {v23 .. v25}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lmiui/app/screenelement/ScreenElementRoot;->getScale()F

    move-result v20

    .line 298
    .local v20, scale:F
    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniWidth:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-gtz v23, :cond_302

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniHeight:F

    move/from16 v23, v0

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-gtz v23, :cond_302

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    if-eqz v23, :cond_417

    .line 299
    :cond_302
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    move/from16 v26, v0

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    move/from16 v27, v0

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    invoke-virtual/range {v23 .. v27}, Landroid/graphics/Rect;->set(IIII)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    if-eqz v23, :cond_3cc

    .line 301
    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcX:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v25

    mul-double v23, v23, v25

    move-wide/from16 v0, v23

    double-to-int v0, v0

    move/from16 v18, v0

    .line 302
    .restart local v18       #sX:I
    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcY:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v25

    mul-double v23, v23, v25

    move-wide/from16 v0, v23

    double-to-int v0, v0

    move/from16 v19, v0

    .line 303
    .restart local v19       #sY:I
    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcW:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v25

    mul-double v23, v23, v25

    move-wide/from16 v0, v23

    double-to-int v0, v0

    move/from16 v17, v0

    .line 304
    .restart local v17       #sW:I
    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcH:Lmiui/app/screenelement/data/Expression;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v25

    mul-double v23, v23, v25

    move-wide/from16 v0, v23

    double-to-int v0, v0

    move/from16 v16, v0

    .line 305
    .restart local v16       #sH:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v23, v0

    add-int v24, v18, v17

    add-int v25, v19, v16

    move-object/from16 v0, v23

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 307
    .end local v16           #sH:I
    .end local v17           #sW:I
    .end local v18           #sX:I
    .end local v19           #sY:I
    :cond_3cc
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBufferCanvas:Landroid/graphics/Canvas;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcRect:Landroid/graphics/Rect;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mDesRect:Landroid/graphics/Rect;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v26, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 312
    :goto_3ef
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_3f9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_42f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lmiui/app/screenelement/animation/AnimatedElement;

    .line 313
    .local v11, mask:Lmiui/app/screenelement/animation/AnimatedElement;
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBufferCanvas:Landroid/graphics/Canvas;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v11, v2, v3}, Lmiui/app/screenelement/elements/ImageScreenElement;->renderWithMask(Landroid/graphics/Canvas;Lmiui/app/screenelement/animation/AnimatedElement;FF)V

    goto :goto_3f9

    .line 309
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v11           #mask:Lmiui/app/screenelement/animation/AnimatedElement;
    :cond_417
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBufferCanvas:Landroid/graphics/Canvas;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v6, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_3ef

    .line 316
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_42f
    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMaskBuffer:Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/elements/ImageScreenElement;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v24, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    move/from16 v2, v21

    move/from16 v3, v22

    move-object/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto/16 :goto_de
.end method

.method protected getBitmap()Landroid/graphics/Bitmap;
    .registers 4

    .prologue
    .line 337
    sget-object v1, Lmiui/app/screenelement/elements/ImageScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType:[I

    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_44

    .line 343
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_24

    .line 344
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    .line 352
    :goto_13
    return-object v1

    .line 339
    :pswitch_14
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mVirtualScreen:Lmiui/app/screenelement/elements/VirtualScreen;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mVirtualScreen:Lmiui/app/screenelement/elements/VirtualScreen;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/VirtualScreen;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_13

    :cond_1f
    const/4 v1, 0x0

    goto :goto_13

    .line 341
    :pswitch_21
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_13

    .line 346
    :cond_24
    iget-object v1, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v1}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v0

    .line 347
    .local v0, name:Ljava/lang/String;
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCachedBitmapName:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_41

    .line 348
    iput-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCachedBitmapName:Ljava/lang/String;

    .line 349
    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-virtual {v1, v0}, Lmiui/app/screenelement/ResourceManager;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCachedBitmap:Landroid/graphics/Bitmap;

    .line 350
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmapChanged:Z

    .line 352
    :cond_41
    iget-object v1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCachedBitmap:Landroid/graphics/Bitmap;

    goto :goto_13

    .line 337
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_14
        :pswitch_21
    .end packed-switch
.end method

.method protected getBitmapHeight()I
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected getBitmapWidth()I
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getHeight()F
    .registers 2

    .prologue
    .line 234
    iget v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    return v0
.end method

.method public getWidth()F
    .registers 2

    .prologue
    .line 229
    iget v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    return v0
.end method

.method public getX()F
    .registers 2

    .prologue
    .line 220
    iget v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mX:F

    return v0
.end method

.method public getY()F
    .registers 2

    .prologue
    .line 224
    iget v0, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mY:F

    return v0
.end method

.method public init()V
    .registers 12

    .prologue
    const/4 v8, 0x1

    .line 170
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->init()V

    .line 171
    iget-object v7, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    if-eqz v7, :cond_1e

    .line 172
    iget-object v7, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmiui/app/screenelement/animation/AnimatedElement;

    .line 173
    .local v3, mask:Lmiui/app/screenelement/animation/AnimatedElement;
    invoke-virtual {v3}, Lmiui/app/screenelement/animation/AnimatedElement;->init()V

    goto :goto_e

    .line 177
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #mask:Lmiui/app/screenelement/animation/AnimatedElement;
    :cond_1e
    iput-boolean v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmapChanged:Z

    .line 178
    sget-object v7, Lmiui/app/screenelement/elements/ImageScreenElement$1;->$SwitchMap$miui$app$screenelement$elements$ImageScreenElement$SrcType:[I

    iget-object v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mSrcType:Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;

    invoke-virtual {v8}, Lmiui/app/screenelement/elements/ImageScreenElement$SrcType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_c6

    .line 205
    :cond_2d
    :goto_2d
    return-void

    .line 180
    :pswitch_2e
    iget-object v7, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v8, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v8}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lmiui/app/screenelement/ScreenElementRoot;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v5

    .line 181
    .local v5, se:Lmiui/app/screenelement/elements/ScreenElement;
    instance-of v7, v5, Lmiui/app/screenelement/elements/VirtualScreen;

    if-eqz v7, :cond_2d

    .line 182
    check-cast v5, Lmiui/app/screenelement/elements/VirtualScreen;

    .end local v5           #se:Lmiui/app/screenelement/elements/ScreenElement;
    iput-object v5, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mVirtualScreen:Lmiui/app/screenelement/elements/VirtualScreen;

    goto :goto_2d

    .line 186
    :pswitch_43
    iget-object v7, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v7}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v6

    .line 187
    .local v6, src:Ljava/lang/String;
    if-eqz v6, :cond_ac

    .line 188
    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 189
    .local v4, name:[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x2

    if-ne v7, v8, :cond_93

    .line 191
    :try_start_55
    iget-object v7, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v7, v7, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    new-instance v8, Landroid/content/ComponentName;

    const/4 v9, 0x0

    aget-object v9, v4, v9

    const/4 v10, 0x1

    aget-object v10, v4, v10

    invoke-direct {v8, v9, v10}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getActivityIcon(Landroid/content/ComponentName;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 193
    .local v0, d:Landroid/graphics/drawable/Drawable;
    instance-of v7, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v7, :cond_2d

    .line 194
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v7

    iput-object v7, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;
    :try_end_78
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_55 .. :try_end_78} :catch_79

    goto :goto_2d

    .line 196
    :catch_79
    move-exception v1

    .line 197
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v7, "ImageScreenElement"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "fail to get icon for src of ApplicationIcon type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d

    .line 200
    .end local v1           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_93
    const-string v7, "ImageScreenElement"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "invalid src of ApplicationIcon type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2d

    .line 202
    .end local v4           #name:[Ljava/lang/String;
    :cond_ac
    const-string v7, "ImageScreenElement"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "invalid src of ApplicationIcon type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2d

    .line 178
    :pswitch_data_c6
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_43
    .end packed-switch
.end method

.method public load(Lorg/w3c/dom/Element;)V
    .registers 4
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 148
    if-nez p1, :cond_11

    .line 149
    const-string v0, "ImageScreenElement"

    const-string v1, "node is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    new-instance v0, Lmiui/app/screenelement/ScreenElementLoadException;

    const-string v1, "node is null"

    invoke-direct {v0, v1}, Lmiui/app/screenelement/ScreenElementLoadException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_11
    invoke-direct {p0, p1}, Lmiui/app/screenelement/elements/ImageScreenElement;->loadMask(Lorg/w3c/dom/Element;)V

    .line 154
    return-void
.end method

.method public reset(J)V
    .registers 6
    .parameter "time"

    .prologue
    .line 473
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->reset(J)V

    .line 474
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    if-eqz v2, :cond_1d

    .line 475
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/animation/AnimatedElement;

    .line 476
    .local v1, mask:Lmiui/app/screenelement/animation/AnimatedElement;
    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/animation/AnimatedElement;->reset(J)V

    goto :goto_d

    .line 479
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #mask:Lmiui/app/screenelement/animation/AnimatedElement;
    :cond_1d
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .parameter "bmp"

    .prologue
    .line 323
    iput-object p1, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    .line 324
    return-void
.end method

.method protected shouldScaleBitmap()Z
    .registers 2

    .prologue
    .line 208
    const/4 v0, 0x1

    return v0
.end method

.method public tick(J)V
    .registers 7
    .parameter "currentTime"

    .prologue
    const/4 v3, 0x0

    .line 441
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->tick(J)V

    .line 442
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->isVisible()Z

    move-result v2

    if-nez v2, :cond_b

    .line 469
    :goto_a
    return-void

    .line 445
    :cond_b
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 446
    invoke-direct {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->updateBmpSizeVar()V

    .line 447
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    if-eqz v2, :cond_2e

    .line 448
    iget-object v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mMasks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/animation/AnimatedElement;

    .line 449
    .local v1, mask:Lmiui/app/screenelement/animation/AnimatedElement;
    invoke-virtual {v1, p1, p2}, Lmiui/app/screenelement/animation/AnimatedElement;->tick(J)V

    goto :goto_1e

    .line 453
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #mask:Lmiui/app/screenelement/animation/AnimatedElement;
    :cond_2e
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getWidth()F

    move-result v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniWidth:F

    .line 454
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getBitmapWidth()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpWidth:F

    .line 455
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniWidth:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_69

    .line 456
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniWidth:F

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    .line 460
    :goto_45
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getHeight()F

    move-result v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniHeight:F

    .line 461
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->getBitmapHeight()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpHeight:F

    .line 462
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniHeight:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_6e

    .line 463
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mAniHeight:F

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    .line 467
    :goto_5c
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getX()F

    move-result v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mX:F

    .line 468
    invoke-super {p0}, Lmiui/app/screenelement/elements/AnimatedScreenElement;->getY()F

    move-result v2

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mY:F

    goto :goto_a

    .line 458
    :cond_69
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpWidth:F

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mWidth:F

    goto :goto_45

    .line 465
    :cond_6e
    iget v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBmpHeight:F

    iput v2, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mHeight:F

    goto :goto_5c
.end method
