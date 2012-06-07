# -*-encoding: utf-8 -*-
require "spec_helper"

describe "Comment on question" do
  let(:question) { questions(:what_is_enum) }

  context "when logged" do
    context "with valid data" do
      before do
        login :with => users(:john).email
        visit "/"
        click_link question.title

        fill_in "Seu comentário", :with => "Some comment"
        click_button "Enviar comentário"
      end

      it "redirects to the question page" do
        current_path.should eql(question_path(question))
      end

      it "displays comment" do
        page.should have_content("Some comment")
      end

      it "displays success message" do
        page.should have_content("Seu comentário foi adicionado.")
      end
    end

    context "with invalid data" do
      before do
        login :with => users(:john).email
        visit "/"
        click_link question.title

        click_button "Enviar comentário"
      end

      it "redirects to the question page" do
        current_path.should eql(question_path(question))
      end

      it "displays error message" do
        page.should have_content("Preencha o seu comentário")
      end
    end
  end

  context "when not logged" do
    before do
      visit "/"
      click_link question.title
    end

    it "displays message" do
      page.should have_content("Faça seu login para comentar")
    end
  end
end
