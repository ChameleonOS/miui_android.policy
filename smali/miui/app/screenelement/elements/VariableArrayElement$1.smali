.class Lmiui/app/screenelement/elements/VariableArrayElement$1;
.super Ljava/lang/Object;
.source "VariableArrayElement.java"

# interfaces
.implements Lmiui/app/screenelement/util/Utils$XmlTraverseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/app/screenelement/elements/VariableArrayElement;-><init>(Lorg/w3c/dom/Element;Lmiui/app/screenelement/ScreenContext;Lmiui/app/screenelement/ScreenElementRoot;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/elements/VariableArrayElement;


# direct methods
.method constructor <init>(Lmiui/app/screenelement/elements/VariableArrayElement;)V
    .registers 2
    .parameter

    .prologue
    .line 158
    iput-object p1, p0, Lmiui/app/screenelement/elements/VariableArrayElement$1;->this$0:Lmiui/app/screenelement/elements/VariableArrayElement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChild(Lorg/w3c/dom/Element;)V
    .registers 5
    .parameter "child"

    .prologue
    .line 161
    iget-object v0, p0, Lmiui/app/screenelement/elements/VariableArrayElement$1;->this$0:Lmiui/app/screenelement/elements/VariableArrayElement;

    #getter for: Lmiui/app/screenelement/elements/VariableArrayElement;->mVars:Ljava/util/ArrayList;
    invoke-static {v0}, Lmiui/app/screenelement/elements/VariableArrayElement;->access$200(Lmiui/app/screenelement/elements/VariableArrayElement;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lmiui/app/screenelement/elements/VariableArrayElement$Var;

    iget-object v2, p0, Lmiui/app/screenelement/elements/VariableArrayElement$1;->this$0:Lmiui/app/screenelement/elements/VariableArrayElement;

    invoke-direct {v1, v2, p1}, Lmiui/app/screenelement/elements/VariableArrayElement$Var;-><init>(Lmiui/app/screenelement/elements/VariableArrayElement;Lorg/w3c/dom/Element;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    return-void
.end method
