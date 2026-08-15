.class public final enum Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/ViviTV/fragmens/VodPlayFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "q0"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum LOAD_VOD_DETAIL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum LOCAL_PARSE:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum NO_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum RETRIEVE_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum VIDEO_PLAYER:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

.field public static final enum VIDEO_PLAYER_TIMEOUT_ERROR:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;


# instance fields
.field resId:I

.field val:I


# direct methods
.method private static synthetic $values()[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->LOAD_VOD_DETAIL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->VIDEO_PLAYER:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->RETRIEVE_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->LOCAL_PARSE:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->NO_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->VIDEO_PLAYER_TIMEOUT_ERROR:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x65

    sget v2, Landroid/media/ViviTV/R$string;->vod_detail_failed:I

    const-string v3, "LOAD_VOD_DETAIL"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->LOAD_VOD_DETAIL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x66

    sget v2, Landroid/media/ViviTV/R$string;->vod_play_failed:I

    const-string v3, "VIDEO_PLAYER"

    const/4 v4, 0x1

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->VIDEO_PLAYER:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x67

    sget v2, Landroid/media/ViviTV/R$string;->vod_fetch_url_faild:I

    const-string v3, "RETRIEVE_URL"

    const/4 v4, 0x2

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->RETRIEVE_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x68

    sget v2, Landroid/media/ViviTV/R$string;->vod_parse_url_faild:I

    const-string v3, "LOCAL_PARSE"

    const/4 v4, 0x3

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->LOCAL_PARSE:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x69

    sget v2, Landroid/media/ViviTV/R$string;->vod_no_url:I

    const-string v3, "NO_URL"

    const/4 v4, 0x4

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->NO_URL:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    new-instance v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    const/16 v1, 0x6a

    sget v2, Landroid/media/ViviTV/R$string;->vod_play_failed:I

    const-string v3, "VIDEO_PLAYER_TIMEOUT_ERROR"

    const/4 v4, 0x5

    invoke-direct {v0, v3, v4, v1, v2}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;-><init>(Ljava/lang/String;III)V

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->VIDEO_PLAYER_TIMEOUT_ERROR:Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    invoke-static {}, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->$values()[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    move-result-object v0

    sput-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->$VALUES:[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->val:I

    iput p4, p0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->resId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;
    .locals 1

    const-class v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    return-object p0
.end method

.method public static values()[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;
    .locals 1

    sget-object v0, Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->$VALUES:[Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    invoke-virtual {v0}, [Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/media/ViviTV/fragmens/VodPlayFragment$q0;

    return-object v0
.end method
