class SurveyTemplateLine < ActiveRecord::Base
  attr_accessible :survey_template_id, :domanda, :tipo_dato, :codice, :gruppo, :um, :progressivo
  validates_inclusion_of :tipo_dato, :in=> ["numerico","testuale"]
  belongs_to :survey_template
  has_many :survey_response_lines


end
