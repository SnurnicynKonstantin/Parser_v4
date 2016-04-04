require 'rails_helper'

describe VideoPolicy do
  subject { VideoPolicy.new(user, Video) }

  context 'logged user can create video' do
    let(:user) { create(:first_user) }

    it { should permit_action(:create)  }
  end

  context 'unlogged user can not create video' do
    let(:user) { nil }

    it { should forbid_action(:create)  }
  end
end