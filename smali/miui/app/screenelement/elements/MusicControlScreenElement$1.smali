.class Lmiui/app/screenelement/elements/MusicControlScreenElement$1;
.super Landroid/content/BroadcastReceiver;
.source "MusicControlScreenElement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/elements/MusicControlScreenElement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/elements/MusicControlScreenElement;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private setTrackInfo(Landroid/content/Intent;)V
    .registers 9
    .parameter "intent"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    if-nez v2, :cond_b

    :goto_a
    return-void

    :cond_b
    const-string v2, "track"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, title:Ljava/lang/String;
    const-string v2, "artist"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, artist:Ljava/lang/String;
    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #setter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mIsOnlineSongBlocking:Z
    invoke-static {v2, v5}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$402(Lmiui/app/screenelement/elements/MusicControlScreenElement;Z)Z

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_32

    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    invoke-virtual {v2, v5}, Lmiui/app/screenelement/elements/TextScreenElement;->show(Z)V

    goto :goto_a

    :cond_32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4b

    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    invoke-virtual {v2, v0}, Lmiui/app/screenelement/elements/TextScreenElement;->setText(Ljava/lang/String;)V

    :goto_41
    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    invoke-virtual {v2, v6}, Lmiui/app/screenelement/elements/TextScreenElement;->show(Z)V

    goto :goto_a

    :cond_4b
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5b

    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    invoke-virtual {v2, v1}, Lmiui/app/screenelement/elements/TextScreenElement;->setText(Ljava/lang/String;)V

    goto :goto_41

    :cond_5b
    iget-object v2, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v2

    const-string v3, "%s   %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    aput-object v0, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/elements/TextScreenElement;->setText(Ljava/lang/String;)V

    goto :goto_41
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v5, 0x0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .local v0, action:Ljava/lang/String;
    const-string v3, "playing"

    invoke-virtual {p2, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .local v2, isPlaying:Z
    if-nez v2, :cond_e

    :cond_d
    :goto_d
    return-void

    :cond_e
    const-string v3, "com.miui.player.metachanged"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    const-string v3, "other"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, extra:Ljava/lang/String;
    const-string v3, "meta_changed_track"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-direct {p0, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->setTrackInfo(Landroid/content/Intent;)V

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestAlbum(Landroid/content/Intent;)V
    invoke-static {v3, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$000(Lmiui/app/screenelement/elements/MusicControlScreenElement;Landroid/content/Intent;)V

    goto :goto_d

    :cond_2d
    const-string v3, "meta_changed_album"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    const/4 v4, 0x1

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestAlbum(Landroid/content/Intent;Z)V
    invoke-static {v3, p2, v4}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$100(Lmiui/app/screenelement/elements/MusicControlScreenElement;Landroid/content/Intent;Z)V

    goto :goto_d

    :cond_3c
    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestAlbum()V
    invoke-static {v3}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$200(Lmiui/app/screenelement/elements/MusicControlScreenElement;)V

    goto :goto_d

    .end local v1           #extra:Ljava/lang/String;
    :cond_42
    const-string v3, "lockscreen.action.SONG_METADATA_UPDATED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-direct {p0, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->setTrackInfo(Landroid/content/Intent;)V

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->setAlbumCover(Landroid/content/Intent;)V
    invoke-static {v3, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$300(Lmiui/app/screenelement/elements/MusicControlScreenElement;Landroid/content/Intent;)V

    goto :goto_d

    :cond_53
    const-string v3, "com.miui.player.refreshprogress"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_67

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    const-string v4, "blocking"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    #setter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mIsOnlineSongBlocking:Z
    invoke-static {v3, v4}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$402(Lmiui/app/screenelement/elements/MusicControlScreenElement;Z)Z

    goto :goto_d

    :cond_67
    const-string v3, "com.miui.player.playstatechanged"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v3}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v3

    if-eqz v3, :cond_86

    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #getter for: Lmiui/app/screenelement/elements/MusicControlScreenElement;->mTextDisplay:Lmiui/app/screenelement/elements/TextScreenElement;
    invoke-static {v3}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$500(Lmiui/app/screenelement/elements/MusicControlScreenElement;)Lmiui/app/screenelement/elements/TextScreenElement;

    move-result-object v3

    invoke-virtual {v3}, Lmiui/app/screenelement/elements/TextScreenElement;->isVisible()Z

    move-result v3

    if-nez v3, :cond_86

    invoke-direct {p0, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->setTrackInfo(Landroid/content/Intent;)V

    :cond_86
    iget-object v3, p0, Lmiui/app/screenelement/elements/MusicControlScreenElement$1;->this$0:Lmiui/app/screenelement/elements/MusicControlScreenElement;

    #calls: Lmiui/app/screenelement/elements/MusicControlScreenElement;->requestAlbum(Landroid/content/Intent;)V
    invoke-static {v3, p2}, Lmiui/app/screenelement/elements/MusicControlScreenElement;->access$000(Lmiui/app/screenelement/elements/MusicControlScreenElement;Landroid/content/Intent;)V

    goto :goto_d
.end method
