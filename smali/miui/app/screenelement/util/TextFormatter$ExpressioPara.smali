.class Lmiui/app/screenelement/util/TextFormatter$ExpressioPara;
.super Lmiui/app/screenelement/util/TextFormatter$FormatPara;
.source "TextFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/util/TextFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExpressioPara"
.end annotation


# instance fields
.field private mExp:Lmiui/app/screenelement/data/Expression;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/Expression;)V
    .registers 3
    .parameter "exp"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lmiui/app/screenelement/util/TextFormatter$FormatPara;-><init>(Lmiui/app/screenelement/util/TextFormatter$1;)V

    iput-object p1, p0, Lmiui/app/screenelement/util/TextFormatter$ExpressioPara;->mExp:Lmiui/app/screenelement/data/Expression;

    return-void
.end method


# virtual methods
.method public evaluate(Lmiui/app/screenelement/data/Variables;)Ljava/lang/Object;
    .registers 4
    .parameter "var"

    .prologue
    iget-object v0, p0, Lmiui/app/screenelement/util/TextFormatter$ExpressioPara;->mExp:Lmiui/app/screenelement/data/Expression;

    invoke-virtual {v0, p1}, Lmiui/app/screenelement/data/Expression;->evaluate(Lmiui/app/screenelement/data/Variables;)D

    move-result-wide v0

    double-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method
