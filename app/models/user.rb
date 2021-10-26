class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :employees, dependent: :destroy

         after_create do
           self.employees.create(first_name: "Guest", last_name: "", title: "")
         end
end
