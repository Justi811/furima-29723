class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i
       
        validates :password, presence: true,
         format: { with: PASSWORD_REGEX,message: "半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。" }

        validates :nickname,presence: true
        validates :birthday,presence: true

        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を使用してください" } do
          validates :name
          validates :surname
          validates :kana_name
          validates :kana_surname
        end

        with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カナを使用してください" } do 
          validates :kana_name
          validates :kana_surname
        end

        with_options presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "メールアドレスが、正しい形ではありません。" } do 
          validates :email
        end

end
