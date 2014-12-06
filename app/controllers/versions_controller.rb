class VersionsController < ApplicationController
  before_action :set_version, only: [ :edit, :update ]

  # GET /versions/1/edit
  def edit
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    version_params = params[:version]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_version
    @version = Version.find(params[:id])
  end

end
