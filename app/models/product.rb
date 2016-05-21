class Product < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  belongs_to :manufacturer
  belongs_to :size
  belongs_to :location


  has_attached_file :prod_image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :prod_image, content_type: /\Aimage\/.*\Z/

end
