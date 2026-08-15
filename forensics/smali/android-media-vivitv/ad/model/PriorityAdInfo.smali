.class public Landroid/media/ViviTV/ad/model/PriorityAdInfo;
.super Landroid/media/ViviTV/ad/model/MultimediaAdInfo;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;
.implements Landroid/media/ViviTV/ad/view/PictureVideoAdView$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/media/ViviTV/ad/model/MultimediaAdInfo;",
        "Ljava/lang/Comparable<",
        "Landroid/media/ViviTV/ad/model/PriorityAdInfo;",
        ">;",
        "Landroid/media/ViviTV/ad/view/PictureVideoAdView$d;"
    }
.end annotation


# static fields
.field private static final FMT:Ljava/text/SimpleDateFormat;

.field private static final FMT_STR:Ljava/lang/String; = "yyyy-MM-dd HH:mm:ss"


# instance fields
.field private endTime:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "EndTime"
    .end annotation
.end field

.field private endTimestamp:J
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        deserialize = false
        serialize = false
    .end annotation
.end field

.field private instanceCreateTime:J
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        deserialize = false
        serialize = false
    .end annotation
.end field

.field private mergedList:Ljava/util/List;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        deserialize = false
        serialize = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/ViviTV/ad/model/PriorityAdInfo;",
            ">;"
        }
    .end annotation
.end field

.field private priority:I
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "Level"
    .end annotation
.end field

.field private serverTime:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ServerTime"
    .end annotation
.end field

.field private startTime:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "StartTime"
    .end annotation
.end field

.field private startTimestamp:J
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        deserialize = false
        serialize = false
    .end annotation
.end field

.field private type:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "InformType"
    .end annotation
.end field

.field private typeEnum:Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        deserialize = false
        serialize = false
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/media/ViviTV/ad/model/PriorityAdInfo;->FMT:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    return-void

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method private final parseToTimestamp(Ljava/lang/String;)J
    .locals 3

    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop

    nop

    nop

    nop

    :try_start_0
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    :catch_0
    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public compareTo(Landroid/media/ViviTV/ad/model/PriorityAdInfo;)I
    .locals 5
    .param p1    # Landroid/media/ViviTV/ad/model/PriorityAdInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0

    nop

    nop

    nop

    nop

    nop
.end method

.method public getEndTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getEndTimestamp()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getInstanceCreateTime()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getMergedList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/ad/model/PriorityAdInfo;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPriority()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getServerTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getStartTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getStartTimestamp()J
    .locals 5

    const-wide/16 v0, 0x0

    return-wide v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public getTextAdItemContent()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop
.end method

.method public getTextAdItemDuration()I
    .locals 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getTypeEnum()Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setEndTimestamp(J)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setInstanceCreateTime(J)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setMergedList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/ad/model/PriorityAdInfo;",
            ">;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public setPriority(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setServerTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setStartTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setStartTimestamp(J)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setTypeEnum(Landroid/media/ViviTV/ad/model/PriorityAdInfo$Type;)V
    .locals 0

    return-void

    nop

    nop
.end method
