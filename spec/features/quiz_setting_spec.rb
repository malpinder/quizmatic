require 'spec_helper'

feature "Setting a quiz" do

  scenario "with simple questions" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit '/'
    click_link 'Set new quiz'

    fill_in :quiz_title, with: "My first quiz"
    fill_in :quiz_instructions, with: "Answer all questions."

    click_button "Create quiz"

    expect(page).to have_content "Your quiz has been created."

    click_link "Add a question"

    expect(page).to have_content "Adding a question to 'My first quiz'"
    fill_in :question_body, with: "What is my first question?"
    fill_in :question_available_marks, with: "1"
    click_button "Add question"

    expect(page).to have_content "Question added"

    visit '/'
    expect(page).to have_content "My first quiz"
    expect(page).to have_button "Publish"

    click_button "Publish"
    expect(page).to have_content "Quiz updated"
    expect(page).to have_button "Unpublish"
  end


end
