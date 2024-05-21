require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    bulletin1 = bulletins(:bulletin1)
    bulletin2 = bulletins(:bulletin2)
    
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'li', bulletin1.title
    assert_select 'li', bulletin2.title
  end

  test 'opens one bulletin page' do
    bulletin1 = bulletins(:bulletin1)

    get bulletin_path(bulletin1)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h3', 'Продам гараж!'
    assert_select 'p', 'Недорого!'
  end
end
