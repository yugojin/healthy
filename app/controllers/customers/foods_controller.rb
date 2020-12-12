class Customers::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @customer = @food.customer
    @comment = Comment.new
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.customer_id = current_customer.id
    byebug
    if @food.save
      redirect_to customers_food_path(@food)
    else
      render 'new'
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to customers_food_path(@food)
    else
      render 'edit'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to customers_foods_path
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :image, :introduction, :kcal)
  end
end
