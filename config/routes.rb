Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "trips#index"
  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })
  post("/create_comment_from_trip_detail", { :controller => "comments", :action => "create_row_from_trip_detail" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  get("/delete_comment_from_detail/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_detail" })
  get("/delete_comment_from_user/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  get("/likes/new", { :controller => "likes", :action => "new_form" })
  post("/create_like", { :controller => "likes", :action => "create_row" })
  post("/create_like_from_trip_detail", { :controller => "likes", :action => "create_row_from_trip_detail" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  get("/likes/:id_to_display", { :controller => "likes", :action => "show" })

  # UPDATE
  get("/likes/:prefill_with_id/edit", { :controller => "likes", :action => "edit_form" })
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })
  get("/delete_like_from_detail/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_detail" })
  get("/delete_like_from_user/:id_to_remove", { :controller => "likes", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Trip detail resource:

  # CREATE
  get("/trip_details/new", { :controller => "trip_details", :action => "new_form" })
  post("/create_trip_detail", { :controller => "trip_details", :action => "create_row" })
  post("/create_trip_detail_from_trip", { :controller => "trip_details", :action => "create_row_from_trip" })

  # READ
  get("/trip_details", { :controller => "trip_details", :action => "index" })
  get("/trip_details/:id_to_display", { :controller => "trip_details", :action => "show" })

  # UPDATE
  get("/trip_details/:prefill_with_id/edit", { :controller => "trip_details", :action => "edit_form" })
  post("/update_trip_detail/:id_to_modify", { :controller => "trip_details", :action => "update_row" })

  # DELETE
  get("/delete_trip_detail/:id_to_remove", { :controller => "trip_details", :action => "destroy_row" })
  get("/delete_trip_detail_from_trip/:id_to_remove", { :controller => "trip_details", :action => "destroy_row_from_trip" })

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
  get("/delete_trip_from_user/:id_to_remove", { :controller => "trips", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
