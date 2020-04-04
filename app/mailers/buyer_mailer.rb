class BuyerMailer < ApplicationMailer
  default from: 'Inquiry for Paper <test-buyer@yopmail.com>'

  def inquiry_message_email(message_id)
    @message = Message.find(message_id)
    mail to: 'test-admin@yopmail.com', subject: "Regarding Inquiry for #{@message.channel.paper.paper_name}"
  end
end
