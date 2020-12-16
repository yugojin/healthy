class Admins::FoodsController < ApplicationController
  def index
    @foods = Food.all
    @foods = Food.includes(:favorited_customers).sort {|a,b| b.favorited_customers.size <=> a.favorited_customers.size}
  end

  def show
    @food = Food.find(params[:id])
    @customer = @food.customer
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :image, :introduction, :kcal)
  end
end
