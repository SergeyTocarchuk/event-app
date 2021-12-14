class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    enrollment = Enrollment.new(event_id: event.id, user_id: current_user.id)
    if enrollment.save
      redirect_to root_path
    else
      flash[:alert] = 'something went wrong...'
    end
  end

  def update
    event = Event.find(params[:event_id])
    enrollment = Enrollment.where(event_id: event.id, user_id: current_user.id)
    if enrollment.exists?
      enrollment.first.id.destroy
    end
    redirect_to event_path(event)
  end

  def destroy
    enrollment = Enrollment.find(params[:id])
    enrollment.destroy
    flash.now[:success] = 'You cancelled your enrollment'

    redirect_to root_path
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:event_id, :user_id)
  end
end
