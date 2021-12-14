class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash.now[:success] = 'Event was deleted.'
    
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :date)
  end
end
