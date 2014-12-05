Rails.application.configure do
  config.i18n.default_locale = 'en'
  config.i18n.available_locales = ['en', 'zh-CN']
  config.i18n.locale_names = {
    :'en'    => 'English',
    :'zh-CN' => '简体中文'
  }
end
