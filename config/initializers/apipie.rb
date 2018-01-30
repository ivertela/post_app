Apipie.configure do |config|
	config.app_name                = "PostApp"
	config.api_base_url            = "/api"
	config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.translate         = false
  config.default_locale = nil
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
