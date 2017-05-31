#
# Cookbook Name:: mapr
# Recipe:: loopbacknfsconfigure
#
##
## configure.sh
##

def get_nodes_with_role_sp(role)
    nodes = []
    if role == ""
      role = "all"
    end
    role_nodes = node[:mapr][:groups][role]

    role_nodes.each do |n|
      nodes.push(n)
    end

    nodes
end


# get a list of the CLDB hostnames
cldbs = get_nodes_with_role_sp("cldb")
cldb_list = cldbs.reject(&:empty?).join(':7222,')

# get a list of the ZooKeeper hostnames
zks = get_nodes_with_role_sp("zk")
zk_list = zks.reject(&:empty?).join(':5181,')

execute 'configure.sh' do
  command "#{node[:mapr][:home]}/server/configure.sh -C #{cldb_list} -Z #{zk_list} -N #{node[:mapr][:clustername]}"
end

cookbook_file "#{node[:mapr][:diskpath]}" do
  source "disks.txt"
  owner  node['mapr']['user']
  group  node['mapr']['group']
  mode "755"
end


execute 'configure.sh' do
  command "#{node[:mapr][:home]}/server/disksetup -F #{node[:mapr][:diskpath]}"
end

execute 'mapr-zookeeper-restart' do
  command 'systemctl restart mapr-zookeeper'
end

execute 'mapr-warden-restart' do
  command 'systemctl restart mapr-warden'
end

template "#{node[:mapr][:siteconfigpath]}/mapred-site.xml" do
  source 'mapred-site.xml.erb'
  owner  node['mapr']['user']
  group  node['mapr']['group']
  mode "755"
end

template "#{node[:mapr][:siteconfigpath]}/core-site.xml" do
  source 'core-site.xml.erb'
  owner  node['mapr']['user']
  group  node['mapr']['group']
  mode "755"
end

template "#{node[:mapr][:hiveconfigpath]}/hive-site.xml" do
  source 'hive-site.xml.erb'
  owner  node['mapr']['user']
  group  node['mapr']['group']
  mode "755"
end

execute 'start-loopbacknfs' do
  command 'systemctl start mapr-loopbacknfs'
end

execute 'copy nfs config' do
  command 'cp -pr /opt/mapr/conf/mapr-clusters.conf   /usr/local/mapr-loopbacknfs/conf/'
end

execute 'mount nfs' do
  command 'mount localhost:/mapr /mapr'  
end

execute 'copy to mapr_fstab' do
  command 'echo "localhost:/mapr /mapr hard,nolock"  >> /usr/local/mapr-loopbacknfs/conf/mapr_fstab'  
end