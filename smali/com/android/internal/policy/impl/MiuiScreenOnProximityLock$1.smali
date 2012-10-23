.class Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;
.super Landroid/os/Handler;
.source "MiuiScreenOnProximityLock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;Landroid/os/Looper;)V
    .registers 3
    .parameter
    .parameter "x0"

    .prologue
    .line 105
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 108
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_20

    .line 124
    :goto_5
    return-void

    .line 111
    :pswitch_6
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_5

    .line 116
    :pswitch_10
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    #getter for: Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->access$300(Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->hide()V

    goto :goto_5

    .line 121
    :pswitch_1a
    iget-object v0, p0, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock$1;->this$0:Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/MiuiScreenOnProximityLock;->release()Z

    goto :goto_5

    .line 108
    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_6
        :pswitch_10
        :pswitch_1a
    .end packed-switch
.end method
