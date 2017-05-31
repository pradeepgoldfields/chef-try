name 			 "mapr"
maintainer       "Pradeep"
maintainer_email "pradeep.goldfields@gmail.com"
description      "Installs/Configures a Hadoop Cluster"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

%w{ centos redhat suse ubuntu }.each do |os|
  supports os
end

depends 'hostsfile'
depends 'hostname'
depends 'apt'
depends 'yum'
depends 'iptables'
depends 'java', '= 1.7.0'
