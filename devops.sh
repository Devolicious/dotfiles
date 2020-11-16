
function sslexpiry {
  echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}