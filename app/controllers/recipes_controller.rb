class RecipesController < ApplicationController
  before_action :load_recipe, except: [:index, :new, :create]
  before_action :recipe_params, only: [:create, :update]
  before_action :load_chefs, only: [:new, :create, :edit, :update]


  def index
    # @sort = Recipe.sort_by(:id)
    @recipes = Recipe.paginate(page: params[:page], per_page: 2)
  end

  def show
    @count_like = @recipe.count_like
    @count_dislike = @recipe.count_dislike
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

  def like
    like = Like.create(like: params[:like], chef: @recipe.chef, recipe: @recipe)
    if like.valid?
      flash[:success] = "Like created"
      redirect_to :back
    else
      flash[:danger] = "Only like/dislike once"
      redirect_to :back
    end

  end

  private
  def recipe_params
    params.require(:recipe).permit :title, :description, :chef_id, :img
  end

  def load_recipe
    @recipe = Recipe.find params[:id]
  end

  def load_chefs
    @chefs = Chef.all
  end

end
