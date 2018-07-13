require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe 'GET#new' do 
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { jack }
      end
    
    it 'goes to the new page' do 
      get :new
      expect(response).to render_template('new')
    end 
  end 
end
  describe 'POST#create' do
    context 'with valid params and public' do 
      it 'create new goal for user' do
        post :create, params: {goal: { goal: 'first goal', private: false, user_id: 1, completed:false} }
        expect(response).to redirect_to(user_url(1))
      end
    end
    
    # context 'with valid params and private' do 
    #   it 'create new goal for user' do
    #     post :create, params: {user: { username: 'user1', password: 'password'} }
    #     user = User.find_by(username: 'user1')
    #     expect(session[:session_token]).to eq(user.session_token)
    #     expect(response).to redirect_to(user_url(user))
    #   end
    # end
    # 
    # context 'with invalid params' do
    #   it 'redirects to create user page' do
    #     post :create, params: {user: { username: 'user1'} }
    #     user = User.find_by(username: 'user1')
    #     expect(response).to render_template(:new)
    #     expect(flash[:errors]).to be_present
    #   end
    # end 
    
  end 
end
