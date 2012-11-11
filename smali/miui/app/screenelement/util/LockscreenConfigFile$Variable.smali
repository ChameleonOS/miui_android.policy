.class public Lmiui/app/screenelement/util/LockscreenConfigFile$Variable;
.super Ljava/lang/Object;
.source "LockscreenConfigFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/util/LockscreenConfigFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Variable"
.end annotation


# instance fields
.field public name:Ljava/lang/String;

.field final synthetic this$0:Lmiui/app/screenelement/util/LockscreenConfigFile;

.field public type:Ljava/lang/String;

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/util/LockscreenConfigFile;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/util/LockscreenConfigFile$Variable;->this$0:Lmiui/app/screenelement/util/LockscreenConfigFile;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
