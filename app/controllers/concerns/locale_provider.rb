require 'active_support/concern'

module LocaleProvider
  extend ActiveSupport::Concern

  def set_locale
    I18n.locale = cookies[:lang] || I18n.default_locale
  end

end