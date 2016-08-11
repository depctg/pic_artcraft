class AddInfoToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :titile, :text
    add_column :pictures, :filename, :string
    add_column :pictures, :author, :string
    add_column :pictures, :created_date, :date
  end
end
