# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/whois/answer/parser/responses/whois.denic.de/schema-1.10.0/status_registered_spec.rb
#
# and regenerate the tests with the following rake task
#
#   $ rake genspec:parsers
#

require 'spec_helper'
require 'whois/answer/parser/whois.denic.de'

describe Whois::Answer::Parser::WhoisDenicDe, "status_registered.expected" do

  before(:each) do
    file = fixture("responses", "whois.denic.de/schema-1.10.0/status_registered.txt")
    part = Whois::Answer::Part.new(:body => File.read(file))
    @parser = klass.new(part)
  end

  context "#registrar" do
    it do
      @parser.registrar.should be_a(_registrar)
    end
    it do
      @parser.registrar.id.should           == nil
    end
    it do
      @parser.registrar.name.should         == "Domain Billing"
    end
    it do
      @parser.registrar.organization.should == "MarkMonitor"
    end
  end
  context "#registrant_contacts" do
    it do
      @parser.registrant_contacts.should be_a(Array)
    end
    it do
      @parser.registrant_contacts.should have(1).items
    end
    it do
      @parser.registrant_contacts[0].should be_a(_contact)
    end
    it do
      @parser.registrant_contacts[0].type.should         == Whois::Answer::Contact::TYPE_REGISTRANT
    end
    it do
      @parser.registrant_contacts[0].id.should           == nil
    end
    it do
      @parser.registrant_contacts[0].name.should         == "Google Inc."
    end
    it do
      @parser.registrant_contacts[0].city.should         == "Mountain View"
    end
    it do
      @parser.registrant_contacts[0].zip.should          == "94043"
    end
    it do
      @parser.registrant_contacts[0].state.should        == nil
    end
    it do
      @parser.registrant_contacts[0].phone.should        == nil
    end
    it do
      @parser.registrant_contacts[0].fax.should          == nil
    end
    it do
      @parser.registrant_contacts[0].email.should        == nil
    end
  end
  context "#admin_contacts" do
    it do
      @parser.admin_contacts.should be_a(Array)
    end
    it do
      @parser.admin_contacts.should have(1).items
    end
    it do
      @parser.admin_contacts[0].should be_a(_contact)
    end
    it do
      @parser.admin_contacts[0].type.should         == Whois::Answer::Contact::TYPE_ADMIN
    end
    it do
      @parser.admin_contacts[0].id.should           == nil
    end
    it do
      @parser.admin_contacts[0].name.should         == "Lena Tangermann"
    end
    it do
      @parser.admin_contacts[0].organization.should == "Google Germany GmbH"
    end
    it do
      @parser.admin_contacts[0].address.should      == "ABC-Strasse 19"
    end
    it do
      @parser.admin_contacts[0].city.should         == "Hamburg"
    end
    it do
      @parser.admin_contacts[0].zip.should          == "20354"
    end
    it do
      @parser.admin_contacts[0].state.should        == nil
    end
    it do
      @parser.admin_contacts[0].phone.should        == nil
    end
    it do
      @parser.admin_contacts[0].fax.should          == nil
    end
    it do
      @parser.admin_contacts[0].email.should        == nil
    end
  end
  context "#technical_contacts" do
    it do
      @parser.technical_contacts.should be_a(Array)
    end
    it do
      @parser.technical_contacts.should have(1).items
    end
    it do
      @parser.technical_contacts[0].should be_a(_contact)
    end
    it do
      @parser.technical_contacts[0].type.should         == Whois::Answer::Contact::TYPE_TECHNICAL
    end
    it do
      @parser.technical_contacts[0].id.should           == nil
    end
    it do
      @parser.technical_contacts[0].name.should         == "Google Inc."
    end
    it do
      @parser.technical_contacts[0].city.should         == "Mountain View"
    end
    it do
      @parser.technical_contacts[0].zip.should          == "94043"
    end
    it do
      @parser.technical_contacts[0].state.should        == nil
    end
    it do
      @parser.technical_contacts[0].phone.should        == "+1-6503300100"
    end
    it do
      @parser.technical_contacts[0].fax.should          == "+1-6506188571"
    end
    it do
      @parser.technical_contacts[0].email.should        == "dns-admin@google.com"
    end
  end
end
