Gem::Specification.new do |s|
  s.name              = 'integrity-jabber'
  s.version           = '1.0.1'
  s.date              = '2008-11-16'
  s.summary           = 'Jabber notifier for the Integrity continuous integration server'
  s.description       = 'Easily let Integrity send jabber messages after each build'
  s.homepage          = 'http://integrityapp.com'
  s.email             = 'ph@heykimo.com'
  s.authors           = ['Pier-Hugues Pellerin']
  s.has_rdoc          = false
  s.files             = %w(
                          lib/notifier/config.haml
                          lib/notifier/jabber.rb
                        )

  s.add_dependency 'foca-integrity'
  s.add_dependency 'xmpp4r-simple'
end
