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
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'user cannot sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'user can not sign up with an already registered email address' do
    sign_up(email: 'andy101@gmail.com')
    expect { sign_up(email: 'andy101@gmail.com') }.not_to change(User, :count)
    expect(page).to have_content 'Email address taken'
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
