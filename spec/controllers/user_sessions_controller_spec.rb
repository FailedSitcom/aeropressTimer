require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end


  describe "POST 'create'" do
    context "with correct credentials" do
      let!(:user) { User.create(first_name: "Samuel", last_name: "Durkin", email: "sam.thomas.durkin@gmail.com", password: "password1234", password_confirmation: "password1234" ) }

      it "redirects to the recipe path" do
        post :create, email: "sam.thomas.durkin@gmail.com", password: "password1234"
        expect(response).to be_redirect
        expect(response).to redirect_to(recipes_path)
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email: "sam.thomas.durkin@gmail.com"}).and_return(user)
        post :create, email: "sam.thomas.durkin@gmail.com", password: "password1234"
      end

      it "authenticates the user" do
        User.stub(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, email: "sam.thomas.durkin@gmail.com", password: "password1234"
      end
    end
  end

end
