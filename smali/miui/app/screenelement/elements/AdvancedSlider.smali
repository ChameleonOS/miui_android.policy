.class public Lmiui/app/screenelement/elements/AdvancedSlider;
.super Lmiui/app/screenelement/elements/ScreenElement;
.source "AdvancedSlider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/elements/AdvancedSlider$1;,
        Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;,
        Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;,
        Lmiui/app/screenelement/elements/AdvancedSlider$UnlockAction;,
        Lmiui/app/screenelement/elements/AdvancedSlider$Position;,
        Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;,
        Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;,
        Lmiui/app/screenelement/elements/AdvancedSlider$State;,
        Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;,
        Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field static final synthetic $assertionsDisabled:Z = false

.field private static final DEBUG:Z = false

.field private static final DEFAULT_DRAG_TOLERANCE:I = 0x96

.field private static final FREE_ENDPOINT_DIST:F = 1.7014117E38f

.field private static final LOG_TAG:Ljava/lang/String; = "LockScreen_AdvancedSlider"

.field public static final MOVE_DIST:Ljava/lang/String; = "move_dist"

.field public static final MOVE_X:Ljava/lang/String; = "move_x"

.field public static final MOVE_Y:Ljava/lang/String; = "move_y"

.field private static final NONE_ENDPOINT_DIST:F = 3.4028235E38f

.field public static final SLIDER_STATE_NORMAL:I = 0x0

.field public static final SLIDER_STATE_PRESSED:I = 0x1

.field public static final SLIDER_STATE_REACHED:I = 0x2

.field public static final STATE:Ljava/lang/String; = "state"

.field public static final TAG_NAME:Ljava/lang/String; = "Slider"


# instance fields
.field private mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

.field private mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

.field private mEndPoints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;",
            ">;"
        }
    .end annotation
.end field

.field private mMoveDistVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mMoveXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mMoveYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mMoving:Z

.field private mOnLaunchListener:Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;

.field private mPressed:Z

.field private mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

.field private mStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

.field private mTouchOffsetX:F

.field private mTouchOffsetY:F

.field private mUnlockingHide:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lmiui/app/screenelement/elements/AdvancedSlider;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lmiui/app/screenelement/elements/AdvancedSlider;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
    .registers 8
    .parameter "node"
    .parameter "c"
    .parameter "root"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-direct {p0, p1, p2, p3}, Lmiui/app/screenelement/elements/ScreenElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    .line 76
    new-instance v0, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;-><init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lmiui/app/screenelement/elements/AdvancedSlider$1;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    .line 268
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_52

    .line 269
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "state"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 270
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "move_x"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 271
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "move_y"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 272
    new-instance v0, Lmiui/app/screenelement/util/IndexedNumberVariable;

    iget-object v1, p0, Lmiui/app/screenelement/elements/ScreenElement;->mName:Ljava/lang/String;

    const-string v2, "move_dist"

    iget-object v3, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v3, v3, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-direct {v0, v1, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;-><init>(Ljava/lang/String;Ljava/lang/String;Lmiui/app/screenelement/data/Variables;)V

    iput-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveDistVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    .line 274
    :cond_52
    invoke-virtual {p0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider;->load(Lorg/w3c/dom/Element;)V

    .line 275
    return-void
.end method

.method static synthetic access$100(Lmiui/app/screenelement/elements/AdvancedSlider;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 28
    invoke-direct {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->cancelMoving()V

    return-void
.end method

.method static synthetic access$200(Lmiui/app/screenelement/elements/AdvancedSlider;)Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;
    .registers 2
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    return-object v0
.end method

.method static synthetic access$400(Lmiui/app/screenelement/elements/AdvancedSlider;FF)V
    .registers 3
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider;->moveStartPoint(FF)V

    return-void
.end method

.method static synthetic access$500(Lmiui/app/screenelement/elements/AdvancedSlider;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mPressed:Z

    return v0
.end method

.method static synthetic access$600(Lmiui/app/screenelement/elements/AdvancedSlider;)F
    .registers 2
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mTouchOffsetX:F

    return v0
.end method

.method static synthetic access$700(Lmiui/app/screenelement/elements/AdvancedSlider;)F
    .registers 2
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mTouchOffsetY:F

    return v0
.end method

.method private cancelMoving()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    const-wide/16 v5, 0x0

    .line 1094
    iput-boolean v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mPressed:Z

    .line 1095
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v3}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->getX()F

    move-result v3

    iget-object v4, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v4}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->moveTo(FF)V

    .line 1096
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    sget-object v3, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Normal:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    .line 1097
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1098
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    sget-object v2, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Normal:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {v0, v2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_23

    .line 1101
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_35
    iget-boolean v2, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v2, :cond_4d

    .line 1102
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v2, v5, v6}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1103
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v2, v5, v6}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1104
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveDistVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v2, v5, v6}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1105
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v2, v5, v6}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1107
    :cond_4d
    iput-boolean v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    .line 1108
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->requestUpdate()V

    .line 1109
    return-void
.end method

.method private checkEndPoint(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Z
    .registers 9
    .parameter "point"
    .parameter "endPoint"

    .prologue
    .line 1045
    const/4 v2, 0x0

    .line 1046
    .local v2, reached:Z
    iget-wide v3, p1, Lmiui/app/screenelement/util/Utils$Point;->x:D

    double-to-float v3, v3

    iget-wide v4, p1, Lmiui/app/screenelement/util/Utils$Point;->y:D

    double-to-float v4, v4

    invoke-virtual {p2, v3, v4}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->touched(FF)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 1047
    invoke-virtual {p2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->getState()Lmiui/app/screenelement/elements/AdvancedSlider$State;

    move-result-object v3

    sget-object v4, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Reached:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    if-eq v3, v4, :cond_39

    .line 1048
    sget-object v3, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Reached:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p2, v3}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    .line 1049
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_20
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1050
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    if-eq v0, p2, :cond_20

    .line 1051
    sget-object v3, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Pressed:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {v0, v3}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_20

    .line 1053
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_34
    iget-object v3, p2, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mName:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lmiui/app/screenelement/elements/AdvancedSlider;->onReach(Ljava/lang/String;)V

    .line 1055
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_39
    const/4 v2, 0x1

    .line 1059
    :goto_3a
    return v2

    .line 1057
    :cond_3b
    sget-object v3, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Pressed:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {p2, v3}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_3a
.end method

.method private checkTouch(FF)Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    .registers 14
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v8, 0x0

    .line 984
    const v3, 0x7f7fffff

    .line 985
    .local v3, minDist:F
    const/4 v4, 0x0

    .line 986
    .local v4, point:Lmiui/app/screenelement/util/Utils$Point;
    new-instance v7, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;

    invoke-direct {v7, p0, v8}, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;-><init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lmiui/app/screenelement/elements/AdvancedSlider$1;)V

    .line 988
    .local v7, result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    iget-object v9, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 989
    .local v1, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    #calls: Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->getNearestPoint(FF)Lmiui/app/screenelement/util/Utils$Point;
    invoke-static {v1, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->access$1000(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;FF)Lmiui/app/screenelement/util/Utils$Point;

    move-result-object v5

    .line 990
    .local v5, pt:Lmiui/app/screenelement/util/Utils$Point;
    invoke-virtual {v1, v5, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->getTransformedDist(Lmiui/app/screenelement/util/Utils$Point;FF)F

    move-result v0

    .line 991
    .local v0, di:F
    cmpg-float v9, v0, v3

    if-gez v9, :cond_10

    .line 992
    move v3, v0

    .line 993
    move-object v4, v5

    .line 994
    iput-object v1, v7, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    goto :goto_10

    .line 997
    .end local v0           #di:F
    .end local v1           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    .end local v5           #pt:Lmiui/app/screenelement/util/Utils$Point;
    :cond_2d
    const/4 v6, 0x0

    .line 1000
    .local v6, reached:Z
    const v9, 0x7f7fffff

    cmpg-float v9, v3, v9

    if-gez v9, :cond_85

    .line 1001
    iget-wide v8, v4, Lmiui/app/screenelement/util/Utils$Point;->x:D

    double-to-float v8, v8

    iget-wide v9, v4, Lmiui/app/screenelement/util/Utils$Point;->y:D

    double-to-float v9, v9

    invoke-direct {p0, v8, v9}, Lmiui/app/screenelement/elements/AdvancedSlider;->moveStartPoint(FF)V

    .line 1004
    const v8, 0x7effffff

    cmpg-float v8, v3, v8

    if-gez v8, :cond_64

    .line 1006
    iget-object v8, v7, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    invoke-direct {p0, v4, v8}, Lmiui/app/screenelement/elements/AdvancedSlider;->checkEndPoint(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Z

    move-result v6

    .line 1023
    :cond_4b
    :goto_4b
    iget-object v9, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    if-eqz v6, :cond_8e

    sget-object v8, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Reached:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    :goto_51
    invoke-virtual {v9, v8}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    .line 1024
    iget-boolean v8, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v8, :cond_61

    .line 1025
    iget-object v10, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    if-eqz v6, :cond_91

    const-wide/high16 v8, 0x4000

    :goto_5e
    invoke-virtual {v10, v8, v9}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1027
    :cond_61
    iput-boolean v6, v7, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->reached:Z

    .line 1028
    .end local v7           #result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    :goto_63
    return-object v7

    .line 1009
    .restart local v7       #result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    :cond_64
    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1010
    .restart local v1       #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    #getter for: Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->mPath:Ljava/util/ArrayList;
    invoke-static {v1}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->access$300(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Ljava/util/ArrayList;

    move-result-object v8

    if-nez v8, :cond_6a

    .line 1012
    invoke-direct {p0, v4, v1}, Lmiui/app/screenelement/elements/AdvancedSlider;->checkEndPoint(Lmiui/app/screenelement/util/Utils$Point;Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Z

    move-result v6

    if-eqz v6, :cond_6a

    .line 1013
    iput-object v1, v7, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    goto :goto_4b

    .line 1019
    .end local v1           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_85
    const-string v9, "LockScreen_AdvancedSlider"

    const-string v10, "unlock touch canceled due to exceeding tollerance"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v7, v8

    .line 1020
    goto :goto_63

    .line 1023
    :cond_8e
    sget-object v8, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Pressed:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    goto :goto_51

    .line 1025
    :cond_91
    const-wide/high16 v8, 0x3ff0

    goto :goto_5e
.end method

.method private doLaunch(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Z
    .registers 4
    .parameter "endPoint"

    .prologue
    .line 1064
    const/4 v0, 0x0

    .line 1065
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p1, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->mAction:Lmiui/app/screenelement/elements/AdvancedSlider$UnlockAction;

    if-eqz v1, :cond_b

    .line 1066
    iget-object v1, p1, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->mAction:Lmiui/app/screenelement/elements/AdvancedSlider$UnlockAction;

    invoke-virtual {v1}, Lmiui/app/screenelement/elements/AdvancedSlider$UnlockAction;->perform()Landroid/content/Intent;

    move-result-object v0

    .line 1069
    :cond_b
    iget-object v1, p1, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mName:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lmiui/app/screenelement/elements/AdvancedSlider;->onLaunch(Ljava/lang/String;Landroid/content/Intent;)Z

    move-result v1

    return v1
.end method

.method private loadEndPoint(Lorg/w3c/dom/Element;)V
    .registers 7
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 295
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 296
    const-string v3, "EndPoint"

    invoke-interface {p1, v3}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 297
    .local v2, nodeList:Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_c
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_25

    .line 298
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 299
    .local v1, item:Lorg/w3c/dom/Element;
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    new-instance v4, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    invoke-direct {v4, p0, v1}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;-><init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lorg/w3c/dom/Element;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 301
    .end local v1           #item:Lorg/w3c/dom/Element;
    :cond_25
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_34

    const/4 v3, 0x1

    :goto_2e
    const-string v4, "no end point for unlocker!"

    invoke-static {v3, v4}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 302
    return-void

    .line 301
    :cond_34
    const/4 v3, 0x0

    goto :goto_2e
.end method

.method private loadStartPoint(Lorg/w3c/dom/Element;)V
    .registers 5
    .parameter "node"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lmiui/app/screenelement/ScreenElementLoadException;
        }
    .end annotation

    .prologue
    .line 289
    const-string v1, "StartPoint"

    invoke-static {p1, v1}, Lmiui/app/screenelement/util/Utils;->getChild(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 290
    .local v0, ele:Lorg/w3c/dom/Element;
    if-eqz v0, :cond_16

    const/4 v1, 0x1

    :goto_9
    const-string v2, "no StartPoint node"

    invoke-static {v1, v2}, Lmiui/app/screenelement/util/Utils;->asserts(ZLjava/lang/String;)V

    .line 291
    new-instance v1, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-direct {v1, p0, v0}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;-><init>(Lmiui/app/screenelement/elements/AdvancedSlider;Lorg/w3c/dom/Element;)V

    iput-object v1, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    .line 292
    return-void

    .line 290
    :cond_16
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private moveStartPoint(FF)V
    .registers 13
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1032
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v6, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->moveTo(FF)V

    .line 1034
    iget-boolean v6, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v6, :cond_4f

    .line 1035
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    iget v6, v6, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentX:F

    invoke-virtual {p0, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->descale(F)F

    move-result v6

    float-to-double v6, v6

    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    iget-object v8, v8, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mX:Lmiui/app/screenelement/data/Expression;

    iget-object v9, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v9, v9, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v8, v9}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    sub-double v2, v6, v8

    .line 1036
    .local v2, move_x:D
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    iget v6, v6, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mCurrentY:F

    invoke-virtual {p0, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->descale(F)F

    move-result v6

    float-to-double v6, v6

    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    iget-object v8, v8, Lmiui/app/screenelement/elements/AdvancedSlider$SliderPoint;->mY:Lmiui/app/screenelement/data/Expression;

    iget-object v9, p0, Lmiui/app/screenelement/elements/ScreenElement;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v9, v9, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    invoke-virtual {v8, v9}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v8

    sub-double v4, v6, v8

    .line 1037
    .local v4, move_y:D
    mul-double v6, v2, v2

    mul-double v8, v4, v4

    add-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    .line 1038
    .local v0, move_dist:D
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveXVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v6, v2, v3}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1039
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveYVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v6, v4, v5}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1040
    iget-object v6, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoveDistVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    invoke-virtual {v6, v0, v1}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 1042
    .end local v0           #move_dist:D
    .end local v2           #move_x:D
    .end local v4           #move_y:D
    :cond_4f
    return-void
.end method


# virtual methods
.method public findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;
    .registers 6
    .parameter "name"

    .prologue
    .line 1149
    invoke-super {p0, p1}, Lmiui/app/screenelement/elements/ScreenElement;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 1150
    .local v0, ele:Lmiui/app/screenelement/elements/ScreenElement;
    if-eqz v0, :cond_8

    move-object v3, v0

    .line 1163
    :goto_7
    return-object v3

    .line 1153
    :cond_8
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v3, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 1154
    if-eqz v0, :cond_12

    move-object v3, v0

    .line 1155
    goto :goto_7

    .line 1157
    :cond_12
    iget-object v3, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1158
    .local v1, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v1, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->findElement(Ljava/lang/String;)Lmiui/app/screenelement/elements/ScreenElement;

    move-result-object v0

    .line 1159
    if-eqz v0, :cond_18

    move-object v3, v0

    .line 1160
    goto :goto_7

    .line 1163
    .end local v1           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_2c
    const/4 v3, 0x0

    goto :goto_7
.end method

.method public finish()V
    .registers 4

    .prologue
    .line 857
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->finish()V

    .line 858
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->finish()V

    .line 859
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 860
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->finish()V

    goto :goto_e

    .line 862
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_1e
    return-void
.end method

.method public init()V
    .registers 4

    .prologue
    .line 847
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->init()V

    .line 848
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->init()V

    .line 849
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->init()V

    .line 850
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 851
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->init()V

    goto :goto_13

    .line 853
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_23
    return-void
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 1112
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mUnlockingHide:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
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
    .line 278
    sget-boolean v0, Lmiui/app/screenelement/elements/AdvancedSlider;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Slider"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 283
    :cond_16
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->load(Lorg/w3c/dom/Element;)V

    .line 284
    invoke-direct {p0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider;->loadStartPoint(Lorg/w3c/dom/Element;)V

    .line 285
    invoke-direct {p0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider;->loadEndPoint(Lorg/w3c/dom/Element;)V

    .line 286
    return-void
.end method

.method protected onCancel()V
    .registers 3

    .prologue
    .line 1077
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->haptic(I)V

    .line 1078
    return-void
.end method

.method protected onLaunch(Ljava/lang/String;Landroid/content/Intent;)Z
    .registers 4
    .parameter "name"
    .parameter "intent"

    .prologue
    .line 1088
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mOnLaunchListener:Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;

    if-eqz v0, :cond_9

    .line 1089
    iget-object v0, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mOnLaunchListener:Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;

    invoke-interface {v0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;->onLaunch(Ljava/lang/String;)V

    .line 1090
    :cond_9
    const/4 v0, 0x0

    return v0
.end method

.method protected onReach(Ljava/lang/String;)V
    .registers 4
    .parameter "name"

    .prologue
    .line 1082
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->haptic(I)V

    .line 1083
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 1073
    iget-object v0, p0, Lmiui/app/screenelement/elements/ScreenElement;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->haptic(I)V

    .line 1074
    return-void
.end method

.method public onTouch(Landroid/view/MotionEvent;)Z
    .registers 13
    .parameter "event"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 896
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->isVisible()Z

    move-result v8

    if-nez v8, :cond_b

    move v4, v7

    .line 971
    :cond_a
    :goto_a
    return v4

    .line 899
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    .line 900
    .local v5, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    .line 902
    .local v6, y:F
    const/4 v4, 0x0

    .line 903
    .local v4, ret:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v8

    packed-switch v8, :pswitch_data_d2

    goto :goto_a

    .line 905
    :pswitch_1c
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v7, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->touched(FF)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 906
    iput-boolean v9, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    .line 907
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v7}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->getX()F

    move-result v7

    sub-float v7, v5, v7

    iput v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mTouchOffsetX:F

    .line 908
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v7}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->getY()F

    move-result v7

    sub-float v7, v6, v7

    iput v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mTouchOffsetY:F

    .line 909
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    sget-object v8, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Pressed:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {v7, v8}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    .line 910
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_47
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_59

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 911
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    sget-object v7, Lmiui/app/screenelement/elements/AdvancedSlider$State;->Pressed:Lmiui/app/screenelement/elements/AdvancedSlider$State;

    invoke-virtual {v0, v7}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->setState(Lmiui/app/screenelement/elements/AdvancedSlider$State;)V

    goto :goto_47

    .line 913
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_59
    iput-boolean v9, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mPressed:Z

    .line 917
    iget-boolean v7, p0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v7, :cond_66

    .line 918
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;

    const-wide/high16 v8, 0x3ff0

    invoke-virtual {v7, v8, v9}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    .line 920
    :cond_66
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    invoke-virtual {v7}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->init()V

    .line 921
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->onStart()V

    .line 922
    const/4 v4, 0x1

    goto :goto_a

    .line 926
    .end local v1           #i$:Ljava/util/Iterator;
    :pswitch_70
    iget-boolean v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    if-eqz v8, :cond_a

    .line 927
    invoke-direct {p0, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->checkTouch(FF)Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;

    move-result-object v3

    .line 928
    .local v3, result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    if-eqz v3, :cond_80

    .line 929
    iget-object v7, v3, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    iput-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 935
    :goto_7e
    const/4 v4, 0x1

    .line 936
    goto :goto_a

    .line 931
    :cond_80
    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    iget-object v9, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    invoke-virtual {v8, v9}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->startCancelMoving(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)V

    .line 932
    iput-boolean v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    .line 933
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->onCancel()V

    goto :goto_7e

    .line 940
    .end local v3           #result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    :pswitch_8d
    const/4 v2, 0x0

    .line 941
    .local v2, launched:Z
    iget-boolean v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    if-eqz v8, :cond_a

    .line 942
    const-string v8, "LockScreen_AdvancedSlider"

    const-string v9, "unlock touch up"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    invoke-direct {p0, v5, v6}, Lmiui/app/screenelement/elements/AdvancedSlider;->checkTouch(FF)Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;

    move-result-object v3

    .line 944
    .restart local v3       #result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    if-eqz v3, :cond_ad

    .line 945
    iget-boolean v8, v3, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->reached:Z

    if-eqz v8, :cond_a9

    .line 946
    iget-object v8, v3, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    invoke-direct {p0, v8}, Lmiui/app/screenelement/elements/AdvancedSlider;->doLaunch(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)Z

    move-result v2

    .line 948
    :cond_a9
    iget-object v8, v3, Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;->endPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    iput-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 951
    :cond_ad
    iput-boolean v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    .line 952
    if-nez v2, :cond_bb

    .line 953
    iget-object v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    invoke-virtual {v7, v8}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->startCancelMoving(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)V

    .line 954
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->onCancel()V

    .line 956
    :cond_bb
    const/4 v4, 0x1

    .line 957
    goto/16 :goto_a

    .line 961
    .end local v2           #launched:Z
    .end local v3           #result:Lmiui/app/screenelement/elements/AdvancedSlider$CheckTouchResult;
    :pswitch_be
    iget-boolean v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    if-eqz v8, :cond_a

    .line 962
    iget-object v8, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    invoke-virtual {v8, v10}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->startCancelMoving(Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;)V

    .line 963
    iput-object v10, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mCurrentEndPoint:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 964
    iput-boolean v7, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mMoving:Z

    .line 965
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->onCancel()V

    .line 966
    const/4 v4, 0x1

    goto/16 :goto_a

    .line 903
    nop

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_8d
        :pswitch_70
        :pswitch_8d
        :pswitch_be
    .end packed-switch
.end method

.method public pause()V
    .registers 4

    .prologue
    .line 866
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->pause()V

    .line 868
    invoke-direct {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->cancelMoving()V

    .line 870
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->pause()V

    .line 871
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 872
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->pause()V

    goto :goto_11

    .line 874
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_21
    return-void
.end method

.method public render(Landroid/graphics/Canvas;)V
    .registers 5
    .parameter "c"

    .prologue
    .line 1117
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->isVisible()Z

    move-result v2

    if-nez v2, :cond_7

    .line 1124
    :goto_6
    return-void

    .line 1120
    :cond_7
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1121
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->render(Landroid/graphics/Canvas;)V

    goto :goto_d

    .line 1123
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_1d
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2, p1}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->render(Landroid/graphics/Canvas;)V

    goto :goto_6
.end method

.method public reset()V
    .registers 4

    .prologue
    .line 887
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->reset()V

    .line 888
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->reset()V

    .line 889
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 890
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->reset()V

    goto :goto_e

    .line 892
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_1e
    return-void
.end method

.method public resume()V
    .registers 4

    .prologue
    .line 878
    invoke-super {p0}, Lmiui/app/screenelement/elements/ScreenElement;->resume()V

    .line 879
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->resume()V

    .line 880
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 881
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->resume()V

    goto :goto_e

    .line 883
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_1e
    return-void
.end method

.method public setOnLaunchListener(Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;)V
    .registers 2
    .parameter "l"

    .prologue
    .line 305
    iput-object p1, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mOnLaunchListener:Lmiui/app/screenelement/elements/AdvancedSlider$OnLaunchListener;

    .line 306
    return-void
.end method

.method public showCategory(Ljava/lang/String;Z)V
    .registers 6
    .parameter "category"
    .parameter "show"

    .prologue
    .line 1141
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->showCategory(Ljava/lang/String;Z)V

    .line 1142
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1143
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->showCategory(Ljava/lang/String;Z)V

    goto :goto_b

    .line 1145
    .end local v0           #ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    :cond_1b
    return-void
.end method

.method public tick(J)V
    .registers 6
    .parameter "currentTime"

    .prologue
    .line 1128
    invoke-super {p0, p1, p2}, Lmiui/app/screenelement/elements/ScreenElement;->tick(J)V

    .line 1129
    invoke-virtual {p0}, Lmiui/app/screenelement/elements/AdvancedSlider;->isVisible()Z

    move-result v2

    if-nez v2, :cond_a

    .line 1138
    :cond_9
    return-void

    .line 1132
    :cond_a
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mBounceAnimationController:Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;

    invoke-virtual {v2, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$BounceAnimationController;->tick(J)V

    .line 1134
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mStartPoint:Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;

    invoke-virtual {v2, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$StartPoint;->tick(J)V

    .line 1135
    iget-object v2, p0, Lmiui/app/screenelement/elements/AdvancedSlider;->mEndPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;

    .line 1136
    .local v0, ep:Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;
    invoke-virtual {v0, p1, p2}, Lmiui/app/screenelement/elements/AdvancedSlider$EndPoint;->tick(J)V

    goto :goto_1a
.end method
