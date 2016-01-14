require './spec/helper'

describe Attribution::Client do
  describe "#track" do
    let(:client) { Attribution::Client.new('12345') }
    let(:status) { 200 }
    let(:body) { "" }

    before do
      stub_request(:post, "https://12345:@track.attributionapp.com/track").
         with(:body => "{\"user_id\":\"user_123\",\"event\":\"Ate a Pizza\",\"properties\":{\"revenue\":14.99}}",
              :headers => {'Accept'=>'application/vnd.attribution.3+json', 'Accept-Encoding'=>'gzip, deflate', 'Acceptencoding'=>'gzip, deflate', 'Content-Type'=>'application/json', 'User-Agent'=>'Attribution-Ruby/0.0.1'}).
         to_return(:status => status, :body => body, :headers => {})
    end

    it "makes track call" do
      client.track({ user_id: 'user_123', event: 'Ate a Pizza', properties: { revenue: 14.99 } })
    end

    context "when there is an error" do
      let(:status) { 401 }
      it "shows error" do
        expect {
          client.track({ user_id: 'user_123', event: 'Ate a Pizza', properties: { revenue: 14.99 } })
        }.to raise_error(Attribution::AuthenticationError)
      end
    end
  end
end
