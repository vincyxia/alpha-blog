class ArticlesController < ApplicationController

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def edit
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Articles was created successfully."
			redirect_to article_path(@article.id)
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Articles was updated successfully."
			redirect_to article_path(@article.id)
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path status: :see_other
	end

end