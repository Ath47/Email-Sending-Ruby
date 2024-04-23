require 'net/smtp'

def send_email(sender_email, sender_password, recipient_email, subject, body)
smtp_server = 'smtp.gmail.com'
smtp_port = 587

msg = <<END_OF_MESSAGE
From: Your Name <#{sender_email}>
To: Recipient <#{recipient_email}>
Subject: #{subject}

#{body}
END_OF_MESSAGE

begin
smtp = Net::SMTP.new(smtp_server, smtp_port)
smtp.enable_starttls
smtp.start(smtp_server, sender_email, sender_password, :login) do |smtp|
smtp.send_message(msg, sender_email, recipient_email)
end
puts "Email sent successfully!"
rescue => e
puts "Error sending email: #{e.message}"
end
end

sender_email = 'yourEmail@gmail.com'
sender_password = 'passwordForYourEmail'

recipient_email = 'receiverEmail@gmail.com'
subject = 'Test Email 1'
body = 'This is a test email sent from a Ruby script using Gmail SMTP.'
send_email(sender_email, sender_password, recipient_email, subject, body)