class AddImageToBlogPost < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :image, :active_storage_attachments
  end
end
