.class public Lcom/android/internal/policy/impl/MiuiLockScreen;
.super Landroid/widget/FrameLayout;
.source "MiuiLockScreen.java"

# interfaces
.implements Lcom/android/internal/policy/impl/KeyguardScreen;
.implements Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;
.implements Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;
.implements Lcom/miui/internal/policy/impl/SlidingPanel$OnTriggerListener;
.implements Lcom/android/internal/policy/impl/QcomCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/MiuiLockScreen$4;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;,
        Lcom/android/internal/policy/impl/MiuiLockScreen$Status;
    }
.end annotation


# static fields
.field private static final BACKGROUND_MUSIC_SHOW_DEFAULT_ALBUM:I = 0x3

.field private static final BACKGROUND_MUSIC_SHOW_HAS_ALBUM:I = 0x2

.field private static final BACKGROUND_MUSIC_SHOW_NONE:I = 0x1

.field private static final BACKGROUND_NONE:I = 0x0

.field private static final CONTROL_VIEW_BATTERY:I = 0x5

.field private static final CONTROL_VIEW_CALL:I = 0x1

.field private static final CONTROL_VIEW_DATE:I = 0x3

.field private static final CONTROL_VIEW_MUSIC:I = 0x4

.field private static final CONTROL_VIEW_NONE:I = 0x0

.field private static final CONTROL_VIEW_SMS:I = 0x2

.field private static final CallLog_COLUMNS:[Ljava/lang/String; = null

.field private static final DBG:Z = false

.field private static final ENABLE_MENU_KEY_FILE:Ljava/lang/String; = "/data/local/enable_menu_key"

.field private static final MAKR_PREVIEW_READ_DELAY:J = 0x7d0L

.field private static final MAX_VISIBLE_ITEM_NUM:I = 0x2

.field private static final QUERY_TOKEN:I = 0x35

.field private static final SMS_RECEIVED_WAKE_UP_DELAY:I = 0x61a8

.field private static final TAG:Ljava/lang/String; = "LockScreen"

.field private static sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;


# instance fields
.field private isPaused:Z

.field private mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

.field private mBackgroundMask:Landroid/widget/ImageView;

.field private mBatteryInfo:Landroid/view/View;

.field private mBatteryInfoText:Landroid/widget/TextView;

.field private mBatteryLevel:I

.field private final mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

.field private mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

.field private mCallsControlView:Landroid/view/View;

.field private mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

.field private mCallsPreviewList:Landroid/widget/ListView;

.field private mCarrier:Landroid/widget/TextView;

.field private mControlView:Landroid/widget/FrameLayout;

.field private mControlViewType:I

.field private mCreationOrientation:I

.field private mCurrentPreviewList:Landroid/widget/ListView;

.field private mEmergencyCall:Landroid/view/View;

.field private mEmergencyCallText:Landroid/widget/Button;

.field private mEnableMenuKeyInLockScreen:Z

.field private final mFadeoutAnim:Landroid/view/animation/Animation;

.field private mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

.field private mHintView:Landroid/view/View;

.field private mKeyboardHidden:I

.field private mLastGrabTime:J

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

.field private mPluggedIn:Z

.field private mPowerManager:Landroid/os/PowerManager;

.field private mScreenLocked:Landroid/widget/TextView;

.field private mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

.field private mShowingBatteryInfo:Z

.field private mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

.field private mSmsControlView:Landroid/view/View;

.field private mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

.field private mSmsPreviewList:Landroid/widget/ListView;

.field private mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

.field private mTimeView:Landroid/view/View;

.field private mUnlockIccCard:Landroid/view/View;

.field private mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

.field private final sLongPressVibration:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "number"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "date"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "name"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen;->CallLog_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/res/Configuration;Lcom/android/internal/widget/LockPatternUtils;Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;Lcom/miui/internal/policy/impl/KeyguardScreenCallback;)V
    .registers 16
    .parameter "context"
    .parameter "configuration"
    .parameter "lockPatternUtils"
    .parameter "updateMonitor"
    .parameter "callback"

    .prologue
    const/16 v9, 0x50

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v7, -0x1

    const/4 v6, 0x1

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    sget-object v3, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->Normal:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    const-wide v3, 0x7fffffffffffffffL

    iput-wide v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    const/16 v3, 0x64

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$3;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$3;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iput-object p4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iput-object p5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->shouldEnableMenuKey()Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEnableMenuKeyInLockScreen:Z

    iget v3, p2, Landroid/content/res/Configuration;->orientation:I

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCreationOrientation:I

    iget v3, p2, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    new-instance v0, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .local v0, bgView:Landroid/widget/ImageView;
    const v3, 0x60200a2

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v7, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x602008a

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v7, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .local v1, inflater:Landroid/view/LayoutInflater;
    const v3, 0x603003b

    invoke-virtual {v1, v3, p0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const v3, 0x60b002c

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSelected(Z)V

    const v3, 0x60b002d

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const v3, 0x60b002e

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    new-instance v4, Lcom/android/internal/policy/impl/MiuiLockScreen$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$1;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x60b002f

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    new-instance v4, Lcom/android/internal/policy/impl/MiuiLockScreen$2;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$2;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    const v3, 0x6030017

    invoke-virtual {v1, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mTimeView:Landroid/view/View;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v4, 0x6030016

    invoke-static {v3, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHintView:Landroid/view/View;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v4, 0x6040004

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mFadeoutAnim:Landroid/view/animation/Animation;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupSlidingPanel()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupBatteryInfo()V

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, p0, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    invoke-direct {v3, v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, p0, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-direct {v3, v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setFocusable(Z)V

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setFocusableInTouchMode(Z)V

    const/high16 v3, 0x6

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setDescendantFocusability(I)V

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setChildrenDrawnWithCacheEnabled(Z)V

    invoke-virtual {p4, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    invoke-virtual {p4, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    invoke-direct {p0, p4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V

    new-instance v2, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .local v2, statusBarBg:Landroid/widget/ImageView;
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const v3, 0x60200bd

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const/16 v5, 0x30

    invoke-direct {v3, v7, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const-string v4, "power"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    new-instance v3, Lmiui/util/HapticFeedbackUtil;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4, v6}, Lmiui/util/HapticFeedbackUtil;-><init>(Landroid/content/Context;Z)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->onPause()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/KeyguardScreenCallback;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z
    .registers 2
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/os/PowerManager;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/android/internal/policy/impl/MiuiLockScreen;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V

    return-void
.end method

.method static synthetic access$2100(Lcom/android/internal/policy/impl/MiuiLockScreen;)I
    .registers 2
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    return v0
.end method

.method static synthetic access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    return p1
.end method

.method static synthetic access$2200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z
    .registers 2
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    return v0
.end method

.method static synthetic access$2300(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/android/internal/policy/impl/MiuiLockScreen;)V
    .registers 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    return-void
.end method

.method static synthetic access$3200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lmiui/util/HapticFeedbackUtil;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private callAndSmsHandle(Landroid/widget/ListView;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;Landroid/view/View;)V
    .registers 7
    .parameter "previewList"
    .parameter "adapter"
    .parameter "controlView"

    .prologue
    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->isSecure()Z

    move-result v0

    if-nez v0, :cond_23

    invoke-virtual {p2}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->getCount()I

    move-result v0

    if-lez v0, :cond_23

    iput-object p2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->enableDefaultCount(Z)V

    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCurrentPreviewList:Landroid/widget/ListView;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->markReadDelayVibrate()V

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :goto_1f
    invoke-direct {p0, p3, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-void

    :cond_23
    invoke-virtual {p1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_1f
.end method

.method static getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 2
    .parameter "telephonyPlmn"
    .parameter "telephonySpn"

    .prologue
    if-eqz p0, :cond_3

    .end local p0
    :goto_2
    return-object p0

    .restart local p0
    :cond_3
    if-eqz p1, :cond_7

    move-object p0, p1

    goto :goto_2

    :cond_7
    const-string p0, ""

    goto :goto_2
.end method

.method private getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;
    .registers 5
    .parameter "simState"

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->isDeviceProvisioned()Z

    move-result v1

    if-nez v1, :cond_16

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->ABSENT:Lcom/android/internal/telephony/IccCard$State;

    if-ne p1, v1, :cond_16

    const/4 v0, 0x1

    .local v0, missingAndNotProvisioned:Z
    :goto_d
    if-nez v0, :cond_13

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->NETWORK_LOCKED:Lcom/android/internal/telephony/IccCard$State;

    if-ne p1, v1, :cond_18

    :cond_13
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissingLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    :goto_15
    return-object v1

    .end local v0           #missingAndNotProvisioned:Z
    :cond_16
    const/4 v0, 0x0

    goto :goto_d

    .restart local v0       #missingAndNotProvisioned:Z
    :cond_18
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$4;->$SwitchMap$com$android$internal$telephony$IccCard$State:[I

    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCard$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_38

    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_26
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_29
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_2c
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_2f
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_32
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->Normal:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_35
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_26
        :pswitch_29
        :pswitch_2c
        :pswitch_2f
        :pswitch_32
        :pswitch_35
    .end packed-switch
.end method

.method private markReadDelayVibrate()V
    .registers 5

    .prologue
    iget-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_18
    return-void
.end method

.method private noHandle()V
    .registers 9

    .prologue
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x7d0

    cmp-long v4, v4, v6

    if-lez v4, :cond_6c

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    if-eqz v4, :cond_6c

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCurrentPreviewList:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCurrentPreviewList:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCurrentPreviewList:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/lit8 v0, v4, 0x1

    .local v0, MAX_MARK_READ_COUNT:I
    add-int/lit8 v2, v0, -0x1

    .local v2, i:I
    :goto_2e
    if-ltz v2, :cond_3a

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->markRead(Landroid/content/Context;I)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_2e

    :cond_3a
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->enableDefaultCount(Z)V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    invoke-virtual {v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->getCount()I

    move-result v1

    .local v1, count:I
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.APPLICATION_MESSAGE_UPDATE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v3, intent:Landroid/content/Intent;
    const-string v5, "android.intent.extra.update_application_message_text"

    if-le v1, v0, :cond_74

    sub-int v4, v1, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    :goto_57
    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    if-ne v4, v5, :cond_76

    const-string v4, "android.intent.extra.update_application_component_name"

    const-string v5, "com.android.contacts/.TwelveKeyDialer"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_67
    :goto_67
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .end local v0           #MAX_MARK_READ_COUNT:I
    .end local v1           #count:I
    .end local v2           #i:I
    .end local v3           #intent:Landroid/content/Intent;
    :cond_6c
    const-wide v4, 0x7fffffffffffffffL

    iput-wide v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    return-void

    .restart local v0       #MAX_MARK_READ_COUNT:I
    .restart local v1       #count:I
    .restart local v2       #i:I
    .restart local v3       #intent:Landroid/content/Intent;
    :cond_74
    const/4 v4, 0x0

    goto :goto_57

    :cond_76
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    if-ne v4, v5, :cond_67

    const-string v4, "android.intent.extra.update_application_component_name"

    const-string v5, "com.android.mms/.ui.MmsTabActivity"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_67
.end method

.method private refreshBatteryStringAndIcon()V
    .registers 9

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v1, 0x0

    .local v1, info:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, backgroundId:I
    const v2, 0x60200a5

    .local v2, musicBatteryIndicatorId:I
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v3, :cond_21

    iget-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    if-eqz v3, :cond_53

    iget v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    const/16 v4, 0x64

    if-lt v3, v4, :cond_39

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x60c017f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x3

    :cond_21
    :goto_21
    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setBatteryInfo(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setBatteryLevel(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v3, v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->setBackgroundFor(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v3, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setBatteryIndicator(I)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    return-void

    :cond_39
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x60c017e

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x2

    const v2, 0x60200a4

    goto :goto_21

    :cond_53
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x60c0180

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x1

    const v2, 0x60200a6

    goto :goto_21
.end method

.method private resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V
    .registers 3
    .parameter "updateMonitor"

    .prologue
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->shouldShowBatteryInfo()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->isDevicePluggedIn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getBatteryLevel()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getSimState()Lcom/android/internal/telephony/IccCard$State;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    return-void
.end method

.method private setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 10
    .parameter "view"
    .parameter "params"

    .prologue
    if-eqz p1, :cond_3b

    const/4 v3, 0x0

    .local v3, useDefaultParams:Z
    if-nez p2, :cond_1a

    :try_start_5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object p2, v0

    if-nez p2, :cond_19

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    const/16 v6, 0x50

    invoke-direct {v1, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .end local p2
    .local v1, params:Landroid/view/ViewGroup$MarginLayoutParams;
    move-object p2, v1

    .end local v1           #params:Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local p2
    :cond_19
    const/4 v3, 0x1

    :cond_1a
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .local v2, parent:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    if-nez v3, :cond_3a

    :cond_30
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .end local v2           #parent:Landroid/view/ViewGroup;
    .end local v3           #useDefaultParams:Z
    :cond_3a
    :goto_3a
    return-void

    :cond_3b
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V
    :try_end_41
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_41} :catch_42

    goto :goto_3a

    :catch_42
    move-exception v4

    goto :goto_3a
.end method

.method private setupBatteryInfo()V
    .registers 4

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v1, 0x603000e

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    const v1, 0x60b0032

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfoText:Landroid/widget/TextView;

    return-void
.end method

.method private setupCallsPreviewList()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030010

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    const v2, 0x60b0030

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDrawingCacheEnabled(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x603000f

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .local v0, hint:Landroid/view/View;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method private setupSlidingPanel()V
    .registers 6

    .prologue
    new-instance v0, Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/internal/policy/impl/SlidingPanel;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    const/16 v4, 0x53

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mTimeView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->setTimeView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, p0}, Lcom/miui/internal/policy/impl/SlidingPanel;->setOnTriggerListener(Lcom/miui/internal/policy/impl/SlidingPanel$OnTriggerListener;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->getControlView()Landroid/widget/FrameLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    return-void
.end method

.method private setupSmsPreviewList()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030014

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    const v2, 0x60b0031

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDrawingCacheEnabled(Z)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030013

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .local v0, hint:Landroid/view/View;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method private shouldEnableMenuKey()Z
    .registers 8

    .prologue
    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .local v3, res:Landroid/content/res/Resources;
    const v5, 0x6090006

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .local v0, configDisabled:Z
    const-string v5, "ro.monkey"

    invoke-static {v5, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .local v2, isMonkey:Z
    new-instance v5, Ljava/io/File;

    const-string v6, "/data/local/enable_menu_key"

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v1

    .local v1, fileOverride:Z
    if-eqz v0, :cond_23

    if-nez v2, :cond_23

    if-eqz v1, :cond_24

    :cond_23
    const/4 v4, 0x1

    :cond_24
    return v4
.end method

.method private startCallsQuery()V
    .registers 10

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x35

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;->setLoading(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->cancelOperation(I)V

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v0, " type="

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .local v8, where:Ljava/lang/StringBuilder;
    const/4 v0, 0x3

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " AND new=1 "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    sget-object v3, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    sget-object v4, Lcom/android/internal/policy/impl/MiuiLockScreen;->CallLog_COLUMNS:[Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "date DESC"

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private startSmsQuery()V
    .registers 9

    .prologue
    const/16 v1, 0x35

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->setLoading(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->cancelOperation(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    sget-object v3, Lmiui/provider/ExtraTelephony$MmsSms;->CONTENT_PREVIEW_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private updateBackground()V
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    .local v0, backgroundStatus:I
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isMusicControlVisible()Z

    move-result v1

    .local v1, isMusicControlVisible:Z
    if-eqz v1, :cond_13

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isAlbumShow()Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$200(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Z

    move-result v3

    if-eqz v3, :cond_17

    const/4 v0, 0x2

    :cond_13
    :goto_13
    packed-switch v0, :pswitch_data_48

    :cond_16
    :goto_16
    return-void

    :cond_17
    const/4 v0, 0x3

    goto :goto_13

    :pswitch_19
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x60200a7

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_16

    :pswitch_27
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x602008a

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v4, :cond_44

    :goto_35
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    if-nez v2, :cond_16

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v2, :cond_16

    const/4 v2, 0x5

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    goto :goto_16

    :cond_44
    const/16 v2, 0x8

    goto :goto_35

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_27
        :pswitch_27
        :pswitch_19
        :pswitch_19
    .end packed-switch
.end method

.method private updateControlView()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isMusicStatusNone()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    :cond_11
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->shouldShowMusic()Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->showAlbum()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$300(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    :goto_22
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->clearAnimation()V

    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    packed-switch v0, :pswitch_data_6c

    invoke-direct {p0, v2, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    :goto_2f
    return-void

    :cond_30
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V

    goto :goto_22

    :pswitch_34
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->getMusicControl()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    :pswitch_3e
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    if-nez v0, :cond_45

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupSmsPreviewList()V

    :cond_45
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->callAndSmsHandle(Landroid/widget/ListView;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;Landroid/view/View;)V

    goto :goto_2f

    :pswitch_4f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    if-nez v0, :cond_56

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupCallsPreviewList()V

    :cond_56
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->callAndSmsHandle(Landroid/widget/ListView;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;Landroid/view/View;)V

    goto :goto_2f

    :pswitch_60
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHintView:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    :pswitch_66
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_4f
        :pswitch_3e
        :pswitch_60
        :pswitch_34
        :pswitch_66
    .end packed-switch
.end method

.method private updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V
    .registers 10
    .parameter "status"

    .prologue
    const v7, 0x60c0182

    const v3, 0x60c0181

    const/4 v6, 0x4

    const/16 v5, 0x8

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen$4;->$SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status:[I

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_152

    :goto_1f
    return-void

    :pswitch_20
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonyPlmn()Ljava/lang/CharSequence;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonySpn()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1f

    :pswitch_51
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonyPlmn()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x60c0183

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const v1, 0x60c0187

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1f

    :pswitch_88
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_1f

    :pswitch_a8
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonyPlmn()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v5}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1f

    :pswitch_df
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonyPlmn()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x60c0186

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_1f

    :pswitch_10f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getTelephonyPlmn()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x60c0184

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const v1, 0x60c0185

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v5}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1f

    nop

    :pswitch_data_152
    .packed-switch 0x1
        :pswitch_20
        :pswitch_51
        :pswitch_88
        :pswitch_a8
        :pswitch_df
        :pswitch_10f
    .end packed-switch
.end method


# virtual methods
.method public cleanUp()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v0, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->closeCursor()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->closeCursor()V

    return-void
.end method

.method public needsInput()Z
    .registers 2

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateConfiguration()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->registerPlayerStatusListener()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->startCallsQuery()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->startSmsQuery()V

    return-void
.end method

.method public onClockVisibilityChanged()V
    .registers 1

    .prologue
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2
    .parameter "newConfig"

    .prologue
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateConfiguration()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->unregisterPlayerStatusListener()V

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onDevicePolicyManagerStateChanged()V
    .registers 1

    .prologue
    return-void
.end method

.method public onDeviceProvisioned()V
    .registers 1

    .prologue
    return-void
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .registers 6
    .parameter "v"
    .parameter "grabbedState"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    if-ne p1, v0, :cond_1a

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    :cond_17
    packed-switch p2, :pswitch_data_90

    :cond_1a
    :goto_1a
    :pswitch_1a
    return-void

    :pswitch_1b
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    :pswitch_27
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    :pswitch_33
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->toggleMusicControl()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateSpectrumVisualizer()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$100(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    goto :goto_1a

    :pswitch_43
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    :pswitch_4f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    iput v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_6f

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->clearAnimation()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mFadeoutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_6f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    goto :goto_1a

    :pswitch_7c
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->noHandle()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->addCheckStreamCallbacks()V

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_7c
        :pswitch_1b
        :pswitch_27
        :pswitch_43
        :pswitch_1a
        :pswitch_4f
        :pswitch_33
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/16 v0, 0x52

    if-ne p1, v0, :cond_14

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEnableMenuKeyInLockScreen:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    const-string v0, "MiuiLockScreen"

    const-string v1, "Unlock Screen by pressing menu"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->onPause()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->onPause()V

    return-void
.end method

.method public onPhoneStateChanged(I)V
    .registers 5
    .parameter "newState"

    .prologue
    sget-object v0, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->clearBatteryAnimations()V

    :cond_15
    :goto_15
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/internal/widget/LockPatternUtils;->updateEmergencyCallButtonState(Landroid/widget/Button;IZ)V

    return-void

    :cond_1e
    sget-object v0, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_15

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    goto :goto_15
.end method

.method public onRefreshBatteryInfo(ZZI)V
    .registers 4
    .parameter "showBatteryInfo"
    .parameter "pluggedIn"
    .parameter "batteryLevel"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    iput-boolean p2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    iput p3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    return-void
.end method

.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 4
    .parameter "plmn"
    .parameter "spn"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V

    return-void
.end method

.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V
    .registers 4
    .parameter "plmn"
    .parameter "spn"
    .parameter "subscription"

    .prologue
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->onResume()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->onResume()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    return-void
.end method

.method public onRingerModeChanged(I)V
    .registers 2
    .parameter "state"

    .prologue
    return-void
.end method

.method public onSimStateChanged(Lcom/android/internal/telephony/IccCard$State;)V
    .registers 5
    .parameter "simState"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    const-string v0, "LockScreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "current status is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", and prev status is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/internal/policy/impl/MiuiLockScreen;->sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    if-ne v0, v1, :cond_48

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    if-eq v0, v1, :cond_48

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    :goto_43
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sput-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    return-void

    :cond_48
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V

    goto :goto_43
.end method

.method public onSimStateChanged(Lcom/android/internal/telephony/IccCard$State;I)V
    .registers 3
    .parameter "simState"
    .parameter "subscription"

    .prologue
    return-void
.end method

.method public onTimeChanged()V
    .registers 1

    .prologue
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .registers 12
    .parameter "v"
    .parameter "whichHandle"

    .prologue
    const/high16 v8, 0x3400

    const/4 v7, 0x1

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    if-ne p1, v5, :cond_27

    if-ne p2, v7, :cond_28

    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v1, dialIntent:Landroid/content/Intent;
    const-string v5, "vnd.android.cursor.dir/calls"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "android.intent.category.DEFAULT"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5, v1}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .end local v1           #dialIntent:Landroid/content/Intent;
    :cond_27
    :goto_27
    return-void

    :cond_28
    const/4 v5, 0x3

    if-ne p2, v5, :cond_37

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    goto :goto_27

    :cond_37
    const/4 v5, 0x2

    if-ne p2, v5, :cond_27

    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v3, smsIntent:Landroid/content/Intent;
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .local v4, threadIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5, v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->enableDefaultCount(Z)V

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getCount()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .local v2, i:I
    :goto_53
    if-ltz v2, :cond_6e

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .local v0, c:Landroid/database/Cursor;
    if-eqz v0, :cond_6b

    const/4 v5, 0x6

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_6b
    add-int/lit8 v2, v2, -0x1

    goto :goto_53

    .end local v0           #c:Landroid/database/Cursor;
    :cond_6e
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v5

    if-ne v5, v7, :cond_8d

    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v6, "thread_id"

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/Serializable;

    invoke-virtual {v3, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v5, "view_conversation"

    invoke-virtual {v3, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_8d
    const-string v5, "vnd.android-dir/mms-sms"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "android.intent.category.DEFAULT"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v3, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5, v3}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    goto :goto_27
.end method

.method public onUserChanged(I)V
    .registers 2
    .parameter "userId"

    .prologue
    return-void
.end method

.method public setBatteryInfo(Ljava/lang/String;)V
    .registers 3
    .parameter "info"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfoText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method updateConfiguration()V
    .registers 5

    .prologue
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .local v1, newConfig:Landroid/content/res/Configuration;
    iget v2, v1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iget v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    if-eq v2, v3, :cond_1e

    iget v2, v1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    iget v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    if-ne v2, v0, :cond_1f

    .local v0, isKeyboardOpen:Z
    :goto_17
    if-eqz v0, :cond_1e

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v2}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .end local v0           #isKeyboardOpen:Z
    :cond_1e
    return-void

    :cond_1f
    const/4 v0, 0x0

    goto :goto_17
.end method
