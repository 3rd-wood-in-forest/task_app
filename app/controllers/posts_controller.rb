class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new # postテーブルのレコードを全て取得する。
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :last_date, :all_day, :memo_contents))
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash.now[:danger] = "スケジュールを登録できませんでした。"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :last_date, :all_day, :memo_contents))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:danger] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
end
