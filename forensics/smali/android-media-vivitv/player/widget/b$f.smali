.class public final enum Landroid/media/ViviTV/player/widget/b$f;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/ViviTV/player/widget/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/media/ViviTV/player/widget/b$f;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/media/ViviTV/player/widget/b$f;

.field public static final enum LIVE:Landroid/media/ViviTV/player/widget/b$f;

.field public static final enum LIVE_PLAYBACK_OR_HLS:Landroid/media/ViviTV/player/widget/b$f;

.field public static final enum REAL_TIME_LIVE:Landroid/media/ViviTV/player/widget/b$f;

.field public static final enum VOD:Landroid/media/ViviTV/player/widget/b$f;


# direct methods
.method private static synthetic $values()[Landroid/media/ViviTV/player/widget/b$f;
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Landroid/media/ViviTV/player/widget/b$f;

    sget-object v1, Landroid/media/ViviTV/player/widget/b$f;->REAL_TIME_LIVE:Landroid/media/ViviTV/player/widget/b$f;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/player/widget/b$f;->LIVE:Landroid/media/ViviTV/player/widget/b$f;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/player/widget/b$f;->VOD:Landroid/media/ViviTV/player/widget/b$f;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/player/widget/b$f;->LIVE_PLAYBACK_OR_HLS:Landroid/media/ViviTV/player/widget/b$f;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/media/ViviTV/player/widget/b$f;

    const-string v1, "REAL_TIME_LIVE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/player/widget/b$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/player/widget/b$f;->REAL_TIME_LIVE:Landroid/media/ViviTV/player/widget/b$f;

    new-instance v0, Landroid/media/ViviTV/player/widget/b$f;

    const-string v1, "LIVE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/player/widget/b$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/player/widget/b$f;->LIVE:Landroid/media/ViviTV/player/widget/b$f;

    new-instance v0, Landroid/media/ViviTV/player/widget/b$f;

    const-string v1, "VOD"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/player/widget/b$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/player/widget/b$f;->VOD:Landroid/media/ViviTV/player/widget/b$f;

    new-instance v0, Landroid/media/ViviTV/player/widget/b$f;

    const-string v1, "LIVE_PLAYBACK_OR_HLS"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/player/widget/b$f;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/player/widget/b$f;->LIVE_PLAYBACK_OR_HLS:Landroid/media/ViviTV/player/widget/b$f;

    invoke-static {}, Landroid/media/ViviTV/player/widget/b$f;->$values()[Landroid/media/ViviTV/player/widget/b$f;

    move-result-object v0

    sput-object v0, Landroid/media/ViviTV/player/widget/b$f;->$VALUES:[Landroid/media/ViviTV/player/widget/b$f;

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

.method public static valueOf(Ljava/lang/String;)Landroid/media/ViviTV/player/widget/b$f;
    .locals 1

    const-class v0, Landroid/media/ViviTV/player/widget/b$f;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/media/ViviTV/player/widget/b$f;

    return-object p0
.end method

.method public static values()[Landroid/media/ViviTV/player/widget/b$f;
    .locals 1

    sget-object v0, Landroid/media/ViviTV/player/widget/b$f;->$VALUES:[Landroid/media/ViviTV/player/widget/b$f;

    invoke-virtual {v0}, [Landroid/media/ViviTV/player/widget/b$f;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/media/ViviTV/player/widget/b$f;

    return-object v0
.end method
