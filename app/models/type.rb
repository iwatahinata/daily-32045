class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '注文用アカウント' },
    { id: 3, name: 'レストラン用アカウント' },
  ]

  include ActiveHash::Associations
  has_many :users
end
