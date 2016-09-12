class Link < ApplicationRecord
  belongs_to :user
  validates :url, presence: true, url: true

  def is_read
    read == true
  end

  def is_unread
    read == false
  end

end
