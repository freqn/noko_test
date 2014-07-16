require 'spec_helper'

feature "View the home page" do

  scenario "users should sees relevant information" do
    visit root_path
    expect(page).to have_css 			'title', text: "Lit Temple", visible: false
    expect(page).to have_content 	'Reddit:'
		expect(page).to have_text 		'Looking for something simple?'
    expect(page).to have_css 			'.sec-heading'
  end
  
end
