module Config
  mattr_accessor :pepper
  @@pepper = 'salt'

  mattr_accessor :stretches
  @@stretches = 1

  mattr_accessor :secret_key
  @@secret_key = 'very secreto key'

  mattr_accessor :staticfiles_path
  @@staticfiles_path = '../staticfiles'
end
