require 'zip/zip'
require 'zip/zipfilesystem'

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      if file = params[:source_work_file] then
        @source_work_file = @project.source_work_files.new(name: file.original_filename)
        @source_work_file.file = file.tempfile

        if @source_work_file.save
          ProjectFilesWorker.perform_async(:source_work, @project.id)
        end
      end

      if file = params[:delivery_file]
        @delivery_file = @project.delivery_files.new(name: file.original_filename)
        @delivery_file.file = file.tempfile

        if @delivery_file.save
          ProjectFilesWorker.perform_async(:delivery, @project.id)
        end
      end

      Rails.logger.info "SEND EMAIL: project #{@project.name} ##{@project.id} was created"

      redirect_to @project, notice: "Project was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      if file = params[:source_work_file]
        @source_work_file = @project.source_work_files.new(name: file.original_filename)
        @source_work_file.file = file.tempfile

        if @source_work_file.save
          @project.save!
          ProjectFilesWorker.perform_async(:source_work, @project.id)
        end
      end

      if file = params[:delivery_file]
        @delivery_file = @project.delivery_files.new(name: file.original_filename)
        @delivery_file.file = file.tempfile

        if @delivery_file.save
          @project.save!
          ProjectFilesWorker.perform_async(:delivery, @project.id)
        end
      end

      Rails.logger.info "SEND EMAIL: project #{@project.name} ##{@project.id} was updated"

      redirect_to @project, notice: "Project was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url
  end

  def zip_url
    @project = Project.find(params[:id])

    case params[:type].to_s
    when "source_work"
      render text: @project.source_work_zip_file
    when "delivery"
      render text: @project.delivery_zip_file
    else
      render nothing: true
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
