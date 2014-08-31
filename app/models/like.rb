class Like < ActiveRecord::Base
  belongs_to :post

  include PublicActivity::Common
  # tracked

end
