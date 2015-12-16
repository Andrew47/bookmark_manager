# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature 'Viewing links' do
  before do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can see existing links on the links page' do
    visit '/links'
    # as this is our first feature test,
       # the following expectation is a quick check that everything is working.
       expect(page.status_code).to eq 200
       # you might remove this later.

       # why do we use within here?
       # might we get a false positive if we just test for 'Makers Academy'?
       within 'ul#links' do
         expect(page).to have_content('Makers Academy')
         expect(page).to have_content('Google')
         expect(page).to have_content('This is Zombocom')
         expect(page).to have_content('Bubble Bobble')
       end
     end

     # As a time-pressed user
     # So that I can quickly find links on a particular topic
     # I would like to filter links by tag

       scenario 'I can see the links associated with a tag' do
         visit '/tags/bubbles'
           expect(page.status_code).to eq 200
            within 'ul#links' do
              expect(page).not_to have_content('Makers Academy')
              expect(page).not_to have_content('Google')
              expect(page).to have_content('This is Zombocom')
              expect(page).to have_content('Bubble Bobble')
            end
          end



   end
