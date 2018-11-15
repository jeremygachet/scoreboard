ActiveAdmin.register_page "Dashboard" do

  def index
    authorize :dashboards, :index?
  end

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    controller do
      before_filter :authorize_index, only: :index
      def authorize_index
        policy_scope(User)
      end
    end
  end # content
end
