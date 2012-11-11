.class Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
.super Landroid/view/View;
.source "MagnifierPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MagnifierPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MagnifierView"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mDisplayMatrix:Landroid/graphics/Matrix;

.field private mDstRect:Landroid/graphics/Rect;

.field private mFilterDrawable:Landroid/graphics/drawable/Drawable;

.field private mFrontDrawable:Landroid/graphics/drawable/Drawable;

.field private mLastHeight:I

.field private mLastWidth:I

.field private mMagHeight:I

.field private mMagWidth:I

.field private mSrcHeight:I

.field private mSrcRect:Landroid/graphics/Rect;

.field private mSrcWidth:I

.field private mUpdateHandler:Landroid/os/Handler;

.field private mUpdateThread:Landroid/os/HandlerThread;

.field final synthetic this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/MagnifierPopupWindow;Landroid/content/Context;F)V
    .registers 8
    .parameter
    .parameter "context"
    .parameter "times"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    iput-object p1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmapPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDstRect:Landroid/graphics/Rect;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDisplayMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "UpdateMagnifier"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView$1;-><init>(Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;Landroid/os/Looper;Lcom/android/internal/policy/impl/MagnifierPopupWindow;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmapPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x6020053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFilterDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x6020054

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFrontDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFilterDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagWidth:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFilterDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagHeight:I

    iget v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagWidth:I

    int-to-float v0, v0

    div-float/2addr v0, p3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcWidth:I

    iget v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagHeight:I

    int-to-float v0, v0

    div-float/2addr v0, p3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcHeight:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDstRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagWidth:I

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagHeight:I

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x60a0019

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    #setter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mFingerOffset:I
    invoke-static {p1, v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$102(Lcom/android/internal/policy/impl/MagnifierPopupWindow;I)I

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->refresh()V

    return-void
.end method

.method private getDegreesForRotation(I)F
    .registers 3
    .parameter "value"

    .prologue
    packed-switch p1, :pswitch_data_e

    const/4 v0, 0x0

    :goto_4
    return v0

    :pswitch_5
    const/high16 v0, 0x4387

    goto :goto_4

    :pswitch_8
    const/high16 v0, 0x4334

    goto :goto_4

    :pswitch_b
    const/high16 v0, 0x42b4

    goto :goto_4

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_5
        :pswitch_8
        :pswitch_b
    .end packed-switch
.end method

.method private refresh()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    iget-object v0, v0, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_1d
    return-void
.end method


# virtual methods
.method public hide()V
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x2

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_6a

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMagnifierView:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$300(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mX:I
    invoke-static {v3}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$200(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->setPivotX(F)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMagnifierView:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$300(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mY:I
    invoke-static {v3}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$400(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->setPivotY(F)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMagnifierView:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$300(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    move-result-object v2

    const-string v3, "scaleX"

    new-array v4, v5, [F

    fill-array-data v4, :array_6c

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .local v0, animation1:Landroid/animation/ObjectAnimator;
    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMagnifierView:Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$300(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;

    move-result-object v2

    const-string v3, "scaleY"

    new-array v4, v5, [F

    fill-array-data v4, :array_74

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .local v1, animation2:Landroid/animation/ObjectAnimator;
    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mAnimationExit:Landroid/animation/AnimatorSet;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$500(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/animation/AnimatorSet;

    move-result-object v2

    new-array v3, v5, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    aput-object v1, v3, v6

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mAnimationExit:Landroid/animation/AnimatorSet;
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$500(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/animation/AnimatorSet;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .end local v0           #animation1:Landroid/animation/ObjectAnimator;
    .end local v1           #animation2:Landroid/animation/ObjectAnimator;
    :cond_6a
    return-void

    nop

    :array_6c
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    :array_74
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .parameter "canvas"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_46

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_46

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mLocationX:I
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$900(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mLocationY:I
    invoke-static {v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$1000(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFilterDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFilterDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDstRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFrontDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mFrontDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_46
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplay:Landroid/view/Display;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$700(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->setMeasuredDimension(II)V

    return-void
.end method

.method takeScreenshot()V
    .registers 15

    .prologue
    const/4 v13, 0x0

    const/high16 v12, 0x4000

    const/4 v11, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const-wide/16 v8, 0x2

    const-string v10, "Magnifier"

    invoke-static {v8, v9, v10}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplay:Landroid/view/Display;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$700(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/view/Display;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v9}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    const/4 v8, 0x2

    new-array v3, v8, [F

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v8, v8

    aput v8, v3, v7

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v8, v8

    aput v8, v3, v6

    .local v3, dims:[F
    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplay:Landroid/view/Display;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$700(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/view/Display;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Display;->getRotation()I

    move-result v8

    invoke-direct {p0, v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->getDegreesForRotation(I)F

    move-result v2

    .local v2, degrees:F
    cmpl-float v8, v2, v11

    if-lez v8, :cond_fb

    move v5, v6

    .local v5, requiresRotation:Z
    :goto_48
    if-eqz v5, :cond_6a

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8}, Landroid/graphics/Matrix;->reset()V

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDisplayMatrix:Landroid/graphics/Matrix;

    neg-float v9, v2

    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->preRotate(F)Z

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    aget v8, v3, v7

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    aput v8, v3, v7

    aget v8, v3, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    aput v8, v3, v6

    :cond_6a
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmap:Landroid/graphics/Bitmap;

    .local v0, bitmap:Landroid/graphics/Bitmap;
    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v9, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mLastWidth:I

    if-ne v8, v9, :cond_84

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v9, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mLastHeight:I

    if-eq v8, v9, :cond_ae

    :cond_84
    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v9, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v9}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->heightPixels:I

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mLastWidth:I

    iget-object v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;
    invoke-static {v8}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$600(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v8, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mLastHeight:I

    :cond_ae
    aget v8, v3, v7

    float-to-int v8, v8

    aget v9, v3, v6

    float-to-int v9, v9

    iget-object v10, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mMaxLayer:I
    invoke-static {v10}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$800(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v10

    invoke-static {v8, v9, v7, v10}, Landroid/view/Surface;->screenshot(IIII)Landroid/graphics/Bitmap;

    move-result-object v4

    .local v4, rawss:Landroid/graphics/Bitmap;
    if-eqz v5, :cond_fe

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v1, c:Landroid/graphics/Canvas;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {v1, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->rotate(F)V

    aget v8, v3, v7

    neg-float v8, v8

    div-float/2addr v8, v12

    aget v6, v3, v6

    neg-float v6, v6

    div-float/2addr v6, v12

    invoke-virtual {v1, v8, v6}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v1, v4, v11, v11, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v13}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .end local v1           #c:Landroid/graphics/Canvas;
    :goto_ed
    invoke-virtual {v0, v7}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mBitmap:Landroid/graphics/Bitmap;

    const-wide/16 v6, 0x2

    invoke-static {v6, v7}, Landroid/os/Trace;->traceEnd(J)V

    return-void

    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v4           #rawss:Landroid/graphics/Bitmap;
    .end local v5           #requiresRotation:Z
    :cond_fb
    move v5, v7

    goto/16 :goto_48

    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    .restart local v4       #rawss:Landroid/graphics/Bitmap;
    .restart local v5       #requiresRotation:Z
    :cond_fe
    move-object v0, v4

    goto :goto_ed
.end method

.method public updateCache()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mUpdateHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x50

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method updateMagnifier(Landroid/graphics/Rect;)V
    .registers 5
    .parameter "rect"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcWidth:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcHeight:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcWidth:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mSrcHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagWidth:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    #setter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mLocationX:I
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$902(Lcom/android/internal/policy/impl/MagnifierPopupWindow;I)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    iget v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->mMagHeight:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mFingerOffset:I
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$100(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->this$0:Lcom/android/internal/policy/impl/MagnifierPopupWindow;

    #getter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mFingerOffset:I
    invoke-static {v2}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$100(Lcom/android/internal/policy/impl/MagnifierPopupWindow;)I

    move-result v2

    neg-int v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    #setter for: Lcom/android/internal/policy/impl/MagnifierPopupWindow;->mLocationY:I
    invoke-static {v0, v1}, Lcom/android/internal/policy/impl/MagnifierPopupWindow;->access$1002(Lcom/android/internal/policy/impl/MagnifierPopupWindow;I)I

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MagnifierPopupWindow$MagnifierView;->invalidate()V

    return-void
.end method
