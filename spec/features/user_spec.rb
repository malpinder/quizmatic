require 'spec_helper'
require 'uri'

feature "User management" do

  scenario "registering a new account" do
    visit "/"
    click_link "Join"

    fill_in :user_email, with: 'me@arg.org'
    fill_in :user_display_name, with: 'mr teach'
    click_button "Join"

    expect(page).to have_content "Please check your email"

    deliveries = ActionMailer::Base.deliveries
    expect(deliveries).to_not be_empty

    email = deliveries.last
    link = URI.parse(URI.extract(email.parts.first.body.to_s, 'http').first)
    visit link.path

    expect(page).to have_content "You have been logged in."
  end

  scenario "logging in" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link "Log in"

    fill_in :email, with: user.email
    click_button "Send login link"

    expect(page).to have_content "Please check your email"

    deliveries = ActionMailer::Base.deliveries
    expect(deliveries).to_not be_empty

    email = deliveries.last
    link = URI.parse(URI.extract(email.parts.first.body.to_s, 'http').first)
    visit link.path

    expect(page).to have_content "You have been logged in."
  end

  scenario "logging out" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit "/"
    expect(page).to_not have_content "Log in"

    click_button "Log out"
    expect(page).to have_content "You have been logged out."
  end

end
