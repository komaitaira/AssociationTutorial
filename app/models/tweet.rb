class Tweet < ApplicationRecord
	belongs_to :user
	has_many :favorites

# favoritesを解除するために
# このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
# 存在していればtrue、存在していなければfalseを返すようにしています。
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
