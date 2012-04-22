module IntegrationHelper
  def login(options = {})
    visit login_path
    fill_in "Seu e-mail", :with => options[:with]
    fill_in "Sua senha", :with => "test"
    click_button "Entrar"

    page.should have_content("John Doe")
  end
end
