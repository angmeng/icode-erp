# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TypeOfSale.create([
  {:name => 'SALES WITH TAX'},
  {:name => 'LOCAL SALES (MAS)'},
  {:name => 'OTHERS'},
  {:name => 'FREE TRADE ZONE'},
  {:name => 'LMW EXEMPTION / WL'},
  {:name => 'CJ5 LICENCE MANUFACTURER'},
  {:name => 'EXPORT SALES'},
  {:name => 'IMPORT'}
])

TradeTerm.create([
  {:name => '30 DAYS'},
  {:name => '60 DAYS'},
  {:name => '90 DAYS'},
  {:name => '45 DAYS'},
  {:name => '120 DAYS'},
  {:name => 'BANDRAFT'},
  {:name => 'CASH PAYMENT'},
  {:name => 'DP'},
  {:name => 'L/C AT SIGHT'}
])

UnitMeasurement.create([  
  {:code => "BAG"}, 
  {:code => "BOOK"}, 
  {:code => "BOX"}, 
  {:code => "BTL"}, 
  {:code => "BUNDD"}, 
  {:code => "CAN"}, 
  {:code => "COIL"}, 
  {:code => "CTN"}, 
  {:code => "CYLN"}, 
  {:code => "DRUM"}, 
  {:code => "HR"}, 
  {:code => "GM"}, 
  {:code => "KG"}, 
  {:code => "LOAD"}, 
  {:code => "METER"}, 
  {:code => "NO"}, 
  {:code => "PAD"}, 
  {:code => "PAIR"}, 
  {:code => "PC"}, 
  {:code => "REAM"}, 
  {:code => "ROLL"}, 
  {:code => "SET"}, 
  {:code => "TIN"}, 
  {:code => "TUBE"}, 
  {:code => "UNIT"}, 
  {:code => "SHOT"}, 
  {:code => "LOT"}, 
  {:code => "SQFT"}, 
  {:code => "GROSS"},
  {:code => "LBS"},
  {:code => "FT"},
  {:code => "M2"},
  {:code => "TRIP"},
  {:code => "COPY"}
])

Currency.create([
  {:name => 'AUD'},
  {:name => 'RM'},
  {:name => 'SGD'},
  {:name => 'USD'},
  {:name => 'YEN'}
])

Transport.create([
  {:name => 'AIR'},
  {:name => 'RAIL'},
  {:name => 'ROAD'},
  {:name => 'SEA'}
])

Department.create([
  {:name => 'MANAGEMENT'},
  {:name => 'ACCOUNTS & FINANCE'},
  {:name => 'ADMIN & PERSONNEL'},
  {:name => 'DELIVERY'},
  {:name => 'FINISHING & PACKING'},
  {:name => 'GRAPHIC'},
  {:name => 'MAINTENANCE & ENGINE'},
  {:name => 'MARKETING & SALES'},
  {:name => 'PRINTING & CUTTER'},
  {:name => 'PURCHASING & PPC'},
  {:name => 'STORE & WAREHOUSE'}
])

PaymentType.create([
  {:name => 'DEBTOR'},
  {:name => 'OTHER DEBTOR'},
  {:name => 'CREDITOR'},
  {:name => 'OTHER CREDITOR'}
])

InventoryIssue.create([
  {:description => 'RECEIVED NOTE'},
  {:description => 'PRODUCTION RETURN', :in_out => "IN"},
  {:description => 'RETURN STOCK FORM LOAN', :in_out => "IN"},
  
  {:description => 'REJECT FOR REWORK / RETURN', :in_out => "OUT"},
  {:description => 'BOM PLAN TO PRODUCTION', :in_out => "OUT"},
  {:description => 'REQUEST FOR SAMPLE', :in_out => "OUT"},
  {:description => 'ON LOAN', :in_out => "OUT"},
  {:description => 'SCRAP NOTE', :in_out => "OUT"},
  
  {:description => 'NEW PRODUCT'}
])

InventoryManagementSystem.create([
  {:name => 'PURCHASE REQUISITION MENU'},
  {:name => 'PURCHASE REQUISITION MAIN'},
  {:name => 'PURCHASE REQUISITION NEW'},
  {:name => 'PURCHASE REQUISITION SHOW'},
  {:name => 'PURCHASE REQUISITION EDIT'},
  {:name => 'PURCHASE REQUISITION DELETE'},
  {:name => 'PURCHASE REQUISITION PRINTABLE'},
    
  {:name => 'PURCHASE ORDER MENU'},
  {:name => 'PURCHASE ORDER MAIN'},
  {:name => 'PURCHASE ORDER NEW'},
  {:name => 'PURCHASE ORDER SHOW'},
  {:name => 'PURCHASE ORDER EDIT'},
  {:name => 'PURCHASE ORDER DELETE'},
  {:name => 'PURCHASE ORDER PRINTABLE'},
  
  {:name => 'RECEIVE NOTE MENU'},
  {:name => 'RECEIVE NOTE MAIN'},
  {:name => 'RECEIVE NOTE NEW'},
  {:name => 'RECEIVE NOTE SHOW'},
  {:name => 'RECEIVE NOTE EDIT'},
  {:name => 'RECEIVE NOTE DELETE'},
  {:name => 'RECEIVE NOTE PRINTABLE'},
  
  {:name => 'INCOMING REJECT MENU'},
  {:name => 'INCOMING REJECT MAIN'},
  {:name => 'INCOMING REJECT NEW'},
  {:name => 'INCOMING REJECT SHOW'},
  {:name => 'INCOMING REJECT EDIT'},
  {:name => 'INCOMING REJECT DELETE'},
  {:name => 'INCOMING REJECT PRINTABLE'},

  {:name => 'SALES TAX EXEMPTION MENU'},
  {:name => 'SALES TAX EXEMPTION MAIN'},
  {:name => 'SALES TAX EXEMPTION NEW'},
  {:name => 'SALES TAX EXEMPTION SHOW'},
  {:name => 'SALES TAX EXEMPTION EDIT'},
  {:name => 'SALES TAX EXEMPTION DELETE'},
  {:name => 'SALES TAX EXEMPTION PRINTABLE'},
  
  {:name => 'INVENTORY MENU'},
  {:name => 'INVENTORY MAIN'},
  {:name => 'INVENTORY NEW'},
  {:name => 'INVENTORY SHOW'},
  {:name => 'INVENTORY EDIT'},
  {:name => 'INVENTORY DELETE'},
  {:name => 'INVENTORY PRINTABLE'},
  
  {:name => 'TRADE COMPANY MENU'},
  {:name => 'TRADE COMPANY MAIN'},
  {:name => 'TRADE COMPANY NEW'},
  {:name => 'TRADE COMPANY SHOW'},
  {:name => 'TRADE COMPANY EDIT'},
  {:name => 'TRADE COMPANY DELETE'},
  {:name => 'TRADE COMPANY PRINTABLE'},
  
  {:name => 'PRODUCT CATEGORY MENU'},
  {:name => 'PRODUCT CATEGORY MAIN'},
  {:name => 'PRODUCT CATEGORY NEW'},
  {:name => 'PRODUCT CATEGORY SHOW'},
  {:name => 'PRODUCT CATEGORY EDIT'},
  {:name => 'PRODUCT CATEGORY DELETE'},
  {:name => 'PRODUCT CATEGORY PRINTABLE'},
  
  {:name => 'PRODUCT ID MENU'},
  {:name => 'PRODUCT ID MAIN'},
  {:name => 'PRODUCT ID NEW'},
  {:name => 'PRODUCT ID SHOW'},
  {:name => 'PRODUCT ID EDIT'},
  {:name => 'PRODUCT ID DELETE'},
  {:name => 'PRODUCT ID PRINTABLE'}
])