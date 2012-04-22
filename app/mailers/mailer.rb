class Mailer < ActionMailer::Base
  default from: "Hackerboard <noreply@hackerboard.com>"
  # default_url_options[:host] = "example.org"

  #
  #   Mailer.welcome({
  #     :url => "http://example.org",
  #     :name => "John Doe",
  #     :email => "john@example.org"
  #   }).deliver
  #
  def welcome(options)
    @options = options
    mail :to => options[:email], :subject => t("subjects.welcome") do |format|
      format.text
      format.html
    end
  end
end
