class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index" })
  end

  def show

    render({ :template => "user_templates/show" })
  end

  def create
  end

  def update
  end

  def destroy
  end
end
