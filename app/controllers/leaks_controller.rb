class LeaksController < ApplicationController

  # GET /leaks
  # GET /leaks.json
  def index
    @leaks = Leak.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @leaks }
    end
  end

  # GET /leaks/1
  # GET /leaks/1.json
  def show
    @leak = Leak.find(params[:id])
    @passwords = Password.where(leak_id: @leak.id).page params[:page] || 1
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @leak }
    end
  end
  
  # GET /leaks/new
  # GET /leaks/new.json
  def new
    @leak = Leak.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @leak }
    end
  end
  
  # GET /leaks/edit/1
  def edit
    @leak = Leak.find(params[:id])
  end
  
  # POST /leaks/create
  # POST /leaks/create.json
  def create
    @leak = Leak.new(params[:leak])
    
    # Remember the original filename, even after we nil out the file
    @leak.original_filename = @leak.file_file_name

    respond_to do |format|
      if @leak.save
        # Start background processing before rendering results
        @leak.load_data
        format.html { redirect_to @leak, notice: 'Leak was successfully created.' }
        format.json { render json: @leak, status: :created, location: @leak }
      else
        format.html { render action: "new" }
        format.json { render json: @leak.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /leaks/1
  # PUT /leaks/1.json
  def update
    @leak = Leak.find(params[:id])

    respond_to do |format|
      if @leak.update_attributes(params[:leak])
        format.html { redirect_to @leak, notice: 'Leak was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaks/1
  # DELETE /leaks/1.json
  def destroy
    @leak = Leak.find(params[:id])
    
    # Find all passwords for this leak and delete them as well
    @passwords = Password.where(leak_id: @leak.id)
    
    @passwords.destroy
    @leak.destroy

    respond_to do |format|
      format.html { redirect_to leaks_url }
      format.json { head :no_content }
    end
  end
  
end
