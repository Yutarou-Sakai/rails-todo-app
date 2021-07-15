class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy #ユーザーは複数のボードを持つ
  has_one :profile, dependent: :destroy #ユーザーは１つのプロフィールを持つ

  def display_name #ユーザーの仮名、メールアドレスの@より前の部分を切り取り
    profile&.nickname || self.email.split('@').first
  end

  def prepare_profile #プロフィールの情報があればそれを、なければ空を渡す
    profile || build_profile
  end

  def avatar_image #アバターがあればそれを、なければS.jpgを返す
    if profile&.avatar&.attached?
      profile.avatar
    else
      'S.jpg'
    end
  end
end
