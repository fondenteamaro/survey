class SurveyResponseLine < ActiveRecord::Base
  attr_accessible :risposta, :survey_response_id, :survey_template_line_id
  belongs_to :survey_response
  belongs_to :survey_template_line

  def domanda
    survey_template_line.domanda   if survey_template_line
  end
  def codice
    survey_template_line.codice  if survey_template_line
  end
  def gruppo
    survey_template_line.gruppo  if survey_template_line
  end
  def tipo_dato
    survey_template_line.tipo_dato  if survey_template_line
  end
  def um
    survey_template_line.um if survey_template_line
  end
end
