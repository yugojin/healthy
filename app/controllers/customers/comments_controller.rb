class Customers::CommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @comment = @food.comments.new(comment_params)
    @comment.customer_id = current_customer.id
    byebug
    if @comment.save
      redirect_to request.referer
    else
      render 'customers/foods/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], food_id: params[:food_id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
