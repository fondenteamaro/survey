class CreateSurveyTemplates < ActiveRecord::Migration
  def self.up
    create_table :survey_templates do |t|
      t.string :nome
      t.boolean :attivo
      t.string :categoria
      t.string :descrizione
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_templates
  end
end
