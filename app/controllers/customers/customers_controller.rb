class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save
      redirect_to customers_customer_path
    else
      render action: :edit
    end
  end

  def withdrawal
  end

  def change
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def search
    @customer_or_food = params[:option]
    if @customer_or_food == "customers"
      @customers = Customer.search(params[:search], @customer_or_food)
    else
      @foods = Food.search(params[:search], @customer_or_food)
    end
    @tag_list = Tag.all
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :name_kana, :postal_code, :telephone_number, :address, :is_deleted)
  end
end
