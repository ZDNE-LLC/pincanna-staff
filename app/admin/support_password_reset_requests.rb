ActiveAdmin.register Support::PasswordResetRequest, as: 'Password Reset' do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :body, :completed
  menu parent: 'Support'
  member_action :complete_request, method: :put do
    resource.update(completed: true)
    redirect_to resource_path, notice: 'Password request completed.'
  end

end
