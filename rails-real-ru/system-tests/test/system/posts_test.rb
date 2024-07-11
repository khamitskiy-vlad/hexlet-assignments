# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:two)
  end

  test 'Visiting to index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
    assert_selector 'td', text: @post.title
  end

  test 'Visiting to Post' do
    visit posts_url
    click_on 'Show', match: :first

    assert_selector 'h1', text: @post.title
    assert_selector 'p', text: @post.body
  end

  test 'Creating a Post' do
    visit posts_url
    click_on 'New Post'
    
    fill_in('Title', with: @post.title)
    fill_in('Body', with: @post.body)

    click_on 'Create Post'

    assert_text 'Post was successfully created'
  end

  test 'Updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
  end

  test 'Destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
# END
