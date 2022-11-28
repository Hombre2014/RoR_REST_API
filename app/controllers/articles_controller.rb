class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: serializer.new(articles), status: :ok
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def serializer
    ArticleSerializer
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :slug)
  end
end
