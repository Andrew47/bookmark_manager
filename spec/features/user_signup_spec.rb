feature 'Creating Users' do

  scenario 'There is a sign-up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end

  scenario 'I can sign up' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome andrew')
    expect(User.first.email).to eq("andy101@gmail.com")
  end

 def sign_up
   visit '/users/new'
   expect(page.status_code).to eq 200
   fill_in('name', with: 'andrew')
   fill_in('email', with: 'andy101@gmail.com')
   fill_in('password', with: 'qwerty')
   click_button('Sign Up')
 end

end
