class ProjectFilesWorker
  include Sidekiq::Worker

  # sidekiq_options retry: false

  def perform(type, id)
    project = Project.find(id)

    case type.to_s
    when "source_work"
      project.source_work_zip_file = update_zip_file(SourceWorkFile.new.upload_zip(project))
      project.save!
    when "delivery"
      project.delivery_zip_file = update_zip_file(DeliveryFile.new.upload_zip(project))
      project.save!
    else
      Rails.logger.debug "Yet unknown project file type."
    end
  end


  private

  # used to create/update zip for uploaded file projects
  # returns nil when project doesn't have files
  def update_zip_file(path)
    return File.open(path) if !path.blank?
    nil
  end
end
