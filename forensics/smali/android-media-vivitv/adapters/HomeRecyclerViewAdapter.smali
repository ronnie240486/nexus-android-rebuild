.class public Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;
.super Lcn/dolit/twowayviewlib/adapters/BaseSpannableRecyclerViewAdapter;
.source "SourceFile"


# static fields
.field public static final VT_APP_INSTALLED:I = 0x3e7

.field public static final VT_APP_INSTALLED_INFO:Lh30;

.field public static final VT_BANNER:I = 0xa

.field public static final VT_BANNER_INFO:Lh30;

.field public static final VT_BANNER_PAGER:I = 0x7fffffff

.field public static final VT_BANNER_PAGER_INFO:Lh30;

.field public static final VT_BANNER_WITH_RIGHT_TITLE:I = 0xe

.field public static final VT_BANNER_WITH_RIGHT_TITLE_INFO:Lh30;

.field public static final VT_EMPTY:I = 0x0

.field public static final VT_EMPTY_INFO:Lh30;

.field public static final VT_FAVOURITE:I = 0xc

.field public static final VT_FAVOURITE_INFO:Lh30;

.field public static final VT_GIF:I = 0x7

.field public static final VT_GIF_INFO:Lh30;

.field public static final VT_HOTEL:I = 0x15

.field public static final VT_HOTEL_INFO:Lh30;

.field public static final VT_HSCROLL:I = 0x16

.field public static final VT_HSCROLL_INFO:Lh30;

.field public static final VT_IMAGE:I = 0x1

.field public static final VT_IMAGE_INFO:Lh30;

.field public static final VT_LIKE_APP_ITEM:I = 0x4

.field public static final VT_LIKE_APP_ITEM_INFO:Lh30;

.field public static final VT_LIKE_NEWS:I = 0x3

.field public static final VT_LIKE_NEWS_INFO:Lh30;

.field public static final VT_LIKE_NEWS_MARQUEE:I = 0x9

.field public static final VT_LIKE_NEWS_MARQUEE_INFO:Lh30;

.field public static final VT_MOVIE_FULL_WIDTH:I = 0x6

.field public static final VT_MOVIE_FULL_WIDTH_INFO:Lh30;

.field public static final VT_PLAY_HISTORY:I = 0xb

.field public static final VT_PLAY_HISTORY_INFO:Lh30;

.field public static final VT_ROOM_INFO:I = 0x13

.field public static final VT_ROOM_INFO_INFO:Lh30;

.field public static final VT_TELEPLAY_BOTTOM_TEXT:I = 0x5

.field public static final VT_TELEPLAY_BOTTOM_TEXT_INFO:Lh30;

.field public static final VT_TELEPLAY_WITH_EPISODE:I = 0x2

.field public static final VT_TELEPLAY_WITH_EPISODE_INFO:Lh30;

.field public static final VT_TEXT:I = 0x12

.field public static final VT_TEXT_INFO:Lh30;

.field public static final VT_TITLE:I = 0x8

.field public static final VT_TITLE_INFO:Lh30;

.field public static final VT_VIDEO:I = 0x14

.field public static final VT_VIDEO_INFO:Lh30;

.field public static final u:I = 0x1

.field public static final v:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lh30;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public s:I

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LKq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v6, Lh30;

    sget v3, Landroid/media/ViviTV/R$layout;->layout_home_item_empty:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-class v2, Landroid/media/ViviTV/viewholders/EmptyViewHolder;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v6, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_EMPTY_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_image_view:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v8, 0x1

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderImage;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_IMAGE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_teleplay_with_episode:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v2, 0x2

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderTeleplay;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_TELEPLAY_WITH_EPISODE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_like_news:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v8, 0x3

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderLikeNews;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_LIKE_NEWS_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_like_app:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v2, 0x4

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderLikeApp;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_LIKE_APP_ITEM_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_teleplay_with_btm_text:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v8, 0x5

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderTeleplayBtmText;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_TELEPLAY_BOTTOM_TEXT_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_movie_full_width:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v2, 0x6

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderMovieFullWidth;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_MOVIE_FULL_WIDTH_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_gif:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/4 v8, 0x7

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderGif;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_GIF_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_title:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v2, 0x8

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderTitle;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_TITLE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_like_news_marquee:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/16 v8, 0x9

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderLikeNewsMarquee;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_LIKE_NEWS_MARQUEE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_banner:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/16 v2, 0xa

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderBanner;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_BANNER_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_play_history:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v8, 0xb

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderPlayHistory;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_PLAY_HISTORY_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_play_history:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v2, 0xc

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderFavorite;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_FAVOURITE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_app_installed:I

    const/16 v8, 0x3e7

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderAppInstalled;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_APP_INSTALLED_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_banner_pager:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const v2, 0x7fffffff

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderBannerPager;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_BANNER_PAGER_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_banner_with_right_title:I

    sget v11, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v12, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/16 v8, 0xe

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderBannerWithRightTitle;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_BANNER_WITH_RIGHT_TITLE_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_text_view:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/16 v2, 0x12

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderText;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_TEXT_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_text_view:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v8, 0x13

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderRoomInfo;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_ROOM_INFO_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_video:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v2, 0x14

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderVideo;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_VIDEO_INFO:Lh30;

    new-instance v0, Lh30;

    sget v10, Landroid/media/ViviTV/R$layout;->layout_home_item_image_view:I

    const/16 v8, 0x15

    const-class v9, Landroid/media/ViviTV/viewholders/ViewHolderHotelPosterImg;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_HOTEL_INFO:Lh30;

    new-instance v0, Lh30;

    sget v4, Landroid/media/ViviTV/R$layout;->layout_home_item_horizon_scroll:I

    sget v5, Landroid/media/ViviTV/R$layout;->video_source:I

    sget v6, Landroid/media/ViviTV/R$layout;->vip_mark:I

    const/16 v2, 0x16

    const-class v3, Landroid/media/ViviTV/viewholders/ViewHolderHorizonScroll;

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lh30;-><init>(ILjava/lang/Class;III)V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->VT_HSCROLL_INFO:Lh30;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->v:Landroid/util/SparseArray;

    const-class v0, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lh30;

    invoke-virtual {v5, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    instance-of v5, v3, Lh30;

    if-eqz v5, :cond_1

    move-object v4, v3

    check-cast v4, Lh30;

    :cond_1
    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    :try_start_1
    sget-object v3, Landroid/media/ViviTV/adapters/HomeRecyclerViewAdapter;->v:Landroid/util/SparseArray;

    invoke-virtual {v4}, Lh30;->c()I

    move-result v5

    invoke-virtual {v3, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    :catchall_0
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/lucasr/twowayview/widget/TwoWayView;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lorg/lucasr/twowayview/widget/TwoWayView;",
            "Ljava/util/List<",
            "Lp6;",
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
.end method


# virtual methods
.method public final A(Landroid/view/View;Lh30;Lcn/dolit/twowayviewlib/viewholders/BaseRecyclerViewHolder;)V
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
.end method

.method public e(Landroid/view/View;I)V
    .locals 0

    .line 1
    return-void
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
.end method

.method public g(Z)Z
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
.end method

.method public getItemViewType(I)I
    .locals 1

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
.end method

.method public i(Lcn/dolit/twowayviewlib/viewholders/BaseRecyclerViewHolder;I)V
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
.end method

.method public j(Landroid/view/ViewGroup;I)Lcn/dolit/twowayviewlib/viewholders/BaseRecyclerViewHolder;
    .locals 6

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    nop

    :catch_0
    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public l()V
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

.method public m(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1

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
.end method

.method public final w(Lcn/dolit/twowayviewlib/viewholders/BaseRecyclerViewHolder;)V
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

.method public final x(Landroid/view/View;)Z
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public y(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lp6;",
            ">;)V"
        }
    .end annotation

    return-void

    nop

    nop

    nop

    nop

    nop
.end method

.method public z(I)V
    .locals 0

    return-void

    nop

    nop
.end method
