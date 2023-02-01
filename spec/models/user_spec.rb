require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "creates and saves a user successfully" do
      user = User.new(
        name: 'Bob', 
        email: 'bob@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "123450")
    
      expect(user).to be_valid
    end

    it "does not create a user when passwords do not match" do
      user = User.new(
        name: 'Bob', 
        email: 'bob@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "1234500")
    
      expect(user).to_not be_valid
    end

    it "does not create a user when name is missing" do
      user = User.new(
        name: nil,
        email: 'bob@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "123450")
    
      expect(user).to_not be_valid
    end

    it "does not create a user when email is missing" do
      user = User.new(
        name: 'Bob',
        email: nil, 
        password: "123450", 
        password_confirmation: "123450")
    
      expect(user).to_not be_valid
    end

    it "does not create a user when password is less than 6 characters" do
      user = User.new(
        name: 'Bob',
        email: 'bob@lighthouse.ca', 
        password: "1234", 
        password_confirmation: "1234")
    
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "returns the user, given the correct email and password" do
    user = User.new(
      name: 'Bob',
      email: 'bob@lighthouse.ca', 
      password: "123450", 
      password_confirmation: "123450")

      user.save

      authenticatedUser = User.authenticate_with_credentials('bob@lighthouse.ca', "123450")
      expect(authenticatedUser).to eq(user)
    end 

    it "does not return the user, given an incorrect password" do
      user = User.new(
        name: 'Bob',
        email: 'bob@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "123450")
  
        user.save
  
        authenticatedUser = User.authenticate_with_credentials('bob@lighthouse.ca', "12345")
        expect(authenticatedUser).to_not eq(user)
      end 

    it "still authenticates when there are extra spaces before or after the email" do
      user = User.new(
        name: 'Bob',
        email: 'Bob@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "123450")
  
      user.save
  
      authenticatedUser = User.authenticate_with_credentials('  bob@lighthouse.ca    ', "123450")
      expect(authenticatedUser).to_not be_nil
    end

    it "still authenticates when there is variation in the case sensitivity for the email" do
      user = User.new(
        name: 'Bob',
        email: 'BOB@lighthouse.ca', 
        password: "123450", 
        password_confirmation: "123450")
  
      user.save
  
      authenticatedUser = User.authenticate_with_credentials('bob@ligHthouse.CA', "123450")
      expect(authenticatedUser).to_not be_nil
    end 

  end

end
