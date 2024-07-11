# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = posts(:two).comments.first
    @post_without_comments = posts(:without_comments)
  end

  test 'Visiting to Post with Comment' do
    visit posts_url
    click_on 'Show', match: :first

    assert_selector 'small', text: @comment.body
  end

  test 'Creating a Comment' do
    visit posts_url
    click_on 'Show', match: :first
    
    fill_in 'post_comment[body]', with: @comment.body
    
    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
  end

  test 'Updating a Comment' do
    visit posts_url
    click_on 'Show', match: :first
    
    within(:xpath, '/html/body/main/div/div/div/div[2]/div[1]/div/div[2]') do
      click_link 'Edit'
    end
    
    fill_in 'Body', with: @comment.body

    click_on 'Update Comment'

    assert_text 'Comment was successfully updated'
  end

  test 'Destroying a Post' do
    visit posts_url
    click_on 'Show', match: :first
    
    within(:xpath, '/html/body/main/div/div/div/div[2]/div[1]/div/div[2]') do
      page.accept_confirm do
        click_on 'Delete', match: :first
      end
    end

    assert_text 'Translation missing. Options considered were: - en.posts.comments.destroy.success - en.posts.comments.success'
  end
end
