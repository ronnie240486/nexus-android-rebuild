.class public final enum Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/ViviTV/fragmens/PasswordVerifyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

.field public static final enum INPUT_PWD:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

.field public static final enum MODIFY_PWD_SAVE:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

.field public static final enum MODIFY_PWD_VERIFY:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;


# direct methods
.method private static synthetic $values()[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    sget-object v1, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->INPUT_PWD:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->MODIFY_PWD_VERIFY:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->MODIFY_PWD_SAVE:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const-string v1, "INPUT_PWD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->INPUT_PWD:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    new-instance v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const-string v1, "MODIFY_PWD_VERIFY"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->MODIFY_PWD_VERIFY:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    new-instance v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    const-string v1, "MODIFY_PWD_SAVE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->MODIFY_PWD_SAVE:Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    invoke-static {}, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->$values()[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    move-result-object v0

    sput-object v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->$VALUES:[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;
    .locals 1

    const-class v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    return-object p0
.end method

.method public static values()[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;
    .locals 1

    sget-object v0, Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->$VALUES:[Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    invoke-virtual {v0}, [Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/media/ViviTV/fragmens/PasswordVerifyFragment$a;

    return-object v0
.end method
