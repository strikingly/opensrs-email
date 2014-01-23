module Opensrs
  module Email
    module Mailbox
      def create_mailbox_forward_only(mailbox, domain, forward_email, workgroup)
        call(:create_mailbox_forward_only, {:mailbox => mailbox, :domain => domain, :forward_email => forward_email, :workgroup => workgroup})
      end

      def delete_mailbox_forward_only(mailbox, domain)
        call(:delete_mailbox_forward_only, {:mailbox => mailbox, :domain => domain})
      end
    end
  end
end
