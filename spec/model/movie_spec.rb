require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject {
    described_class.new(
      title: "Anything",
      release_year: 2010
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a release_year" do
    subject.release_year = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a string release_year" do
    subject.release_year = "nineteen ninety nine"
    expect(subject).to_not be_valid
  end

end