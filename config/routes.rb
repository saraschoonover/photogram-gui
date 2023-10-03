Rails.application.routes.draw do
  get("/users", {controller: "users", action: "index"})
  get("/users", {controller: "users", action: "show"})

  get("/photos", {controller: "photos", action: "index"})
  get("/photos", {controller: "photos", action: "show"})
end
