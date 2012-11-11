.class public Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/BuiltinVariableBinders;
.super Ljava/lang/Object;
.source "BuiltinVariableBinders.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fill(Lmiui/app/screenelement/data/VariableBinderManager;)V
    .registers 1
    .parameter "m"

    .prologue
    invoke-static {p0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/BuiltinVariableBinders;->fillMissedCall(Lmiui/app/screenelement/data/VariableBinderManager;)V

    invoke-static {p0}, Lcom/miui/internal/policy/impl/AwesomeLockScreenImp/BuiltinVariableBinders;->fillUnreadSms(Lmiui/app/screenelement/data/VariableBinderManager;)V

    return-void
.end method

.method private static fillMissedCall(Lmiui/app/screenelement/data/VariableBinderManager;)V
    .registers 5
    .parameter "m"

    .prologue
    const/4 v2, 0x2

    new-array v0, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_id"

    aput-object v3, v0, v2

    const/4 v2, 0x1

    const-string v3, "number"

    aput-object v3, v0, v2

    .local v0, columns:[Ljava/lang/String;
    const-string v1, "type=3 AND new=1"

    .local v1, where:Ljava/lang/String;
    const-string v2, "content://call_log/calls"

    invoke-virtual {p0, v2}, Lmiui/app/screenelement/data/VariableBinderManager;->addContentProviderBinder(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setColumns([Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setWhere(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v2

    const-string v3, "call_missed_count"

    invoke-virtual {v2, v3}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setCountName(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    return-void
.end method

.method private static fillUnreadSms(Lmiui/app/screenelement/data/VariableBinderManager;)V
    .registers 4
    .parameter "m"

    .prologue
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    .local v0, columns:[Ljava/lang/String;
    const-string v1, "content://sms/inbox"

    invoke-virtual {p0, v1}, Lmiui/app/screenelement/data/VariableBinderManager;->addContentProviderBinder(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setColumns([Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v1

    const-string v2, "seen=0 AND read=0"

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setWhere(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    move-result-object v1

    const-string v2, "sms_unread_count"

    invoke-virtual {v1, v2}, Lmiui/app/screenelement/data/ContentProviderBinder$Builder;->setCountName(Ljava/lang/String;)Lmiui/app/screenelement/data/ContentProviderBinder$Builder;

    return-void
.end method
