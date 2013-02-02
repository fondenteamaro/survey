class SurveyTemplateLine < ActiveRecord::Base
  attr_accessible :survey_template_id, :domanda, :tipo_dato, :codice, :gruppo, :um, :progressivo, :parent_id
  validates_inclusion_of :tipo_dato, :in=> ["numerico","testuale"], :allow_nil=>true
  belongs_to :survey_template
  has_many :survey_response_lines

  acts_as_nested_set


  def name
     gruppo
  end

  def gruppi
    survey_template.survey_template_lines.roots
  end
end
