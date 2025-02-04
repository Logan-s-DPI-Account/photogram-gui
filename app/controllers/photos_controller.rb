class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show

    # Parameters: {"path_id"=>"785"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end
  def baii
      the_id = params.fetch("toast_id")

      matching_photos = Photo.where({ :id => the_id })

      the_photo = matching_photos.at(0)

      the_photo.destroy

    # render({ :template => "photo_templates/baii.html" })
    redirect_to("/photos")
  end

  def create
   # Parameters: {"query_image"=>"https://tse2.mm.bing.net/th?id=OIP.pbYpUQrV-J4VTMLsWdYeEwHaDA&pid=Api&P=0", "query_caption"=>"Tulane", "query_owner_id"=>"117"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb"})
  redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update

    #Parameters: {"input_image"=>"https://robohash.org/dolorehicincidunt.png?size=300x300&set=set1", "input_caption"=>"Bru's favorite", "modify_id"=>"952"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")

  the_photo.image = input_image
  the_photo.caption = input_caption

  the_photo.save

    # render({ :template => "photo_templates/update.html.erb"})

  redirect_to("/photos/" + the_photo.id.to_s)
  end

  def comment
  photo_id = params.fetch("populated_photo_id")
  author_id = params.fetch("input_author_id")
  input_comment = params.fetch("input_body")
    a_new_comment = Comment.new
    
    a_new_comment.photo_id = photo_id
    a_new_comment.author_id = author_id
    a_new_comment.body = input_comment

    a_new_comment.save

    redirect_to("/photos/#{photo_id}")
  end
end
