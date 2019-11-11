class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    items = Item.order(cerated_at: : desc)
    # created_at でsort
    render json: { status:'SUCCESS', message: 'Loaded items', data: items }
  end


  def create
    item = Item.new(item_params)
    if item.save
      render json:{ status:'SUCCESS', data:item }
    else
      render json:{ status: 'ERROR', data: item.errors }
    end
  end


## ここまで postsとpost
## ここから @post

  def show
    render json:{ status:'SUCCESS', message: 'Loaded the item', data: @item}
  end


  def update
      render json: { status: 'SUCCESS' ,message: 'Updated the item', data: @item}
    else
      render json: { status: 'SUCCESS' ,message: 'Not updated', data: @item.errors}
    end
  end

  def destroy
    @item.destroy
      render json: { status: 'SUCCESS' ,message: 'Deleted the item', data: @item}
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    
    def item_params
      params.require(:item).permit(:image, :title, :description, :price)
    end
end
