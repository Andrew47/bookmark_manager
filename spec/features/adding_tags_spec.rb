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

feature 'Add mutiple tags to the same link' do
  scenario 'Type in multiple tag names into tags form' do
    visit '/links/new'
    fill_in('url', with: 'http://www.google.com/')
    fill_in('title', with: 'Google')
    fill_in('tags', with: 'research information internship')
    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('internship', 'research', 'information')
  end
end
