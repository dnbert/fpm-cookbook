#
# Cookbook Name:: fpm
# Recipe:: default
# Author:: Brett Gailey <brett.gailey@dreamhost.com>
#
# Copyright 2012, DreamHost.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

gem_package "fpm" do
    action :install
end

ruby_block "link_fpm" do
    block do
        # First see if it's in the standard gem bin dir
        gemdir = `gem env gemdir`.strip
        gembin = File.join("#{gemdir}","bin","fpm")
        if File.exist?("#{gembin}")
            File.symlink("#{gembin}","/usr/bin/fpm")
            break            
        end

        # if that didn't work, chef gem installs seem to add fpm to the same dir 
        # that gem resides in, so check there next
        chefdir = `gem env | grep "EXECUTABLE DIRECTORY" | cut -d':' -f2`.strip
        chefbin = File.join("#{chefdir}","fpm")
        if File.exist?("#{chefdir}")
            File.symlink("#{chefbin}","/usr/bin/fpm")
        end
    end
    not_if { File.exist?("/usr/bin/fpm") }
end
