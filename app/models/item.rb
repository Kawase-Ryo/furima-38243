class Item < ApplicationRecord

     # テーブルとのアソシエーション
     belongs_to :user
     has_one    :order

     # アクティブハッシュとのアソシエーション
     belongs_to :category
     belongs_to :status
     belongs_to :shipping_charge
     belongs_to :prefecture
     belongs_to :shipping_day

     # active_storageとのアソシエーション（items・active_storage_blobsテーブルを関連付け）
     has_one_attached :image

     with_options presence: true do
        validates :name
        validates :description
        validates :category_id
        validates :status_id
        validates :shipping_charge_id
        validates :prefecture_id
        validates :shipping_day_id
     end

     # ジャンルの選択が「--」の時は保存不可
     with_options numericality: { other_than: 0 } do
        validates :category_id
        validates :status_id
        validates :shipping_charge_id
        validates :prefecture_id
        validates :shipping_day_id
    end
end