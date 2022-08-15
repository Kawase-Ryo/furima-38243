class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

     # テーブルとのアソシエーション
     belongs_to :user
     has_one    :order

     # アクティブハッシュとのアソシエーション
     belongs_to_active_hash :category
     belongs_to :status
     belongs_to :shipping_charge
     belongs_to :prefecture
     belongs_to :shipping_day

     # active_storageとのアソシエーション（items・active_storage_blobsテーブルを関連付け）
     has_one_attached :image

     with_options presence: true do
        validates :image
        validates :name
        validates :description
        validates :category_id
        validates :status_id
        validates :shipping_charge_id
        validates :prefecture_id
        validates :shipping_day_id
        # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可（小数点の入力も不可）
        validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
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