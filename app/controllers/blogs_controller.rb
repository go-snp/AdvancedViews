class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully saved.'
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
    @entries = @blog.entries
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:title)
    end

end
