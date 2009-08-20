#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client.
#
#
# Category::    Net
# Package::     Whois
# Author::      Simone Carletti <weppos@weppos.net>
# License::     MIT License
#
#--
#
#++


module Whois
  class Server
    module Adapters

      class Afilias < Base

        def request(qstring)
          response = ask_the_socket(qstring, "whois.afilias-grs.info", DEFAULT_WHOIS_PORT)
          endpoint = extract_referral(response)
          if endpoint
            response + "\n" + ask_the_socket(qstring, endpoint, DEFAULT_WHOIS_PORT)
          else
            response
          end
        end

        private

          def extract_referral(response)
            if response =~ /Domain Name:/ && response =~ /Whois Server:(\S+)/
              $1
            end
          end

      end
      
    end
  end
end