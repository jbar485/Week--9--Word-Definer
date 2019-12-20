require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("create a word path", {:type => :feature}) do
  it "creates a word and then navigates to the word page" do
    visit("/words")
    save_and_open_page
    click_on("Add a New Word")
    fill_in("word_name", :with => "Awesome")
    click_on("Create")
    expect(page).to have_content("Awesome")
  end
end


describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new("Love", nil)
    word.save
    visit("/words/#{word.id}")
    save_and_open_page
    fill_in('definition_name', :with => 'Act of loving someone')
    click_on('Add')
    expect(page).to have_content('Act of loving someone')
  end
end
