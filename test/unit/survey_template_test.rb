require 'test_helper'

class SurveyTemplateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SurveyTemplate.new.valid?
  end
end
