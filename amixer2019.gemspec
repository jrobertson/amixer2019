Gem::Specification.new do |s|
  s.name = 'amixer2019'
  s.version = '0.1.0'
  s.summary = 'A wrapper around the command-line program amixer. #amixer #alsamixer #raspberrypi'
  s.authors = ['James Robertson']
  s.files = Dir['lib/amixer2019.rb']
  s.signing_key = '../privatekeys/amixer2019.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/amixer2019'
end
