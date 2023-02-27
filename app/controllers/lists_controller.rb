class ListsController < ApplicationController
  def index
    # see all my movie lists
    @lists = List.all
  end

  def show
    # see the details of a movie list
    @list = List.find(params[:id])
  end

  def new
    # instantiate the new movie list form
    @list = List.new
  end

  def create
    # create a movie list
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # instantiate the new movie list form
    @list = List.find(params[:id])
  end

  def update
    # update a movie list
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # delete a movie list
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
