require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :user_parties}
    it { should have_many(:parties).through(:user_parties) }
  end

  describe 'validations' do
    subject { User.new(name: "Jim", email: "Jim@email.com") }

    describe '#name' do
      it {should validate_presence_of :name}
      it { should_not allow_value(nil).for(:name) }
    end

    describe '#email' do
      it {should validate_presence_of :email}
      it { should_not allow_value(nil).for(:email) }
    end
  end
end
