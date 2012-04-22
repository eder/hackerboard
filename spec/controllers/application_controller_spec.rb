require "spec_helper"

describe ApplicationController do
  describe ".require_logged_user" do
    controller do
      require_logged_user

      def index
        render :nothing => true
      end
    end

    context "when logged" do
      before do
        controller.stub :logged_in? => true
      end

      it "renders requested page" do
        get :index
        response.code.should eql("200")
      end
    end

    context "when unlogged" do
      before do
        controller.stub :logged_in? => false
        get :index
      end

      it "redirects to loggin page" do
        response.should redirect_to(login_path)
      end

      it "sets error message" do
        flash[:alert].should eql(I18n.t("flash.require_login"))
      end
    end
  end
end
