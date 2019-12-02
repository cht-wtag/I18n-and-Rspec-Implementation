require 'rails_helper'

RSpec.describe User, type: :model do

let!(:user) { create(:user) }

  it { should validate_presence_of(:name) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is valid with a name, age and email" do
    expect(user.save).to eq(true)
  end

  it "is invalid without a name" do
    user.name=nil
    expect(user.save).to eq(false)
  end

  it "is invalid without a age"  do
    user.age= nil
    expect(user.save).to eq(false)
  end

  it "is invalid without a email" do
  user.email=nil
  expect(user.save).to eq(false)
  end

  context 'test uniqueness of email' do
    let(:user2) {create(:user)}
    it "is invalid with a duplicate email address" do
      user.email = "tamals@gmaila.coma"
      user.save!
      #puts user.email

      user2.email="tamals@gmaila.coma"
      expect(user2.save).to eq(false)
      #puts user2.email
    end
  end

  it "returns a user's age as a integer" do
    user.save
    expect(user.age.class).to eq Integer
    puts user.age
  end

  describe "filter last name by letter" do before :each do
    @smith = User.create(
        name: 'Smith',
        age: 20,
        email: 'jsmith@example.com'
    )
    @jones = User.create(
       name: 'Johnn',
       age: 25,
        email: 'tjones@example.com'
    )
    @johnson = User.create(
        name: 'John',
       age: 30,
        email: 'jjohnson@example.com'
    )
  end
  context "with matching letters" do
    it "returns a sorted array of results that match" do
      expect(User.by_letter("J")).to eq [@johnson, @jones] end
  end
  context "with non-matching letters" do it "omits results that do not match" do
    expect(User.by_letter("J")).not_to include @smith end
  end
end

end
