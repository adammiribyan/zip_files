class SourceWorkFile < ActiveRecord::Base
  attr_accessible :file, :name

  mount_uploader :file, SourceWorkFileUploader

  belongs_to :project

  validates_presence_of :name

  def upload_zip(project)
    filename = zip_file_name(project, "source")
    tmp_directory = "#{Rails.root}/tmp/source_work_zip_file/#{project.name}"
    files = SourceWorkFile.find_all_by_project_id(project.id)

    compress_files_into_filename(files, filename, tmp_directory)
  end


  private

  include ZipUtils
end
