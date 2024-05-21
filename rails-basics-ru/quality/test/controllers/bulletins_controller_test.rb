require "test_helper"

class BulletinControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    bulletin_1 = bulletins(:bulletin_1)
    bulletin_2 = bulletins(:bulletin_2)

    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'li', "#{bulletin_1.title}"
    assert_select 'li', "#{bulletin_2.title}"
  end

  test 'opens one bulletin page' do
    bulletin_1 = bulletins(:bulletin_1)

    get bulletin_path(bulletin_1)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h3', 'Продам гараж!'
    assert_select 'p', 'Недорого!'
  end
end
