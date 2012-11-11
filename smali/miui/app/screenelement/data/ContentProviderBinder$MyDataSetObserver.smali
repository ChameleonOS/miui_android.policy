.class Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "ContentProviderBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/ContentProviderBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyDataSetObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/data/ContentProviderBinder;


# direct methods
.method private constructor <init>(Lmiui/app/screenelement/data/ContentProviderBinder;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lmiui/app/screenelement/data/ContentProviderBinder;Lmiui/app/screenelement/data/ContentProviderBinder$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;-><init>(Lmiui/app/screenelement/data/ContentProviderBinder;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mFinished:Z
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$300(Lmiui/app/screenelement/data/ContentProviderBinder;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #calls: Lmiui/app/screenelement/data/ContentProviderBinder;->updateVariables()V
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$400(Lmiui/app/screenelement/data/ContentProviderBinder;)V

    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mQueryCompletedListener:Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$500(Lmiui/app/screenelement/data/ContentProviderBinder;)Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mQueryCompletedListener:Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$500(Lmiui/app/screenelement/data/ContentProviderBinder;)Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    iget-object v1, v1, Lmiui/app/screenelement/data/ContentProviderBinder;->mName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;->onQueryCompleted(Ljava/lang/String;)V

    goto :goto_8
.end method

.method public onInvalidated()V
    .registers 3

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mFinished:Z
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$300(Lmiui/app/screenelement/data/ContentProviderBinder;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #calls: Lmiui/app/screenelement/data/ContentProviderBinder;->updateVariables()V
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$400(Lmiui/app/screenelement/data/ContentProviderBinder;)V

    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mQueryCompletedListener:Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$500(Lmiui/app/screenelement/data/ContentProviderBinder;)Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    #getter for: Lmiui/app/screenelement/data/ContentProviderBinder;->mQueryCompletedListener:Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;
    invoke-static {v0}, Lmiui/app/screenelement/data/ContentProviderBinder;->access$500(Lmiui/app/screenelement/data/ContentProviderBinder;)Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;

    move-result-object v0

    iget-object v1, p0, Lmiui/app/screenelement/data/ContentProviderBinder$MyDataSetObserver;->this$0:Lmiui/app/screenelement/data/ContentProviderBinder;

    iget-object v1, v1, Lmiui/app/screenelement/data/ContentProviderBinder;->mName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lmiui/app/screenelement/data/ContentProviderBinder$QueryCompleteListener;->onQueryCompleted(Ljava/lang/String;)V

    goto :goto_8
.end method
