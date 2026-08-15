.class public Landroid/media/ViviTV/model/persistent/EpgItemInfo;
.super LnU;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static NOT_SET:Ljava/util/Date;


# instance fields
.field private channelId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cid"
    .end annotation
.end field

.field private endHour:I
    .annotation runtime Lvr;
    .end annotation
.end field

.field private endTime:Ljava/lang/String;
    .annotation runtime Lvr;
    .end annotation
.end field

.field private infoId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field private isPlaceholder:Z
    .annotation runtime Lvr;
    .end annotation
.end field

.field private nameMultiLang:Ljava/util/Map;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "nameMulLang"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Lvr;
    .end annotation
.end field

.field private nameMultiLangJson:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
        deserialize = false
        serialize = false
    .end annotation
.end field

.field private playDate:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "date"
    .end annotation
.end field

.field private playDateTime:Ljava/util/Date;
    .annotation runtime Lvr;
    .end annotation
.end field

.field private playDayOfWeek:I
    .annotation runtime Lvr;
    .end annotation
.end field

.field private playMonthDay:Ljava/lang/String;
    .annotation runtime Lvr;
    .end annotation
.end field

.field private playTime:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "time"
    .end annotation
.end field

.field private playUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url"
    .end annotation
.end field

.field private playUrlNextHour:Ljava/lang/String;
    .annotation runtime Lvr;
    .end annotation
.end field

.field private programName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private startHour:I
    .annotation runtime Lvr;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/Date;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Landroid/media/ViviTV/model/persistent/EpgItemInfo;->NOT_SET:Ljava/util/Date;

    return-void
.end method

.method public constructor <init>()V
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
.end method

.method public constructor <init>(Landroid/media/ViviTV/model/persistent/EpgItemInfo;)V
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


# virtual methods
.method public getChannelId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getEndHour()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getEndTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getInfoId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getNameMultiLang()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getNameMultiLangJson()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayDate()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayDateTime()Ljava/util/Date;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayDayOfWeek()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getPlayMonthDay()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop

    nop

    nop

    nop

    nop
.end method

.method public getPlayTime()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayUrl()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlayUrlNextHour()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getProgramName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getProgramNameForLang(I)Ljava/lang/String;
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

.method public getStartHour()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public initPlayDateTime()V
    .locals 3

    :try_start_0
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
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    :catch_0
    nop

    nop

    nop

    nop

    nop
.end method

.method public initPlayMonDayWeekByPlayDateTime(Z)V
    .locals 8

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    nop
.end method

.method public isPlaceholder()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public parseNameMultipleLanguage()V
    .locals 5

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

.method public setChannelId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setEndHour(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setInfoId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setNameMultiLang(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public setNameMultiLangJson(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlaceholder(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayDate(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayDateTime(Ljava/util/Date;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayDayOfWeek(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayMonthDay(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayTime(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayUrl(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlayUrlNextHour(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setProgramName(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setStartHour(I)V
    .locals 0

    return-void

    nop

    nop
.end method
