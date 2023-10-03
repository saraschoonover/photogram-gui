class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos

    render({ :template => "photo_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photo = Photo.where(:id => the_id)
    @the_photo = matching_photo[0]

    render({ :template => "photo_templates/show" })
  end

  def create
  end

  def update
  end

  def destroy
  end
end
