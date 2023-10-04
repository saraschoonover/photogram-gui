Rails.application.routes.draw do
  get("/", {controller: "users", action: "index"})

  get("/users", {controller: "users", action: "index"})
  get("/users/:path_username", {controller: "users", action: "show"})
  post("/add_user", {controller: "users", action: "create"})
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })
  post("/modify_user/:path_username", { :controller => "users", :action => "update" })

  get("/photos", {controller: "photos", action: "index"})
  get("/photos/:path_id", {controller: "photos", action: "show"})
  post("/add_photo", {controller: "photos", action: "create"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })

end
