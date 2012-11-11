.class public Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;
.super Lmiui/app/screenelement/MiAdvancedView;
.source "AwesomeLockScreenView.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AwesomeLockScreenView"

.field private static final MOVING_THRESHOLD:I = 0x19


# instance fields
.field private mLastTouchTime:J

.field private mPreX:I

.field private mPreY:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenRoot;)V
    .registers 4
    .parameter "context"
    .parameter "root"

    .prologue
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2}, Lmiui/app/screenelement/MiAdvancedView;-><init>(Landroid/content/Context;Lmiui/app/screenelement/ScreenElementRoot;)V

    invoke-virtual {p0, v0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->setFocusable(Z)V

    invoke-virtual {p0, v0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->setFocusableInTouchMode(Z)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11
    .parameter "event"

    .prologue
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v3, v5

    .local v3, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v4, v5

    .local v4, y:I
    const/4 v5, 0x2

    if-ne v0, v5, :cond_45

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mLastTouchTime:J

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x3e8

    cmp-long v5, v5, v7

    if-ltz v5, :cond_40

    iget v5, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreX:I

    sub-int v1, v3, v5

    .local v1, dx:I
    iget v5, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreY:I

    sub-int v2, v4, v5

    .local v2, dy:I
    mul-int v5, v1, v1

    mul-int v6, v2, v2

    add-int/2addr v5, v6

    const/16 v6, 0x19

    if-le v5, v6, :cond_40

    iget-object v5, p0, Lmiui/app/screenelement/MiAdvancedView;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    check-cast v5, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenRoot;

    invoke-virtual {v5}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/LockScreenRoot;->pokeWakelock()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mLastTouchTime:J

    iput v3, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreX:I

    iput v4, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreY:I

    .end local v1           #dx:I
    .end local v2           #dy:I
    :cond_40
    :goto_40
    invoke-super {p0, p1}, Lmiui/app/screenelement/MiAdvancedView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    return v5

    :cond_45
    if-nez v0, :cond_40

    iput v3, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreX:I

    iput v4, p0, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/AwesomeLockScreenView;->mPreY:I

    goto :goto_40
.end method
