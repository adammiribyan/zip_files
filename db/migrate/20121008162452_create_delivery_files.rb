class CreateDeliveryFiles < ActiveRecord::Migration
  def change
    create_table :delivery_files do |t|
      t.string :name
      t.string :file
      t.integer :project_id

      t.timestamps
    end
  end
end
