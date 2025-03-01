class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end


  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      flash[:errors] = @author.errors.full_messages
      render "new"
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
