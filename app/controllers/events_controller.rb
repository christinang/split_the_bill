class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])

    render("events/index.html.erb")
  end

  def show
    @charge = Charge.new
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.event_name = params[:event_name]
    @event.event_description = params[:event_description]
    @event.total_cost = params[:total_cost]

    save_status = @event.save

    if save_status == true
      redirect_to(:back, :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.event_name = params[:event_name]
    @event.event_description = params[:event_description]
    @event.total_cost = params[:total_cost]

    save_status = @event.save

    if save_status == true
      redirect_to(:back, :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_to(:back, :notice => "Event deleted.")
    end
  end
end
