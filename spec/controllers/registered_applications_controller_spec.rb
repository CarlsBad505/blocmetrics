require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:user) { User.create!(name: "john snow", email: "johnsnow@gmail.com", password: "winteriscoming") }
  let(:registered_application) { RegisteredApplication.create!(name: "YapBox", url: "www.yapbox.com", user: user) }
  let(:event) { Event.create!(name: "sign ups", registered_application: registered_application) }

  context "guest" do
    describe "GET #index" do
      it "redirects to sign up view" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "GET #show" do
      it "redirects to sign up view" do
        get :show, { id: registered_application.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to sign up view" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "redirects to sign up view" do
        get :edit, { id: registered_application.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST #create" do
      it "redirects to sign up view" do
        post :create, registered_application: { name: "FlappyBird", url: "www.flappybird.com" }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT #update" do
      it "redirects to sign up view" do
        put :edit, { id: registered_application.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE #destroy" do
      it "redirects to sign up view" do
        delete :destroy, { id: registered_application.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  context "signed in user" do
    before do
      sign_in(user)
    end
    
    describe "GET #index" do
      it "should return the user index view" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "assigns RegisteredApplication.all to registered_application" do
        get :index
        expect(assigns(:registered_applications)).to eq([registered_application])
      end
    end
  end
end
  

 