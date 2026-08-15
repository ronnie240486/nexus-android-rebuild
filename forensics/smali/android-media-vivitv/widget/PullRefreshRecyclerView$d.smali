.class public final enum Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/ViviTV/widget/PullRefreshRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

.field public static final enum HORIZONTAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

.field public static final enum VERTICAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;


# direct methods
.method private static synthetic $values()[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    sget-object v1, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->VERTICAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->HORIZONTAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    const-string v1, "VERTICAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->VERTICAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    new-instance v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    const-string v1, "HORIZONTAL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->HORIZONTAL:Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    invoke-static {}, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->$values()[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    move-result-object v0

    sput-object v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->$VALUES:[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

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

.method public static valueOf(Ljava/lang/String;)Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;
    .locals 1

    const-class v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    return-object p0
.end method

.method public static values()[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;
    .locals 1

    sget-object v0, Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->$VALUES:[Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    invoke-virtual {v0}, [Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/media/ViviTV/widget/PullRefreshRecyclerView$d;

    return-object v0
.end method
