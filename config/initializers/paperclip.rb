Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
# Paperclip::Attachment.default_options[:default_url] = "/images/:style/default_image.png"
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3.us-east-2.amazonaws.com'
