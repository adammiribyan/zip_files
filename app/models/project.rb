class Project < ActiveRecord::Base
  attr_accessible :delivery_zip_file, :name, :source_work_zip_file

  has_many :delivery_files
  has_many :source_work_files

  mount_uploader :source_work_zip_file, SourceWorkZipFileUploader
  mount_uploader :delivery_zip_file, DeliveryZipFileUploader

  def files_are_compressed?
    (delivery_files.any? && delivery_zip_file.present?) && (source_work_files.any? && source_work_zip_file.present?)
  end
end
