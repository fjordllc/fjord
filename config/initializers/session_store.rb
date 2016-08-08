Rails.application.config.session_store :cookie_store, key: '_fjord_session', domain: {
  'production' => '.fjord.cm',
  'staging'    => '.fjord-cm-dev.com'
}.fetch(Rails.env, '.lvh.me')
