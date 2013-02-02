require 'test_helper'

class SurveyTemplateLineTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SurveyTemplateLine.new.valid?
  end
end
