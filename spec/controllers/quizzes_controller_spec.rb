require 'spec_helper'

describe QuizzesController do

  let(:current_user) { FactoryGirl.create(:user) }
  let(:quiz) { FactoryGirl.create(:quiz, user: current_user) }

  let(:valid_show_params) { {id: quiz.id} }
  let(:valid_create_params) { {quiz: FactoryGirl.attributes_for(:quiz)} }
  let(:valid_update_params) { {id: quiz.id, quiz: {published: true}} }
  let(:valid_session) { { user_token: current_user.session_token } }

  describe "as a guest user" do
    describe "GET #new" do
      it "redirects to the log in page" do
        get :new
        expect(response).to redirect_to(new_session_request_path)
      end
    end

    describe "POST #create" do
      it "redirects to the log in page" do
        post :create, valid_create_params
        expect(response).to redirect_to(new_session_request_path)
      end
    end

    describe "GET #show" do
      it "redirects to the log in page" do
        get :show, valid_show_params
        expect(response).to redirect_to(new_session_request_path)
      end
    end

    describe "PUT #update" do
      it "redirects to the log in page" do
        put :update, valid_update_params
        expect(response).to redirect_to(new_session_request_path)
      end
    end
  end

  describe "as the owner of the quiz" do
    describe "GET #new" do
      it "renders the new template" do
        get :new, {}, valid_session
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      it "saves the quiz" do
        expect {
          post :create, valid_create_params, valid_session
        }.to change { Quiz.count }.from(0).to(1)
      end
    end

    describe "GET #show" do
      it "renders the show template" do
        get :show, valid_show_params, valid_session
        expect(response).to render_template :show
      end
    end

    describe "PUT #update" do
      it "redirects to back" do
        request.env["HTTP_REFERER"] = '/'
        put :update, valid_update_params, valid_session
        expect(response).to redirect_to '/'
      end
    end
  end

  describe "as a different user" do
    let(:other_user) { FactoryGirl.create(:user) }
    let(:invalid_session) { { user_token: other_user.session_token } }

    describe "GET #show" do
      it "redirects to the log in page" do
        get :show, valid_show_params, invalid_session
        expect(response).to redirect_to(new_session_request_path)
      end
    end

    describe "PUT #update" do
      it "redirects to the log in page" do
        put :update, valid_update_params, invalid_session
        expect(response).to redirect_to(new_session_request_path)
      end
    end
  end

end
