class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy #タスクは複数のコメントを持つ

  has_one_attached :eyecatch #active recordを通してアイキャッチ画像のカラムを作成
end
