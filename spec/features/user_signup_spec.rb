feature 'Creating Users' do

  scenario 'I can see user count' do
    visit '/users/new'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end

  scenario 'User welcome message on new signup' do
    visit '/users/new'
    fill_in('name', with: 'andrew')
    fill_in('email', with: 'andy101@gmail.com')
    fill_in('password', with: 'qwerty')
    click_button('Sign Up')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome andrew')
  end

  feature 'user sign-up' do
    scenario 'sign up as new user' do
    visit '/users/new'
    fill_in('name', with: 'andrew')
    fill_in('email', with: 'andy101@gmail.com')
    fill_in('password', with: 'qwerty')
    click_button('Sign Up')
    expect(User.first.email).to eq("andy101@gmail.com")
  end
 end

end
