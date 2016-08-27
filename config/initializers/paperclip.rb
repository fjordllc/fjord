if Rails.env.production?
  storage = :fog
else
  storage = :filesystem
end

Paperclip::Attachment.default_options[:storage] = storage
Paperclip::Attachment.default_options[:default_url] = ':class-:attachment-:style-missing.png'
Paperclip::Attachment.default_options[:fog_credentials] = Rails.root.join('config', 'gce.yml')
Paperclip::Attachment.default_options[:fog_directory] = 'fjord-cm'
