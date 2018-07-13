require 'spec_helper'
require 'rails_helper'
require 'faker'

feature 'SignUp' do 
  background :each do
    visit new_user_url
  end

  feature 'the signup process' do
    scenario 'has a new user page' do 
      expect(page).to have_content('Sign Up')
    end 

    feature 'signing up a user' do
      scenario 'shows username on the homepage after signup' do
        username = Faker::StarWars.character
        create_user(username, Faker::Superhero.name)
        expect(page).to have_content(username) 
      end 
    end
  end
end

feature 'Log in ' do 
  background :each do
    visit new_session_url
  end

  feature 'logging in' do
    scenario 'shows username on the homepage after login' do
      user1 = User.create(username: 'abcd', password: '123456')
      fill_in('Username', with: 'abcd')
      fill_in('Password', with: '123456')
      click_on('submit')
      expect(page).to have_content('abcd') 
    end 
  end

  feature 'logging out' do
    scenario 'begins with a logged out state' do
      user1 = User.create(username: 'abcd', password: '123456')
      fill_in('Username', with: 'abcd')
      fill_in('Password', with: '123456')
      click_on('submit')
      click_on('log out')
      expect(page).to have_content('Sign In') 
    end
    
    scenario 'doesn\'t show username on the homepage after logout' do
      user1 = User.create(username: 'abcd', password: '123456')
      fill_in('Username', with: 'abcd')
      fill_in('Password', with: '123456')
      click_on('submit')
      click_on('log out')
      expect(page).not_to have_content('abcd')
    end
  end
end

