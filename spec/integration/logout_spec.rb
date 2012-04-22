# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Logout" do
  context "when logged" do
    before do
      login :with => users(:john).email

      visit "/"
      click_link "Sair"
      click_link "Criar nova pergunta"
    end

    it "redirects to login page" do
      current_path.should eql(login_path)
    end
  end
end
