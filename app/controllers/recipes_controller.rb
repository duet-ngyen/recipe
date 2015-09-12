class RecipesController < ApplicationController
  before_action :load_recipe, except: [:index, :new, :create]
  before_action :recipe_params, only: [:create, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @chefs = Chef.all
  end

  def create
    @recipe = Recipe.new recipe_params
    # byebug
    # @recipe.chef = Chef.find(2)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @chefs = Chef.all
  end

  def update
    if @recipe.update_attributes recipe_params
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
end
