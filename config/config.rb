module Config
  mattr_accessor :pepper
  @@pepper = ENV["PEPPER"]

  mattr_accessor :stretches
  @@stretches = ENV["STRETCHES"].to_i

  mattr_accessor :secret_key
  @@secret_key = ENV["SECRET_KEY"]

  mattr_accessor :staticfiles_path
  @@staticfiles_path = ENV["STATICFILES_PATH"]
end
