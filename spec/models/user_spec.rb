require 'rails_helper'

RSpec.describe User, type: :model do
    it "空があるとバリデーションが通らない" do
      user = User.new(
                  name:'user_model',
                  email:'',
                  password:'aaaaaa')
      expect(user).not_to be_valid
    end

    it "すべて記載されていればバリデーションが通る" do
      user = User.new(
                  name:'user_model',
                  email:'user@users.com',
                  password:'aaaaaa')
      expect(user).to be_valid
    end
end
