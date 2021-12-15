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

  def destroy
    enrollment = current_user.enrollments.find(params[:id])
    enrollment.destroy
    flash.now[:success] = 'You cancelled your enrollment'

    redirect_to root_path
  end
end
