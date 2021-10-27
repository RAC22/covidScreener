class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :employees, dependent: :destroy
         has_many :questions, dependent: :destroy

         after_create do
           self.employees.create(first_name: "Guest", last_name: "", title: "")
           self.questions.create(attestation: "Have you experienced any of the following within the past 14 days (not due to some other known condition or treatment)?
           New fever or sense of having a fever (100.0°F or higher)")
           self.questions.create(attestation: "New cough, shortness of breath, difficulty breathing, fatigue, headache, chills, sore throat, congestion, runny nose, nausea, vomiting or diarrhea")
           self.questions.create(attestation: "New muscle aches (myalgia) not caused by a specific activity (such as physical exercise)")
           self.questions.create(attestation: "New loss of taste or smell")
           self.questions.create(attestation: "In the past 14 days, have you taken a COVID-19 test that used saliva, nose swab, or throat swab (not a blood test) and 1) not yet recieved results or 2) received a positive result?")
           self.questions.create(attestation: "Within the past 14 days, has a public health or medical professional told you to self-monitor, self isolate, or self-quarantine because of concerns about COVID-19 infection?")
           self.questions.create(attestation: "To the best of your knowledge, in the past 14 days, have you been in close contact (within 6 feet for a cumulative total of at least 15 minutes) with anyone while they had COVID-19?")
           self.questions.create(attestation: "Would anyone living in your household answer YES to any of the previous questions?")
           self.questions.create(attestation: "In the past 14 days, have you travelled outside the country?")
         end
         
end
