class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :manager_companies, dependent: :destroy
  has_many :manager_workspaces, dependent: :destroy

  enum position: {admin: 0, company_manager: 1, workspace_manager: 2, personnel: 3}

  scope :find_all_user_of_workspace, -> workspace_id {where "workspace_id = ?",
    workspace_id}
  scope :newest, -> {order created_at: :desc}

  def self.import file
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row Settings.number_row_import_file
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash.slice(*row.to_hash.keys)
      user.save!
    end
  end

  def self.open_spreadsheet file
    case File.extname file.original_filename
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      when ".ods" then Roo::OpenOffice.new(file.path)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end
end
