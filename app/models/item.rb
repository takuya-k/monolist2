class Item < ActiveRecord::Base
  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  
  #アイテムをwantしているユーザーの一覧
  has_many :wants, class_name: "Want", foreign_key: "item_id", dependent: :destroy
  has_many :want_users, through: :wants, source: :user
  
  has_many :haves, class_name: "Haves", foreign_key: "item_id", dependent: :destroy
  has_many :have_users, through: :haves, source: :user
  
end
