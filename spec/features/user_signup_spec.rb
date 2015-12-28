feature 'Creating Users' do

  scenario 'There is a sign-up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end

  scenario 'I can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome andrew')
    expect(User.first.email).to eq("andy101@gmail.com")
  end

  scenario 'no user created if mismatching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match confirmation'
  end

  scenario 'user cannot sign up without entering an email' do
    visit '/users/new'
    fill_in :name, with: 'andrew'
    fill_in :password, with: 'qwerty'
    fill_in :password_confirmation, with: 'qwerty'
    fill_in :email, with: nil
    expect { click_button('Sign Up') }.not_to change(User, :count)
  end


 def sign_up( name: 'andrew',
              email: 'andy101@gmail.com',
              password: 'qwerty',
              password_confirmation: 'qwerty')
   visit '/users/new'
   fill_in :name, with: name
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button('Sign Up')
 end

end
