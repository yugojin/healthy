require 'rails_helper'

describe 'トップページのテスト' do
  let(:customer) { create(:customer) }
  before do
    visit root_path
  end

  describe 'ボディ部分のテスト' do
    context '表示の確認' do
      it 'ログインリンクが表示される' do
        ログイン_link = find_all('a')[4].native.inner_text
        expect(ログイン_link).to match(/ログイン/i)
        expect(page).to have_link ログイン_link, href: new_customer_session_path
      end
      it '新規登録リンクが表示される' do
        signup_link = find_all('a')[3].native.inner_text
        expect(signup_link).to match(/新規登録/i)
        expect(page).to have_link signup_link, href: new_customer_registration_path
      end
    end

    context 'ログインしている場合の挙動を確認' do
      before do
        visit new_customer_session_path
        fill_in 'customer[name]', with: customer.name
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
        visit root_path
      end
    end

    context 'ログインしていない場合の挙動を確認' do
      it 'ログインリンクをクリックしたらログイン画面へ遷移する' do
        ログイン_link = find_all('a')[4].native.inner_text
        click_link ログイン_link
        expect(current_path).to eq(new_customer_session_path)
      end
      it '新規登録リンクをクリックしたら新規登録画面に遷移する' do
        新規登録_link = find_all('a')[3].native.inner_text
        click_link 新規登録_link
        expect(current_path).to eq(new_customer_registration_path)
      end
    end
  end
end
