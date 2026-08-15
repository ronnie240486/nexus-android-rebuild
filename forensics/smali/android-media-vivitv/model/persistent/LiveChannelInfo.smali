.class public Landroid/media/ViviTV/model/persistent/LiveChannelInfo;
.super LnU;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final VIDEO_TYPE_FREE:I = 0x0

.field public static final VIDEO_TYPE_VIP:I = 0x1


# instance fields
.field private area:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "area"
    .end annotation
.end field

.field private duration:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "duration"
    .end annotation
.end field

.field private epgId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "epgId"
    .end annotation
.end field

.field private favorite:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "favorite"
    .end annotation
.end field

.field private huibo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "huibo"
    .end annotation
.end field

.field private icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon"
    .end annotation
.end field

.field private itemId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ChannelTypeId"
    .end annotation
.end field

.field private lastSource:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lastSource"
    .end annotation
.end field

.field private liveSources:[LQv;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Url"
    .end annotation

    .annotation runtime Lvr;
    .end annotation
.end field

.field private mLangItems:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "MultiLang"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/LiveChannelMultiLang;",
            ">;"
        }
    .end annotation

    .annotation runtime Lvr;
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Name"
    .end annotation
.end field

.field private num:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ChannelNum"
    .end annotation
.end field

.field private pinyin:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pinyin"
    .end annotation
.end field

.field private playbackMetaUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "HuiKanUrl"
    .end annotation
.end field

.field private quality:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Quality"
    .end annotation
.end field

.field private sortNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "SortNum"
    .end annotation
.end field

.field private sourceText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "urllist"
    .end annotation
.end field

.field private stationLogo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "StationLogo"
    .end annotation
.end field

.field private tId:[Ljava/lang/String;
    .annotation runtime Lvr;
    .end annotation
.end field

.field private vId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Id"
    .end annotation
.end field

.field private vipType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "VipType"
    .end annotation
.end field


# direct methods
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

    nop

    nop

    nop

    nop
.end method


# virtual methods
.method public getArea()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getDuration()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getEpgId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getFavorite()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getHuibo()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getItemId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getLangItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/LiveChannelMultiLang;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getLastSource()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getLiveSources()[LQv;
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

.method public getNum()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getPinyin()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getPlaybackMetaUrl()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getQuality()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getSimpleNameNumInfo()Ljava/lang/String;
    .locals 7

    :try_start_0
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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    :catch_0
    nop

    nop

    nop
.end method

.method public getSortNum()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public getSourceCount()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public getSourceText()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getSourceText([LQv;)Ljava/lang/String;
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public getSourceUrl(I)LQv;
    .locals 2

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
.end method

.method public getStationLogo()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getTidText([Ljava/lang/String;)Ljava/lang/String;
    .locals 3

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
.end method

.method public getVipType()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public gettId(I)Ljava/lang/String;
    .locals 2

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
.end method

.method public gettId()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public getvId()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public hasSameSourceWith(Landroid/media/ViviTV/model/persistent/LiveChannelInfo;)Z
    .locals 6

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
.end method

.method public isBelongsToType(Ljava/lang/String;)Z
    .locals 5

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
.end method

.method public isFavorite()Z
    .locals 2

    const/4 v0, 0x0

    return v0

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public isPlayingLastSource()Z
    .locals 4

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
.end method

.method public lessThanOneSource()Z
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
.end method

.method public setArea(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setDuration(J)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setEpgId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setFavorite(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setFavorite(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setHuibo(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setItemId(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setLangItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/ViviTV/model/persistent/LiveChannelMultiLang;",
            ">;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public setLastSource(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setLiveSources([LQv;)V
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

.method public setNum(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPinyin(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setPlaybackMetaUrl(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setQuality(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setSortNum(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setSourceText(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setStationLogo(Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setVipType(I)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public settId([Ljava/lang/String;)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public setvId(I)V
    .locals 0

    return-void

    nop

    nop
.end method
