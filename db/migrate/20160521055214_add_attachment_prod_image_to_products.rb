class AddAttachmentProdImageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :prod_image
    end
  end

  def self.down
    remove_attachment :products, :prod_image
  end
end
