class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i.freeze

  validates :password, presence: true,
                       format: { with: PASSWORD_REGEX, message: 'には半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。' }

  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角(漢字・ひらがな・カタカナ)を使用してください' } do
    validates :name
    validates :surname
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'にはカナを使用してください' } do
    validates :kana_name
    validates :kana_surname
  end

  with_options presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'にはメールアドレスが、正しい形ではありません。' } do
    validates :email
  end
end
