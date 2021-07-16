class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy #タスクは複数のコメントを持つ

  has_one_attached :eyecatch #active recordを通してアイキャッチ画像のカラムを作成

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }

  validates :content, presence: true
  validates :content, length: { minimum: 10 }
end
