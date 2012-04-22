# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Signup" do
  context "when sending valid data" do
    before do
      visit "/"
      click_link "Cadastre-se"

      fill_in "Nome completo", :with => "John Doe"
      fill_in "E-mail", :with => "doe@example.org"
      fill_in "Senha", :with => "test"
      fill_in "Confirmação da senha", :with => "test"

      click_button "Quero me cadastrar!"
    end

    it "redirects to login page" do
      current_path.should eql("/login")
    end

    it "displays success message" do
      page.should have_content("Sua conta foi criada com sucesso!")
    end

    it "accepts account credentials" do
      login :with => "doe@example.org"
    end
  end

  context "with invalid data" do
    before do
      visit "/"
      click_link "Cadastre-se"
      click_button "Quero me cadastrar!"
    end

    it "displays error message" do
      page.should have_content("Verifique seu formulário antes de continuar")
    end

    it "renders login page" do
      current_path.should eql(signup_path)
    end
  end
end
