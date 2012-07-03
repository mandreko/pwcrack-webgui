class PasswordsController < ApplicationController
  
  # GET /passwords
  # GET /passwords.json
  def index
    @passwords = Password.all
    
    #TODO: Break this into a helper
    hash_type = params[:hash_type]
    if !hash_type.nil? && !hash_type.empty?
      @passwords = @passwords.where(:hash_type => hash_type)
    end
    
    cracked = params[:cracked]
    if !cracked.nil? && !cracked.empty?
      if cracked == "true"
        @passwords = @passwords.where(:cleartext != nil)
      elsif cracked == "false"
        @passwords = @passwords.where(:cleartext == nil)
      end
    end
    
    @passwords = @passwords.page params[:page] || 1

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @passwords }
    end
  end

  # GET /passwords/1
  # GET /passwords/1.json
  def show
    @password = password.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @password }
    end
  end
  
  # GET /passwords/new
  # GET /passwords/new.json
  def new
    @password = password.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @password }
    end
  end
  
  # GET /passwords/edit/1
  def edit
    @password = password.find(params[:id])
  end
  
  # POST /passwords/create
  # POST /passwords/create.json
  def create
    @password = password.new(params[:password])

    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: 'password was successfully created.' }
        format.json { render json: @password, status: :created, location: @password }
      else
        format.html { render action: "new" }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /passwords/1
  # PUT /passwords/1.json
  def update
    @password = password.find(params[:id])

    respond_to do |format|
      if @password.update_attributes(params[:password])
        format.html { redirect_to @password, notice: 'password was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1
  # DELETE /passwords/1.json
  def destroy
    @password = password.find(params[:id])
    
    @password.destroy

    respond_to do |format|
      format.html { redirect_to passwords_url }
      format.json { head :no_content }
    end
  end
  
end
