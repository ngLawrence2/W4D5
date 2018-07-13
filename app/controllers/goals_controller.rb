class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    render :new 
  end
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to user_url(@goal.user_id)
    end 
  end 
  
  def goal_params
    params.require(:goal).permit(:goal,:user_id,:private,:completed)
  end 
end
