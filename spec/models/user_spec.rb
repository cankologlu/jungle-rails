require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before(:each) do
    @user = User.new(name:"shadow", email:"shadow@shadow.com", 
    password:"shadow", password_confirmation:"shadow")
    end

    it "checks if the user is valid" do
      expect(@user).to be_valid
    end

    it "checks if the password and password_confirmation match"do
    @user.password_confirmation = ""
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "checks if the email is case sensitive and unique" do
      user1 = User.create(name:"hello", email:"hello@hi.com", password:"12345")
      user2 = User.create(name:"hey", email:"HeLLo@Hi.com", password:"12345")
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "checks if the password is more than 5 characters" do
      @user.password = "1"
      @user.password_confirmation = "1"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    before(:each) do
      @user = User.create(name:"shadow", email:"shadow@shadow.com", 
      password:"shadow", password_confirmation:"shadow")
    end

    it "returns nil if the email is incorrect" do
     result = User.authenticate_with_credentials("abo@ool.com", "password")
     expect(result).to be_nil
    end

    it "returns nil if the password is incorrect" do
      result = User.authenticate_with_credentials("shadow@shadow.com", "banana")
      expect(result).to be_nil
    end

    it "returns the user if provided correct email and password" do
      result = User.authenticate_with_credentials("shadow@shadow.com", "shadow")
      expect(result).to be_an_instance_of(User)
    end 

    it "authenticates if user adds spaces before or after their email" do
      result = User.authenticate_with_credentials(" shadow@shadow.com ", "shadow")
      expect(result).to be_an_instance_of(User)
    end

    it "authenticates if user uses capital case entering their email" do
      result = User.authenticate_with_credentials("ShaDOW@SHAdow.com", "shadow")
      expect(result).to be_an_instance_of(User)
    end

  end
end
