require './spec/helper'

describe Attribution::Client do
  describe "#track" do
    let(:client) { Attribution::Client.new('12345') }
    let(:status) { 200 }
    let(:body) { "" }

    describe "#track" do
      before do
        stub_request(:post, "https://12345:@track.attributionapp.com/track").
           with(:body => {"event"=>"Ate a Pizza", "properties"=>{"revenue"=>14.99}, "user_id"=>"user_123"},
                :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Attribution-Ruby/0.0.1'}).
           to_return(:status => status, :body => body, :headers => {})
      end

      it "makes track call" do
        response = client.track(event: "Ate a Pizza", user_id: 'user_123', properties: { revenue: 14.99 })
        expect(response).to be_success
      end

      context "when there is an error" do
        let(:status) { 401 }
        it "shows error" do
          expect {
            client.track(event: "Ate a Pizza", user_id: 'user_123', properties: { revenue: 14.99 })
          }.to raise_error
        end
      end
    end

    describe "#alias" do
      before do
        stub_request(:post, "https://12345:@track.attributionapp.com/alias").
           with(:body => {"user_id"=>"12345", "previous_id"=> "12"},
                :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Attribution-Ruby/0.0.1'}).
           to_return(:status => status, :body => body, :headers => {})
      end

      it "makes alias call" do
        response = client.alias(user_id: "12345", previous_id: "12")
        expect(response).to be_success
      end

      context "when there is an error" do
        let(:status) { 401 }
        it "shows error" do
          expect {
            client.alias(previous_id: "12345", user_id: "12")
          }.to raise_error
        end
      end
    end

    describe "#identify" do
      before do
        stub_request(:post, "https://12345:@track.attributionapp.com/identify").
           with(:body => {"user_id"=>"12345", "traits"=> { "email" => "test@example.com" }},
                :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Attribution-Ruby/0.0.1'}).
           to_return(:status => status, :body => body, :headers => {})
      end

      it "makes alias call" do
        response = client.identify(user_id: "12345", traits: { email: "test@example.com" })
        expect(response).to be_success
      end

      context "when there is an error" do
        let(:status) { 401 }
        it "shows error" do
          expect {
            client.identify(user_id: "12345", traits: { email: "test@example.com" })
          }.to raise_error
        end
      end
    end

  end
end
