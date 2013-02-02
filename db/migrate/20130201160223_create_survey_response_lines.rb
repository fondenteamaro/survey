class CreateSurveyResponseLines < ActiveRecord::Migration
  def change
    create_table :survey_response_lines do |t|
      t.integer :survey_response_id
      t.integer :survey_template_line_id
      t.string :risposta
      t.integer :progressivo

      t.timestamps
    end
  end
end
