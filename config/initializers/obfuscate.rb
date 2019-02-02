require 'obfuscate/obfuscatable'

Obfuscate.setup do |config|
  config.salt = ENV.fetch('OBFUSCATE_SALT')
end
