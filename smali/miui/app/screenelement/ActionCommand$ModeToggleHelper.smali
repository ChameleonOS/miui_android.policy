.class Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;
.super Ljava/lang/Object;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ModeToggleHelper"
.end annotation


# instance fields
.field private mCurModeIndex:I

.field private mCurToggleIndex:I

.field private mModeIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mModeNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mToggle:Z

.field private mToggleAll:Z

.field private mToggleModes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 125
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeIds:Ljava/util/ArrayList;

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleModes:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lmiui/app/screenelement/ActionCommand$1;)V
    .registers 2
    .parameter "x0"

    .prologue
    .line 125
    invoke-direct {p0}, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;-><init>()V

    return-void
.end method

.method private findMode(Ljava/lang/String;)I
    .registers 4
    .parameter "name"

    .prologue
    .line 174
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 175
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 178
    .end local v0           #i:I
    :goto_17
    return v0

    .line 174
    .restart local v0       #i:I
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 178
    :cond_1b
    const/4 v0, -0x1

    goto :goto_17
.end method


# virtual methods
.method public addMode(Ljava/lang/String;I)V
    .registers 5
    .parameter "mode"
    .parameter "id"

    .prologue
    .line 142
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeIds:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    return-void
.end method

.method public build(Ljava/lang/String;)Z
    .registers 9
    .parameter "value"

    .prologue
    const/4 v4, 0x1

    .line 148
    invoke-direct {p0, p1}, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->findMode(Ljava/lang/String;)I

    move-result v2

    .line 150
    .local v2, index:I
    if-ltz v2, :cond_a

    .line 151
    iput v2, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    .line 170
    :goto_9
    return v4

    .line 155
    :cond_a
    const-string v5, "toggle"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 156
    iput-boolean v4, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleAll:Z

    goto :goto_9

    .line 161
    :cond_15
    const-string v5, ","

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 162
    .local v3, modes:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1c
    array-length v5, v3

    if-ge v0, v5, :cond_35

    .line 163
    aget-object v5, v3, v0

    invoke-direct {p0, v5}, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->findMode(Ljava/lang/String;)I

    move-result v1

    .line 164
    .local v1, ind:I
    if-gez v1, :cond_29

    .line 165
    const/4 v4, 0x0

    goto :goto_9

    .line 166
    :cond_29
    iget-object v5, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleModes:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 169
    .end local v1           #ind:I
    :cond_35
    iput-boolean v4, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggle:Z

    goto :goto_9
.end method

.method public click()V
    .registers 3

    .prologue
    .line 182
    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggle:Z

    if-eqz v0, :cond_24

    .line 183
    iget v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurToggleIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurToggleIndex:I

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleModes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurToggleIndex:I

    .line 184
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleModes:Ljava/util/ArrayList;

    iget v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurToggleIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    .line 188
    :cond_23
    :goto_23
    return-void

    .line 185
    :cond_24
    iget-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mToggleAll:Z

    if-eqz v0, :cond_23

    .line 186
    iget v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    goto :goto_23
.end method

.method public getModeId()I
    .registers 3

    .prologue
    .line 195
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeIds:Ljava/util/ArrayList;

    iget v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getModeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 191
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mModeNames:Ljava/util/ArrayList;

    iget v1, p0, Lmiui/app/screenelement/ActionCommand$ModeToggleHelper;->mCurModeIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
