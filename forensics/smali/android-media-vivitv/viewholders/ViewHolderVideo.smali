.class public Landroid/media/ViviTV/viewholders/ViewHolderVideo;
.super Landroid/media/ViviTV/viewholders/BaseHomeRecyclerViewHolder;
.source "SourceFile"

# interfaces
.implements Landroid/media/ViviTV/player/widget/a$b;
.implements Landroid/media/ViviTV/player/widget/a$c;
.implements Landroid/media/ViviTV/player/widget/a$g;
.implements LXq;
.implements LKq;
.implements Landroid/media/ViviTV/player/widget/a$d;
.implements LCq;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/ViviTV/viewholders/ViewHolderVideo$VideoWindowReceiver;,
        Landroid/media/ViviTV/viewholders/ViewHolderVideo$d;
    }
.end annotation


# static fields
.field public static J:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static K:Ljava/lang/String; = null

.field public static L:Ljava/lang/String; = null

.field public static M:Ljava/lang/String; = null

.field public static N:Ljava/lang/String; = null

.field public static final O:I = 0x14


# instance fields
.field public A:Landroid/view/animation/Animation;

.field public B:Landroid/media/ViviTV/viewholders/ViewHolderVideo$VideoWindowReceiver;

.field public C:Landroid/media/ViviTV/model/persistent/VodRecode;

.field public D:Ler;

.field public E:LB30;

.field public F:LpP;

.field public G:I

.field public H:Ljava/lang/Runnable;

.field public I:Landroid/os/Handler;

.field public n:I

.field public o:Ljava/lang/String;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public q:Landroid/media/ViviTV/player/widget/DolitVideoView;

.field public r:Z

.field public s:Landroid/widget/TextView;

.field public t:Z

.field public u:Lcp;

.field public v:I

.field public w:Z

.field public x:I

.field public y:Landroid/widget/ImageView;

.field public z:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/media/ViviTV/viewholders/ViewHolderVideo;->J:Ljava/util/HashMap;

    const-string v0, "cn.dolit.ott.VIDEO_WINDOW"

    sput-object v0, Landroid/media/ViviTV/viewholders/ViewHolderVideo;->K:Ljava/lang/String;

    const-string v0, "PLAY_STATUS"

    sput-object v0, Landroid/media/ViviTV/viewholders/ViewHolderVideo;->L:Ljava/lang/String;

    const-string v0, "STOP"

    sput-object v0, Landroid/media/ViviTV/viewholders/ViewHolderVideo;->M:Ljava/lang/String;

    const-string v0, "CONTINUE"

    sput-object v0, Landroid/media/ViviTV/viewholders/ViewHolderVideo;->N:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public static synthetic I(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)V
    .locals 0

    return-void

    nop

    nop

    nop
.end method

.method public static synthetic K(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)Landroid/widget/ImageView;
    .locals 0

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method public static synthetic L(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)V
    .locals 0

    return-void

    nop

    nop

    nop
.end method

.method public static synthetic M(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)V
    .locals 0

    return-void

    nop

    nop

    nop
.end method

.method public static synthetic N(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)V
    .locals 0

    return-void

    nop

    nop

    nop
.end method

.method public static synthetic O(Landroid/media/ViviTV/viewholders/ViewHolderVideo;)Landroid/os/Handler;
    .locals 0

    const/4 p0, 0x0

    return-object p0

    nop
.end method

.method private Q()Landroid/media/ViviTV/model/persistent/VodRecode;
    .locals 10

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
.end method

.method private synthetic T()V
    .locals 0

    return-void

    nop

    nop

    nop
.end method


# virtual methods
.method public B0(Ljava/lang/Object;II)Z
    .locals 0

    const/4 p0, 0x0

    return p0

    nop

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

.method public C(Lcp;)V
    .locals 3

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public J()V
    .locals 6

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
.end method

.method public final P()V
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
.end method

.method public final R()V
    .locals 4

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
.end method

.method public final S()V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public final U()V
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
.end method

.method public final V(Landroid/net/Uri;Ljava/lang/String;)Z
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public final W()V
    .locals 0

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public final X()V
    .locals 3

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    nop
.end method

.method public Y(Ljava/lang/Boolean;)V
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
.end method

.method public final Z()V
    .locals 3

    return-void

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

.method public final a0()V
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
.end method

.method public b()Ljava/lang/Object;
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
.end method

.method public final b0()V
    .locals 3

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public d(Ljava/lang/Object;)V
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

    nop

    nop

    nop

    nop

    nop
.end method

.method public final d0()V
    .locals 2

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    nop
.end method

.method public e(Landroid/view/View;I)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public final e0(I)V
    .locals 3

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

.method public f(I)V
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
.end method

.method public final f0(I)V
    .locals 0

    return-void

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public g(Z)Z
    .locals 0

    const/4 p0, 0x0

    return p0

    nop

    nop

    nop

    nop

    nop

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

.method public final g0()V
    .locals 2

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

.method public getExtras()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
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

    nop
.end method

.method public h()Ljava/lang/String;
    .locals 4

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
.end method

.method public h0(Ljava/lang/Object;)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop
.end method

.method public final i0()V
    .locals 4

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
.end method

.method public j(Ljava/lang/Object;IIJ)Z
    .locals 0

    const/4 p0, 0x0

    return p0

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public o()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    return v0
.end method

.method public u(Ljava/lang/Object;II)V
    .locals 0

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
.end method
