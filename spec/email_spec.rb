require 'spec_helper'

describe Opensrs::Email::Gateway do
  let! (:gateway) { Opensrs::Email::Gateway.new('admin.test.hostedemail.com', 4449, 'admin', 'domain.com', 'password') }

  describe "Gateway" do
    it "should respond to create_domain" do
      expect(gateway).to respond_to(:create_domain)
    end

    it "should respond to create_mailbox_forward_only" do
      expect(gateway).to respond_to(:create_mailbox_forward_only)
    end

    it "should respond to delete_mailbox_forward_only" do
      expect(gateway).to respond_to(:delete_mailbox_forward_only)
    end

    it "should build response as documented by opensrs" do
      response_body = "OK 0 Mailbox created\r\n.\r\n"
      response = gateway.parse_response(response_body)
      expect(response[:status]).to eq("OK")
      expect(response[:status_code]).to eq(0)
    end
  end
end

