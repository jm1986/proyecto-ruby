class PostsController < ApplicationController
  before_filter :get_post, :only =>[:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all #con el all indica que te recupere todos los datos de la base

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #@post = Post.find(params[:id]) #find recupera un post por su identificador (id)
    @comment = Comment.new #creamos un comentario
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new #crea un objeto nuevo, lo crea vacio

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
   # @post = Post.find(params[:id])#nos permite editar nuestro post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post]) 

    respond_to do |format|
      if @post.save #para guardar, el post, si se crea correctamente, o sino
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" } #al ponerle render, consigues que si te falta uno de los 2 campos, el campo que si habias introducido se siga manteniendo, a falta que completes el que falta
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    #@post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #@post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  def get_post
     @post = Post.find(params[:id])
  end
end
