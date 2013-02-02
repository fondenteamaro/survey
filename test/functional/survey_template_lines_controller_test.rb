require 'test_helper'

class SurveyTemplateLinesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SurveyTemplateLine.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SurveyTemplateLine.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SurveyTemplateLine.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to survey_template_line_url(assigns(:survey_template_line))
  end

  def test_edit
    get :edit, :id => SurveyTemplateLine.first
    assert_template 'edit'
  end

  def test_update_invalid
    SurveyTemplateLine.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SurveyTemplateLine.first
    assert_template 'edit'
  end

  def test_update_valid
    SurveyTemplateLine.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SurveyTemplateLine.first
    assert_redirected_to survey_template_line_url(assigns(:survey_template_line))
  end

  def test_destroy
    survey_template_line = SurveyTemplateLine.first
    delete :destroy, :id => survey_template_line
    assert_redirected_to survey_template_lines_url
    assert !SurveyTemplateLine.exists?(survey_template_line.id)
  end
end
