class TimelogsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @timelogs = current_user.timelogs.all
    @timelog = Timelog.new
  end
  
  def create
    @timelog = Timelog.new(timelog_params)
    @timelog.user_id = current_user.id
    if @timelog.save
      redirect_to timelogs_path
    else
      @timelogs = current_user.timelogs.all
      render :index
    end
  end

  def edit
    @timelog = Timelog.find(params[:id])
  end

  def update
    @timelog = Timelog.find(params[:id])
    if @timelog.update(timelog_params)
      redirect_to timelogs_path
    else
      render :edit
    end
  end

  private

  def timelog_params
    params.require(:timelog).permit(:time, :action, :effect)
  end
  
  def is_matching_login_user
    @timelog = Timelog.find(params[:id])
    @user = @timelog.user
    redirect_to timelogs_path unless @user == current_user
  end
end
