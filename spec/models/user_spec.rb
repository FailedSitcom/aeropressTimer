require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Samuel",
      last_name: "Durkin",
      email: "sam.thomas.durkin@gmail.com",
      password: "securepassword1234",
      password_confirmation: "securepassword1234"
    }
  }

  context "relationships" do
    it { should have_many(:recipes) }
  end


  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email ="SAM.THOMAS.DURKIN@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email address" do
      user.email = "sam"
      expect(user).to_not be_valid
    end

  end

  describe "#downcase_email" do
    it "makes the email lower case" do
      user = User.new(valid_attributes.merge(email: "SAM.THOMAS.DURKIN@GMAIL.COM"))
      expect{ user.downcase_email}.to change{ user.email}.
      from("SAM.THOMAS.DURKIN@GMAIL.COM").
      to("sam.thomas.durkin@gmail.com")
    end

    it "downcase an email before saving" do
      user = User.new(valid_attributes)
      user.email = "FAILEDSITCOMMUSIC@GMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("failedsitcommusic@gmail.com")
    end
  end

  describe "#generate_password_reset_token!" do
    let(:user) {create(:user) }

    it "changes the password_reset_token attribute" do
      expect{ user.generate_password_reset_token! }.to change{user.password_reset_token}
    end

    it "calls SecureRandom.urlsafe_base64 to generate the password_reset_token" do
      expect(SecureRandom).to receive(:urlsafe_base64)
      user.generate_password_reset_token!
    end
  end
end
