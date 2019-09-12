+++
fragment = "contact"
#disabled = true
date = "2017-09-10"
weight = 1100
#background = "light"
form_name = "defaultContact"

title = "Contact Us"
subtitle  = "If you are interested in Dymodia, then please get in touch."

# PostURL can be used with backends such as mailout from caddy
#post_url = "https://formspree.io/sales@dymodiansystems.com" #default: formspree.io
email = "sales@dymodiansystems.com"
button = "Send Button" # defaults to theme default
#netlify = false

# Optional google captcha
#[recaptcha]
#  sitekey = ""

[message]
  #success = "" # defaults to theme default
  #error = "" # defaults to theme default

# Only defined fields are shown in contact form
[fields.name]
  text = "Your Name *"
  #error = "" # defaults to theme default

[fields.email]
  text = "Your Email *"
  #error = "" # defaults to theme default


[fields.message]
  text = "Your Message *"
  #error = "" # defaults to theme default

# Optional hidden form fields
# Fields "page" and "site" will be autofilled
#[[fields.hidden]]
 # name = "page"

#[[fields.hidden]]
#  name = "someID"
#  value = "dymodiansystems.com"
+++
