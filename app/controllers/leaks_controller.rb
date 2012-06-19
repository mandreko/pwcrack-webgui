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
		@leak = Leaks.find(params[:id])
	
		respond_to do |format|
			format.html # show.html.erb
			format.xml { render :xml => @leak }
		end
	end
end
