class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  has_many :foods, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true do
  validates :password_confirmation
  validates :nickname
  end
  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'

  validates :type_id, numericality: { other_than: 1 }


end
