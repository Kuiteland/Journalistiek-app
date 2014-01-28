class SubjectsController < ApplicationController

  def index
    @search = "%#{params[:search]}%"
    @subjects = Subject.paginate(:conditions => ['name LIKE ?
                         OR short_description LIKE ?', @search, @search],
                  page: params[:page], :per_page => 30)
  end

  def date_index
    @subjects = Subject.order(:air_date).
                paginate(page: params[:page], :per_page => 30)
  end

  def new
  	@subject = Subject.new
  end

  def show
  	@subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Nieuw onderwerp aangemaakt!"
      redirect_to subjects_url
    else
      render 'new'
    end
  end

  def edit
  	@subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:success] = "Subject updated"
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted."
    redirect_to subjects_url
  end


  private

    def subject_params
      params.require(:subject).permit(:name, :short_description, :description,
                                   :red, :reg, :host, :status, :air_date)
    end
end
