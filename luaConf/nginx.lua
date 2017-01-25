  local req_headers = ngx.req.get_headers()
  -- local rex = require("rex_pcre")
  reItemPage = "^/(ip|product)/[^/]+/([A-Za-z0-9]*)"
  reItemPage = "^/(ip|product)/([A-Za-z0-9])"

  local requestUrl = ngx.var.request_uri;
  local requestUrlModified = requestUrl:gsub("/lua","",1)

  if requestUrl == "/" then
    ngx.header["Content-type"] = "text/html"
    ngx.say('<b>  LUA Routing Rules </b>');
    return
  end
  if requestUrl == "/akamai" then
	ngx.header["Content-type"] = "text/html"
	ngx.say('<b> Akamai LUA Routing Rules </b>');
  return
  end
  if requestUrl == "/limelight" then
  ngx.header["Content-type"] = "text/html"
  ngx.say('<b> limelight LUA Routing Rules </b>');
  return
  end
 
  match = ngx.re.match(requestUrlModified, reItemPage)
   --if req_headers["x-gauri-header"] then
  if match then
        ngx.header["Content-type"] = "text/html"
        ngx.header["x-Gauri-response"] = "if block --> " .. requestUrlModified
        ngx.say('<H1>Hello Gauri.</H1>');
        --ngx.exit(0)
  else
        -- serve the original content (index.html)
        ngx.header["Content-type"] = "text/html"
        ngx.header["x-Gauri-response"] = "else block --> " .. requestUrlModified
	       ngx.say('<H1>Hello Shankar.</H1>');
  end











