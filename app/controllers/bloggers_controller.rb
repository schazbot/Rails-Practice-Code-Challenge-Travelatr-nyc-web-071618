class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = set_blogger
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new
    if @blogger.valid?
      @blogger.create(blogger_params)
      redirect_to blogger_path
    else
      redirect_to new_blogger_path
    end
  end

  def edit
    @blogger = set_blogger
  end

  def update
    @blogger = set_blogger
    @blogger.update
    redirect_to blogger_path
  end

  def destroy
  end

private

def blogger_params
  params.require(:blogger).permit(:name, :bio, :age)
end

def set_blogger
  @blogger = Blogger.find(params[:id])
end


end
