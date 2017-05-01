class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @city = @post.city_id
    @user = @post.user
    @city_object = @post.city
    @comments = @post.comments
    

  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
    # @post_errors = @post.errors[:title]
    # @title_errors = render @post.errors.to_json

    # @title_errors = def title_errors 
    #                   if @post_errors
    #                     flash[:error] = "Action failed"
    #                   end
    #                 end
  end

  def create
    post = Post.create(post_params)
    city = City.find(params[:city_id])
    validate_new_post(post)
  end

  def edit
    @post = Post.find(params[:id])
    @city = @post.city
    # redirect_to city_post_path(@city, @post)
  end

  def update
    post = Post.find(params[:id])
    city = City.find(params[:city_id])
    post.update(post_params)
    redirect_to city_post_path(city, post)
  end

  def destroy
    @post = Post.find(params[:id])
    city_id = @post.city_id
    @post.destroy
    redirect_to city_path(city_id)
  end
  def validate_new_post(post)
    if post.errors.any?
      error_object = post.errors.messages.keys.first.to_s
      error_message = post.errors.messages.values.first[0].to_s
      flash[:errors] = error_object.capitalize + " " + error_message 
      redirect_to :back
    end
  end
 
  private
  def post_params
    params.require(:post)
      .permit(:title, :content)
      .merge(user_id: current_user.id, city_id: params[:city_id])
  end
<<<<<<< HEAD

  def validate_new_post(post)
    city = City.find(params[:city_id])
    if post.errors.any?
      error_object = post.errors.messages.keys.first.to_s
      error_message = post.errors.messages.values.first[0].to_s
      flash[:errors] = error_object.capitalize + " " + error_message
      redirect_to :back
    else
      redirect_to city_path(city)
    end
  end
=======
>>>>>>> setup comments, styled forms, get rout to new comment
end
