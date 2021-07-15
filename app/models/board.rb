class Board < ApplicationRecord
  belongs_to :user #ボードはユーザーに属している

  def author_name #user.rbのdisplay_nameを使用。ユーザー名を取得
    user.display_name
  end
end
