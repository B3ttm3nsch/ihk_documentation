class MepAudiosController < ApplicationController
  def index
    @project_partial = BsagProjectPartial.find(params[:project_partial_id])
    @mep_audios = @project_partial.mep_audios.all
  end

  def show
    @mep_audio = BsagMepAudio.find(params[:id])
  end

  def new
    @mep_audio = BsagMepAudio.new
  end

  def edit
    @mep_audio = BsagMepAudio.find(params[:id])
  end

  def create
    @project_partial = BsagProjectPartial.find(params[:project_partial_id])
    @mep_audio = @project_partial.mep_audios.create(mep_audio_params)
    if @mep_audio.save
      redirect_to project_partial_mep_audios_path
    else
      render 'new'
    end
  end

  def update
    @mep_audio = BsagMepAudio.find(params[:id])
    if @mep_audio.update(mep_audio_params)
      redirect_to project_partial_mep_audios_path(@mep_audio.bsag_project_partial_id)
    else
      render 'edit'
    end
  end

  def destroy
    @mep_audio = BsagMepAudio.find(params[:id])
    @mep_audio.destroy
    redirect_to project_partial_mep_audios_path(@mep_audio.bsag_project_partial_id)
  end

  private

  def mep_audio_params
    params.require(:bsag_mep_audio).permit(:bsag_project_partial_id,
                                           :bsag_audio_type_id,
                                           :receiving_date,
                                           :bsag_mep_version_id,
                                           :version_number,
                                           :version_name_ext,
                                           :bsag_audio_format_id,
                                           :bsag_audio_speed_id,
                                           :is_complete,
                                           :is_complete_comment,
                                           :is_in_sync,
                                           :is_in_sync_comment,
                                           :dbtp_max, :lra, :lufs,
                                           :bsag_channel_error_id,
                                           :channel_error_comment,
                                           :bsag_audio_fault_id,
                                           :audio_fault_comment,
                                           :bsag_mep_evaluation_id)
  end
end