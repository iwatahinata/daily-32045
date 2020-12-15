class AddressOrder
    include ActiveModel::Model
    attr_accessor :postal_code, :city, :street, :house_name, :phone_number, :user_id, :food_id, :token
  
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :phone_number, format: {with: /\A\d{11}\z/, message: "11桁以内で入力してください"}
      with_options presence: true do
      validates :city
      validates :street
      validates :user_id
      validates :food_id
      validates :token
      end
      
      def save
        # 購入情報を保存し、「order」という変数に入れている
        order = Order.create(food_id: food_id, user_id: user_id)
        # 住所の情報を保存
        Address.create(postal_code: postal_code, city: city, street: street, house_name: house_name, phone_number: phone_number) 
      end
end
