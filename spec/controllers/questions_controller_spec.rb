require 'spec_helper'

describe QuestionsController do

  let(:current_user) { FactoryGirl.create(:user) }
  let(:quiz) { FactoryGirl.create(:quiz, user: current_user) }

  let(:valid_get_params) { {quiz_id: quiz.id} }
  let(:valid_post_params) { {quiz_id: quiz.id, question: FactoryGirl.attributes_for(:question)} }
  let(:valid_session) { { user_token: current_user.session_token } }

  describe "as a guest user" do
    describe "GET #new" do
      it "redirects to the log in page" do
        get :new, valid_get_params
        expect(response).to redirect_to(new_session_request_path)
      end
    end
    describe "POST #create" do
      it "redirects to the log in page" do
        post :create, valid_post_params
        expect(response).to redirect_to(new_session_request_path)
      end
    end

  end

  describe "as the owner of the quiz" do
    describe "GET #new" do
      it "renders the new template" do
        get :new, valid_get_params, valid_session
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      it "saves the question for the current quiz" do
        expect {
          post :create, valid_post_params, valid_session
        }.to change { quiz.questions.count }.from(0).to(1)
      end
    end
  end

  describe "as a different user" do
    let(:other_user) { FactoryGirl.create(:user) }
    let(:invalid_session) { { user_token: other_user.session_token } }

    describe "GET #new" do
      it "redirects to the log in page" do
        get :new, valid_get_params, invalid_session
        expect(response).to redirect_to(new_session_request_path)
      end
    end

    describe "POST #create" do
      it "redirects to the log in page" do
        post :create, valid_post_params, invalid_session
        expect(response).to redirect_to(new_session_request_path)
      end
    end

  end

end
