.class public Landroid/media/ViviTV/model/persistent/AdPlayTimeInfo;
.super LnU;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private endTime:Ljava/lang/String;

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "name"
    .end annotation
.end field

.field private scheduleId:I

.field private startTime:Ljava/lang/String;

.field private time:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "time"
    .end annotation
.end field

.field private timeList:Ljava/util/List;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "timeList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    return-void

    nop

    nop

    nop
.end method


# virtual methods
.method public getEndTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getScheduleId()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getStartTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getTimeList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

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
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setScheduleId(I)V
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

.method public setTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setTimeList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method
