class CostingSheet < ActiveRecord::Base
  attr_accessible :quotation_request_form_id, :prod_size, :open_size, :quantity, :color, :paper_size_l, :paper_size_w,
                  :ratio, :printing_size_l, :printing_size_w, :ups, :art_card, :rej_percent, :cost_lb,
                  :art_card_pc, :material_cost_usage, :material_cost_rej, :material_cost_lot, :material_cost_pc,
                  :printing_cost, :printing_cost_mc, :printing_cost_k, :printing_cost_r, :printing_cost_lot, :printing_cost_pc,
                  :pre_press, :pre_press_sq, :pre_press_l, :pre_press_w, :pre_press_lot, :pre_press_pc,
                  :plate_sq, :plate_l, :plate_w, :plate_lot, :plate_pc, :uv_k, :uv_r, :uv_lot, :uv_pc, 
                  :lamination_remark, :lamination_k, :lamination_r, :lamination_lot, :lamination_pc,
                  :die_cut_lot, :die_cut_pc, :die_cut_labour_k, :die_cut_labour_r, :die_cut_labour_lot, :die_cut_labour_pc,
                  :glueing_remark, :glueing_k, :glueing_r, :glueing_lot, :glueing_pc,
                  :gold_remark, :gold_k, :gold_r, :gold_lot, :gold_pc, :packing_cost,:packing_cost_r,:packing_lot,:packing_pc, 
                  :transport, :transport_r, :transport_lot, :transport_pc, :misc_r, :misc_lot, :misc_pc,
                  :raw_material_percent, :paper_mt, :total_lot, :total_pc,
                  :admin_percent, :admin_lot, :admin_pc, :grand_total_lot, :grand_total_pc,
                  :summary_percent, :summary_lot, :summary_pc, :remark, :costing_sheet_date, :status
  
  belongs_to :quotation_request_form
  has_many :costing_sheet_changelogs, :dependent => :destroy
  
  validates :quotation_request_form_id, :presence => true
  
  ACTIVE = "A"
  KEEP_IN_VIEW = "KIV"
  
  scope :get_kiv, where(:status => CostingSheet::KEEP_IN_VIEW)
  
  def self.comparator_cs(costing_sheet)
    @costing = CostingSheet.where("status = ? and quotation_request_form_id = ?", CostingSheet::ACTIVE, costing_sheet.quotation_request_form_id)
    @costing_last_two = @costing.last(2).first
    @costing_last     = @costing.last
    
    if @costing.size > 1
      
      if @costing_last.prod_size != @costing_last_two.prod_size
        @costing_last.costing_sheet_changelogs.new(:change_log => "Product Size has changed from #{@costing_last_two.prod_size} to #{@costing_last.prod_size}.") 
        @costing_last.save!
      end  
        
      if @costing_last.open_size != @costing_last_two.open_size
        @costing_last.costing_sheet_changelogs.new(:change_log => "Open Size has changed from #{@costing_last_two.open_size} to #{@costing_last.open_size}.") 
        @costing_last.save!
      end  
          
      if @costing_last.quantity != @costing_last_two.quantity
        @costing_last.costing_sheet_changelogs.new(:change_log => "Quantity has changed from #{@costing_last_two.quantity} to #{@costing_last.quantity}.") 
        @costing_last.save!
      end  
      
      if @costing_last.color != @costing_last_two.color
        @costing_last.costing_sheet_changelogs.new(:change_log => "Color has changed from #{@costing_last_two.color} to #{@costing_last.color}.") 
        @costing_last.save!
      end  
          
      if @costing_last.paper_size_l != @costing_last_two.paper_size_l
        @costing_last.costing_sheet_changelogs.new(:change_log => "Paper Size Length has changed from #{@costing_last_two.paper_size_l} to #{@costing_last.paper_size_l}.") 
        @costing_last.save!
      end  
          
      if @costing_last.paper_size_w != @costing_last_two.paper_size_w
        @costing_last.costing_sheet_changelogs.new(:change_log => "Paper Size Width has changed from #{@costing_last_two.paper_size_w} to #{@costing_last.paper_size_w}.") 
        @costing_last.save!
      end  
                
      if @costing_last.ratio != @costing_last_two.ratio
        @costing_last.costing_sheet_changelogs.new(:change_log => "Ratio has changed from #{@costing_last_two.ratio} to #{@costing_last.ratio}.") 
        @costing_last.save!
      end  
          
#      if @costing_last.printing_size_l != @costing_last_two.printing_size_l
#        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Size Length has changed from #{@costing_last_two.printing_size_l} to #{@costing_last.printing_size_l}.") 
#        @costing_last.save!
#      end  
        
#      if @costing_last.printing_size_w != @costing_last_two.printing_size_w
#        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Size Width has changed from #{@costing_last_two.printing_size_w} to #{@costing_last.printing_size_w}.") 
#        @costing_last.save!
#      end  
          
#      if @costing_last.ups != @costing_last_two.ups
#        @costing_last.costing_sheet_changelogs.new(:change_log => "Ups has changed from #{@costing_last_two.ups} to #{@costing_last.ups}.") 
#        @costing_last.save!
#      end  
          
      if @costing_last.art_card != @costing_last_two.art_card
        @costing_last.costing_sheet_changelogs.new(:change_log => "1s Art Card has changed from #{@costing_last_two.art_card} to #{@costing_last.art_card}.") 
        @costing_last.save!
      end  
          
      if @costing_last.rej_percent != @costing_last_two.rej_percent
        @costing_last.costing_sheet_changelogs.new(:change_log => "Rej % has changed from #{@costing_last_two.rej_percent} to #{@costing_last.rej_percent}.") 
        @costing_last.save!
      end  
          
      if @costing_last.cost_lb != @costing_last_two.cost_lb
        @costing_last.costing_sheet_changelogs.new(:change_log => "$/lb has changed from #{@costing_last_two.cost_lb} to #{@costing_last.cost_lb}.") 
        @costing_last.save!
      end
      
      if @costing_last.art_card_pc != @costing_last_two.art_card_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Material Cost $/pc has changed from #{@costing_last_two.art_card_pc} to #{@costing_last.art_card_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.material_cost_usage != @costing_last_two.material_cost_usage
        @costing_last.costing_sheet_changelogs.new(:change_log => "Usage/Lot has changed from #{@costing_last_two.material_cost_usage} to #{@costing_last.material_cost_usage}.") 
        @costing_last.save!
      end
      
      if @costing_last.material_cost_rej != @costing_last_two.material_cost_rej
        @costing_last.costing_sheet_changelogs.new(:change_log => "Material Cost Rej has changed from #{@costing_last_two.material_cost_rej} to #{@costing_last.material_cost_rej}.") 
        @costing_last.save!
      end
      
      if @costing_last.material_cost_lot != @costing_last_two.material_cost_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Material Cost $/Lot has changed from #{@costing_last_two.material_cost_lot} to #{@costing_last.material_cost_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.material_cost_pc != @costing_last_two.material_cost_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Material Cost $/Pc has changed from #{@costing_last_two.material_cost_pc} to #{@costing_last.material_cost_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost != @costing_last_two.printing_cost
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Cost has changed from #{@costing_last_two.printing_cost} to #{@costing_last.printing_cost}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost_mc != @costing_last_two.printing_cost_mc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Cost M/c has changed from #{@costing_last_two.printing_cost_mc} to #{@costing_last.printing_cost_mc}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost_k != @costing_last_two.printing_cost_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing cost $/K has changed from #{@costing_last_two.printing_cost_k} to #{@costing_last.printing_cost_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost_r != @costing_last_two.printing_cost_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Cost R% has changed from #{@costing_last_two.printing_cost_r} to #{@costing_last.printing_cost_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost_lot != @costing_last_two.printing_cost_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Cost $/Lot has changed from #{@costing_last_two.printing_cost_lot} to #{@costing_last.printing_cost_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.printing_cost_pc != @costing_last_two.printing_cost_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Printing Cost $/Pc has changed from #{@costing_last_two.printing_cost_pc} to #{@costing_last.printing_cost_pc}.") 
        @costing_last.save!
      end
      
#      if @costing_last.pre_press != @costing_last_two.pre_press
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press} to #{@costing_last.pre_press}.") 
#        @costing_last.save!
#      end
      
#      if @costing_last.pre_press_sq != @costing_last_two.pre_press_sq
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press_sq} to #{@costing_last.pre_press_sq}.") 
#        @costing_last.save!
#      end
      
#      if @costing_last.pre_press_l != @costing_last_two.pre_press_l
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press_l} to #{@costing_last.pre_press_l}.") 
#        @costing_last.save!
#      end
      
#      if @costing_last.pre_press_w != @costing_last_two.pre_press_w
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press_w} to #{@costing_last.pre_press_w}.") 
#        @costing_last.save!
#      end
      
#      if @costing_last.pre_press_lot != @costing_last_two.pre_press_lot
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press_lot} to #{@costing_last.pre_press_lot}.") 
#        @costing_last.save!
#      end

#      if @costing_last.pre_press_pc != @costing_last_two.pre_press_pc
#        @costing_last.costing_sheet_changelogs.new(:change_log => " has changed from #{@costing_last_two.pre_press_pc} to #{@costing_last.pre_press_pc}.") 
#        @costing_last.save!
#      end
      
      if @costing_last.plate_sq != @costing_last_two.plate_sq
        @costing_last.costing_sheet_changelogs.new(:change_log => "Plate $/SQ in has changed from #{@costing_last_two.plate_sq} to #{@costing_last.plate_sq}.") 
        @costing_last.save!
      end
      
      if @costing_last.plate_l != @costing_last_two.plate_l
        @costing_last.costing_sheet_changelogs.new(:change_log => "Plate Length has changed from #{@costing_last_two.plate_l} to #{@costing_last.plate_l}.") 
        @costing_last.save!
      end
      
      if @costing_last.plate_w != @costing_last_two.plate_w
        @costing_last.costing_sheet_changelogs.new(:change_log => "Plate Width has changed from #{@costing_last_two.plate_w} to #{@costing_last.plate_w}.") 
        @costing_last.save!
      end
      
      if @costing_last.plate_lot != @costing_last_two.plate_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Plate $/Lot has changed from #{@costing_last_two.plate_lot} to #{@costing_last.plate_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.plate_pc != @costing_last_two.plate_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Plate $/Pc has changed from #{@costing_last_two.plate_pc} to #{@costing_last.plate_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.uv_k != @costing_last_two.uv_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Uv/Calender $/K has changed from #{@costing_last_two.uv_k} to #{@costing_last.uv_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.uv_r != @costing_last_two.uv_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Uv/Calender R% has changed from #{@costing_last_two.uv_r} to #{@costing_last.uv_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.uv_lot != @costing_last_two.uv_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Uv/Calender $/Lot has changed from #{@costing_last_two.uv_lot} to #{@costing_last.uv_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.uv_pc != @costing_last_two.uv_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Uv/Calender $/Pc has changed from #{@costing_last_two.uv_pc} to #{@costing_last.uv_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.lamination_remark != @costing_last_two.lamination_remark
        @costing_last.costing_sheet_changelogs.new(:change_log => "Lmn-Flute/opp Remark has changed from #{@costing_last_two.lamination_remark} to #{@costing_last.lamination_remark}.") 
        @costing_last.save!
      end
      
      if @costing_last.lamination_k != @costing_last_two.lamination_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Lmn-Flute/opp $/K has changed from #{@costing_last_two.lamination_k} to #{@costing_last.lamination_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.lamination_r != @costing_last_two.lamination_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Lmn-Flute/opp R% has changed from #{@costing_last_two.lamination_r} to #{@costing_last.lamination_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.lamination_lot != @costing_last_two.lamination_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Lmn-Flute/opp $/Lot has changed from #{@costing_last_two.lamination_lot} to #{@costing_last.lamination_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.lamination_pc != @costing_last_two.lamination_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Lmn-Flute/opp $/Pc has changed from #{@costing_last_two.lamination_pc} to #{@costing_last.lamination_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_lot != @costing_last_two.die_cut_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Mold $/Lot has changed from #{@costing_last_two.die_cut_lot} to #{@costing_last.die_cut_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_pc != @costing_last_two.die_cut_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Mold $/Pc has changed from #{@costing_last_two.die_cut_pc} to #{@costing_last.die_cut_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_labour_k != @costing_last_two.die_cut_labour_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Labour $/K has changed from #{@costing_last_two.die_cut_labour_k} to #{@costing_last.die_cut_labour_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_labour_r != @costing_last_two.die_cut_labour_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Labour R% has changed from #{@costing_last_two.die_cut_labour_r} to #{@costing_last.die_cut_labour_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_labour_lot != @costing_last_two.die_cut_labour_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Labour $/Lot has changed from #{@costing_last_two.die_cut_labour_lot} to #{@costing_last.die_cut_labour_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.die_cut_labour_pc != @costing_last_two.die_cut_labour_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Die Cut Labour $/Pc has changed from #{@costing_last_two.die_cut_labour_pc} to #{@costing_last.die_cut_labour_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.glueing_remark != @costing_last_two.glueing_remark
        @costing_last.costing_sheet_changelogs.new(:change_log => "Glueing Remark has changed from #{@costing_last_two.glueing_remark} to #{@costing_last.glueing_remark}.") 
        @costing_last.save!
      end
      
      if @costing_last.glueing_k != @costing_last_two.glueing_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Glueing $/K has changed from #{@costing_last_two.glueing_k} to #{@costing_last.glueing_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.glueing_r != @costing_last_two.glueing_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Glueing R% has changed from #{@costing_last_two.glueing_r} to #{@costing_last.glueing_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.glueing_lot != @costing_last_two.glueing_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Glueing $/Lot has changed from #{@costing_last_two.glueing_lot} to #{@costing_last.glueing_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.glueing_pc != @costing_last_two.glueing_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Glueing $/Pc has changed from #{@costing_last_two.glueing_pc} to #{@costing_last.glueing_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.gold_remark != @costing_last_two.gold_remark
        @costing_last.costing_sheet_changelogs.new(:change_log => "Gold Stamp Remark has changed from #{@costing_last_two.gold_remark} to #{@costing_last.gold_remark}.") 
        @costing_last.save!
      end
      
      if @costing_last.gold_k != @costing_last_two.gold_k
        @costing_last.costing_sheet_changelogs.new(:change_log => "Gold Stamp $/K has changed from #{@costing_last_two.gold_k} to #{@costing_last.gold_k}.") 
        @costing_last.save!
      end
      
      if @costing_last.gold_r != @costing_last_two.gold_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Gold Stamp R% has changed from #{@costing_last_two.gold_r} to #{@costing_last.gold_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.gold_lot != @costing_last_two.gold_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Gold Stamp $/Lot has changed from #{@costing_last_two.gold_lot} to #{@costing_last.gold_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.gold_pc != @costing_last_two.gold_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Gold Stamp $/Pc has changed from #{@costing_last_two.gold_pc} to #{@costing_last.gold_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.packing_cost != @costing_last_two.packing_cost
        @costing_last.costing_sheet_changelogs.new(:change_log => "Packing Cost has changed from #{@costing_last_two.packing_cost} to #{@costing_last.packing_cost}.") 
        @costing_last.save!
      end
      
      if @costing_last.packing_cost_r != @costing_last_two.packing_cost_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Packing Cost R% has changed from #{@costing_last_two.packing_cost_r} to #{@costing_last.packing_cost_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.packing_lot != @costing_last_two.packing_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Packing Cost $/Lot has changed from #{@costing_last_two.packing_lot} to #{@costing_last.packing_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.packing_pc != @costing_last_two.packing_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Packing Cost $/Pc has changed from #{@costing_last_two.packing_pc} to #{@costing_last.packing_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.transport != @costing_last_two.transport
        @costing_last.costing_sheet_changelogs.new(:change_log => "Transport Cost has changed from #{@costing_last_two.transport} to #{@costing_last.transport}.") 
        @costing_last.save!
      end
      
      if @costing_last.transport_r != @costing_last_two.transport_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Transport Cost R% has changed from #{@costing_last_two.transport_r} to #{@costing_last.transport_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.transport_lot != @costing_last_two.transport_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Transport Cost $/Lot has changed from #{@costing_last_two.transport_lot} to #{@costing_last.transport_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.transport_pc != @costing_last_two.transport_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Transport Cost $/Pc has changed from #{@costing_last_two.transport_pc} to #{@costing_last.transport_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.misc_r != @costing_last_two.misc_r
        @costing_last.costing_sheet_changelogs.new(:change_log => "Misc R% has changed from #{@costing_last_two.misc_r} to #{@costing_last.misc_r}.") 
        @costing_last.save!
      end
      
      if @costing_last.misc_lot != @costing_last_two.misc_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Misc $/Lot has changed from #{@costing_last_two.misc_lot} to #{@costing_last.misc_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.misc_pc != @costing_last_two.misc_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Misc $/Pc has changed from #{@costing_last_two.misc_pc} to #{@costing_last.misc_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.raw_material_percent != @costing_last_two.raw_material_percent
        @costing_last.costing_sheet_changelogs.new(:change_log => "Raw-Material% has changed from #{@costing_last_two.raw_material_percent} to #{@costing_last.raw_material_percent}.") 
        @costing_last.save!
      end
      
      if @costing_last.paper_mt != @costing_last_two.paper_mt
        @costing_last.costing_sheet_changelogs.new(:change_log => "Paper-Mt has changed from #{@costing_last_two.paper_mt} to #{@costing_last.paper_mt}.") 
        @costing_last.save!
      end
      
      if @costing_last.total_lot != @costing_last_two.total_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Total $/Lot has changed from #{@costing_last_two.total_lot} to #{@costing_last.total_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.total_pc != @costing_last_two.total_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Total $/Pc has changed from #{@costing_last_two.total_pc} to #{@costing_last.total_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.admin_percent != @costing_last_two.admin_percent
        @costing_last.costing_sheet_changelogs.new(:change_log => "Admin-% has changed from #{@costing_last_two.admin_percent} to #{@costing_last.admin_percent}.") 
        @costing_last.save!
      end
      
      if @costing_last.admin_lot != @costing_last_two.admin_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Admin $/Lot has changed from #{@costing_last_two.admin_lot} to #{@costing_last.admin_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.admin_pc != @costing_last_two.admin_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Admin $/Pc has changed from #{@costing_last_two.admin_pc} to #{@costing_last.admin_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.grand_total_lot != @costing_last_two.grand_total_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Grand Total $/Lot has changed from #{@costing_last_two.grand_total_lot} to #{@costing_last.grand_total_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.grand_total_pc != @costing_last_two.grand_total_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Grand Total $/Pc has changed from #{@costing_last_two.grand_total_pc} to #{@costing_last.grand_total_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.summary_percent != @costing_last_two.summary_percent
        @costing_last.costing_sheet_changelogs.new(:change_log => "Summary-% has changed from #{@costing_last_two.summary_percent} to #{@costing_last.summary_percent}.") 
        @costing_last.save!
      end
      
      if @costing_last.summary_lot != @costing_last_two.summary_lot
        @costing_last.costing_sheet_changelogs.new(:change_log => "Summary $/Lot has changed from #{@costing_last_two.summary_lot} to #{@costing_last.summary_lot}.") 
        @costing_last.save!
      end
      
      if @costing_last.summary_pc != @costing_last_two.summary_pc
        @costing_last.costing_sheet_changelogs.new(:change_log => "Summary $/Pc has changed from #{@costing_last_two.summary_pc} to #{@costing_last.summary_pc}.") 
        @costing_last.save!
      end
      
      if @costing_last.remark != @costing_last_two.remark
        @costing_last.costing_sheet_changelogs.new(:change_log => "Remark has changed.") 
        @costing_last.save!
      end
      
      if @costing_last.costing_sheet_date != @costing_last_two.costing_sheet_date
        @costing_last.costing_sheet_changelogs.new(:change_log => "Date has changed from #{@costing_last_two.costing_sheet_date} to #{@costing_last.costing_sheet_date}.") 
        @costing_last.save!
      end
    end
  end
end
