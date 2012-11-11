.class Lmiui/app/screenelement/ActionCommand$IntentCommand;
.super Lmiui/app/screenelement/ActionCommand;
.source "ActionCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/ActionCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IntentCommand"
.end annotation


# static fields
.field public static final TAG_NAME:Ljava/lang/String; = "IntentCommand"


# instance fields
.field private mIntent:Landroid/content/Intent;

.field private mRoot:Lmiui/app/screenelement/ScreenElementRoot;

.field private mTask:Lmiui/app/screenelement/util/Task;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;Lorg/w3c/dom/Element;)V
    .registers 5
    .parameter "context"
    .parameter "root"
    .parameter "ele"

    .prologue
    invoke-direct {p0, p1}, Lmiui/app/screenelement/ActionCommand;-><init>(Lmiui/app/screenelement/ScreenContext;)V

    iput-object p2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    invoke-static {p3}, Lmiui/app/screenelement/util/Task;->load(Lorg/w3c/dom/Element;)Lmiui/app/screenelement/util/Task;

    move-result-object v0

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    return-void
.end method


# virtual methods
.method protected doPerform()V
    .registers 4

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    if-eqz v1, :cond_d

    :try_start_4
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand;->mContext:Lmiui/app/screenelement/ScreenContext;

    iget-object v1, v1, Lmiui/app/screenelement/ScreenContext;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_d
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4 .. :try_end_d} :catch_e

    :cond_d
    :goto_d
    return-void

    :catch_e
    move-exception v0

    .local v0, e:Landroid/content/ActivityNotFoundException;
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    const-string v1, "ActionCommand"

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public init()V
    .registers 6

    .prologue
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mRoot:Lmiui/app/screenelement/ScreenElementRoot;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v2, v2, Lmiui/app/screenelement/util/Task;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/ScreenElementRoot;->findTask(Ljava/lang/String;)Lmiui/app/screenelement/util/Task;

    move-result-object v0

    .local v0, configTask:Lmiui/app/screenelement/util/Task;
    if-eqz v0, :cond_16

    iget-object v1, v0, Lmiui/app/screenelement/util/Task;->action:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_16

    iput-object v0, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    :cond_16
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v1, v1, Lmiui/app/screenelement/util/Task;->action:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7e

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v2, v2, Lmiui/app/screenelement/util/Task;->action:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v1, v1, Lmiui/app/screenelement/util/Task;->type:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3e

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v2, v2, Lmiui/app/screenelement/util/Task;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    :cond_3e
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v1, v1, Lmiui/app/screenelement/util/Task;->category:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_51

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v2, v2, Lmiui/app/screenelement/util/Task;->category:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    :cond_51
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v1, v1, Lmiui/app/screenelement/util/Task;->packageName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_77

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v1, v1, Lmiui/app/screenelement/util/Task;->className:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_77

    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v3, v3, Lmiui/app/screenelement/util/Task;->packageName:Ljava/lang/String;

    iget-object v4, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mTask:Lmiui/app/screenelement/util/Task;

    iget-object v4, v4, Lmiui/app/screenelement/util/Task;->className:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :cond_77
    iget-object v1, p0, Lmiui/app/screenelement/ActionCommand$IntentCommand;->mIntent:Landroid/content/Intent;

    const/high16 v2, 0x3400

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :cond_7e
    return-void
.end method
