# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Create question" do
  context "when unlogged" do
    before do
      visit "/"
      click_link "Criar nova pergunta"
    end

    it "redirects to login page" do
      current_path.should eql(login_path)
    end
  end

  context "when logged" do
    context "with valid data" do
      before do
        login :with => users(:john).email

        visit "/"
        click_link "Criar nova pergunta"

        fill_in "Sua pergunta", :with => "Some question"
        fill_in "Detalhe sua pergunta", :with => "Some details"
        select "Ruby", :from => "Escolha uma categoria"
        click_button "Criar pergunta"
      end

      it "displays success message" do
        page.should have_content("Sua pergunta foi criada com sucesso.")
      end

      it "displays question name" do
        page.should have_content("Some question")
      end

      it "renders question page" do
        current_path.should match(%r[/questions/\d+])
      end
    end

    context "with invalid data" do
      before do
        login :with => users(:john).email

        visit "/"
        click_link "Criar nova pergunta"

        click_button "Criar pergunta"
      end

      it "renders new question page" do
        current_path.should eql(new_question_path)
      end

      it "displays error message" do
        page.should have_content("Verifique seu formulário antes de continuar")
      end
    end
  end
end
