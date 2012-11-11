.class public Lmiui/app/screenelement/elements/TimepanelScreenElement;
.super Lmiui/app/screenelement/elements/ImageScreenElement;
.source "TimepanelScreenElement.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "TimepanelScreenElement"

.field private static final M12:Ljava/lang/String; = "hh:mm"

.field private static final M24:Ljava/lang/String; = "kk:mm"

.field public static final TAG_NAME:Ljava/lang/String; = "Time"


# instance fields
.field private mBmpHeight:I

.field private mBmpWidth:I

.field protected mCalendar:Ljava/util/Calendar;

.field private mFormat:Ljava/lang/String;

.field private mHandler:Landroid/os/Handler;

.field private mLastUpdateTimeMillis:J

.field private mLoadResourceFailed:Z

.field private mPreTime:Ljava/lang/CharSequence;

.field private final mTimeUpdater:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 5
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ImageScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    const-string v0, "kk:mm"

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    new-instance v0, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;-><init>(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    const-string v0, "format"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    iget-object v0, p2, Lmiui/app/screenelement/ScreenContext;->mHandler:Landroid/os/Handler;

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->updateTime()V

    return-void
.end method

.method static synthetic access$100(Lmiui/app/screenelement/elements/TimepanelScreenElement;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private createBitmap()V
    .registers 10

    .prologue
    const/4 v8, 0x1

    const-string v2, "0123456789:"

    .local v2, digits:Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, maxWidth:I
    const/4 v0, 0x0

    .local v0, density:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_6
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_56

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-direct {p0, v5}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->getDigitBmp(C)Landroid/graphics/Bitmap;

    move-result-object v1

    .local v1, digitBmp:Landroid/graphics/Bitmap;
    if-nez v1, :cond_35

    iput-boolean v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLoadResourceFailed:Z

    const-string v5, "TimepanelScreenElement"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to load digit bitmap: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v1           #digitBmp:Landroid/graphics/Bitmap;
    :goto_34
    return-void

    .restart local v1       #digitBmp:Landroid/graphics/Bitmap;
    :cond_35
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-ge v4, v5, :cond_3f

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    :cond_3f
    iget v5, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    if-ge v5, v6, :cond_4d

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    iput v5, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    :cond_4d
    if-nez v0, :cond_53

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v0

    :cond_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .end local v1           #digitBmp:Landroid/graphics/Bitmap;
    :cond_56
    mul-int/lit8 v5, v4, 0x5

    iget v6, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    iput-object v5, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v0}, Landroid/graphics/Bitmap;->setDensity(I)V

    iget v5, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    int-to-double v5, v5

    invoke-virtual {p0, v5, v6}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setActualHeight(D)V

    iput-boolean v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmapChanged:Z

    goto :goto_34
.end method

.method private getDigitBmp(C)Landroid/graphics/Bitmap;
    .registers 6
    .parameter "c"

    .prologue
    iget-object v2, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v2}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_21

    const-string v0, "time.png"

    .local v0, src:Ljava/lang/String;
    :goto_e
    const/16 v2, 0x3a

    if-ne p1, v2, :cond_28

    const-string v1, "dot"

    .local v1, suffix:Ljava/lang/String;
    :goto_14
    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/ResourceManager;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2

    .end local v0           #src:Ljava/lang/String;
    .end local v1           #suffix:Ljava/lang/String;
    :cond_21
    iget-object v2, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v2}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .restart local v0       #src:Ljava/lang/String;
    :cond_28
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_14
.end method

.method private setDateFormat()V
    .registers 2

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string v0, "kk:mm"

    :goto_14
    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    :cond_16
    return-void

    :cond_17
    const-string v0, "hh:mm"

    goto :goto_14
.end method

.method private updateTime()V
    .registers 13

    .prologue
    iget-boolean v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLoadResourceFailed:Z

    if-eqz v8, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .local v2, elapsedRealTimeMillis:J
    iget-wide v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLastUpdateTimeMillis:J

    sub-long v8, v2, v8

    const-wide/16 v10, 0x3e8

    cmp-long v8, v8, v10

    if-ltz v8, :cond_4

    iget-object v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v8, :cond_1a

    invoke-direct {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->createBitmap()V

    :cond_1a
    iget-object v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v8, :cond_4

    iget-object v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/util/Calendar;->setTimeInMillis(J)V

    iget-object v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    iget-object v9, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    invoke-static {v8, v9}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v5

    .local v5, newTime:Ljava/lang/CharSequence;
    iget-object v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mPreTime:Ljava/lang/CharSequence;

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    iput-object v5, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mPreTime:Ljava/lang/CharSequence;

    new-instance v6, Landroid/graphics/Canvas;

    iget-object v8, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v6, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v6, tmpCanvas:Landroid/graphics/Canvas;
    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v9}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    const/4 v7, 0x0

    .local v7, x:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_48
    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-ge v4, v8, :cond_66

    invoke-interface {v5, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .local v1, digit:C
    invoke-direct {p0, v1}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->getDigitBmp(C)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, bmp:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_63

    int-to-float v8, v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v6, v0, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    add-int/2addr v7, v8

    :cond_63
    add-int/lit8 v4, v4, 0x1

    goto :goto_48

    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v1           #digit:C
    :cond_66
    iput v7, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpWidth:I

    iget v8, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpWidth:I

    int-to-float v8, v8

    invoke-virtual {p0, v8}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->descale(F)F

    move-result v8

    float-to-double v8, v8

    invoke-virtual {p0, v8, v9}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setActualWidth(D)V

    invoke-virtual {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->requestUpdate()V

    iput-wide v2, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLastUpdateTimeMillis:J

    goto :goto_4
.end method


# virtual methods
.method public finish()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected getBitmapWidth()I
    .registers 2

    .prologue
    iget v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpWidth:I

    return v0
.end method

.method public init()V
    .registers 3

    .prologue
    invoke-super {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->init()V

    invoke-direct {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setDateFormat()V

    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public pause()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public resume()V
    .registers 3

    .prologue
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
