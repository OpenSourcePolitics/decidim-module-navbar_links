# frozen_string_literal: true

require "spec_helper"

describe Decidim::NavbarLinks::Admin::Permissions do
  subject { described_class.new(user, permission_action, context).permissions.allowed? }

  let(:user) { build :user, :admin, organization: organization }
  let(:organization) { build :organization }
  let(:permission_action) { Decidim::PermissionAction.new(action) }
  let(:context) { {} }
  let(:action) do
    { scope: :admin, action: action_name, subject: action_subject }
  end
  let(:action_name) { :foo }
  let(:action_subject) { :navbar_links }

  context "when scope is not admin" do
    let(:action) do
      { scope: :public, action: :foo, subject: :bar }
    end

    it { is_expected.to eq false }
  end

  context "when user is not present" do
    let(:user) { nil }

    it { is_expected.to eq false }
  end

  context "when user is not admin" do
    let(:user) { build :user, organization: organization }

    it { is_expected.to eq false }
  end

  describe "navbar_links" do
    let(:action_subject) { :navbar_link }

    it { is_expected.to eq true }

    context "when user is admin" do
      let(:action_subject) { :navbar_link }
      let(:user) { build :user, organization: organization }

      it { is_expected.to eq false }
    end
  end
end
