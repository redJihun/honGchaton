class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :get_type
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where('post_type =?', @post_type)

    if params[:search]
      @posts = Post.where('location_one = ? AND post_type= ?', params[:search], @post_type)
    end
    @posts = @posts.reverse

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_type = @post.post_type
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def toggle
    @post = Post.find(params[:post_id])
    @post.complete =  1 - @post.complete.to_i
    @post.save
    redirect_to posts_url(@post_id)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.location_one = params[:location_one]
    @post.location_two = params[:location_two]
    @post.start_date =  params[:start_date]
    @post.end_date = params[:end_date]
    @post.welfare = params[:welfare]
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    post.user_id = current_user.id
    @post.location_one = params[:location_one]
    @post.location_two = params[:location_two]
    @post.start_date =  params[:start_date]
    @post.end_date = params[:end_date]
    @post.welfare = params[:welfare]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #authorize_action_for @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def get_type
      @post_type = params[:post_type].to_i
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :person, :phone, :post_type)
    end
end
