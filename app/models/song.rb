class Song < ActiveRecord::Base

  has_many :likes, dependent: :destroy

end
