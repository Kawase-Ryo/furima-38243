class OrderForm
    include ActiveModel::Model
    # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

    # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
    with_options presence: true do
        # orderモデルのバリデーション
        validates :user_id
        validates :item_id
        # paymentモデルのバリデーション
        validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
        validates :prefecture_id, numericality: { other_than: 0 }
        validates :city
        validates :address
        validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/ }
        # トークンのバリデーション
        validates :token
    end

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
        Payment.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
    end
end