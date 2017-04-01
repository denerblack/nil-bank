require 'rails_helper'

RSpec.describe Balance, type: :model do
  describe "Associations" do
   it { should respond_to(:user)  }
  end
end
