alias kumauser='if [ -f "bin/console" ]; then bin/console kuma:user:create; else app/console kuma:user:create; fi'
alias kumapagepart='if [ -f "bin/console" ]; then bin/console kuma:generate:pagepart; else app/console kuma:generate:pagepart; fi'
alias kumapage='if [ -f "bin/console" ]; then bin/console kuma:generate:page; else app/console kuma:generate:page; fi'
