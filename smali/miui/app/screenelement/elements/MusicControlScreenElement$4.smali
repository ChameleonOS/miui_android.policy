.class Lmiui/app/screenelement/elements/MusicControlScreenElement$4;
.super Ljava/lang/Object;
.source "MusicControlScreenElement.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/screenelement/elements/MusicControlScreenElement;->onButtonUp(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

.field final synthetic val$_name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/elements/MusicControlScreenElement;Ljava/lang/String;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    iput-object p2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->val$_name:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const-string v0, "music_pause"

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->val$_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mButtonPause:Lmiui/app/screenelement/elements/ButtonScreenElement;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$900(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/ButtonScreenElement;

    move-result-object v0

    invoke-virtual {v0, v3}, Lmiui/app/screenelement/elements/ButtonScreenElement;->show(Z)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mButtonPlay:Lmiui/app/screenelement/elements/ButtonScreenElement;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1000(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/ButtonScreenElement;

    move-result-object v0

    invoke-virtual {v0, v2}, Lmiui/app/screenelement/elements/ButtonScreenElement;->show(Z)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #setter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mMusicStatus:I
    invoke-static {v0, v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1102(Lmiui/app/screenelement/elements/MusicControlScreenElement;I)I

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    iget-boolean v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_34

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mMusicStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1200(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/util/IndexedNumberVariable;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    :cond_34
    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestFramerate(F)V

    :cond_3a
    :goto_3a
    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$700(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mCheckStreamMusicRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1300(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$700(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mCheckStreamMusicRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1300(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$700(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$800(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$700(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mEnableSpectrumVisualizerRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$800(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_7b
    const-string v0, "music_play"

    iget-object v1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->val$_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mButtonPlay:Lmiui/app/screenelement/elements/ButtonScreenElement;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1000(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/ButtonScreenElement;

    move-result-object v0

    invoke-virtual {v0, v3}, Lmiui/app/screenelement/elements/ButtonScreenElement;->show(Z)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mButtonPause:Lmiui/app/screenelement/elements/ButtonScreenElement;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$900(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/ButtonScreenElement;

    move-result-object v0

    invoke-virtual {v0, v2}, Lmiui/app/screenelement/elements/ButtonScreenElement;->show(Z)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    const/4 v1, 0x2

    #setter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mMusicStatus:I
    invoke-static {v0, v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1102(Lmiui/app/screenelement/elements/MusicControlScreenElement;I)I

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    iget-boolean v0, v0, Lmiui/app/screenelement/elements/ScreenElement;->mHasName:Z

    if-eqz v0, :cond_ae

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mMusicStateVar:Lmiui/app/screenelement/util/IndexedNumberVariable;
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$1200(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/util/IndexedNumberVariable;

    move-result-object v0

    const-wide/high16 v1, 0x3ff0

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    :cond_ae
    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    const/high16 v1, 0x41f0

    invoke-virtual {v0, v1}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestFramerate(F)V

    iget-object v0, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$4;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestAlbum()V
    invoke-static {v0}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$200(Lmiui/app/screenelement/elements/MusicControlScreenElement;)V

    goto :goto_3a
.end method
