# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#TypeOfSale.create([
#  {:name => 'SALES WITH TAX'},
#  {:name => 'LOCAL SALES (MAS)'},
#  {:name => 'OTHERS'},
#  {:name => 'FREE TRADE ZONE'},
#  {:name => 'LMW EXEMPTION / WL'},
#  {:name => 'CJ5 LICENCE MANUFACTURER'},
#  {:name => 'EXPORT SALES'},
#  {:name => 'IMPORT'}
#])

#TradeTerm.create([
#  {:name => '30 DAYS'},
#  {:name => '60 DAYS'},
#  {:name => '90 DAYS'},
#  {:name => '45 DAYS'},
#  {:name => '120 DAYS'},
#  {:name => 'BANDRAFT'},
#  {:name => 'CASH PAYMENT'},
#  {:name => 'DP'},
#  {:name => 'L/C AT SIGHT'}
#])

#UnitMeasurement.create([  
#  {:code => "BAG"}, 
#  {:code => "BOOK"}, 
#  {:code => "BOX"}, 
#  {:code => "BTL"}, 
#  {:code => "BUNDD"}, 
#  {:code => "CAN"}, 
#  {:code => "COIL"}, 
#  {:code => "CTN"}, 
#  {:code => "CYLN"}, 
#  {:code => "DRUM"}, 
#  {:code => "HR"}, 
#  {:code => "GM"}, 
#  {:code => "GSM"},
#  {:code => "KG"}, 
#  {:code => "LOAD"}, 
#  {:code => "METER"}, 
#  {:code => "NO"}, 
#  {:code => "PAD"}, 
#  {:code => "PAIR"}, 
#  {:code => "PC"}, 
#  {:code => "REAM"}, 
#  {:code => "ROLL"}, 
#  {:code => "SET"}, 
#  {:code => "TIN"}, 
#  {:code => "TUBE"}, 
#  {:code => "UNIT"}, 
#  {:code => "SHOT"}, 
#  {:code => "LOT"}, 
#  {:code => "SQFT"}, 
#  {:code => "GROSS"},
#  {:code => "LBS"},
#  {:code => "FT"},
#  {:code => "M2"},
#  {:code => "TRIP"},
#  {:code => "COPY"}
#])

#Currency.create([
#  {:name => 'AUD', :status => "ACTIVE"},
#  {:name => 'RM', :status => "ACTIVE"},
#  {:name => 'SGD', :status => "ACTIVE"},
#  {:name => 'USD', :status => "ACTIVE"},
#  {:name => 'YEN', :status => "ACTIVE"}
#])
#
#Transport.create([
#  {:name => 'AIR', :status => "ACTIVE"},
#  {:name => 'RAIL', :status => "ACTIVE"},
#  {:name => 'ROAD', :status => "ACTIVE"},
#  {:name => 'SEA', :status => "ACTIVE"}
#])

#Department.create([
#  {:name => 'MANAGEMENT'},
#  {:name => 'ACCOUNTS & FINANCE'},
#  {:name => 'ADMIN & PERSONNEL'},
#  {:name => 'DELIVERY'},
#  {:name => 'FINISHING & PACKING'},
#  {:name => 'GRAPHIC'},
#  {:name => 'MAINTENANCE & ENGINE'},
#  {:name => 'MARKETING & SALES'},
#  {:name => 'PRINTING & CUTTER'},
#  {:name => 'PURCHASING & PPC'},
#  {:name => 'STORE & WAREHOUSE'}
#])

#PaymentType.create([
#  {:name => 'DEBTOR'},
#  {:name => 'OTHER DEBTOR'},
#  {:name => 'CREDITOR'},
#  {:name => 'OTHER CREDITOR'}
#])

InventoryIssue.create([
  {:description => 'RECEIVED NOTE', :in_out => "IN"},
  {:description => 'PRODUCTION RETURN', :in_out => "IN"},
  {:description => 'RETURN STOCK FORM LOAN', :in_out => "IN"},
  {:description => 'REJECT FOR REWORK / RETURN', :in_out => "OUT"},
  {:description => 'BOM PLAN TO PRODUCTION', :in_out => "OUT"},
  {:description => 'REQUEST FOR SAMPLE', :in_out => "OUT"},
  {:description => 'ON LOAN', :in_out => "OUT"},
  {:description => 'SCRAP NOTE', :in_out => "OUT"},
  {:description => 'NEW PRODUCT', :in_out => "IN"},
  {:description => 'FINISH GOODS', :in_out => "IN"},
  {:description => 'DELIVERY ORDER', :in_out => "OUT"},
  {:description => 'EXPIRED SCRAP DAMAGED', :in_out => "OUT"},
  {:description => 'TRANSFER NOTE', :in_out => "OUT"},
])

#Material.create([
#  {code: '1', :description => 'Spray Powder'},
#  {code: '2', :description => 'Ink Remover'},
#  {code: '3', :description => 'Plate Cleaner'},
#  {code: '4', :description => 'Cotton Rag'},
#  {code: '5', :description => 'OPP Varnish'},
#  {code: '6', :description => 'IPA'},
#  {code: '7', :description => 'Kerosene'},
#  {code: '8', :description => 'Water Base'},
#  {code: '9', :description => 'Lube Guard'},
#  {code: '10', :description => 'Anti Skin'},
#  
#  {code: '11', :description => 'Foamex'},
#  {code: '12', :description => 'Drier'},
#  {code: '13', :description => 'Orange Sponge'},
#  {code: '14', :description => 'Thinner'},
#  {code: '15', :description => 'Blanket with Bar'},
#  {code: '16', :description => 'Blanket'},
#  {code: '17', :description => 'Litho Thin Varnish'},
#  {code: '18', :description => 'Jelly Compound'},
#  {code: '19', :description => 'Die Cut Sponge'},
#  {code: '20', :description => 'Channel'},
#  
#  {code: '21', :description => 'SKP Tape'},
#  {code: '22', :description => 'Masking Tape'},
#  {code: '23', :description => 'Glue 8890'},
#  {code: '24', :description => 'Glue V2350'},
#  {code: '25', :description => 'Rubber Band'},
#  {code: '26', :description => 'OPP Tape'},
#  {code: '27', :description => 'Fountain'},
#  {code: '28', :description => 'Semi Auto Strap'},
#  {code: '29', :description => 'Clip'},
#  {code: '30', :description => 'Stretch Film'},
#  
#  {code: '31', :description => 'Double Side Tape'},
#  {code: '32', :description => 'Silicone Spray'}
#])

#CompanyProfile.create([
#  :name => 'ETHEOS IMPRINT TECHNOLOGY SDN BHD',
#  :address => 'EOT 603 KAW PERINDUSTRIAN
#                KG TELUK SG DUA
#                13800 BUTTERWORTH PENANG.',
#  :tel_no_1 => '04-3565872',
#  :tel_no_2 => '04-3565870',
#  :fax_no => '04-3565879',
#  :sales_tax_no => 'A061583',
#  :reg_no => '362823-K',
#  :sn_sales_order_no => 21662,
#  :sn_purchase_order_no => 23438,
#  :sn_deliver_order_no => 35056,
#  :sn_receive_note_no => 28134,
#  :sn_transfer_slip_no => 0,
#  :sn_store_voucher_no => 0,
#  :sn_incoming_reject_no => 11,
#  :sn_outgoing_reject_no => 331,
#  :sn_credit_note_no => 924,
#  :sn_debit_note_no => 712,
#  :sn_billing_order_no => 0,
#  :sn_purchase_req_no => 106,
#  :sn_product_price_no => 2034,
#  :sn_job_order_no => 0,
#  :sn_shipment_schedule => 0,
#  :sn_scrap_sheet_no => 0,
#  :sn_receiving_instr_no => 0,
#  :sn_shipping_instr_no => 0,
#  :sn_receipt_no => 6189,
#  :sn_bankin_slip_no => 0,
#  :sn_journal_voucher_no => 312,
#  :sn_payment_voucher_no => 0,
#  :sn_product_id_no => 70,
#  :sn_sales_tax_exemption_no => 22,
#  :sn_quotation_request_no => 4
#])