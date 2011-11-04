node[:deploy].each do |application, deploy|
  
  template "#{deploy[:deploy_to]}/current/zend.ini" do
    source "zend.ini.erb"
    owner 'www-data'
    variables({:database => deploy[:database]})
    only_if do
      ::File.exists?("#{deploy[:deploy_to]}/current/zend.ini")
    end
  end
  
end