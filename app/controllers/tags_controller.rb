class TagsController < ApplicationController
  def new
    @subject = Subject.find(params[:subject_id])
    @tag = @subject.tags.build
  end

	def create
		@subject = Subject.find(params[:subject_id])
		@tag = @subject.tags.build(tag_params)
    	if @tag.save
      		flash[:success] = "Tag created"
      		redirect_to subjects_url
    	else
      		render 'new'
    	end
	end

	def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
	end

	private

    def tag_params
      params.require(:tag).permit(:name)
    end
end
