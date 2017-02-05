require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:'User1', email:'test@test.com', password: 'password', password_confirmation:"password")

  end

  test "name required" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "password confirmation required and matches" do

    @user.password_confirmation = " "
    assert_not @user.valid?

    @user.password_confirmation = @user.password + "h"
    assert_not @user.valid?

    @user.password_confirmation = @user.password
    assert @user.valid?

  end

  test "emails should be unique" do
    @user.email = "a@A.com"

    @user.save()
    dup = @user.dup

    assert_not dup.valid?

    dup.email = "A@a.COM"

    assert_not dup.valid?
  end

  test "email is lowered before save" do
    email = "T1@gmaIL.com"
    @user.email = email
    @user.save()

    assert_equal email.downcase, @user.email
  end

  test "lowercase works for turkish chars" do
    email = "IÇŞÖ@test.com"
    @user.email = email
    @user.save()

    assert_equal "içşö@test.com", @user.email

    @user.reload()
    assert_equal "içşö@test.com", @user.email
  end

  test "authenticate with correct pass" do
    user = @user.authenticate(@user.password)
    assert (user.is_a? User)
  end

  test "authenticate with invalid pass" do
    assert_not @user.authenticate(@user.password * 2)
  end



end
