class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]
 
  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      #エラーが出た場合は@itemsにnilを代入する
      begin
        @items = response.first(20)
      rescue
        @items = nil
      end
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
