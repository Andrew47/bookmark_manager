feature 'Adding Tags' do
  scenario 'Can add tags upon creating a link' do
  visit '/links/new'
  fill_in('url', with: 'http://www.makersacademy.com/')
  fill_in('title', with: 'Makers Academy')
  fill_in('tags', with: 'Training')
  click_button 'Add Link'
  link = Link.first
  expect(link.tags.map(&:name)).to include('Training')
  end
end
