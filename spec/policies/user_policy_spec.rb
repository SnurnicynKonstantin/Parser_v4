require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy.new(current_user, user) }
  let(:current_user) { create(:first_user) }
  let(:user) { current_user }

  context 'for a logged user' do
    it { should permit_action(:show) }
    it { should permit_action(:vote_up) }
    it { should permit_action(:vote_down) }
    it { should permit_action(:search) }
    it { should permit_action(:add_video) }
  end

  context 'simple user can not visit page other users' do
    let(:user) { create(:second_user) }

    it { should forbid_action(:show) }
  end

  context 'for a nil_user' do
    let(:current_user) { nil }

    it { should forbid_action(:vote_up) }
    it { should forbid_action(:vote_down) }
    it { should forbid_action(:search) }
    it { should forbid_action(:add_video) }
  end

end