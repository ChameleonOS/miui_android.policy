.class public Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;
.super Ljava/lang/Object;
.source "MiuiLockScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ContactInfo"
.end annotation


# instance fields
.field public name:Ljava/lang/String;

.field final synthetic this$1:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;


# direct methods
.method protected constructor <init>(Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;)V
    .registers 3
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;->this$1:Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/policy/impl/MiuiLockScreen$PreviewCursorAdpater$ContactInfo;->name:Ljava/lang/String;

    return-void
.end method
