class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    redirect_to new_article_path if @articles.empty?
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Artykuł dodany do bazy'
    else
      render action: 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Artykuł został zaktualizowany'
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :author, :source, :content)
  end
end
