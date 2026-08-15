.class public Landroid/media/ViviTV/model/persistent/AdScheduleInfo;
.super LnU;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime LkV;
.end annotation


# instance fields
.field private deviceGroupId:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "DeviceGroupId"
    .end annotation
.end field

.field private endDate:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "EndDate"
    .end annotation
.end field

.field private loopPlayBack:I
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "LoopPlayBack"
    .end annotation
.end field

.field private playJson:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "PlayJson"
    .end annotation
.end field

.field private playJsonInfo:Landroid/media/ViviTV/model/persistent/AdPlayJsonInfo;

.field private playPeriod:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "PlayPeriod"
    .end annotation
.end field

.field private programList:Ljava/util/List;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ProgramList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/AdProgramInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Lvr;
    .end annotation
.end field

.field private programListId:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ProgramListId"
    .end annotation
.end field

.field private scheduleId:I
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ScheduleId"
    .end annotation
.end field

.field private scheduleName:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "ScheduleName"
    .end annotation
.end field

.field private startDate:Ljava/lang/String;
    .annotation runtime Lcom/alibaba/fastjson/annotation/JSONField;
        name = "StartDate"
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

.method public static getDateToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public getDeviceGroupId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getEndDate()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getLoopPlayBack()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getPlayJson()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayJsonInfo()Landroid/media/ViviTV/model/persistent/AdPlayJsonInfo;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayPeriod()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getProgramList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/AdProgramInfo;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getProgramListId()Ljava/lang/String;
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

.method public getScheduleName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public setDeviceGroupId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public setLoopPlayBack(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayJson(Ljava/lang/String;)V
    .locals 1

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public setPlayJsonInfo(Landroid/media/ViviTV/model/persistent/AdPlayJsonInfo;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayPeriod(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setProgramList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/AdProgramInfo;",
            ">;)V"
        }
    .end annotation

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

.method public setProgramListId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setScheduleId(I)V
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

.method public setScheduleName(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method
