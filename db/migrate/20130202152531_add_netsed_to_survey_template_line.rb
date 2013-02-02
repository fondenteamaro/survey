class AddNetsedToSurveyTemplateLine < ActiveRecord::Migration
  def change
    change_table :survey_template_lines do |t|
        t.integer :parent_id
        t.integer :lft
        t.integer :rgt
        t.integer :depth # this is optional.
      end
  end
end
