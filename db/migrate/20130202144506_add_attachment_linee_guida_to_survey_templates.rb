class AddAttachmentLineeGuidaToSurveyTemplates < ActiveRecord::Migration
  def self.up
    change_table :survey_templates do |t|
      t.attachment :linee_guida
    end
  end

  def self.down
    drop_attached_file :survey_templates, :linee_guida
  end
end
