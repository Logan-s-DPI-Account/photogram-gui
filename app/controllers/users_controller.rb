class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users =matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end
  
  def show
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)
    #we don't have to do these for this assignment but a redirect if the value is nil woul
    # if the_user == nil
    #   redirect_to("/404")
    # else
    
    render({ :template => "user_templates/show.html.erb"})

    # end
  end
  
  def create
  input_username = params.fetch(:a_new_user)

  a_new_user = User.new
  a_new_user.username = input_username
  a_new_user.save

  redirect_to("/users/#{a_new_user.username}")

  end

  def update
    the_id = params.fetch("an_id")
    matching_user = User.where({ :id => the_id })
    the_user = matching_user.at(0)

    updated_username = params.fetch("user_update")
    the_user.username = updated_username
    the_user.save
    redirect_to("/users/#{the_user.username}")

  end
  

end
