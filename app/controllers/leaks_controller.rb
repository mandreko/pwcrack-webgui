class LeaksController < ApplicationController

	# GET /leaks
	# GET /leaks.xml
	def index
		@leaks = Leaks.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml { render :xml => @leaks }
		end
	end

	# GET /leaks/1
	# GET /leaks/1.xml
	def show
		@leak = Leak.find(params[:id])
	
		respond_to do |format|
			format.html # show.html.erb
			format.xml { render :xml => @leak }
		end
	end
	
	# GET /leaks/new
	def new
	  @leak = Leak.new
	  
	  respond_to do |format|
	          format.html # new.html.erb
	          format.xml { render :xml => @leak }
	         end
  end
  
  # POST /leaks/create
  def create
    @leak = Leak.new(params[:leak])
    
    # Remember the original filename, even after we nil out the file
	  @leak.original_filename = @leak.file_file_name
    #render :text => @leak.inspect
    
    if @leak.save  
      redirect_to @leak, :notice => "Successfully created leak."  
    else  
      render :action => 'new'  
    end  
  end
end
