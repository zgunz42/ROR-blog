# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject {build(:user)}
    it 'is valid with proper attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without username' do
      subject.username = ''
      expect(subject).not_to be_valid
    end
    it 'is not valid if username is contain @ symbol' do
      subject.username = subject.email
      expect(subject).not_to be_valid
    end
    it 'is not valid without email' do
      subject.email = ''
      expect(subject).not_to be_valid
    end
    it 'valid with empty password' do
      subject.password = ''
      expect(subject).not_to be_valid
    end
  end
end
