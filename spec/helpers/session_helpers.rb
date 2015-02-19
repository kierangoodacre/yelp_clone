module SessionHelpers 

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_two
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'testy@example.com')
    fill_in('Password', with: 'testytesty')
    fill_in('Password confirmation', with: 'testytesty')
    click_button('Sign up')
  end

  def edit_restaurant
    click_link('editKFC')
  end

  def make_restaurant
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
  end

end