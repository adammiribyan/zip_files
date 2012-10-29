class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :reference_zip_file
      t.string :source_work_zip_file
      t.string :delivery_zip_file
      t.string :instuction_zip_file

      t.timestamps
    end
  end
end
