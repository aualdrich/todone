class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lists, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # Handle new list creation if specified
    if params[:list][:name].present?
      @list = current_user.lists.build(name: params[:list][:name], order: @lists.count)
      if @list.save
        @item.list = @list
      else
        render :new, status: :unprocessable_entity and return
      end
    end

    if @item.save
      redirect_to @item.list, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to @item.list, notice: 'Task was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @item.list, notice: 'Task was successfully deleted.'
  end

  private

  def set_lists
    @lists = current_user.lists.order(:order)
  end

  def item_params
    params.require(:item).permit(:description, :list_id, :priority, :done)
  end
end 