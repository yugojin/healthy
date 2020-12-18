class Customers::FoodsController < ApplicationController
  def index
    @foods = Food.all
    @foods = Food.includes(:favorited_customers).sort { |a, b| b.favorited_customers.size <=> a.favorited_customers.size }
    @tag_list = Tag.all
  end

  def show
    @food = Food.find(params[:id])
    @customer = @food.customer
    @comment = Comment.new
    @comments = @food.comments.order(created_at: :desc)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.customer_id = current_customer.id
    @tag_list = params[:food][:tag_ids].split(',')
    if @food.save
      @food.save_tags(@tag_list)
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

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @foods = @tag.foods.all
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :image, :introduction, :kcal)
  end
end
