require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation' do
    it "should have firstname, lastname, username and email and password_digest" do
      should have_db_column(:firstname).of_type(:string)
      should have_db_column(:lastname).of_type(:string)
      should have_db_column(:username).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

    describe "validates presence and uniqueness of username and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_uniqueness_of(:username) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
      it { is_expected.to validate_confirmation_of(:password) }
    end
  end # end of context validation

  context 'user creation' do
    # happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        firstname: "Raz",
        lastname: "W",
        username: 'raz',
        email: "raz@nextacademy.com",
        password: "123456",
        password_confirmation: "123456"
      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a name" do
      When(:user) { User.create(email: "josh@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(firstname: "Josh", lastname: "Teng", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

  end # end of context user creation

  context 'associations with dependency' do
    it { is_expected.to have_many(:listings).dependent(:destroy)}
  end

end
