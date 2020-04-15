
class Employee < ApplicationRecord
  validate :password_complexity
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? #|| password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, ' must be at least 8 characters long.'
  end


  devise :database_authenticatable, :registerable, :recoverable, stretches: 13
  # devise :database_authenticatable, :registerable, :recoverable, :confirmable, stretches: 13
  belongs_to :battery, optional: true
end