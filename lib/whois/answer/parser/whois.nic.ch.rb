#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
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


require 'whois/answer/parser/base'


module Whois
  class Answer
    class Parser

      #
      # = whois.nic.ch parser
      #
      # Parser for the whois.nic.ch server.
      #
      # NOTE: This parser is just a stub and provides only a few basic methods
      # to check for domain availability and get domain status.
      # Please consider to contribute implementing missing methods.
      # See WhoisNicIt parser for an explanation of all available methods
      # and examples.
      #
      class WhoisNicCh < Base

        property_supported :status do
          if available?
            :available
          else
            :registered
          end
        end

        property_supported :available? do
          !!(content_for_scanner =~ /We do not have an entry/)
        end

        property_supported :registered? do
          !available?
        end


        property_not_supported :created_on

        property_not_supported :updated_on

        property_not_supported :expires_on


        # Nameservers are listed in the following formats:
        #
        #   ns1.citrin.ch
        #   ns1.citrin.ch  [193.247.72.8]
        #
        property_supported :nameservers do
          if content_for_scanner =~ /Name servers:\n((.+\n)+)(?:\n|\z)/
            list = {}
            $1.split("\n").map do |line|
              if line =~ /(.+)\t\[(.+)\]/
                name, ip = $1, $2
                list[name] ||= Answer::Nameserver.new(name)
                list[name].ipv4 = ip if Whois::Server.valid_ipv4?(ip)
                list[name].ipv6 = ip if Whois::Server.valid_ipv6?(ip)
              else
                list[line] ||= Answer::Nameserver.new(line)
              end
            end
            list.values
          end || []
        end

      end

    end
  end
end
