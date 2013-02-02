class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.integer :survey_template_id
      t.string :azienda
      t.string :nome
      t.string :cognome
      t.string :telefono
      t.string :email
      t.integer :user_id
      t.date :data_compilazione

      t.timestamps
    end
  end
end
