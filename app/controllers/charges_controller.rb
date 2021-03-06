class ChargesController < ApplicationController
  before_action :current_user_must_be_charge_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_charge_user
    charge = Charge.find(params[:id])

    unless current_user == charge.payer
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @charges = Charge.page(params[:page])

    render("charges/index.html.erb")
  end

  def show
    @charge = Charge.find(params[:id])

    render("charges/show.html.erb")
  end

  def new
    @charge = Charge.new

    render("charges/new.html.erb")
  end

  def create
    @charge = Charge.new

    @charge.payer_id = params[:payer_id]
    @charge.ower_id = params[:ower_id]
    @charge.event_id = params[:event_id]
    @charge.amount = params[:amount]

    save_status = @charge.save

    if save_status == true
      redirect_to(:back, :notice => "Charge created successfully.")
    else
      render("charges/new.html.erb")
    end
  end

  def edit
    @charge = Charge.find(params[:id])

    render("charges/edit.html.erb")
  end

  def update
    @charge = Charge.find(params[:id])

    @charge.payer_id = params[:payer_id]
    @charge.ower_id = params[:ower_id]
    @charge.event_id = params[:event_id]
    @charge.amount = params[:amount]

    save_status = @charge.save

    if save_status == true
      redirect_to(:back, :notice => "Charge updated successfully.")
    else
      render("charges/edit.html.erb")
    end
  end

  def destroy
    @charge = Charge.find(params[:id])

    @charge.destroy

    if URI(request.referer).path == "/charges/#{@charge.id}"
      redirect_to("/", :notice => "Charge deleted.")
    else
      redirect_to(:back, :notice => "Charge deleted.")
    end
  end
end
