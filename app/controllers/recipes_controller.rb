class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id  #誰が投稿したのかを指定する
    @recipe.save
    redirect_to recipe_path(@recipe)
  end
    
  def edit
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
  
end