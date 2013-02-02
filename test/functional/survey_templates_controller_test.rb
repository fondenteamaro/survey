require 'test_helper'

class SurveyTemplatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SurveyTemplate.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SurveyTemplate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SurveyTemplate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to survey_template_url(assigns(:survey_template))
  end

  def test_edit
    get :edit, :id => SurveyTemplate.first
    assert_template 'edit'
  end

  def test_update_invalid
    SurveyTemplate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SurveyTemplate.first
    assert_template 'edit'
  end

  def test_update_valid
    SurveyTemplate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SurveyTemplate.first
    assert_redirected_to survey_template_url(assigns(:survey_template))
  end

  def test_destroy
    survey_template = SurveyTemplate.first
    delete :destroy, :id => survey_template
    assert_redirected_to survey_templates_url
    assert !SurveyTemplate.exists?(survey_template.id)
  end
end
