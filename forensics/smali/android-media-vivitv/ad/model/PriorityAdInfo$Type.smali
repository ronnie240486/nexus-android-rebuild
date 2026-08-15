.class public final enum Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/media/ViviTV/ad/model/PriorityAdInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

.field public static final enum IMAGE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

.field public static final enum NONE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

.field public static final enum TEXT:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

.field public static final enum VIDEO:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;


# instance fields
.field private canMerged:Z

.field private strValue:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    sget-object v1, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->NONE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->TEXT:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->IMAGE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->VIDEO:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const-string v1, "none"

    const-string v2, "NONE"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1, v3}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->NONE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    new-instance v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v1, 0x1

    const-string v2, "urgentMsg"

    const-string v4, "TEXT"

    invoke-direct {v0, v4, v1, v2, v1}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->TEXT:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    new-instance v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v1, 0x2

    const-string v2, "image"

    const-string v4, "IMAGE"

    invoke-direct {v0, v4, v1, v2, v3}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->IMAGE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    new-instance v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    const/4 v1, 0x3

    const-string v2, "video"

    const-string v4, "VIDEO"

    invoke-direct {v0, v4, v1, v2, v3}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->VIDEO:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    invoke-static {}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->$values()[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    move-result-object v0

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->$VALUES:[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->strValue:Ljava/lang/String;

    iput-boolean p4, p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->canMerged:Z

    return-void
.end method

.method public static from(Ljava/lang/String;)Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .locals 5

    invoke-static {}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->values()[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->strValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->NONE:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .locals 1

    const-class v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    return-object p0
.end method

.method public static values()[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .locals 1

    sget-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->$VALUES:[Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    invoke-virtual {v0}, [Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;

    return-object v0
.end method


# virtual methods
.method public canMerged()Z
    .locals 1

    iget-boolean v0, p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->canMerged:Z

    return v0
.end method

.method public strValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;->strValue:Ljava/lang/String;

    return-object v0
.end method
