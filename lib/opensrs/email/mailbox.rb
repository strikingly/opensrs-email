module Opensrs
  module Email
    module Mailbox
      MAIL_COMMANDS = [
                       :get_mailbox_availability,
                       :get_alternate_mailbox_names,
                       :create_mailbox,
                       :set_mail_admin,
                       :set_mail_admin,
                       :change_mailbox,
                       :create_alias_mailbox,
                       :rename_mailbox,
                       :set_mailbox_allow_list,
                       :set_mailbox_block_list,
                       :get_mailbox_allow_list,
                       :get_mailbox_block_list,
                       :verify_password,
                       :get_admin,
                       :get_mailbox,
                       :get_mailbox_any,
                       :get_mailbox_services,
                       :set_mailbox_services,
                       :get_mailbox_quota,
                       :set_mailbox_quota,
                       :delete_mailbox,
                       :delete_mailbox_any,
                       :set_mailbox_autorespond,
                       :get_mailbox_autorespond,
                       :set_mailbox_forward,
                       :get_mailbox_forward,
                       :show_available_offerings,
                       :show_enabled_offerings,
                       :disable_offering,
                       :enable_offering,
                       :set_mailbox_suspension,
                       :get_mailbox_suspension,
                       :set_mailbox_status,
                       :get_mailbox_status,
                       :create_group_alias_mailbox,
                       :get_group_alias_mailbox,
                       :get_group_alias_mailbox,
                       :change_group_alias_mailbox,
                       :delete_group_alias_mailbox,
                       :create_mailbox_forward_only,
                       :get_mailbox_forward_only,
                       :change_mailbox_forward_only,
                       :delete_mailbox_forward_only,
                      ]
      
      def create_mailbox_forward_only(mailbox, domain, forward_email, workgroup)
        call(:create_mailbox_forward_only, {:mailbox => mailbox, :domain => domain, :forward_email => forward_email, :workgroup => workgroup})
      end

      def delete_mailbox_forward_only(mailbox, domain)
        call(:delete_mailbox_forward_only, {:mailbox => mailbox, :domain => domain})
      end
    end
  end
end
