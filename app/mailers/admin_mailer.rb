class AdminMailer < ApplicationMailer
  default from: 'Mail From stockInquiry <test-admin@yopmail.com>'

  def replay_to_inquiry_message_email(message_id)
    @message = Message.find(message_id)
    # mail to: @message.channel.buyer.email, subject: 'Regarding paper'
    mail to: 'test-buyer@yopmail.com', subject: "Regarding replay for Inquiry #{@message.channel.paper.paper_name}"
  end
end 
