class Inspection < ApplicationRecord
  require 'json'
  def self.get_all(user_id)
    sql = "SELECT inspections.* ,farms.farm_name from inspections"\
          " INNER JOIN farms ON farms.id = inspections.farm_id"\
          " WHERE inspections.user_id = #{user_id};"
    inspections_array = ActiveRecord::Base.connection.exec_query(sql)

    inspections_array.each do |inspection|
      inspection['current_age'] = ActiveSupport::JSON.decode inspection['current_age']
      inspection['feed_consumption'] = ActiveSupport::JSON.decode inspection['feed_consumption']
      inspection['water_consumption'] = ActiveSupport::JSON.decode inspection['water_consumption']
      inspection['average_weight'] = ActiveSupport::JSON.decode inspection['average_weight']
    end
    inspections_array
  end

  def self.get_by_id(id)
    inspection = Inspection.find(id)
    new_inspection = {}
    new_inspection['id'] = inspection.id
    new_inspection['user_id'] = inspection.user_id
    new_inspection['farm_id'] = inspection.farm_id
    new_inspection['inspection_date'] = inspection.inspection_date
    new_inspection['current_age'] = ActiveSupport::JSON.decode inspection.current_age
    new_inspection['dead_last_3_days'] = inspection.dead_last_3_days
    new_inspection['feed_consumption'] =  ActiveSupport::JSON.decode inspection.feed_consumption
    new_inspection['water_consumption'] =  ActiveSupport::JSON.decode inspection.water_consumption
    new_inspection['average_weight'] =  ActiveSupport::JSON.decode inspection.average_weight
    new_inspection['other_notes'] = inspection.other_notes
    new_inspection['clinical_signs'] = inspection.clinical_signs
    new_inspection['pm_lesions'] = inspection.pm_lesions
    new_inspection['diagnoses'] = inspection.diagnoses
    new_inspection
  end

  def self.update_inspection(params)
    old_insp = Inspection.find(params[:id])
    inspection = {}
    inspection['inspection_date'] = params[:inspection_date]
    inspection['current_age'] =params[:current_age].to_json
    inspection['dead_last_3_days'] = params[:dead_last_3_days]
    inspection['feed_consumption'] =   params[:feed_consumption].to_json
    inspection['water_consumption'] = params[:water_consumption].to_json
    inspection['average_weight'] =  params[:average_weight].to_json
    inspection['other_notes'] = params[:other_notes]
    inspection['clinical_signs'] =params[:clinical_signs]
    inspection['pm_lesions'] = params[:pm_lesions]
    inspection['diagnoses'] = params[:diagnoses]
    old_insp.update(inspection)
    old_insp
  end

  def self.add_new(params,user_id)
    inspection = Inspection.new(farm_id:params[:farm_id])
    inspection.inspection_date = params[:inspection_date]
    inspection.user_id = user_id
    inspection.current_age =params[:current_age].to_json
    inspection.dead_last_3_days = params[:dead_last_3_days]
    inspection.feed_consumption = params[:feed_consumption].to_json
    inspection.water_consumption = params[:water_consumption].to_json
    inspection.average_weight = params[:average_weight].to_json
    inspection.other_notes = params[:other_notes]
    inspection.clinical_signs = params[:clinical_signs]
    inspection.pm_lesions = params[:pm_lesions]
    inspection.diagnoses = params[:diagnoses]
    inspection
  end
end
