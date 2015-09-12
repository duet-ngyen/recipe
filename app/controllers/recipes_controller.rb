class RecipesController < ApplicationController
  before_action :load_recipe, except: [:index, :new, :create]
  before_action :recipe_params, only: [:create, :update]
  before_action :load_chefs, only: [:new, :create, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      flash[:success] = "created successful"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update_attributes recipe_params
      flash[:danger] = "updated successful"
      redirect_to recipe_path @recipe
    else
      render :edit
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit :title, :description, :chef_id
  end

  def load_recipe
    @recipe = Recipe.find params[:id]
  end

  def load_chefs
    @chefs = Chef.all
  end
end
