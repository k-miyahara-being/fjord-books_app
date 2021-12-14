# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:novel)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text @book.title
    assert_text @book.memo
    assert_text @book.author
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: '容疑者Xの献身'
    fill_in 'メモ', with: '福山雅治主演'
    fill_in '著者', with: '東野圭吾'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text '容疑者Xの献身'
    assert_text '福山雅治主演'
    assert_text '東野圭吾'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
  end
end
