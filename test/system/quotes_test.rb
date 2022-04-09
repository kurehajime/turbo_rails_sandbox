require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  test "quoteを表示" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "quoteを作る" do
    # indexのページを開いたら"Quotes"のタイトルがあるはず。
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # "New quote"をクリックしたら"New quote"のタイトルがあるはず
    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # nameに"Capybara quote"を入れて"Create Quote"を押す
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # タイトルには"Quotes"がひょうじされてるはず
    # "Capybara quote"がリストに追加されてるはず
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "quoteを削除" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

end
