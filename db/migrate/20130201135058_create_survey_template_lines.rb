class CreateSurveyTemplateLines < ActiveRecord::Migration
  def self.up
    create_table :survey_template_lines do |t|
      t.integer :survey_template_id
      t.string :domanda
      t.string :tipo_dato
      t.string :codice
      t.string :gruppo
      t.string :um
      t.integer :progressivo
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_template_lines
  end
end
