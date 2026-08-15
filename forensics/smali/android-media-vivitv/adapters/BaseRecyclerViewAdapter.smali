.class public abstract Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b;,
        Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d;,
        Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VHH:",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "DataType:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "TVHH;>;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnLongClickListener;",
        "Landroid/view/View$OnFocusChangeListener;",
        "Landroid/view/View$OnKeyListener;"
    }
.end annotation


# static fields
.field public static final l:Ljava/lang/String; = "1"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public c:Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public d:Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$c<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public e:Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "TDataType;>;)V"
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
.end method


# virtual methods
.method public A(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public B(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public C(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public D(Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b<",
            "TDataType;>;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public E(Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$c<",
            "TDataType;>;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public F(Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d<",
            "TDataType;>;)V"
        }
    .end annotation

    return-void

    nop

    nop
.end method

.method public G(I)V
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

.method public abstract d(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;ILjava/lang/Object;)V
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVHH;ITDataType;)V"
        }
    .end annotation
.end method

.method public getItemCount()I
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
.end method

.method public abstract h(Landroid/view/ViewGroup;ILandroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I",
            "Landroid/view/View;",
            ")TVHH;"
        }
    .end annotation
.end method

.method public abstract i()I
.end method

.method public j(I)I
    .locals 0

    .line 1
    const/4 p1, 0x0

    return p1
.end method

.method public k(I)Landroid/view/View;
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public l()Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$b<",
            "TDataType;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public m()Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/media/ViviTV/adapters/BaseRecyclerViewAdapter$d<",
            "TDataType;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0

    nop
.end method

.method public n()I
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public final o(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TVHH;"
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

    nop

    nop

    nop

    nop

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

.method public final onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVHH;I)V"
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
.end method

.method public onClick(Landroid/view/View;)V
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
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TVHH;"
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public onFocusChange(Landroid/view/View;Z)V
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
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 9

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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public onLongClick(Landroid/view/View;)Z
    .locals 3

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
.end method

.method public p(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "TVHH;)V"
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public q()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    return v0
.end method

.method public r()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public s()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public t()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public u()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public v()Z
    .locals 1

    const/4 v0, 0x0

    return v0

    nop
.end method

.method public final w(Landroid/view/View;I)V
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

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

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

.method public x(Ljava/lang/Object;Ljava/util/Comparator;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDataType;",
            "Ljava/util/Comparator<",
            "TDataType;>;Z)V"
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
.end method

.method public y(Z)V
    .locals 0

    return-void

    nop

    nop
.end method

.method public z(Z)V
    .locals 0

    return-void

    nop

    nop
.end method
