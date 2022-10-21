Rails.application.routes.draw do

get("/", { :controller => "users", :action => "index"})

get("/users", { :controller => "users", :action => "index" })

get("/users/new", { :controller => "users", :action => "create"})

get("/user_update/:an_id", { :controller => "users", :action => "update"})

get("/users/:path_username", { :controller => "users", :action => "show"})

get("/create_comment", { :controller => "photos", :action => "comment"})

get("/photos", { :controller => "photos", :action => "index" })

get("/photos/:path_id", { :controller => "photos", :action => "show"})

get("/delete_photo/:toast_id", { :controller => "photos", :action => "baii" })

get("/insert_photo", { :controller => "photos", :action => "create" })

get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

# get("/update_user/:updated_user", { :controller => "users", :action => "update"})
# get("/users/:path_username", { :controller => "users", :action => "create"})
# get("/users/:new_username", { :controller => "users", :action => "create"})
end
