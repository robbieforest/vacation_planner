class TripDetailsController < ApplicationController
  def index
    @q = TripDetail.ransack(params[:q])
    @trip_details = @q.result(:distinct => true).includes(:trip, :likes, :comments).page(params[:page]).per(10)

    render("trip_detail_templates/index.html.erb")
  end

  def show
    @comment = Comment.new
    @like = Like.new
    @trip_detail = TripDetail.find(params.fetch("id_to_display"))

    render("trip_detail_templates/show.html.erb")
  end

  def new_form
    @trip_detail = TripDetail.new

    render("trip_detail_templates/new_form.html.erb")
  end

  def create_row
    @trip_detail = TripDetail.new

    @trip_detail.trip_id = params.fetch("trip_id")
    @trip_detail.description = params.fetch("description")
    @trip_detail.price = params.fetch("price")
    @trip_detail.url = params.fetch("url")
    @trip_detail.detail_type_id = params.fetch("detail_type_id")

    if @trip_detail.valid?
      @trip_detail.save

      redirect_back(:fallback_location => "/trip_details", :notice => "Trip detail created successfully.")
    else
      render("trip_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_trip
    @trip_detail = TripDetail.new

    @trip_detail.trip_id = params.fetch("trip_id")
    @trip_detail.description = params.fetch("description")
    @trip_detail.price = params.fetch("price")
    @trip_detail.url = params.fetch("url")
    @trip_detail.detail_type_id = params.fetch("detail_type_id")

    if @trip_detail.valid?
      @trip_detail.save

      redirect_to("/trips/#{@trip_detail.trip_id}", notice: "TripDetail created successfully.")
    else
      render("trip_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @trip_detail = TripDetail.find(params.fetch("prefill_with_id"))

    render("trip_detail_templates/edit_form.html.erb")
  end

  def update_row
    @trip_detail = TripDetail.find(params.fetch("id_to_modify"))

    @trip_detail.trip_id = params.fetch("trip_id")
    @trip_detail.description = params.fetch("description")
    @trip_detail.price = params.fetch("price")
    @trip_detail.url = params.fetch("url")
    @trip_detail.detail_type_id = params.fetch("detail_type_id")

    if @trip_detail.valid?
      @trip_detail.save

      redirect_to("/trip_details/#{@trip_detail.id}", :notice => "Trip detail updated successfully.")
    else
      render("trip_detail_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_trip
    @trip_detail = TripDetail.find(params.fetch("id_to_remove"))

    @trip_detail.destroy

    redirect_to("/trips/#{@trip_detail.trip_id}", notice: "TripDetail deleted successfully.")
  end

  def destroy_row
    @trip_detail = TripDetail.find(params.fetch("id_to_remove"))

    @trip_detail.destroy

    redirect_to("/trip_details", :notice => "Trip detail deleted successfully.")
  end
end
