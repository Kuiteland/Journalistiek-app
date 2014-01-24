class SubjectsController < ApplicationController
  def new
  	@subject = Subject.new
  end

  def show
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Nieuw onderwerp aangemaakt!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :short_description, :description,
                                   :red, :reg, :host, :status)
    end
end
