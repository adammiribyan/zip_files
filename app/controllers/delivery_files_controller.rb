class DeliveryFilesController < ApplicationController
  # GET /delivery_files
  # GET /delivery_files.json
  def index
    @delivery_files = DeliveryFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delivery_files }
    end
  end

  # GET /delivery_files/1
  # GET /delivery_files/1.json
  def show
    @delivery_file = DeliveryFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery_file }
    end
  end

  # GET /delivery_files/new
  # GET /delivery_files/new.json
  def new
    @delivery_file = DeliveryFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery_file }
    end
  end

  # GET /delivery_files/1/edit
  def edit
    @delivery_file = DeliveryFile.find(params[:id])
  end

  # POST /delivery_files
  # POST /delivery_files.json
  def create
    @delivery_file = DeliveryFile.new(params[:delivery_file])

    respond_to do |format|
      if @delivery_file.save
        format.html { redirect_to @delivery_file, notice: 'Delivery file was successfully created.' }
        format.json { render json: @delivery_file, status: :created, location: @delivery_file }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_files/1
  # PUT /delivery_files/1.json
  def update
    @delivery_file = DeliveryFile.find(params[:id])

    respond_to do |format|
      if @delivery_file.update_attributes(params[:delivery_file])
        format.html { redirect_to @delivery_file, notice: 'Delivery file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_files/1
  # DELETE /delivery_files/1.json
  def destroy
    @delivery_file = DeliveryFile.find(params[:id])
    @delivery_file.destroy

    respond_to do |format|
      format.html { redirect_to delivery_files_url }
      format.json { head :no_content }
    end
  end
end
