require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  scenario "user no fill, and click submit, show alert" do
    visit root_path
    click_link 'お問い合わせ'

    click_button 'この内容で送信する'

    expect(page).to have_content '入力内容をご確認ください'
  end

  scenario "user don't fill name, and click submit, show alert name" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_email', with: 'some@email.com'
    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    expect(page).to have_content 'お名前を入力してください'
  end

  scenario "user don't fill email, and click submit, show alert email" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    expect(page).to have_content 'メールアドレスを入力してください'
  end

  scenario "user don't fill message, and click submit, show alert message" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_email', with: 'some@email.com'
    click_button 'この内容で送信する'

    expect(page).to have_content 'お問い合わせ内容を入力してください'
  end

  scenario "user click submit, show confirm page" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_email', with: 'some@email.com'
    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    expect(page).to have_button '戻る'
  end

  scenario "user click back button, show contact index page" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_email', with: 'some@email.com'
    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    click_button '戻る'

    expect(page).to have_content 'ご覧いただきありがとうございます'
  end

  scenario "user once show alert, and click submit, after that click back button, show contact index page with filled data " do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_email', with: 'some@email.com'
    click_button 'この内容で送信する'

    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    click_button '戻る'

    expect(page).to have_field 'お名前', with: 'some name'
    expect(page).to have_field 'メールアドレス（半角）', with: 'some@email.com'
    expect(page).to have_field 'お問い合わせ内容', with: 'some message'
  end

  scenario "user click submit at confirm page, show contact create page" do
    visit root_path
    click_link 'お問い合わせ'

    fill_in 'contact_name', with: 'some name'
    fill_in 'contact_email', with: 'some@email.com'
    fill_in 'contact_message', with: 'some message'
    click_button 'この内容で送信する'

    click_button 'この内容で送信する'

    expect(page).to have_content 'お問い合わせを承りました'
  end
end
