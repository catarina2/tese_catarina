class Drug < ActiveRecord::Base
	has_many :resists, :dependent => :destroy
	has_many :isolateds, :through => :resists

	validates :name, :reference, :atc,  presence: true
	validates :reference, uniqueness: true, numericality: { only_integer: true}
	validates :name, length: { maximum: 30}
	
	def self.search (search) 
      where("name like ? OR reference like ?", "%#{search}%", "%#{search}%")
    end

    def self.to_csv
      headers = ['Reference', 'Name', 'Atc', 'DrugBank']
      CSV.generate do |csv|
      	
      	all.each do |drug|
          id = ["Drug"]
          body = [drug.reference, drug.name, drug.atc, drug.drugbank]
          csv << id
          csv << headers
      		csv << body
          idi = ["Isolated Associated"]
          header = ['Name', 'Disease']
          drug.isolateds.each do |isolated|
            csv << idi
            csv << header
             bodyx = [isolated.name, isolated.disease]
             csv << bodyx
          end
      	end
      end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        
        d = Drug.new
        d.reference = row[1]
        d.name = row[2]
        d.atc = row[3]
        d.drugbank = row[4]
        d.save
      end
    end


end
