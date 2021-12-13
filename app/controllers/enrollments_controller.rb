class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    user = current_user
    enrollment = Enrollment.new(event_id: event.id, user_id: user.id)
    if enrollment.save
      redirect_to event_path(event)
    else
      flash[:alert] = 'something went wrong...'
    end
  end

  def update
    event = Event.find(params[:event_id])
    user = User.find(current_user.id)
    Enrollment.create(enrollment_params)
    flash[:notice] = 'You joined the event!'
    redirect_to event_path(event)
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:event_id, :user_id)
  end
end
