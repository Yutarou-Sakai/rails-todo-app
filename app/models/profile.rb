class Profile < ApplicationRecord
  belongs_to :user #プロフィールはユーザーに属している
  has_one_attached :avatar #active_strageを用いた仮のカラム
end
