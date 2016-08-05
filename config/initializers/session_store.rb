if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_fjord_session', domain: 'fjord.cm'
elsif Rails.env.staging?
  Rails.application.config.session_store :cookie_store, key: '_fjord_session', domain: 'fjord-cm-staging.com'
else
  Rails.application.config.session_store :cookie_store, key: '_fjord_session', domain: 'lvh.me'
end
