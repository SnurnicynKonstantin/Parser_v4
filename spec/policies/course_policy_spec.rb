require 'rails_helper'

describe CoursePolicy do
  subject { CoursePolicy.new(user, course) }

  let(:resolved_scope) {
    CoursePolicy::Scope.new(user, Course.all).resolve
  }

  let(:course) { create(:first_course) }

  context 'for a user' do
    let(:user) { create(:first_user) }

    it 'includes course in resolved scope' do
      user.courses << course
      expect(resolved_scope).to include(course)
    end

    it { should permit_action(:create)  }
  end

  context 'for a nil_user' do
    let(:user) { nil }
    it { should forbid_action(:create)  }
  end

end