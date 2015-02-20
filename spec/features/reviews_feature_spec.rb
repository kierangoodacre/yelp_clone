require 'rails_helper'
require_relative '../helpers/session_helpers'

feature 'reviewing' do

	include SessionHelpers

	before do
		visit('/')
		sign_up
	end

	scenario 'allows users to leave a review using a form' do
		make_restaurant
		click_link('Sign out')
		sign_up_two
		click_link 'Review KFC'
		fill_in 'Thoughts', with: 'so so'
		select '3', from: 'Rating'
		click_button 'Leave Review'
		expect(current_path).to eq'/restaurants'
		expect(page).to have_content('so so')
	end

	scenario 'when restaurant is deleted so are reviews' do
	  make_restaurant
	  click_link "Review KFC"
	  save_and_open_page
	  fill_in "Thoughts", with: 'meh'
	  select '3', from: 'Rating'
	  click_button 'Leave Review'
    click_link 'Delete KFC'
    expect(page).to_not have_content('Cannot delete restaurants you have not created')
	end

	
end