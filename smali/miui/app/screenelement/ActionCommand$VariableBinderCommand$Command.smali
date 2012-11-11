.class final enum Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;
.super Ljava/lang/Enum;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Command"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

.field public static final enum Invalid:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

.field public static final enum Refresh:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    const-string v1, "Refresh"

    invoke-direct {v0, v1, v2}, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Refresh:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    new-instance v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    const-string v1, "Invalid"

    invoke-direct {v0, v1, v3}, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Invalid:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    const/4 v0, 0x2

    new-array v0, v0, [Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    sget-object v1, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Refresh:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    aput-object v1, v0, v2

    sget-object v1, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Invalid:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    aput-object v1, v0, v3

    sput-object v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->$VALUES:[Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;
    .registers 2
    .parameter "name"

    .prologue
    const-class v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    return-object v0
.end method

.method public static values()[Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;
    .registers 1

    .prologue
    sget-object v0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->$VALUES:[Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    invoke-virtual {v0}, [Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    return-object v0
.end method
