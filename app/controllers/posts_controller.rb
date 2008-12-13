class PostsController < ApplicationController

  before_filter :find_post, :only => [ :show, :edit, :update, :destroy ]

  # GET /posts
  # GET /posts.ext_json
  def index
    respond_to do |format|
      format.html     # index.html.erb (no data required)
      format.ext_json { render :json => find_posts.to_ext_json(:class => Post, :count => Post.count(options_from_search(Post))) }
    end
  end

  # GET /posts/1
  def show
    # show.html.erb
  end

  # GET /posts/new
  def new
    @post = Post.new(params[:post])
    # new.html.erb
  end

  # GET /posts/1/edit
  def edit
    # edit.html.erb
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.ext_json { render(:update) {|page| page.redirect_to posts_path } }
      else
        format.ext_json { render :json => @post.to_ext_json(:success => false) }
      end
    end
  end

  # PUT /posts/1
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.ext_json { render(:update) {|page| page.redirect_to posts_path } }
      else
        format.ext_json { render :json => @post.to_ext_json(:success => false) }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    respond_to do |format|
      format.js  { head :ok }
    end
  rescue
    respond_to do |format|
      format.js  { head :status => 500 }
    end
  end
  
  protected
  
    def find_post
      @post = Post.find(params[:id])
    end
    
    def find_posts
      pagination_state = update_pagination_state_with_params!(Post)
      @posts = Post.find(:all, options_from_pagination_state(pagination_state).merge(options_from_search(Post)))
    end

end
