class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board

  has_one_attached :eyecatch #active recordを通してアイキャッチ画像のカラムを作成
end
