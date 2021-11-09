# Preview all emails at http://localhost:3000/rails/mailers/parent
class ParentPreview < ActionMailer::Preview
  def sign_up_email
    parent = Parent.new(first_name: "Betty",
                        last_name: "Doodle",
                        email: "betty@gmail.com",
                        phone_number: '123-332-6666',
                        address: '124 Main St Denver, CO 34544',
                       )

    ParentMailer.with(parent: parent).sign_up_email
  end
end
