# require "mandrill"

# class BaseMandrillMailer < ActionMailer::Base

#   # def email_name
#   #   mail :subject => "Mandrill rides the Rails!",
#   #   :to      => "i.vertela@dunice.net",
#   #   :from    => "testmandrill@example.com"
#   # end
#   default(
#     from: "testmandrill@example.com",
#     reply_to: "testmandrill@example.com"
#     )

#   private

#   def send_mail(email, subject, body)
#     mail(to: email, subject: subject, message: body, content_type: "text/html")
#   end
#   # def mandrill_client 
#   #   @mandrill_client ||= Mandrill::API.new 'EzQ1SSeUxOkp08RpWXpRQA' 
#   # end 

#   # def mandrill_template(template_name, attributes)
#   #   mandrill = Mandrill::API.new('EzQ1SSeUxOkp08RpWXpRQA')

#   #   merge_vars = attributes.map do |key, value|
#   #     { name: key, content: value }
#   #   end

#   #   mandrill.templates.render(template_name, [], merge_vars)["html"]
#   # end
# end