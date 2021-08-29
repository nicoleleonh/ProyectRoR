require 'test_helper'

class PublicationsMailerTest < ActionMailer::TestCase
  test "publication_create" do
    mail = PublicationsMailer.publication_create
    assert_equal "Publication create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
