<%EnableSessionState=False
host = Request.ServerVariables("HTTP_HOST")

if host = "dymodiansystems.com" or host = "www.dymodiansystems.com" then
response.redirect("https://www.dymodiansystems.com/")

else
response.redirect("https://www.dymodiansystems.com/error.htm")

end if
%>