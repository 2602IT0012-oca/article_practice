# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # 投稿一覧
  def index
    @articles = Article.all
  end

  # 投稿詳細
  def show
  end

  # 新規投稿ページ
  def new
    @article = Article.new
  end

  # 新規投稿の保存処理
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '記事を投稿しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 投稿編集ページ
  def edit
  end

  # 投稿編集の更新処理
  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '記事を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 投稿削除処理
  def destroy
    @article.destroy
    redirect_to articles_path, alert: '記事を削除しました。'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

