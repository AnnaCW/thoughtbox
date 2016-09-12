class Link < ApplicationRecord
  belongs_to :user

  def is_read
    read == true
  end

  def is_unread
    read == false
  end

end
