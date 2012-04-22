# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Login" do
  context "with valid credentials" do
    before do
      visit "/"
      click_link "Entrar"
      fill_in "Seu e-mail", :with => users(:john).email
      fill_in "Sua senha", :with => "test"
      click_button "Entrar"
    end

    it "redirects to dashboard" do
      current_path.should eql("/dashboard")
    end

    it "displays user name" do
      page.should have_content("John Doe")
    end
  end

  context "with invalid credentials" do
    before do
      visit "/"
      click_link "Entrar"
      click_button "Entrar"
    end

    it "renders login page" do
      current_path.should eql("/login")
    end

    it "displays error message" do
      page.should have_content("E-mail/senha inválidos.")
    end
  end
end
