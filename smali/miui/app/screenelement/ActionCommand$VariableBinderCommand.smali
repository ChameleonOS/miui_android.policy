.class Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;
.super Lmiui/app/screenelement/ActionCommand;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VariableBinderCommand"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;
    }
.end annotation


# static fields
.field public static final TAG_NAME:Ljava/lang/String; = "BinderCommand"


# instance fields
.field private mBinder:Lmiui/app/screenelement/data/VariableBinder;

.field private mCommand:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

.field private mName:Ljava/lang/String;

.field private mRoot:Lmiui/app/screenelement/ScreenElementRoot;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Lorg/w3c/dom/Element;)V
    .registers 6
    .parameter "context"
    .parameter "root"
    .parameter "ele"

    .prologue
    invoke-direct {p0, p1}, Lmiui/app/screenelement/ActionCommand;-><init>(Lmiui/app/screenelement/ScreenContext;)V

    sget-object v1, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Invalid:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mCommand:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    iput-object p2, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    const-string v1, "name"

    invoke-interface {p3, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mName:Ljava/lang/String;

    const-string v1, "command"

    invoke-interface {p3, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, command:Ljava/lang/String;
    const-string v1, "refresh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    sget-object v1, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->Refresh:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mCommand:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    :cond_23
    return-void
.end method


# virtual methods
.method protected doPerform()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mBinder:Lmiui/app/screenelement/data/VariableBinder;

    if-eqz v0, :cond_11

    sget-object v0, Lmiui/app/screenelement/ActionCommand$1;->$SwitchMap$miui$app$screenelement$ActionCommand$VariableBinderCommand$Command:[I

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mCommand:Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;

    invoke-virtual {v1}, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand$Command;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_18

    :cond_11
    :goto_11
    return-void

    :pswitch_12
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mBinder:Lmiui/app/screenelement/data/VariableBinder;

    invoke-interface {v0}, Lmiui/app/screenelement/data/VariableBinder;->refresh()V

    goto :goto_11

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method

.method public init()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/ScreenElementRoot;->findBinder(Ljava/lang/String;)Lmiui/app/screenelement/data/VariableBinder;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$VariableBinderCommand;->mBinder:Lmiui/app/screenelement/data/VariableBinder;

    return-void
.end method
