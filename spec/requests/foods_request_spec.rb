require 'rails_helper'

RSpec.describe "Foods", type: :request do
  describe 'TOPページ' do
    context "TOPページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end