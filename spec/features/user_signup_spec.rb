feature 'Creating Users' do

  scenario 'I can see user count' do
    visit '/users/sign_in'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end

  scenario 'User welcome message on new signup' do
    visit '/users/sign_in'
    fill_in('name', with: 'andrew')
    fill_in('email', with: 'andy101@gmail.com')
    fill_in('password', with: 'qwerty')
    click_button('Sign Up')

    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome New User')
  end


end
