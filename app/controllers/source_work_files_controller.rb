class SourceWorkFilesController < ApplicationController
  # GET /source_work_files
  # GET /source_work_files.json
  def index
    @source_work_files = SourceWorkFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @source_work_files }
    end
  end

  # GET /source_work_files/1
  # GET /source_work_files/1.json
  def show
    @source_work_file = SourceWorkFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @source_work_file }
    end
  end

  # GET /source_work_files/new
  # GET /source_work_files/new.json
  def new
    @source_work_file = SourceWorkFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source_work_file }
    end
  end

  # GET /source_work_files/1/edit
  def edit
    @source_work_file = SourceWorkFile.find(params[:id])
  end

  # POST /source_work_files
  # POST /source_work_files.json
  def create
    @source_work_file = SourceWorkFile.new(params[:source_work_file])

    respond_to do |format|
      if @source_work_file.save
        format.html { redirect_to @source_work_file, notice: 'Source work file was successfully created.' }
        format.json { render json: @source_work_file, status: :created, location: @source_work_file }
      else
        format.html { render action: "new" }
        format.json { render json: @source_work_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /source_work_files/1
  # PUT /source_work_files/1.json
  def update
    @source_work_file = SourceWorkFile.find(params[:id])

    respond_to do |format|
      if @source_work_file.update_attributes(params[:source_work_file])
        format.html { redirect_to @source_work_file, notice: 'Source work file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source_work_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_work_files/1
  # DELETE /source_work_files/1.json
  def destroy
    @source_work_file = SourceWorkFile.find(params[:id])
    @source_work_file.destroy

    respond_to do |format|
      format.html { redirect_to source_work_files_url }
      format.json { head :no_content }
    end
  end
end
