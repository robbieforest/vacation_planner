Rails.application.routes.draw do
  # Routes for the Trip detail resource:

  # CREATE
  get("/trip_details/new", { :controller => "trip_details", :action => "new_form" })
  post("/create_trip_detail", { :controller => "trip_details", :action => "create_row" })

  # READ
  get("/trip_details", { :controller => "trip_details", :action => "index" })
  get("/trip_details/:id_to_display", { :controller => "trip_details", :action => "show" })

  # UPDATE
  get("/trip_details/:prefill_with_id/edit", { :controller => "trip_details", :action => "edit_form" })
  post("/update_trip_detail/:id_to_modify", { :controller => "trip_details", :action => "update_row" })

  # DELETE
  get("/delete_trip_detail/:id_to_remove", { :controller => "trip_details", :action => "destroy_row" })

  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  get("/trips/new", { :controller => "trips", :action => "new_form" })
  post("/create_trip", { :controller => "trips", :action => "create_row" })

  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  get("/trips/:id_to_display", { :controller => "trips", :action => "show" })

  # UPDATE
  get("/trips/:prefill_with_id/edit", { :controller => "trips", :action => "edit_form" })
  post("/update_trip/:id_to_modify", { :controller => "trips", :action => "update_row" })

  # DELETE
  get("/delete_trip/:id_to_remove", { :controller => "trips", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
