class Board < ApplicationRecord
  belongs_to :user #ボードはユーザーに属している
  has_many :tasks, dependent: :destroy #ボードは複数のタスクを持つ

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }

  validates :content, presence: true
  validates :content, length: { minimum: 10 }

  def author_name #user.rbのdisplay_nameを使用。ユーザー名を取得
    user.display_name
  end
end
