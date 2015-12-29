def sign_in( name: 'andrew',
            email: 'andy101@gmail.com',
            password: 'qwerty')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  click_button('Sign In')
end
