name              "app"
maintainer        "Jekels Applicant"
maintainer_email  "hireme@sailaway.com"
description       "Main entry point for installing and configuring a dead-simple phpinfo();"
version           "1.0.0"

recipe "app", "Main entry point for installing and configuring a dead-simple phpinfo();"

depends "nginx"
depends "php"
depends "apt"
depends "openssl"

%w{ debian ubuntu }.each do |os|
  supports os
end

