class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lists, only: [:index, :show]

  def index
  end

  def show
    @list = current_user.lists.find(params[:id])
    @items = @list.items.order(created_at: :desc)
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_lists
    @lists = current_user.lists.order(:order)
  end

  def list_params
    params.require(:list).permit(:name, :order)
  end
end 