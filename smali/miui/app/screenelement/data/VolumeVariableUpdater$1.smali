.class Lmiui/app/screenelement/data/VolumeVariableUpdater$1;
.super Ljava/lang/Object;
.source "VolumeVariableUpdater.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/VolumeVariableUpdater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/data/VolumeVariableUpdater;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/data/VolumeVariableUpdater;)V
    .registers 2
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/data/VolumeVariableUpdater$1;->this$0:Lmiui/app/screenelement/data/VolumeVariableUpdater;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/data/VolumeVariableUpdater$1;->this$0:Lmiui/app/screenelement/data/VolumeVariableUpdater;

    #getter for: Lmiui/app/screenelement/data/VolumeVariableUpdater;->mVolumeType:Lmiui/app/screenelement/util/IndexedNumberVariable;
    invoke-static {v0}, Lmiui/app/screenelement/data/VolumeVariableUpdater;->access$000(Lmiui/app/screenelement/data/VolumeVariableUpdater;)Lmiui/app/screenelement/util/IndexedNumberVariable;

    move-result-object v0

    const-wide/high16 v1, -0x4010

    invoke-virtual {v0, v1, v2}, Lmiui/app/screenelement/util/IndexedNumberVariable;->set(D)V

    return-void
.end method
