.class Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;
.super Ljava/lang/Object;
.source "MiuiAccountUnlockScreen.java"

# interfaces
.implements Landroid/accounts/AccountManagerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->asyncCheckPassword()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/accounts/AccountManagerCallback",
        "<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)V
    .registers 2
    .parameter

    .prologue
    .line 337
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/accounts/AccountManagerFuture;)V
    .registers 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/AccountManagerFuture",
            "<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 340
    .local p1, future:Landroid/accounts/AccountManagerFuture;,"Landroid/accounts/AccountManagerFuture<Landroid/os/Bundle;>;"
    :try_start_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mCallback:Lcom/android/internal/policy/impl/KeyguardScreenCallback;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$800(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Lcom/android/internal/policy/impl/KeyguardScreenCallback;

    move-result-object v3

    const/16 v4, 0x7530

    invoke-interface {v3, v4}, Lcom/android/internal/policy/impl/KeyguardScreenCallback;->pokeWakelock(I)V

    .line 341
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    .line 342
    .local v1, result:Landroid/os/Bundle;
    const-string v3, "booleanResult"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 343
    .local v2, verified:Z
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #calls: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->postOnCheckPasswordResult(Z)V
    invoke-static {v3, v2}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1100(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;Z)V
    :try_end_1c
    .catchall {:try_start_0 .. :try_end_1c} :catchall_6d
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_1c} :catch_2b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1c} :catch_41
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_1c} :catch_57

    .line 351
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mLogin:Landroid/widget/Spinner;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1300(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Landroid/widget/Spinner;

    move-result-object v3

    new-instance v4, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;-><init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->post(Ljava/lang/Runnable;)Z

    .line 357
    .end local v1           #result:Landroid/os/Bundle;
    .end local v2           #verified:Z
    :goto_2a
    return-void

    .line 344
    :catch_2b
    move-exception v0

    .line 345
    .local v0, e:Landroid/accounts/OperationCanceledException;
    :try_start_2c
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    const/4 v4, 0x0

    #calls: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->postOnCheckPasswordResult(Z)V
    invoke-static {v3, v4}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1100(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;Z)V
    :try_end_32
    .catchall {:try_start_2c .. :try_end_32} :catchall_6d

    .line 351
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mLogin:Landroid/widget/Spinner;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1300(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Landroid/widget/Spinner;

    move-result-object v3

    new-instance v4, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;-><init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->post(Ljava/lang/Runnable;)Z

    goto :goto_2a

    .line 346
    .end local v0           #e:Landroid/accounts/OperationCanceledException;
    :catch_41
    move-exception v0

    .line 347
    .local v0, e:Ljava/io/IOException;
    :try_start_42
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    const/4 v4, 0x0

    #calls: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->postOnCheckPasswordResult(Z)V
    invoke-static {v3, v4}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1100(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;Z)V
    :try_end_48
    .catchall {:try_start_42 .. :try_end_48} :catchall_6d

    .line 351
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mLogin:Landroid/widget/Spinner;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1300(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Landroid/widget/Spinner;

    move-result-object v3

    new-instance v4, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;-><init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->post(Ljava/lang/Runnable;)Z

    goto :goto_2a

    .line 348
    .end local v0           #e:Ljava/io/IOException;
    :catch_57
    move-exception v0

    .line 349
    .local v0, e:Landroid/accounts/AuthenticatorException;
    :try_start_58
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    const/4 v4, 0x0

    #calls: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->postOnCheckPasswordResult(Z)V
    invoke-static {v3, v4}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1100(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;Z)V
    :try_end_5e
    .catchall {:try_start_58 .. :try_end_5e} :catchall_6d

    .line 351
    iget-object v3, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mLogin:Landroid/widget/Spinner;
    invoke-static {v3}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1300(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Landroid/widget/Spinner;

    move-result-object v3

    new-instance v4, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;

    invoke-direct {v4, p0}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;-><init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;)V

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->post(Ljava/lang/Runnable;)Z

    goto :goto_2a

    .end local v0           #e:Landroid/accounts/AuthenticatorException;
    :catchall_6d
    move-exception v3

    iget-object v4, p0, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;->this$0:Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;

    #getter for: Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->mLogin:Landroid/widget/Spinner;
    invoke-static {v4}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;->access$1300(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen;)Landroid/widget/Spinner;

    move-result-object v4

    new-instance v5, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;

    invoke-direct {v5, p0}, Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4$1;-><init>(Lcom/android/internal/policy/impl/MiuiAccountUnlockScreen$4;)V

    invoke-virtual {v4, v5}, Landroid/widget/Spinner;->post(Ljava/lang/Runnable;)Z

    throw v3
.end method
