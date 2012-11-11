.class final Lcom/android/internal/policy/impl/IconUtilities;
.super Ljava/lang/Object;
.source "IconUtilities.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IconUtilities"

.field private static final sColors:[I


# instance fields
.field private final mBlurPaint:Landroid/graphics/Paint;

.field private final mCanvas:Landroid/graphics/Canvas;

.field private mColorIndex:I

.field private final mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private final mGlowColorFocusedPaint:Landroid/graphics/Paint;

.field private final mGlowColorPressedPaint:Landroid/graphics/Paint;

.field private mIconHeight:I

.field private mIconTextureHeight:I

.field private mIconTextureWidth:I

.field private mIconWidth:I

.field private final mOldBounds:Landroid/graphics/Rect;

.field private final mPaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/android/internal/policy/impl/IconUtilities;->sColors:[I

    return-void

    nop

    :array_a
    .array-data 0x4
        0x0t 0x0t 0xfft 0xfft
        0x0t 0xfft 0x0t 0xfft
        0xfft 0x0t 0x0t 0xfft
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 14
    .parameter "context"

    .prologue
    const/16 v11, 0x1e

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v6, -0x1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconWidth:I

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconHeight:I

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureWidth:I

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureHeight:I

    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mPaint:Landroid/graphics/Paint;

    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mBlurPaint:Landroid/graphics/Paint;

    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorPressedPaint:Landroid/graphics/Paint;

    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorFocusedPaint:Landroid/graphics/Paint;

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mOldBounds:Landroid/graphics/Rect;

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6}, Landroid/graphics/Canvas;-><init>()V

    iput-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mCanvas:Landroid/graphics/Canvas;

    iput v9, p0, Lcom/android/internal/policy/impl/IconUtilities;->mColorIndex:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .local v4, resources:Landroid/content/res/Resources;
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/IconUtilities;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .local v3, metrics:Landroid/util/DisplayMetrics;
    iget v2, v3, Landroid/util/DisplayMetrics;->density:F

    .local v2, density:F
    const/high16 v6, 0x40a0

    mul-float v0, v6, v2

    .local v0, blurPx:F
    const/high16 v6, 0x105

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconHeight:I

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconWidth:I

    iget v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconWidth:I

    const/high16 v7, 0x4000

    mul-float/2addr v7, v0

    float-to-int v7, v7

    add-int/2addr v6, v7

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureHeight:I

    iput v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureWidth:I

    iget-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mBlurPaint:Landroid/graphics/Paint;

    new-instance v7, Landroid/graphics/BlurMaskFilter;

    sget-object v8, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v7, v0, v8}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .local v5, value:Landroid/util/TypedValue;
    iget-object v7, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorPressedPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v8, 0x101038d

    invoke-virtual {v6, v8, v5, v10}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v6

    if-eqz v6, :cond_c5

    iget v6, v5, Landroid/util/TypedValue;->data:I

    :goto_84
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorPressedPaint:Landroid/graphics/Paint;

    invoke-static {v9, v11}, Landroid/graphics/TableMaskFilter;->CreateClipTable(II)Landroid/graphics/TableMaskFilter;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    iget-object v7, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorFocusedPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v8, 0x101038f

    invoke-virtual {v6, v8, v5, v10}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v6

    if-eqz v6, :cond_c8

    iget v6, v5, Landroid/util/TypedValue;->data:I

    :goto_a1
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorFocusedPaint:Landroid/graphics/Paint;

    invoke-static {v9, v11}, Landroid/graphics/TableMaskFilter;->CreateClipTable(II)Landroid/graphics/TableMaskFilter;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    new-instance v1, Landroid/graphics/ColorMatrix;

    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .local v1, cm:Landroid/graphics/ColorMatrix;
    const v6, 0x3e4ccccd

    invoke-virtual {v1, v6}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    iget-object v6, p0, Lcom/android/internal/policy/impl/IconUtilities;->mCanvas:Landroid/graphics/Canvas;

    new-instance v7, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v8, 0x4

    const/4 v9, 0x2

    invoke-direct {v7, v8, v9}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v6, v7}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    return-void

    .end local v1           #cm:Landroid/graphics/ColorMatrix;
    :cond_c5
    const/16 v6, -0x3d00

    goto :goto_84

    :cond_c8
    const/16 v6, -0x7200

    goto :goto_a1
.end method

.method private createIconBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .registers 18
    .parameter "icon"

    .prologue
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/IconUtilities;->mIconWidth:I

    .local v13, width:I
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/internal/policy/impl/IconUtilities;->mIconHeight:I

    .local v4, height:I
    move-object/from16 v0, p1

    instance-of v14, v0, Landroid/graphics/drawable/PaintDrawable;

    if-eqz v14, :cond_71

    move-object/from16 v6, p1

    check-cast v6, Landroid/graphics/drawable/PaintDrawable;

    .local v6, painter:Landroid/graphics/drawable/PaintDrawable;
    invoke-virtual {v6, v13}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v6, v4}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicHeight(I)V

    .end local v6           #painter:Landroid/graphics/drawable/PaintDrawable;
    :cond_18
    :goto_18
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    .local v9, sourceWidth:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    .local v8, sourceHeight:I
    if-lez v9, :cond_31

    if-lez v9, :cond_31

    if-lt v13, v9, :cond_28

    if-ge v4, v8, :cond_93

    :cond_28
    int-to-float v14, v9

    int-to-float v15, v8

    div-float v7, v14, v15

    .local v7, ratio:F
    if-le v9, v8, :cond_8d

    int-to-float v14, v13

    div-float/2addr v14, v7

    float-to-int v4, v14

    .end local v7           #ratio:F
    :cond_31
    :goto_31
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureWidth:I

    .local v11, textureWidth:I
    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureHeight:I

    .local v10, textureHeight:I
    sget-object v14, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v10, v14}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .local v1, bitmap:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/policy/impl/IconUtilities;->mCanvas:Landroid/graphics/Canvas;

    .local v3, canvas:Landroid/graphics/Canvas;
    invoke-virtual {v3, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    sub-int v14, v11, v13

    div-int/lit8 v5, v14, 0x2

    .local v5, left:I
    sub-int v14, v10, v4

    div-int/lit8 v12, v14, 0x2

    .local v12, top:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/policy/impl/IconUtilities;->mOldBounds:Landroid/graphics/Rect;

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    add-int v14, v5, v13

    add-int v15, v12, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v12, v14, v15}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/policy/impl/IconUtilities;->mOldBounds:Landroid/graphics/Rect;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-object v1

    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #canvas:Landroid/graphics/Canvas;
    .end local v5           #left:I
    .end local v8           #sourceHeight:I
    .end local v9           #sourceWidth:I
    .end local v10           #textureHeight:I
    .end local v11           #textureWidth:I
    .end local v12           #top:I
    :cond_71
    move-object/from16 v0, p1

    instance-of v14, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v14, :cond_18

    move-object/from16 v2, p1

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .local v2, bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .restart local v1       #bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v14

    if-nez v14, :cond_18

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/policy/impl/IconUtilities;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v2, v14}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    goto :goto_18

    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v2           #bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    .restart local v7       #ratio:F
    .restart local v8       #sourceHeight:I
    .restart local v9       #sourceWidth:I
    :cond_8d
    if-le v8, v9, :cond_31

    int-to-float v14, v4

    mul-float/2addr v14, v7

    float-to-int v13, v14

    goto :goto_31

    .end local v7           #ratio:F
    :cond_93
    if-ge v9, v13, :cond_31

    if-ge v8, v4, :cond_31

    move v13, v9

    move v4, v8

    goto :goto_31
.end method

.method private createSelectedBitmap(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .registers 12
    .parameter "src"
    .parameter "pressed"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    iget v4, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureWidth:I

    iget v5, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureHeight:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .local v2, result:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v0, dest:Landroid/graphics/Canvas;
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v8, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    const/4 v4, 0x2

    new-array v3, v4, [I

    .local v3, xy:[I
    iget-object v4, p0, Lcom/android/internal/policy/impl/IconUtilities;->mBlurPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v3}, Landroid/graphics/Bitmap;->extractAlpha(Landroid/graphics/Paint;[I)Landroid/graphics/Bitmap;

    move-result-object v1

    .local v1, mask:Landroid/graphics/Bitmap;
    aget v4, v3, v8

    int-to-float v5, v4

    const/4 v4, 0x1

    aget v4, v3, v4

    int-to-float v6, v4

    if-eqz p2, :cond_3a

    iget-object v4, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorPressedPaint:Landroid/graphics/Paint;

    :goto_2a
    invoke-virtual {v0, v1, v5, v6, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    iget-object v4, p0, Lcom/android/internal/policy/impl/IconUtilities;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v7, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    return-object v2

    :cond_3a
    iget-object v4, p0, Lcom/android/internal/policy/impl/IconUtilities;->mGlowColorFocusedPaint:Landroid/graphics/Paint;

    goto :goto_2a
.end method


# virtual methods
.method public createIconDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 9
    .parameter "src"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/IconUtilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v1

    .local v1, scaled:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .local v0, result:Landroid/graphics/drawable/StateListDrawable;
    new-array v2, v6, [I

    const v3, 0x101009c

    aput v3, v2, v5

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p0, v1, v5}, Lcom/android/internal/policy/impl/IconUtilities;->createSelectedBitmap(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v2, v6, [I

    const v3, 0x10100a7

    aput v3, v2, v5

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p0, v1, v6}, Lcom/android/internal/policy/impl/IconUtilities;->createSelectedBitmap(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v2, v5, [I

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v3, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    iget v2, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureWidth:I

    iget v3, p0, Lcom/android/internal/policy/impl/IconUtilities;->mIconTextureHeight:I

    invoke-virtual {v0, v5, v5, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->setBounds(IIII)V

    return-object v0
.end method
