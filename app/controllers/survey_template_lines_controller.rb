class SurveyTemplateLinesController < ApplicationController
  def index
    @survey_template_lines = SurveyTemplateLine.all
  end

  def show
    @survey_template_line = SurveyTemplateLine.find(params[:id])
  end

  def new
    @survey_template_line = SurveyTemplateLine.new(:survey_template_id=>params[:survey_template_id])
  end

  def create
    @survey_template_line = SurveyTemplateLine.new(params[:survey_template_line])
    if @survey_template_line.save
      redirect_to edit_survey_template_path(@survey_template_line.survey_template), :notice => "Campo aggiunto correttaemente."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey_template_line = SurveyTemplateLine.find(params[:id])
  end

  def update
    @survey_template_line = SurveyTemplateLine.find(params[:id])
    if @survey_template_line.update_attributes(params[:survey_template_line])
      redirect_to edit_survey_template_path(@survey_template_line.survey_template), :notice => "Campo modificato correttamente."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey_template_line = SurveyTemplateLine.find(params[:id])
    @survey_template=@survey_template_line.survey_template
    @survey_template_line.destroy
    redirect_to edit_survey_template_path(@survey_template), :notice => "Campo eliminato correttaemente."
  end
end
