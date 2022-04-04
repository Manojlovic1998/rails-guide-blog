class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "", body: "")
    
    # redirect_to will cause the browser to make an ew req
    # whereas render renders the specified view for the current request
    # it is important to use redirect_to after mutating the database or application state
    # Else if the user refreshes the page, the browser will make the same req,
    # and the mutation will be repeated
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entry
    end
  end
end
