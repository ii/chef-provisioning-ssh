#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook Name:: windows
# Provider:: reboot
#
# Copyright:: 2011, Chef Software, Inc.
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

action :request do
  node.run_state[:reboot_requested] = true
  node.run_state[:reboot_timeout] = @new_resource.timeout
  node.run_state[:reboot_reason] = @new_resource.reason
  new_resource.updated_by_last_action(true)
end

action :cancel do
  node.run_state.delete(:reboot_requested)
  node.run_state.delete(:reboot_timeout)
  node.run_state.delete(:reboot_reason)
  new_resource.updated_by_last_action(true)
end
