.class public Lmiui/app/screenelement/util/ImagesInOne;
.super Ljava/lang/Object;
.source "ImagesInOne.java"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mCount:I

.field private mDst:Landroid/graphics/Rect;

.field private mOneWidth:I

.field private mSrc:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .registers 5
    .parameter "bmp"
    .parameter "oneWidth"

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/util/ImagesInOne;->mSrc:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/util/ImagesInOne;->mDst:Landroid/graphics/Rect;

    iput-object p1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    iput p2, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    iget-object v0, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    div-int/2addr v0, v1

    iput v0, p0, Lmiui/app/screenelement/util/ImagesInOne;->mCount:I

    iget-object v0, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    rem-int/2addr v0, v1

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid width"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_33
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V
    .registers 11
    .parameter "c"
    .parameter "x"
    .parameter "y"
    .parameter "index"
    .parameter "paint"

    .prologue
    iget v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mCount:I

    add-int/lit8 v1, v1, -0x1

    if-le p4, v1, :cond_e

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "invalid index"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_e
    iget-object v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mDst:Landroid/graphics/Rect;

    iget v2, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    add-int/2addr v2, p2

    iget-object v3, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    add-int/2addr v3, p3

    invoke-virtual {v1, p2, p3, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    iget v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    mul-int v0, v1, p4

    .local v0, l:I
    iget-object v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mSrc:Landroid/graphics/Rect;

    const/4 v2, 0x0

    iget v3, p0, Lmiui/app/screenelement/util/ImagesInOne;->mOneWidth:I

    add-int/2addr v3, v0

    iget-object v4, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v1, p0, Lmiui/app/screenelement/util/ImagesInOne;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lmiui/app/screenelement/util/ImagesInOne;->mSrc:Landroid/graphics/Rect;

    iget-object v3, p0, Lmiui/app/screenelement/util/ImagesInOne;->mDst:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v2, v3, p5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void
.end method
