# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'Filter links' do
  scenario 'I can visit the page associated with a tag' do
    visit '/'
    fill_in 'tag_name', with: 'bubbles'
    click_button 'Filter by tag'
     expect(page.status_code).to eq 200
  end

  scenario 'I can see the links associated with a tag' do
    visit '/'
    click_button('Add Link')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com/')
    fill_in 'tags', with: 'bubbles'
    click_button('Add Link')
    click_button('Add Link')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk/')
    fill_in 'tags', with: 'news'
    click_button('Add Link')
    fill_in 'tag_name', with: 'bubbles'
    click_button('Filter by tag')
       within 'ul#tag_links' do
         expect(page).to have_content('Makers Academy')
         expect(page).not_to have_content('BBC')
       end
     end
   end
