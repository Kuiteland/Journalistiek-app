class ContactsController < ApplicationController

	def create
		@subject = Subject.find(params[:id])
		@micropost = @subject.microposts.build(micropost_params)
    	if @micropost.save
      		flash[:success] = "Contact created"
      		redirect_to subjects_url
    	else
      		render subjects_path
    	end
	end

	def destroy
	end
end