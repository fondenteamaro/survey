class SurveyResponse < ActiveRecord::Base
  attr_accessible :survey_response_lines_attributes , :survey_template_id , :user_id, :azienda , :nome, :cognome, :telefono, :email, :data_compilazione
  has_many :survey_response_lines  , :dependent => :delete_all
  belongs_to :survey_template

  validates_associated :survey_template
  accepts_nested_attributes_for :survey_response_lines
end
