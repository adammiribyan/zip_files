class CreateSourceWorkFiles < ActiveRecord::Migration
  def change
    create_table :source_work_files do |t|
      t.string :name
      t.string :file
      t.integer :project_id

      t.timestamps
    end
  end
end
