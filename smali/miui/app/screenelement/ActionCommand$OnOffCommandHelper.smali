.class Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;
.super Ljava/lang/Object;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnOffCommandHelper"
.end annotation


# instance fields
.field protected mIsOn:Z

.field protected mIsToggle:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .parameter "value"

    .prologue
    const/4 v1, 0x1

    .line 247
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 249
    const-string v0, "toggle"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 250
    iput-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsToggle:Z

    .line 255
    :cond_e
    :goto_e
    return-void

    .line 251
    :cond_f
    const-string v0, "on"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 252
    iput-boolean v1, p0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    goto :goto_e

    .line 253
    :cond_1a
    const-string v0, "off"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 254
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmiui/app/screenelement/ActionCommand$OnOffCommandHelper;->mIsOn:Z

    goto :goto_e
.end method
