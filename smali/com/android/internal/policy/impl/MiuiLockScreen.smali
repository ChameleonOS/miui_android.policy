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
    .line 1182
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

    .line 264
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 122
    sget-object v3, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->Normal:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    .line 168
    const-wide v3, 0x7fffffffffffffffL

    iput-wide v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    .line 175
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    .line 178
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    .line 181
    const/16 v3, 0x64

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    .line 184
    iput-boolean v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    .line 1433
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$3;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$3;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    .line 265
    iput-object p3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 266
    iput-object p4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    .line 267
    iput-object p5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    .line 269
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->shouldEnableMenuKey()Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEnableMenuKeyInLockScreen:Z

    .line 271
    iget v3, p2, Landroid/content/res/Configuration;->orientation:I

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCreationOrientation:I

    .line 272
    iget v3, p2, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iput v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    .line 274
    new-instance v0, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 275
    .local v0, bgView:Landroid/widget/ImageView;
    const v3, 0x60200a2

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 276
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 277
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v7, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 282
    new-instance v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    .line 283
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x602008a

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 284
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 285
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 286
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v7, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 292
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v3, 0x6030004

    invoke-virtual {v1, v3, p0, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 294
    const v3, 0x60b002c

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    .line 296
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSelected(Z)V

    .line 298
    const v3, 0x60b002d

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    .line 300
    const v3, 0x60b002e

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    .line 303
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    .line 304
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    new-instance v4, Lcom/android/internal/policy/impl/MiuiLockScreen$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$1;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    const v3, 0x60b002f

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    .line 311
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    new-instance v4, Lcom/android/internal/policy/impl/MiuiLockScreen$2;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$2;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 318
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-direct {v3, p0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    .line 321
    const v3, 0x6030017

    invoke-virtual {v1, v3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mTimeView:Landroid/view/View;

    .line 322
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v4, 0x6030016

    invoke-static {v3, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHintView:Landroid/view/View;

    .line 324
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v4, 0x6040004

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mFadeoutAnim:Landroid/view/animation/Animation;

    .line 325
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupSlidingPanel()V

    .line 326
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupBatteryInfo()V

    .line 328
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, p0, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    .line 329
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    invoke-direct {v3, v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    .line 331
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, p0, v4, v8}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;-><init>(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/content/Context;Landroid/database/Cursor;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    .line 332
    new-instance v3, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-direct {v3, v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    .line 334
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setFocusable(Z)V

    .line 335
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setFocusableInTouchMode(Z)V

    .line 336
    const/high16 v3, 0x6

    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setDescendantFocusability(I)V

    .line 337
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 339
    invoke-virtual {p4, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerInfoCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$InfoCallback;)V

    .line 340
    invoke-virtual {p4, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->registerSimStateCallback(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$SimStateCallback;)V

    .line 341
    invoke-direct {p0, p4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V

    .line 343
    new-instance v2, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 344
    .local v2, statusBarBg:Landroid/widget/ImageView;
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 345
    const v3, 0x60200bd

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 346
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const/16 v5, 0x30

    invoke-direct {v3, v7, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const-string v4, "power"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    .line 352
    new-instance v3, Lmiui/util/HapticFeedbackUtil;

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4, v6}, Lmiui/util/HapticFeedbackUtil;-><init>(Landroid/content/Context;Z)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    .line 354
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->onPause()V

    .line 355
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/KeyguardScreenCallback;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/os/PowerManager;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/android/internal/policy/impl/MiuiLockScreen;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V

    return-void
.end method

.method static synthetic access$2100(Lcom/android/internal/policy/impl/MiuiLockScreen;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    return v0
.end method

.method static synthetic access$2102(Lcom/android/internal/policy/impl/MiuiLockScreen;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 113
    iput p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    return p1
.end method

.method static synthetic access$2200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    return v0
.end method

.method static synthetic access$2300(Lcom/android/internal/policy/impl/MiuiLockScreen;Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/android/internal/policy/impl/MiuiLockScreen;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    return-void
.end method

.method static synthetic access$3200(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lcom/miui/internal/policy/impl/SlidingPanel;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/MiuiLockScreen;)Lmiui/util/HapticFeedbackUtil;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHapticFeedbackUtil:Lmiui/util/HapticFeedbackUtil;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/internal/policy/impl/MiuiLockScreen;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 113
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

    .line 490
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->isSecure()Z

    move-result v0

    if-nez v0, :cond_23

    invoke-virtual {p2}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->getCount()I

    move-result v0

    if-lez v0, :cond_23

    .line 491
    iput-object p2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    .line 492
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->enableDefaultCount(Z)V

    .line 493
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCurrentPreviewList:Landroid/widget/ListView;

    .line 494
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->markReadDelayVibrate()V

    .line 495
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 500
    :goto_1f
    invoke-direct {p0, p3, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 501
    return-void

    .line 497
    :cond_23
    invoke-virtual {p1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_1f
.end method

.method static getCarrierString(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 2
    .parameter "telephonyPlmn"
    .parameter "telephonySpn"

    .prologue
    .line 817
    if-eqz p0, :cond_3

    .line 822
    .end local p0
    :goto_2
    return-object p0

    .line 819
    .restart local p0
    :cond_3
    if-eqz p1, :cond_7

    move-object p0, p1

    .line 820
    goto :goto_2

    .line 822
    :cond_7
    const-string p0, ""

    goto :goto_2
.end method

.method private getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;
    .registers 5
    .parameter "simState"

    .prologue
    .line 692
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->isDeviceProvisioned()Z

    move-result v1

    if-nez v1, :cond_16

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->ABSENT:Lcom/android/internal/telephony/IccCard$State;

    if-ne p1, v1, :cond_16

    const/4 v0, 0x1

    .line 694
    .local v0, missingAndNotProvisioned:Z
    :goto_d
    if-nez v0, :cond_13

    sget-object v1, Lcom/android/internal/telephony/IccCard$State;->NETWORK_LOCKED:Lcom/android/internal/telephony/IccCard$State;

    if-ne p1, v1, :cond_18

    .line 695
    :cond_13
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissingLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    .line 712
    :goto_15
    return-object v1

    .line 692
    .end local v0           #missingAndNotProvisioned:Z
    :cond_16
    const/4 v0, 0x0

    goto :goto_d

    .line 698
    .restart local v0       #missingAndNotProvisioned:Z
    :cond_18
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$4;->$SwitchMap$com$android$internal$telephony$IccCard$State:[I

    invoke-virtual {p1}, Lcom/android/internal/telephony/IccCard$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_38

    .line 712
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 700
    :pswitch_26
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 702
    :pswitch_29
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 704
    :pswitch_2c
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 706
    :pswitch_2f
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 708
    :pswitch_32
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->Normal:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 710
    :pswitch_35
    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimMissing:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    goto :goto_15

    .line 698
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
    .line 482
    iget-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    .line 483
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    .line 484
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 486
    :cond_18
    return-void
.end method

.method private noHandle()V
    .registers 9

    .prologue
    .line 507
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    invoke-virtual {p0, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 508
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x7d0

    cmp-long v4, v4, v6

    if-lez v4, :cond_6c

    .line 509
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    if-eqz v4, :cond_6c

    .line 513
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

    .line 516
    .local v0, MAX_MARK_READ_COUNT:I
    add-int/lit8 v2, v0, -0x1

    .local v2, i:I
    :goto_2e
    if-ltz v2, :cond_3a

    .line 517
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->markRead(Landroid/content/Context;I)V

    .line 516
    add-int/lit8 v2, v2, -0x1

    goto :goto_2e

    .line 519
    :cond_3a
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->enableDefaultCount(Z)V

    .line 520
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    invoke-virtual {v4}, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;->getCount()I

    move-result v1

    .line 521
    .local v1, count:I
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.APPLICATION_MESSAGE_UPDATE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 522
    .local v3, intent:Landroid/content/Intent;
    const-string v5, "android.intent.extra.update_application_message_text"

    if-le v1, v0, :cond_74

    sub-int v4, v1, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    :goto_57
    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 527
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    if-ne v4, v5, :cond_76

    .line 528
    const-string v4, "android.intent.extra.update_application_component_name"

    const-string v5, "com.android.contacts/.TwelveKeyDialer"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 539
    :cond_67
    :goto_67
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 542
    .end local v0           #MAX_MARK_READ_COUNT:I
    .end local v1           #count:I
    .end local v2           #i:I
    .end local v3           #intent:Landroid/content/Intent;
    :cond_6c
    const-wide v4, 0x7fffffffffffffffL

    iput-wide v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    .line 543
    return-void

    .line 522
    .restart local v0       #MAX_MARK_READ_COUNT:I
    .restart local v1       #count:I
    .restart local v2       #i:I
    .restart local v3       #intent:Landroid/content/Intent;
    :cond_74
    const/4 v4, 0x0

    goto :goto_57

    .line 532
    :cond_76
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    if-ne v4, v5, :cond_67

    .line 533
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

    .line 649
    const/4 v1, 0x0

    .line 650
    .local v1, info:Ljava/lang/String;
    const/4 v0, 0x0

    .line 651
    .local v0, backgroundId:I
    const v2, 0x60200a5

    .line 653
    .local v2, musicBatteryIndicatorId:I
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v3, :cond_21

    .line 654
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    if-eqz v3, :cond_53

    .line 655
    iget v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    const/16 v4, 0x64

    if-lt v3, v4, :cond_39

    .line 656
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x60c017f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 657
    const/4 v0, 0x3

    .line 670
    :cond_21
    :goto_21
    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setBatteryInfo(Ljava/lang/String;)V

    .line 671
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    invoke-virtual {v3, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setBatteryLevel(I)V

    .line 672
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v3, v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->setBackgroundFor(I)V

    .line 673
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v3, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->setBatteryIndicator(I)V

    .line 674
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    .line 675
    return-void

    .line 659
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

    .line 660
    const/4 v0, 0x2

    .line 661
    const v2, 0x60200a4

    goto :goto_21

    .line 664
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

    .line 665
    const/4 v0, 0x1

    .line 666
    const v2, 0x60200a6

    goto :goto_21
.end method

.method private resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V
    .registers 3
    .parameter "updateMonitor"

    .prologue
    .line 409
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->shouldShowBatteryInfo()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    .line 410
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->isDevicePluggedIn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    .line 411
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getBatteryLevel()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    .line 413
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->getSimState()Lcom/android/internal/telephony/IccCard$State;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    .line 414
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V

    .line 416
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    .line 418
    return-void
.end method

.method private setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 10
    .parameter "view"
    .parameter "params"

    .prologue
    .line 1016
    if-eqz p1, :cond_3b

    .line 1017
    const/4 v3, 0x0

    .line 1018
    .local v3, useDefaultParams:Z
    if-nez p2, :cond_1a

    .line 1019
    :try_start_5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object p2, v0

    .line 1020
    if-nez p2, :cond_19

    .line 1021
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    const/16 v6, 0x50

    invoke-direct {v1, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .end local p2
    .local v1, params:Landroid/view/ViewGroup$MarginLayoutParams;
    move-object p2, v1

    .line 1024
    .end local v1           #params:Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local p2
    :cond_19
    const/4 v3, 0x1

    .line 1026
    :cond_1a
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 1027
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 1028
    .local v2, parent:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    if-nez v3, :cond_3a

    .line 1029
    :cond_30
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 1030
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v4, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1040
    .end local v2           #parent:Landroid/view/ViewGroup;
    .end local v3           #useDefaultParams:Z
    :cond_3a
    :goto_3a
    return-void

    .line 1034
    :cond_3b
    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setVisibility(I)V
    :try_end_41
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_41} :catch_42

    goto :goto_3a

    .line 1037
    :catch_42
    move-exception v4

    goto :goto_3a
.end method

.method private setupBatteryInfo()V
    .registers 4

    .prologue
    .line 400
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v1, 0x603000e

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    .line 401
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    const v1, 0x60b0032

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfoText:Landroid/widget/TextView;

    .line 402
    return-void
.end method

.method private setupCallsPreviewList()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 378
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030010

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    .line 379
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    const v2, 0x60b0030

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    .line 380
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 381
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 382
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDrawingCacheEnabled(Z)V

    .line 383
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x603000f

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 384
    .local v0, hint:Landroid/view/View;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 385
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 386
    return-void
.end method

.method private setupSlidingPanel()V
    .registers 6

    .prologue
    .line 366
    new-instance v0, Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/internal/policy/impl/SlidingPanel;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    .line 367
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    const/16 v4, 0x53

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mTimeView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/policy/impl/SlidingPanel;->setTimeView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 373
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, p0}, Lcom/miui/internal/policy/impl/SlidingPanel;->setOnTriggerListener(Lcom/miui/internal/policy/impl/SlidingPanel$OnTriggerListener;)V

    .line 374
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->getControlView()Landroid/widget/FrameLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    .line 375
    return-void
.end method

.method private setupSmsPreviewList()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 389
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030014

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    .line 390
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    const v2, 0x60b0031

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    .line 391
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 392
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 393
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDrawingCacheEnabled(Z)V

    .line 394
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mContext:Landroid/content/Context;

    const v2, 0x6030013

    invoke-static {v1, v2, v4}, Lcom/android/internal/policy/impl/MiuiLockScreen;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 395
    .local v0, hint:Landroid/view/View;
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 396
    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 397
    return-void
.end method

.method private shouldEnableMenuKey()Z
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 246
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 247
    .local v3, res:Landroid/content/res/Resources;
    const v5, 0x6090006

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 248
    .local v0, configDisabled:Z
    const-string v5, "ro.monkey"

    invoke-static {v5, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 249
    .local v2, isMonkey:Z
    new-instance v5, Ljava/io/File;

    const-string v6, "/data/local/enable_menu_key"

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v1

    .line 250
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

    .line 619
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;->setLoading(Z)V

    .line 621
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->cancelOperation(I)V

    .line 622
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v0, " type="

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 623
    .local v8, where:Ljava/lang/StringBuilder;
    const/4 v0, 0x3

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 624
    const-string v0, " AND new=1 "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    sget-object v3, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    sget-object v4, Lcom/android/internal/policy/impl/MiuiLockScreen;->CallLog_COLUMNS:[Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "date DESC"

    move-object v6, v2

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    return-void
.end method

.method private startSmsQuery()V
    .registers 9

    .prologue
    const/16 v1, 0x35

    const/4 v2, 0x0

    .line 630
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->setLoading(Z)V

    .line 632
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->cancelOperation(I)V

    .line 633
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    sget-object v3, Lmiui/provider/ExtraTelephony$MmsSms;->CONTENT_PREVIEW_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    return-void
.end method

.method private updateBackground()V
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 930
    const/4 v0, 0x1

    .line 934
    .local v0, backgroundStatus:I
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isMusicControlVisible()Z

    move-result v1

    .line 935
    .local v1, isMusicControlVisible:Z
    if-eqz v1, :cond_13

    .line 936
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isAlbumShow()Z
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$200(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 937
    const/4 v0, 0x2

    .line 942
    :cond_13
    :goto_13
    packed-switch v0, :pswitch_data_48

    .line 959
    :cond_16
    :goto_16
    return-void

    .line 939
    :cond_17
    const/4 v0, 0x3

    goto :goto_13

    .line 945
    :pswitch_19
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x60200a7

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 946
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_16

    .line 950
    :pswitch_27
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    const v4, 0x602008a

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 951
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBackgroundMask:Landroid/widget/ImageView;

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v4, :cond_44

    :goto_35
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 952
    iget v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    if-nez v2, :cond_16

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    if-eqz v2, :cond_16

    .line 953
    const/4 v2, 0x5

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    goto :goto_16

    .line 951
    :cond_44
    const/16 v2, 0x8

    goto :goto_35

    .line 942
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

    .line 970
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->isMusicStatusNone()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 971
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 974
    :cond_11
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->shouldShowMusic()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 975
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->showAlbum()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$300(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    .line 979
    :goto_22
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->clearAnimation()V

    .line 981
    iget v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    packed-switch v0, :pswitch_data_6c

    .line 1008
    invoke-direct {p0, v2, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1012
    :goto_2f
    return-void

    .line 977
    :cond_30
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateBackground()V

    goto :goto_22

    .line 983
    :pswitch_34
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->getMusicControl()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    .line 987
    :pswitch_3e
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    if-nez v0, :cond_45

    .line 988
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupSmsPreviewList()V

    .line 990
    :cond_45
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsControlView:Landroid/view/View;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->callAndSmsHandle(Landroid/widget/ListView;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;Landroid/view/View;)V

    goto :goto_2f

    .line 994
    :pswitch_4f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    if-nez v0, :cond_56

    .line 995
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setupCallsPreviewList()V

    .line 997
    :cond_56
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsPreviewList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$CallLogPreviewListAdapter;

    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsControlView:Landroid/view/View;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->callAndSmsHandle(Landroid/widget/ListView;Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;Landroid/view/View;)V

    goto :goto_2f

    .line 1001
    :pswitch_60
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mHintView:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    .line 1004
    :pswitch_66
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfo:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen;->setControlView(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_2f

    .line 981
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

    .line 722
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 723
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 725
    sget-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen$4;->$SwitchMap$com$android$internal$policy$impl$MiuiLockScreen$Status:[I

    invoke-virtual {p1}, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_152

    .line 814
    :goto_1f
    return-void

    .line 728
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

    .line 734
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 737
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 738
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 739
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 740
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1f

    .line 745
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

    .line 749
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const v1, 0x60c0187

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 752
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 753
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 754
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 755
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_1f

    .line 759
    :pswitch_88
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 760
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(I)V

    .line 763
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 764
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 765
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 766
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_1f

    .line 771
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

    .line 775
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(I)V

    .line 778
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 779
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 780
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v5}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 781
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 782
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1f

    .line 786
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

    .line 792
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 793
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 794
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v4}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 795
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_1f

    .line 799
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

    .line 803
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    const v1, 0x60c0185

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 806
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCarrier:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 807
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mScreenLocked:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 808
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0, v5}, Lcom/miui/internal/policy/impl/SlidingPanel;->setVisibility(I)V

    .line 809
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 810
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCall:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 811
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUnlockIccCard:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1f

    .line 725
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

    .line 901
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-virtual {v0, p0}, Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;->removeCallback(Ljava/lang/Object;)V

    .line 902
    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 903
    iput-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    .line 904
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->closeCursor()V

    .line 905
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsHandler:Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$QueryHandler;->closeCursor()V

    .line 906
    return-void
.end method

.method public needsInput()Z
    .registers 2

    .prologue
    .line 878
    const/4 v0, 0x0

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 852
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 853
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateConfiguration()V

    .line 856
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->registerPlayerStatusListener()V

    .line 859
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->startCallsQuery()V

    .line 860
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->startSmsQuery()V

    .line 861
    return-void
.end method

.method public onClockVisibilityChanged()V
    .registers 1

    .prologue
    .line 363
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2
    .parameter "newConfig"

    .prologue
    .line 872
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 873
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateConfiguration()V

    .line 874
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 865
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->unregisterPlayerStatusListener()V

    .line 866
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 867
    return-void
.end method

.method public onDevicePolicyManagerStateChanged()V
    .registers 1

    .prologue
    .line 2114
    return-void
.end method

.method public onDeviceProvisioned()V
    .registers 1

    .prologue
    .line 359
    return-void
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .registers 6
    .parameter "v"
    .parameter "grabbedState"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 547
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    if-ne p1, v0, :cond_1a

    .line 554
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 555
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock()V

    .line 558
    :cond_17
    packed-switch p2, :pswitch_data_90

    .line 616
    :cond_1a
    :goto_1a
    :pswitch_1a
    return-void

    .line 561
    :pswitch_1b
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 562
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    .line 563
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    .line 568
    :pswitch_27
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 569
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    .line 570
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    .line 574
    :pswitch_33
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->toggleMusicControl()V

    .line 575
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    .line 576
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    #calls: Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->updateSpectrumVisualizer()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->access$100(Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;)V

    goto :goto_1a

    .line 580
    :pswitch_43
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 581
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    .line 582
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    .line 586
    :pswitch_4f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->removeCheckStreamCallbacks()V

    .line 587
    iput v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 588
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_6f

    .line 589
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 590
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->clearAnimation()V

    .line 591
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mFadeoutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 594
    :cond_6f
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sLongPressVibration:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 595
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLastGrabTime:J

    goto :goto_1a

    .line 600
    :pswitch_7c
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->noHandle()V

    .line 601
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->addCheckStreamCallbacks()V

    .line 603
    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlViewType:I

    .line 604
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mControlView:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 605
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    goto :goto_1a

    .line 558
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
    .line 422
    const/16 v0, 0x52

    if-ne p1, v0, :cond_14

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEnableMenuKeyInLockScreen:Z

    if-eqz v0, :cond_14

    .line 423
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 424
    const-string v0, "MiuiLockScreen"

    const-string v1, "Unlock Screen by pressing menu"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 883
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    .line 884
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->onPause()V

    .line 885
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->onPause()V

    .line 886
    return-void
.end method

.method public onPhoneStateChanged(I)V
    .registers 5
    .parameter "newState"

    .prologue
    .line 916
    sget-object v0, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_1e

    .line 917
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->clearBatteryAnimations()V

    .line 921
    :cond_15
    :goto_15
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    iget-object v1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mEmergencyCallText:Landroid/widget/Button;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/internal/widget/LockPatternUtils;->updateEmergencyCallButtonState(Landroid/widget/Button;IZ)V

    .line 922
    return-void

    .line 918
    :cond_1e
    sget-object v0, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    if-nez v0, :cond_15

    .line 919
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    goto :goto_15
.end method

.method public onRefreshBatteryInfo(ZZI)V
    .registers 4
    .parameter "showBatteryInfo"
    .parameter "pluggedIn"
    .parameter "batteryLevel"

    .prologue
    .line 641
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mShowingBatteryInfo:Z

    .line 642
    iput-boolean p2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mPluggedIn:Z

    .line 643
    iput p3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryLevel:I

    .line 645
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->refreshBatteryStringAndIcon()V

    .line 646
    return-void
.end method

.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 4
    .parameter "plmn"
    .parameter "spn"

    .prologue
    .line 685
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateLayout(Lcom/android/internal/policy/impl/MiuiLockScreen$Status;)V

    .line 686
    return-void
.end method

.method public onRefreshCarrierInfo(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)V
    .registers 4
    .parameter "plmn"
    .parameter "spn"
    .parameter "subscription"

    .prologue
    .line 2104
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 890
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mMusicController:Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiLockScreen$MusicController;->onResume()V

    .line 892
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mUpdateMonitor:Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->resetStatusInfo(Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;)V

    .line 894
    invoke-direct {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->updateControlView()V

    .line 895
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    invoke-virtual {v0}, Lcom/miui/internal/policy/impl/SlidingPanel;->onResume()V

    .line 896
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->isPaused:Z

    .line 897
    return-void
.end method

.method public onRingerModeChanged(I)V
    .registers 2
    .parameter "state"

    .prologue
    .line 911
    return-void
.end method

.method public onSimStateChanged(Lcom/android/internal/telephony/IccCard$State;)V
    .registers 5
    .parameter "simState"

    .prologue
    .line 828
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getCurrentStatus(Lcom/android/internal/telephony/IccCard$State;)Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    .line 829
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

    .line 830
    sget-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    if-ne v0, v1, :cond_48

    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sget-object v1, Lcom/android/internal/policy/impl/MiuiLockScreen$Status;->SimPukLocked:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    if-eq v0, v1, :cond_48

    .line 831
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    .line 832
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v0}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 836
    :goto_43
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    sput-object v0, Lcom/android/internal/policy/impl/MiuiLockScreen;->sPrevStatus:Lcom/android/internal/policy/impl/MiuiLockScreen$Status;

    .line 837
    return-void

    .line 834
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
    .line 2108
    return-void
.end method

.method public onTimeChanged()V
    .registers 1

    .prologue
    .line 680
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .registers 12
    .parameter "v"
    .parameter "whichHandle"

    .prologue
    const/high16 v8, 0x3400

    const/4 v7, 0x1

    .line 431
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSelector:Lcom/miui/internal/policy/impl/SlidingPanel;

    if-ne p1, v5, :cond_27

    .line 432
    if-ne p2, v7, :cond_28

    .line 434
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 435
    .local v1, dialIntent:Landroid/content/Intent;
    const-string v5, "vnd.android.cursor.dir/calls"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 436
    const-string v5, "android.intent.category.DEFAULT"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 437
    invoke-virtual {v1, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 440
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5, v1}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    .line 441
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 475
    .end local v1           #dialIntent:Landroid/content/Intent;
    :cond_27
    :goto_27
    return-void

    .line 442
    :cond_28
    const/4 v5, 0x3

    if-ne p2, v5, :cond_37

    .line 443
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    .line 444
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    goto :goto_27

    .line 445
    :cond_37
    const/4 v5, 0x2

    if-ne p2, v5, :cond_27

    .line 447
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 450
    .local v3, smsIntent:Landroid/content/Intent;
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 451
    .local v4, threadIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5, v7}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->enableDefaultCount(Z)V

    .line 452
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getCount()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .local v2, i:I
    :goto_53
    if-ltz v2, :cond_6e

    .line 453
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mSmsAdapter:Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;

    invoke-virtual {v5, v2}, Lcom/android/internal/policy/impl/MiuiLockScreen$SmsPreviewListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 454
    .local v0, c:Landroid/database/Cursor;
    if-eqz v0, :cond_6b

    .line 455
    const/4 v5, 0x6

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 452
    :cond_6b
    add-int/lit8 v2, v2, -0x1

    goto :goto_53

    .line 460
    .end local v0           #c:Landroid/database/Cursor;
    :cond_6e
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v5

    if-ne v5, v7, :cond_8d

    .line 461
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 462
    const-string v6, "thread_id"

    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/Serializable;

    invoke-virtual {v3, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 463
    const-string v5, "view_conversation"

    invoke-virtual {v3, v5, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 466
    :cond_8d
    const-string v5, "vnd.android-dir/mms-sms"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 467
    const-string v5, "android.intent.category.DEFAULT"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 468
    invoke-virtual {v3, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 471
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5, v3}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->setPendingIntent(Landroid/content/Intent;)V

    .line 472
    iget-object v5, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v5}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    goto :goto_27
.end method

.method public onUserChanged(I)V
    .registers 2
    .parameter "userId"

    .prologue
    .line 2120
    return-void
.end method

.method public setBatteryInfo(Ljava/lang/String;)V
    .registers 3
    .parameter "info"

    .prologue
    .line 405
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mBatteryInfoText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    return-void
.end method

.method updateConfiguration()V
    .registers 5

    .prologue
    const/4 v0, 0x1

    .line 840
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/MiuiLockScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 841
    .local v1, newConfig:Landroid/content/res/Configuration;
    iget v2, v1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iget v3, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    if-eq v2, v3, :cond_1e

    .line 842
    iget v2, v1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    iput v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    .line 843
    iget v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mKeyboardHidden:I

    if-ne v2, v0, :cond_1f

    .line 844
    .local v0, isKeyboardOpen:Z
    :goto_17
    if-eqz v0, :cond_1e

    .line 845
    iget-object v2, p0, Lcom/android/internal/policy/impl/MiuiLockScreen;->mCallback:Lcom/miui/internal/policy/impl/KeyguardScreenCallback;

    invoke-interface {v2}, Lcom/miui/internal/policy/impl/KeyguardScreenCallback;->goToUnlockScreen()V

    .line 848
    .end local v0           #isKeyboardOpen:Z
    :cond_1e
    return-void

    .line 843
    :cond_1f
    const/4 v0, 0x0

    goto :goto_17
.end method
