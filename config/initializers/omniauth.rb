Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, "4614983382.15943652465", "3182116576ec1c74c6735621aea79de3", scope: "client"
end
