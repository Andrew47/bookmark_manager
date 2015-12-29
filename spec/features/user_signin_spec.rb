feature 'Signing in Users' do

  let(:user) do
    User.create(name: 'andrew',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.name}"
  end

  def sign_in( name: 'andrew',
              email: 'andy101@gmail.com',
              password: 'qwerty')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign In')
  end

end
