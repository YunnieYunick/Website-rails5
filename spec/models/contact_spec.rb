require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is valid with a name, email, message" do
    contact = build(:contact)
    contact.valid?
    expect(contact).to be_valid
  end

  it "is invalid without name" do
    contact = build(:contact, name: nil)
    contact.valid?
    expect(contact.errors[:name]).to include("お名前を入力してください")
  end

  it "is invalid without email" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("メールアドレスを入力してください")
  end

  it "is invlid without message" do
    contact = build(:contact, message: nil)
    contact.valid?
    expect(contact.errors[:message]).to include("お問い合わせ内容を入力してください")
  end
end
