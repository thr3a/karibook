Amazon::Ecs.configure do |options|
  options[:associate_tag] = Rails.application.secrets.associate_tag
  options[:AWS_access_key_id] = Rails.application.secrets.AWS_access_key
  options[:AWS_secret_key] = Rails.application.secrets.AWS_secret_key
end
