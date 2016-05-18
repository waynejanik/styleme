class Product < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :manufacturer
  belongs_to :size

end
