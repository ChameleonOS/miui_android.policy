.class public Lmiui/app/screenelement/data/Variables;
.super Ljava/lang/Object;
.source "Variables.java"


# static fields
.field public static final AMPM:Ljava/lang/String; = "ampm"

.field public static final BATTERY_LEVEL:Ljava/lang/String; = "battery_level"

.field public static final BATTERY_STATE:Ljava/lang/String; = "battery_state"

.field public static final BATTERY_STATE_CHARGING:I = 0x1

.field public static final BATTERY_STATE_FULL:I = 0x3

.field public static final BATTERY_STATE_LOW:I = 0x2

.field public static final BATTERY_STATE_UNPLUGGED:I = 0x0

.field public static final BLUETOOTH_STATE:Ljava/lang/String; = "bluetooth_state"

.field public static final BOUNCE_PROGRESS:Ljava/lang/String; = "bounce_progress"

.field public static final CALL_MISSED_COUNT:Ljava/lang/String; = "call_missed_count"

.field public static final DATA_STATE:Ljava/lang/String; = "data_state"

.field public static final DATE:Ljava/lang/String; = "date"

.field public static final DAY_OF_WEEK:Ljava/lang/String; = "day_of_week"

.field private static DBG:Z = false

.field public static final FRAME_RATE:Ljava/lang/String; = "frame_rate"

.field private static final GLOBAL:Ljava/lang/String; = "__global"

.field public static final HOUR12:Ljava/lang/String; = "hour12"

.field public static final HOUR24:Ljava/lang/String; = "hour24"

.field private static final LOG_TAG:Ljava/lang/String; = "Variables"

.field public static final MILLISECOND:Ljava/lang/String; = "msec"

.field public static final MINUTE:Ljava/lang/String; = "minute"

.field public static final MONTH:Ljava/lang/String; = "month"

.field public static final MUSIC_STATE:Ljava/lang/String; = "music_state"

.field public static final MUSIC_STATE_PLAY:I = 0x1

.field public static final MUSIC_STATE_STOP:I = 0x0

.field public static final NEXT_ALARM_TIME:Ljava/lang/String; = "next_alarm_time"

.field public static final PLMN:Ljava/lang/String; = "plmn"

.field public static final RING_MODE:Ljava/lang/String; = "ring_mode"

.field public static final SECOND:Ljava/lang/String; = "second"

.field public static final SMS_UNREAD_COUNT:Ljava/lang/String; = "sms_unread_count"

.field public static final SPN:Ljava/lang/String; = "spn"

.field public static final TIME:Ljava/lang/String; = "time"

.field public static final TIME_SYS:Ljava/lang/String; = "time_sys"

.field public static final TOUCH_BEGIN_TIME:Ljava/lang/String; = "touch_begin_time"

.field public static final TOUCH_BEGIN_X:Ljava/lang/String; = "touch_begin_x"

.field public static final TOUCH_BEGIN_Y:Ljava/lang/String; = "touch_begin_y"

.field public static final TOUCH_X:Ljava/lang/String; = "touch_x"

.field public static final TOUCH_Y:Ljava/lang/String; = "touch_y"

.field public static final USB_MODE:Ljava/lang/String; = "usb_mode"

.field public static final WIFI_STATE:Ljava/lang/String; = "wifi_state"

.field public static final YEAR:Ljava/lang/String; = "year"


# instance fields
.field private mDoubleArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mNextDoubleIndex:I

.field private mNextStringIndex:I

.field private mNumLock:Ljava/lang/Object;

.field private mNumObjects:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mStrLock:Ljava/lang/Object;

.field private mStrObjects:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mStringArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-boolean v0, Lmiui/app/screenelement/data/Variables;->DBG:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 9
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput v0, p0, Lmiui/app/screenelement/data/Variables;->mNextDoubleIndex:I

    .line 112
    iput v0, p0, Lmiui/app/screenelement/data/Variables;->mNextStringIndex:I

    .line 115
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mNumObjects:Ljava/util/HashMap;

    .line 118
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStrObjects:Ljava/util/HashMap;

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    .line 124
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mNumLock:Ljava/lang/Object;

    .line 126
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStrLock:Ljava/lang/Object;

    return-void
.end method

.method private getIndex(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;I)I
    .registers 8
    .parameter
    .parameter "object"
    .parameter "property"
    .parameter "nextIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .prologue
    .line 153
    .local p1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    if-nez p2, :cond_4

    .line 154
    const-string p2, "__global"

    .line 155
    :cond_4
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 156
    .local v1, obj:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez v1, :cond_14

    .line 157
    new-instance v1, Ljava/util/HashMap;

    .end local v1           #obj:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 158
    .restart local v1       #obj:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    :cond_14
    invoke-virtual {v1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 161
    .local v0, index:Ljava/lang/Integer;
    if-nez v0, :cond_23

    .line 162
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 163
    invoke-virtual {v1, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_23
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2
.end method


# virtual methods
.method public getNum(I)Ljava/lang/Double;
    .registers 4
    .parameter "index"

    .prologue
    .line 195
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mNumLock:Ljava/lang/Object;

    monitor-enter v1

    .line 196
    const/4 v0, -0x1

    if-lt p1, v0, :cond_10

    :try_start_6
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_13

    .line 197
    :cond_10
    const/4 v0, 0x0

    monitor-exit v1

    .line 199
    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    monitor-exit v1

    goto :goto_12

    .line 200
    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_6 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public getStr(I)Ljava/lang/String;
    .registers 4
    .parameter "index"

    .prologue
    .line 204
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mStrLock:Ljava/lang/Object;

    monitor-enter v1

    .line 205
    const/4 v0, -0x1

    if-lt p1, v0, :cond_10

    :try_start_6
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_13

    .line 206
    :cond_10
    const/4 v0, 0x0

    monitor-exit v1

    .line 208
    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-exit v1

    goto :goto_12

    .line 209
    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_6 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public putNum(ID)V
    .registers 5
    .parameter "index"
    .parameter "value"

    .prologue
    .line 169
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lmiui/app/screenelement/data/Variables;->putNum(ILjava/lang/Double;)V

    .line 170
    return-void
.end method

.method public putNum(ILjava/lang/Double;)V
    .registers 6
    .parameter "index"
    .parameter "value"

    .prologue
    .line 173
    if-gez p1, :cond_3

    .line 181
    :goto_2
    return-void

    .line 175
    :cond_3
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mNumLock:Ljava/lang/Object;

    monitor-enter v1

    .line 176
    :goto_6
    :try_start_6
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_1a

    .line 177
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 180
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_6 .. :try_end_19} :catchall_17

    throw v0

    .line 179
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mDoubleArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 180
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_1a .. :try_end_20} :catchall_17

    goto :goto_2
.end method

.method public putStr(ILjava/lang/String;)V
    .registers 6
    .parameter "index"
    .parameter "value"

    .prologue
    .line 184
    if-gez p1, :cond_3

    .line 192
    :goto_2
    return-void

    .line 186
    :cond_3
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mStrLock:Ljava/lang/Object;

    monitor-enter v1

    .line 187
    :goto_6
    :try_start_6
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_1a

    .line 188
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 191
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_6 .. :try_end_19} :catchall_17

    throw v0

    .line 190
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Lmiui/app/screenelement/data/Variables;->mStringArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 191
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_1a .. :try_end_20} :catchall_17

    goto :goto_2
.end method

.method public registerNumberVariable(Ljava/lang/String;Ljava/lang/String;)I
    .registers 8
    .parameter "object"
    .parameter "property"

    .prologue
    .line 129
    iget-object v2, p0, Lmiui/app/screenelement/data/Variables;->mNumLock:Ljava/lang/Object;

    monitor-enter v2

    .line 130
    :try_start_3
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mNumObjects:Ljava/util/HashMap;

    iget v3, p0, Lmiui/app/screenelement/data/Variables;->mNextDoubleIndex:I

    invoke-direct {p0, v1, p1, p2, v3}, Lmiui/app/screenelement/data/Variables;->getIndex(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 131
    .local v0, index:I
    iget v1, p0, Lmiui/app/screenelement/data/Variables;->mNextDoubleIndex:I

    if-ne v0, v1, :cond_15

    .line 132
    iget v1, p0, Lmiui/app/screenelement/data/Variables;->mNextDoubleIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lmiui/app/screenelement/data/Variables;->mNextDoubleIndex:I

    .line 133
    :cond_15
    sget-boolean v1, Lmiui/app/screenelement/data/Variables;->DBG:Z

    if-eqz v1, :cond_45

    .line 134
    const-string v1, "Variables"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "registerNumberVariable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  index:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :cond_45
    monitor-exit v2

    return v0

    .line 137
    .end local v0           #index:I
    :catchall_47
    move-exception v1

    monitor-exit v2
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_47

    throw v1
.end method

.method public registerStringVariable(Ljava/lang/String;Ljava/lang/String;)I
    .registers 8
    .parameter "object"
    .parameter "property"

    .prologue
    .line 141
    iget-object v2, p0, Lmiui/app/screenelement/data/Variables;->mStrLock:Ljava/lang/Object;

    monitor-enter v2

    .line 142
    :try_start_3
    iget-object v1, p0, Lmiui/app/screenelement/data/Variables;->mStrObjects:Ljava/util/HashMap;

    iget v3, p0, Lmiui/app/screenelement/data/Variables;->mNextStringIndex:I

    invoke-direct {p0, v1, p1, p2, v3}, Lmiui/app/screenelement/data/Variables;->getIndex(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 143
    .local v0, index:I
    iget v1, p0, Lmiui/app/screenelement/data/Variables;->mNextStringIndex:I

    if-ne v0, v1, :cond_15

    .line 144
    iget v1, p0, Lmiui/app/screenelement/data/Variables;->mNextStringIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lmiui/app/screenelement/data/Variables;->mNextStringIndex:I

    .line 145
    :cond_15
    sget-boolean v1, Lmiui/app/screenelement/data/Variables;->DBG:Z

    if-eqz v1, :cond_45

    .line 146
    const-string v1, "Variables"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "registerStringVariable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  index:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :cond_45
    monitor-exit v2

    return v0

    .line 149
    .end local v0           #index:I
    :catchall_47
    move-exception v1

    monitor-exit v2
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_47

    throw v1
.end method
