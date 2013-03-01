class ApprovalsController < ApplicationController
	before_filter :signed_in_user
	def create
		@project = Project.find(params[:approval][:project_id])
		current_user.approve!(@project)
		respond_to do |format|
			format.html {redirect_to root_url}
			format.js
		end
	end
	def destroy
		@project=Project.find(Approval.find(params[:id]).project_id)
		current_user.unapprove!(@project)
		respond_to do |format|
			format.html {redirect_to root_url}
			format.js
		end
	end
end		
