require "rails_helper"

RSpec.describe Support::PasswordResetsMailer, type: :mailer do
  describe "new_request" do
    let(:mail) { Support::PasswordResetsMailer.new_request }

    it "renders the headers" do
      expect(mail.subject).to eq("New request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end