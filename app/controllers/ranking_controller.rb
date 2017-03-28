class RankingController < ApplicationController
  def new
    #Haveしているアイテムの上位10を取り出す
    have_ids = Have.group(:item_id).order('count_all desc').count.keys.first(10)
    @have_items = Item.find(have_ids).sort_by{|item| have_ids.index(item.id)}
    
    #Wantしているアイテムの上位10を取り出す
    want_ids = Want.group(:item_id).order('count_all desc').count.keys.first(10)
    @want_items = Item.find(want_ids).sort_by{|item| want_ids.index(item.id)}
  end
end
