class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @recipes = Recipe.all
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
    if @recipe.save
    redirect_to recipe_path(@recipe), notice: "投稿に成功しました。"
    else
      render :new
    end
  end
    
  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user != current_user #等しくなかったらの場合
    redirect_to recipes_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params) #(recipe_params)はどのカラムをupdateするのかを許可
    redirect_to recipe_path(@recipe), notice: "更新に成功しました。"
    else
    render :edit
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to user_path(recipe.user)
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
  
end
