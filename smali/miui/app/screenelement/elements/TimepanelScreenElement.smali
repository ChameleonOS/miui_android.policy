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
    .line 54
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ImageScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 31
    const-string v0, "kk:mm"

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    .line 33
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    .line 44
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    .line 46
    new-instance v0, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;

    invoke-direct {v0, p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement$1;-><init>(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    .line 55
    const-string v0, "format"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lmiui/app/screenelement/elements/TimepanelScreenElement;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 22
    invoke-direct {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->updateTime()V

    return-void
.end method

.method static synthetic access$100(Lmiui/app/screenelement/elements/TimepanelScreenElement;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 22
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getDigitBmp(C)Landroid/graphics/Bitmap;
    .registers 6
    .parameter "c"

    .prologue
    .line 124
    iget-object v2, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v2}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_21

    const-string v0, "time.png"

    .line 125
    .local v0, src:Ljava/lang/String;
    :goto_e
    const/16 v2, 0x3a

    if-ne p1, v2, :cond_28

    const-string v1, "dot"

    .line 126
    .local v1, suffix:Ljava/lang/String;
    :goto_14
    iget-object v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v2, v2, Lmiui/app/screenelement/ScreenContext;->mResourceManager:Lmiui/app/screenelement/ResourceManager;

    invoke-static {v0, v1}, Lmiui/app/screenelement/util/Utils;->addFileNameSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/ResourceManager;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2

    .line 124
    .end local v0           #src:Ljava/lang/String;
    .end local v1           #suffix:Ljava/lang/String;
    :cond_21
    iget-object v2, p0, Lmiui/app/screenelement/elements/AnimatedScreenElement;->mAni:Lmiui/app/screenelement/animation/AnimatedElement;

    invoke-virtual {v2}, Lmiui/app/screenelement/animation/AnimatedElement;->getSrc()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 125
    .restart local v0       #src:Ljava/lang/String;
    :cond_28
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_14
.end method

.method private setDateFormat()V
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 131
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string v0, "kk:mm"

    :goto_14
    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    .line 133
    :cond_16
    return-void

    .line 131
    :cond_17
    const-string v0, "hh:mm"

    goto :goto_14
.end method

.method private updateTime()V
    .registers 15

    .prologue
    .line 80
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 81
    .local v4, elapsedRealTimeMillis:J
    iget-wide v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLastUpdateTimeMillis:J

    sub-long v10, v4, v10

    const-wide/16 v12, 0x3e8

    cmp-long v10, v10, v12

    if-gez v10, :cond_f

    .line 121
    :cond_e
    :goto_e
    return-void

    .line 85
    :cond_f
    iget-object v10, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v10, :cond_4f

    .line 86
    const/16 v10, 0x30

    invoke-direct {p0, v10}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->getDigitBmp(C)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 87
    .local v2, digitBmp:Landroid/graphics/Bitmap;
    const/16 v10, 0x3a

    invoke-direct {p0, v10}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->getDigitBmp(C)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 88
    .local v3, dotBmp:Landroid/graphics/Bitmap;
    if-eqz v2, :cond_e

    if-eqz v3, :cond_e

    .line 90
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    iput v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    .line 91
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    mul-int/lit8 v10, v10, 0x4

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    add-int/2addr v10, v11

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v11, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    iput-object v10, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    .line 93
    iget-object v10, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Bitmap;->setDensity(I)V

    .line 94
    iget v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpHeight:I

    int-to-double v10, v10

    invoke-virtual {p0, v10, v11}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setActualHeight(D)V

    .line 97
    .end local v2           #digitBmp:Landroid/graphics/Bitmap;
    .end local v3           #dotBmp:Landroid/graphics/Bitmap;
    :cond_4f
    iget-object v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 98
    iget-object v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mFormat:Ljava/lang/String;

    iget-object v11, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    invoke-static {v10, v11}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v7

    .line 99
    .local v7, newTime:Ljava/lang/CharSequence;
    iget-object v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mPreTime:Ljava/lang/CharSequence;

    invoke-virtual {v7, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_e

    .line 102
    iput-object v7, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mPreTime:Ljava/lang/CharSequence;

    .line 103
    new-instance v8, Landroid/graphics/Canvas;

    iget-object v10, p0, Lmiui/app/screenelement/elements/ImageScreenElement;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v8, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 104
    .local v8, tmpCanvas:Landroid/graphics/Canvas;
    const/4 v10, 0x0

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v10, v11}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 105
    const/4 v9, 0x0

    .line 106
    .local v9, x:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_79
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v10

    if-ge v6, v10, :cond_97

    .line 107
    invoke-interface {v7, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 108
    .local v1, digit:C
    invoke-direct {p0, v1}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->getDigitBmp(C)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 109
    .local v0, bmp:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_94

    .line 110
    int-to-float v10, v9

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v8, v0, v10, v11, v12}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 111
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    add-int/2addr v9, v10

    .line 106
    :cond_94
    add-int/lit8 v6, v6, 0x1

    goto :goto_79

    .line 115
    .end local v0           #bmp:Landroid/graphics/Bitmap;
    .end local v1           #digit:C
    :cond_97
    iput v9, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpWidth:I

    .line 116
    iget v10, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mBmpWidth:I

    int-to-double v10, v10

    invoke-virtual {p0, v10, v11}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setActualWidth(D)V

    .line 119
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->requestUpdate()V

    .line 120
    iput-wide v4, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mLastUpdateTimeMillis:J

    goto/16 :goto_e
.end method


# virtual methods
.method public finish()V
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 68
    return-void
.end method

.method public init()V
    .registers 3

    .prologue
    .line 60
    invoke-super {p0}, Lmiui/app/screenelement/elements/ImageScreenElement;->init()V

    .line 61
    invoke-direct {p0}, Lmiui/app/screenelement/elements/TimepanelScreenElement;->setDateFormat()V

    .line 62
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    return-void
.end method

.method public pause()V
    .registers 3

    .prologue
    .line 71
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method

.method public resume()V
    .registers 3

    .prologue
    .line 75
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mCalendar:Ljava/util/Calendar;

    .line 76
    iget-object v0, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lmiui/app/screenelement/elements/TimepanelScreenElement;->mTimeUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    return-void
.end method
