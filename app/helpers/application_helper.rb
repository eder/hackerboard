module ApplicationHelper
  def hint(object, attribute)
    scope = ["hints", object.class.name.underscore, attribute].join(".")
    translation = t(scope, :default => "")

    return if translation.blank?
    content_tag(:span, translation, :class => "hint")
  end

  def gravatar(email)
    email_hash = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email_hash}?s=25&d=mm", :alt => ""
  end

  def profile_link(user)
    render "shared/profile_link", :user => user
  end
end
