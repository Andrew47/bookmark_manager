

require 'user'


describe User do

subject(:user){described_class.new}

# describe '#count' do
#   it 'should have default value of zero' do
#     expect(user.count).to eq 0
#   end
#
#   it 'has a value of 1 upon an addition' do
#     User.create(name: "terry",password: "qwerty", email: "terry@gmail.com")
#     expect(user.count).to eq 1
#   end
#
# end

   it 'checks email address is correct for user' do
     User.create(name: "terry",password: "qwerty", email: "terry@gmail.com", password_confirmation: "qwerty")
     expect(User.first.email).to eq("terry@gmail.com")
   end

end
