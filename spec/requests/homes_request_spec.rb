require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'aboutページ' do
    context "aboutページが正しく表示される" do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
  
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