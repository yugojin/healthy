class Customers::CommentsController < ApplicationController
  def create
    @food = Food.find(params[:food_id])
    @comments = @food.comments.order(created_at: :desc)
    comment = @food.comments.build(comment_params)
    comment.customer_id = current_customer.id
    comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @food = Food.find(params[:food_id])
    @comments = @food.comments.order(created_at: :desc)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :food_id, :customer_id)
  end
end
