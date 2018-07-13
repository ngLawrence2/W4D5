require 'rails_helper'

RSpec.describe UsersController, type: :controller do 
  
  describe 'GET#new' do 
    it 'changes to sign up page' do 
      get :new
      expect(response).to render_template(:new)
    end 
  end 
  
  describe 'POST#create' do
    context 'with valid params' do 
      it 'logs in user' do
        post :create, params: {user: { username: 'user1', password: 'password'} }
        user = User.find_by(username: 'user1')
        expect(session[:session_token]).to eq(user.session_token)
        expect(response).to redirect_to(user_url(user))
      end
    end
    
    context 'with invalid params' do
      it 'redirects to create user page' do
        post :create, params: {user: { username: 'user1'} }
        user = User.find_by(username: 'user1')
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
      
    end 
    
  end 
end 
