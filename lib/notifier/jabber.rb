require 'rubygems'
require 'integrity'
require 'xmpp4r-simple'

module Integrity
  class Notifier
    class Jabber < Notifier::Base
      attr_reader :recipients

      def self.to_haml
        File.read File.dirname(__FILE__) / "config.haml"
      end
      
      def initialize(build, config = {})
        @server = ::Jabber::Simple.new(config.delete("user"), config.delete("pass"))
        sleep 4
        @recipients = config["recipients"].nil? ? [] : config.delete("recipients").split(/\s+/) 
        super
      end

      def deliver!
        @recipients.each do |r|
          @server.deliver(r, message)
        end
      end

      def message
        @message ||= <<-content
#{build.project.name}: #{short_message} (at #{build.commited_at} by #{build.commit_author.name})
Commit Message: '#{build.commit_message}'          
Link: #{build_url}
content
      end
    end
  end
end
