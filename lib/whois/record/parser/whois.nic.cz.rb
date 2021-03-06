#--
# Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
# Copyright (c) 2009-2015 Simone Carletti <weppos@weppos.net>
#++


require 'whois/record/parser/base_whoisd'
require 'whois/record/scanners/whois.nic.cz.rb'


module Whois
  class Record
    class Parser

      # Parser for the whois.nic.cz server.
      #
      # @see Whois::Record::Parser::Example
      #   The Example parser for the list of all available methods.
      #
      class WhoisNicCz < BaseWhoisd

        self.scanner = Scanners::WhoisNicCz

        property_supported :status do
          if available?
            :available
          else
            :registered
          end
        end


        def response_throttled?
          !!node("response:throttled")
        end

      end

    end
  end
end
