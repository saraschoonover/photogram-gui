class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos

    render({ :template => "photo_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photo = Photo.where(:id => the_id)
    @the_photo = matching_photo.at(0)

    render({ :template => "photo_templates/show" })
  end

  def create
    @new_photo = Photo.new
    @new_photo.image = params.fetch("input_image")
    @new_photo.caption = params.fetch("input_caption")
    @new_photo.owner_id = params.fetch("input_owner_id")
    
    
    if @new_photo.valid?
      @new_photo.save
      redirect_to("/photos/#{@new_photo.id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)
    
  
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    
    @the_photo.save
    redirect_to("/photos/#{@the_photo.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_comment = Photo.find(the_id)
    @the_comment.destroy

    redirect_to("/photos", { :notice => "user deleted successfully."} )
  end

  def create_comment
    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.author_id= params.fetch("input_author_id")
    @new_comment.body = params.fetch("input_comment")
    @new_comment.save

    redirect_to("/photos/#{@new_comment.photo_id}")
  end
end
