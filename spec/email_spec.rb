require 'spec_helper'

describe Opensrs::Email::Gateway do
  let! (:gateway) { Opensrs::Email::Gateway.new('admin.test.hostedemail.com', 4449, 'admin', 'domain.com', 'password') }

  describe "Gateway" do
    it "responds to create_domain" do
      expect(gateway).to respond_to(:create_domain)
    end

    it "responds to create_mailbox_forward_only" do
      expect(gateway).to respond_to(:create_mailbox_forward_only)
    end

    it "responds to delete_mailbox_forward_only" do
      expect(gateway).to respond_to(:delete_mailbox_forward_only)
    end

    it "parses successful response" do
      response_body = "OK 0 Mailbox created\r\n.\r\n"
      response = gateway.parse_response(response_body)
      expect(response[:status]).to eq("OK")
      expect(response[:status_code]).to eq(0)
    end

    it "parses error response" do
      response_body = "ER 16 Mailbox already existed\r\n.\r\n"
      response = gateway.parse_response(response_body)
      expect(response[:status]).to eq("ER")
      expect(response[:status_code]).to eq(16)
    end

    it "does not parse status code other than OK and ER" do
      response_body = "BL 33 Invalid status code\r\n.\r\n"
      response = gateway.parse_response(response_body)
      expect(response[:status]).to eq(nil)
      expect(response[:status_code]).to eq(nil)
    end

    it "builds command string correctly" do
      command = :create_mailbox_forward_only
      attributes = {:mailbox => "test", :domain => "testdomain.com", :forward_email => "john@mail.com", :workgroup => "staff"}

      cmd = gateway.make_command_string(command, attributes)

      expect(cmd).to match(/create_mailbox_forward_only/)
      
      expect(cmd).to match(/mailbox=\"test\"/)

      expect(cmd).to match(/domain=\"testdomain[.]com\"/)

      expect(cmd).to match(/forward_email=\"john@mail.com\"/)

      expect(cmd).to match(/workgroup=\"staff\"/)
    end
  end
end
