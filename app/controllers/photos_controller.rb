class PhotosController < ApplicationController
  def index

    render({ :template => "photo_templates/index" })
  end

  def show

    render({ :template => "photo_templates/show" })
  end

  def create
  end

  def update
  end

  def destroy
  end
end
