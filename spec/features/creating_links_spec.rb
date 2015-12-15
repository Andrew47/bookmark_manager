# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'Creating links' do
  scenario 'I can submit links' do
    visit '/'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    click_button('Add Link')
    within 'ul#links' do
      expect(page).to have_content('http://www.makersacademy.com')
    end
  end
end
