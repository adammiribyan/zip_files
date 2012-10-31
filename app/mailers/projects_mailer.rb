class ProjectsMailer < ActionMailer::Base
  default from: "from@example.com"

  def compressed_files_are_ready(project)
    @project = project
    mail to: "client@openlsp.com", subject: "#{@project.name}: files are successfully compressed"
  end
end
