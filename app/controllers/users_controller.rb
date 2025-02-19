class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index" })
  end

  def show
    the_username = params.fetch("path_username")
    matching_usernames = User.where(:username => the_username)
    @the_user = matching_usernames[0]

    if @the_user == nil
      redirect_to "/users"
    else
      render({ :template => "user_templates/show" })
    end
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")

    # if @new_user.valid?
      @new_user.save
      redirect_to("/users/#{@new_user.username}", { :notice => "User created successfully." })
    # else
    #   redirect_to("/users", { :notice => "Movie failed to create successfully." })
    # end
  end

  def update
    the_username = params.fetch("path_username")
    update_user = User.where(:username => the_username)
    @the_user = update_user[0]
    @the_user.username = params.fetch("input_username")
    @the_user.save
    redirect_to("/users/#{@the_user.username}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_user = User.find(the_id)
    @the_user.destroy

    redirect_to("/users", { :notice => "user deleted successfully."} )
  end
end
