.class Lcom/android/internal/policy/impl/KeyguardUpdateMonitor$Injector;
.super Ljava/lang/Object;
.source "KeyguardUpdateMonitor.java"


# annotations
.annotation build Landroid/annotation/MiuiHook;
    value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_CLASS:Landroid/annotation/MiuiHook$MiuiHookType;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/KeyguardUpdateMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getIccCardState(Ljava/lang/String;)Lcom/android/internal/telephony/IccCard$State;
    .registers 3
    .parameter "stateExtra"

    .prologue
    const-string v1, "IMSI"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    sget-object v0, Lcom/android/internal/telephony/IccCard$State;->READY:Lcom/android/internal/telephony/IccCard$State;

    .local v0, state:Lcom/android/internal/telephony/IccCard$State;
    :goto_a
    return-object v0

    .end local v0           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_b
    const-string v1, "LOADED"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    sget-object v0, Lcom/android/internal/telephony/IccCard$State;->READY:Lcom/android/internal/telephony/IccCard$State;

    .restart local v0       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_a

    .end local v0           #state:Lcom/android/internal/telephony/IccCard$State;
    :cond_16
    sget-object v0, Lcom/android/internal/telephony/IccCard$State;->UNKNOWN:Lcom/android/internal/telephony/IccCard$State;

    .restart local v0       #state:Lcom/android/internal/telephony/IccCard$State;
    goto :goto_a
.end method
