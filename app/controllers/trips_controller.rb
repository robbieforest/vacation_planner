class TripsController < ApplicationController
  before_action :current_user_must_be_trip_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_trip_user
    trip = Trip.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == trip.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Trip.ransack(params[:q])
    @trips = @q.result(:distinct => true).includes(:user, :trip_details).page(params[:page]).per(10)

    render("trip_templates/index.html.erb")
  end

  def show
    @trip_detail = TripDetail.new
    @trip = Trip.find(params.fetch("id_to_display"))

    render("trip_templates/show.html.erb")
  end

  def new_form
    @trip = Trip.new

    render("trip_templates/new_form.html.erb")
  end

  def create_row
    @trip = Trip.new

    @trip.name = params.fetch("name")
    @trip.user_id = params.fetch("user_id")

    if @trip.valid?
      @trip.save

      redirect_back(:fallback_location => "/trips", :notice => "Trip created successfully.")
    else
      render("trip_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @trip = Trip.find(params.fetch("prefill_with_id"))

    render("trip_templates/edit_form.html.erb")
  end

  def update_row
    @trip = Trip.find(params.fetch("id_to_modify"))

    @trip.name = params.fetch("name")
    

    if @trip.valid?
      @trip.save

      redirect_to("/trips/#{@trip.id}", :notice => "Trip updated successfully.")
    else
      render("trip_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @trip = Trip.find(params.fetch("id_to_remove"))

    @trip.destroy

    redirect_to("/users/#{@trip.user_id}", notice: "Trip deleted successfully.")
  end

  def destroy_row
    @trip = Trip.find(params.fetch("id_to_remove"))

    @trip.destroy

    redirect_to("/trips", :notice => "Trip deleted successfully.")
  end
end
