class ContactsController < ApplicationController

  def new
    @subject = Subject.find(params[:subject_id])
    @contact = @subject.contacts.build
  end

	def create
		@subject = Subject.find(params[:subject_id])
		@contact = @subject.contacts.build(contact_params)
    	if @contact.save
      		flash[:success] = "Contact created"
      		redirect_to subjects_url
    	else
      		render 'new'
    	end
	end

	def destroy
	end

	private

    def contact_params
      params.require(:contact).permit(:name, :email, :number)
    end
end