class EntriesController < ApplicationController
  before_action :set_entry_and_blog, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @entry = @blog.entries.new
  end

  def create
    @entry = @blog.entries.new(entry_params)

    if @entry.save()
      redirect_to blog_entry_path(@blog, @entry), notice: "Entry was successfully created."
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @entry.update(entry_params)
      redirect_to blog_entry_path(@blog, @entry), notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to blog_path(@blog), notice: "Entry was successfully destroyed."
  end

  private

    def set_entry_and_blog
      @entry = Entry.find_by(id: params[:id], blog_id: params[:blog_id])
      @blog = Blog.find(params[:blog_id])
    end

    def entry_params
      params.require(:entry).permit(:title, :body)
    end
end
