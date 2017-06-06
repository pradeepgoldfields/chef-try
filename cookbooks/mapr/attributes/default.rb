default[:mapr][:uid] = 2222
default[:mapr][:gid] = 2222
default[:mapr][:user] = "mapr"
default[:mapr][:group] = "mapr"
default[:mapr][:siteconfigpath] = "/opt/mapr/hadoop/hadoop-2.7.0/etc/hadoop"
default[:mapr][:hiveconfigpath] = "/opt/mapr/hive/hive-1.2/conf"
default[:mapr][:nfspackageserver] = "nfspackageserver.ntp.org"      #has to be replaced by actual value
default[:mapr][:hivemetaserver] = "" #has to be replaced by actual value
default[:mapr][:hiveserver2] = "" #has to be replaced by actual value
default[:mapr][:groups][:cldb] = {} #array of cldb servers
default[:mapr][:groups][:zk]= {} #array of zk servers

default[:ntp][:servers] = ["0.pool.ntp.org", "1.pool.ntp.org"]

default[:mapr][:node][:host] = "nodeX"
default[:mapr][:node][:fqdn] = "nodeX.cluster.com"
default[:mapr][:node][:ip] = "1.1.1.1"

default[:mapr][:diskpath] = "/tmp/disks.txt"

default[:mapr][:home] = "/opt/mapr"
default[:mapr][:clustername] = "my.cluster.com"
default[:mapr][:version] = "3.0.2"
default[:mapr][:repo_url] = "http://package.mapr.com/releases"
default[:mapr][:repo_key_url] = "http://package.mapr.com/releases/pub/gnugpg.key"

default[:mapr][:node][:disks] = ["/dev/sdb","/dev/sdc","/dev/sdd"]

# TODO: move each port into its corresponding service recipe.
default[:mapr][:ports] = [
                          7222,
                          7220,
                          7221,
                          60000,
                          9083,
                          9001,
                          50030,
                          389,
                          636,
                          5660,
                          2049,
                          9997,
                          9998,
                          11000,
                          111,
                          25,
                          22,
                          50060,
                          8443,
                          8080,
                          5181,
                          2888,
                          3888
                         ]

default[:mapr][:mapr_subnets] = ""
