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

end
