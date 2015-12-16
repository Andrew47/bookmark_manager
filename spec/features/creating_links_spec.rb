# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'Creating links' do

  scenario 'I can access link creation page' do
    visit '/'
    click_button 'Add Link'
    expect(page).to have_content('New Link')
  end

  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com/')
    click_button('Add Link')

    # want to be redirected back to links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
