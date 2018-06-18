class CreateBsagMepAudios < ActiveRecord::Migration
  def change
    create_table :bsag_mep_audios do |t|
      t.references :bsag_project_partial, null: false, index: true, foreign_key: true
      t.references :bsag_audio_type, null: false, index: true, foreign_key: true
      t.date :receiving_date, null: false
      t.references :bsag_mep_version, null: false, index: true, foreign_key: true
      t.integer :version_number, limit: 2, null: false
      t.string :version_name_ext, limit: 30
      t.references :bsag_audio_format, null: false, index: true, foreign_key: true
      t.references :bsag_audio_speed, null: false, index: true, foreign_key: true
      t.boolean :is_complete
      t.string :is_complete_comment, null: false
      t.boolean :is_in_sync
      t.string :is_in_sync_comment, null: false
      t.decimal :dbtp_max, precision: 3, scale: 1
      t.decimal :lra, precision: 3, scale: 1
      t.decimal :lufs, precision: 3, scale: 1
      t.references :bsag_channel_error, null: false, index: true, foreign_key: true
      t.string :channel_error_comment
      t.references :bsag_audio_fault, null: false, index: true, foreign_key: true
      t.string :audio_fault_comment
      t.references :bsag_mep_evaluation, null: false, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end