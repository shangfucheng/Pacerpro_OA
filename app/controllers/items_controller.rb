class ItemsController < ApplicationController
    before_action :set_item, only: [:destroy, :restore]
    # GET / active items and deleted items in Items/index.html.erb
    def index
        @active_items = Item.active
        @deleted_items = Item.deleted
    end
    
    def show
    end

    def new
      @item = Item.new
    end
    
    def create
      @item = Item.new(item_params)
  
      if @item.save
        redirect_to items_path, notice: 'Item was successfully created.'
      else
        render :new
      end
    end
  
    def destroy
      @item.soft_delete
      redirect_to items_path, notice: 'Item was successfully deleted.'
    end
  
    def restore
      @item.restore
      redirect_to items_path, notice: 'Item was successfully restored.'
    end
  
    private
        def item_params
            params.require(:item).permit(:name)
        end
    
        def set_item
            @item = Item.find(params[:id])
        end
  end
  