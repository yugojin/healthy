class Customers::HomesController < ApplicationController
  def top
    @foods = Food.all
  end

  def about
  end
end
