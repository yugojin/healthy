class Customers::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def withdrawal
  end

  def change
  end

  def search
    @customer_or_food = params[:option]
    if @customer_or_food == "customers"
      @customers = Customer.search(params[:search], @customer_or_food)
    else
      @foods = Food.search(params[:search], @customer_or_food)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :name_kana)
  end

end
