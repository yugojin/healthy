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

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :name_kana)
  end

end
