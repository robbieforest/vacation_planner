class TripDetailsController < ApplicationController
  def index
    @trip_details = TripDetail.all

    render("trip_detail_templates/index.html.erb")
  end

  def show
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

  def destroy_row
    @trip_detail = TripDetail.find(params.fetch("id_to_remove"))

    @trip_detail.destroy

    redirect_to("/trip_details", :notice => "Trip detail deleted successfully.")
  end
end
