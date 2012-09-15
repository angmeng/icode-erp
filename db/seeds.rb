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
  {:name => 'AUD', :status => "ACTIVE"},
  {:name => 'RM', :status => "ACTIVE"},
  {:name => 'SGD', :status => "ACTIVE"},
  {:name => 'USD', :status => "ACTIVE"},
  {:name => 'YEN', :status => "ACTIVE"}
])

Transport.create([
  {:name => 'AIR', :status => "ACTIVE"},
  {:name => 'RAIL', :status => "ACTIVE"},
  {:name => 'ROAD', :status => "ACTIVE"},
  {:name => 'SEA', :status => "ACTIVE"}
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
    
#1-18
  #module
  {:name => 'PR MENU'},
  
  #sub module
  {:name => 'PR NEW'},
  {:name => 'PR TRANSACTION'},
  {:name => 'PR KIV VIEW'},
  {:name => 'PR ITEMS KIV VIEW'},
  
  #action - pr new
  {:name => 'PR NEW ADD ITEMS'},
  {:name => 'PR NEW SHOW'},
  {:name => 'PR NEW EDIT'},
  {:name => 'PR NEW KIV'},
  {:name => 'PR NEW PRINTABLE'},
  
  #action - pr transaction
  {:name => 'PR TRANSACTION SHOW'},
  {:name => 'PR TRANSACTION EDIT'},
  {:name => 'PR TRANSACTION KIV'},
  {:name => 'PR TRANSACTION PRINTABLE'},
  
  #action - pr kiv view
  {:name => 'PR KIV SHOW'},
  {:name => 'PR KIV RECOVER'},
  
  #action - pr items kiv view
  {:name => 'PR ITEMS KIV SHOW'},
  {:name => 'PR ITEMS KIV RECOVER'},
  
    
  
#19-48
  #module
  {:name => 'PURCHASE ORDER MENU'},
  
  #sub-module
  {:name => 'PURCHASE ORDER APPROVED FROM PR'},
  {:name => 'PURCHASE ORDER PR-REPAIR'},
  {:name => 'PURCHASE ORDER PROPOSED VENDOR'},
  {:name => 'PURCHASE ORDER VENDOR SELECTION'},
  {:name => 'PURCHASE ORDER VENDOR REGISTRATION'},
  {:name => 'PURCHASE ORDER ENTRY'},
  {:name => 'PURCHASE ORDER TRANSACTION'},
  {:name => 'PURCHASE ORDER KIV VIEW'},
   
  #action - pr-repair  
  {:name => 'PURCHASE ORDER PR-REPAIR APPLY'}, 
  {:name => 'PURCHASE ORDER PR-REPAIR SUBMIT TO'}, 
  {:name => 'PURCHASE ORDER PR-REPAIR KIV'}, 
  
  #action - proposed vendor
  {:name => 'PURCHASE ORDER PROPOSED VENDOR APPLY'},
  {:name => 'PURCHASE ORDER PROPOSED VENDOR SUBMIT TO'},
  {:name => 'PURCHASE ORDER PROPOSED VENDOR KIV'}, 
  
  #action - vendor selection
  {:name => 'PURCHASE ORDER VENDOR SELECTION APPLY'},
  {:name => 'PURCHASE ORDER VENDOR SELECTION SUBMIT TO'},
  {:name => 'PURCHASE ORDER VENDOR SELECTION KIV'}, 
  
  #action - vendor registration
  {:name => 'PURCHASE ORDER VENDOR REGISTRATION APPLY'},
  {:name => 'PURCHASE ORDER VENDOR REGISTRATION SUBMIT TO'},
  {:name => 'PURCHASE ORDER VENDOR REGISTRATION KIV'},
  
  #action - po entry
  {:name => 'PURCHASE ORDER ENTRY APPLY'},
  {:name => 'PURCHASE ORDER ENTRY SUBMIT TO'},
  {:name => 'PURCHASE ORDER ENTRY KIV'},
  
  #action - transaction
  {:name => 'PURCHASE ORDER TRANSACTION SHOW'},
  {:name => 'PURCHASE ORDER TRANSACTION EDIT'},
  {:name => 'PURCHASE ORDER TRANSACTION KIV'},
  {:name => 'PURCHASE ORDER TRANSACTION PRINTABLE'},
  
  #action - kiv
  {:name => 'PO KIV SHOW'},
  {:name => 'PO KIV RECOVER'},
   
    
#49-60
  #module
  {:name => 'RECEIVE NOTE MENU'},
  
  #sub-module
  {:name => 'RECEIVE NOTE NEW'},
  {:name => 'RECEIVE NOTE TRANSACTION'},
  {:name => 'RECEIVE NOTE COMPLETED VIEW'},
  {:name => 'RECEIVE NOTE KIV VIEW'},
  
  #action - new
  {:name => 'RECEIVE NOTE NEW SAVE'},
  
  #action - Transaction
  {:name => 'RECEIVE NOTE TRANSACTION SHOW'},
  {:name => 'RECEIVE NOTE TRANSACTION EDIT'},
  {:name => 'RECEIVE NOTE TRANSACTION KIV'},
  {:name => 'RECEIVE NOTE TRANSACTION PRINTABLE'},
  
  #action - kiv
  {:name => 'RN KIV SHOW'},
  {:name => 'RN KIV RECOVER'},
  
    
#61-76
  #module
  {:name => 'SALES TAX EXEMPTION MENU'},
  
  #sub-module
  {:name => 'SALES TAX EXEMPTION NEW'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION VALID'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION UNVALID'},
  {:name => 'SALES TAX EXEMPTION KIV'},
  
  #sub-module
  {:name => 'SALES TAX EXEMPTION SAVE'},
    
  #action-transaction valid
  {:name => 'SALES TAX EXEMPTION TRANSACTION VALID SHOW'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION VALID EDIT'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION VALID KIV'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION VALID PRINTABLE'},
  
  #action-transaction unvalid
  {:name => 'SALES TAX EXEMPTION TRANSACTION UNVALID SHOW'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION UNVALID EDIT'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION UNVALID KIV'},
  {:name => 'SALES TAX EXEMPTION TRANSACTION UNVALID PRINTABLE'},
  
  #action - kiv valid
  {:name => 'STE KIV VALID SHOW'},
  {:name => 'STE KIV VALID RECOVER'},
  
    
#77-87
  #module
  {:name => 'INVENTORY MENU'},
  
  #sub module
  {:name => 'INVENTORY NEW'},
  {:name => 'INVENTORY TRANSACTION'},
  {:name => 'INVENTORY KIV VIEW'},
  
  #action
  {:name => 'INVENTORY NEW SAVE'},
  
  #action - transaction
  {:name => 'INVENTORY TRANSACTION SHOW'},
  {:name => 'INVENTORY TRANSACTION EDIT'},
  {:name => 'INVENTORY TRANSACTION KIV'},
  {:name => 'INVENTORY TRANSACTION PRINTABLE'},
  
  #action => kiv
  {:name => 'INVENTORY TRANSACTION KIV SHOW'},
  {:name => 'INVENTORY TRANSACTION KIV RECOVER'},
  
    
#88-93
# Housekeeping
  #module
  {:name => 'COMPANY PROFILE MENU'},
  
  #sub module
  {:name => 'COMPANY PROFILE VIEW'},
  
  #action
  {:name => 'COMPANY PROFILE SHOW'},
  {:name => 'COMPANY PROFILE EDIT'},
  {:name => 'COMPANY PROFILE KIV'},
  {:name => 'COMPANY PROFILE PRINTABLE'},
    
#94-114
  #module  
  {:name => 'TRADE COMPANY MENU'},
  
  #sub module
  {:name => 'VENDOR MENU'},
  {:name => 'CUSTOMER MENU'},
  
  #sub sub module
  {:name => 'VENDOR NEW'},
  {:name => 'VENDOR LISTING'},
  {:name => 'VENDOR KIV'},
  
    #action - save
  {:name => 'VENDOR NEW SAVE'},
    
  #action vendor listing
  {:name => 'VENDOR SHOW'},
  {:name => 'VENDOR EDIT'},
  {:name => 'VENDOR ACTION KIV'},  #127
  {:name => 'VENDOR PRINTABLE'},
  
  {:name => 'VENDOR KIV SHOW'},
  {:name => 'VENDOR KIV RECOVER'},
    

  {:name => 'CUSTOMER NEW'},
  {:name => 'CUSTOMER LISTING'},
  {:name => 'CUSTOMER KIV'},
  
    #new
  {:name => 'CUSTOMER NEW SAVE'},
  
    #listing
  {:name => 'CUSTOMER SHOW'},
  {:name => 'CUSTOMER EDIT'},
  {:name => 'CUSTOMER ACTION KIV'},  #128
  {:name => 'CUSTOMER PRINTABLE'},
  
    #kiv
  {:name => 'CUSTOMER KIV SHOW'},
  {:name => 'CUSTOMER KIV RECOVER'},


#115-126
  {:name => 'PRODUCT CATEGORY MENU'},
  {:name => 'PRODUCT CATEGORY NEW'},
  {:name => 'PRODUCT CATEGORY SHOW'},
  {:name => 'PRODUCT CATEGORY EDIT'},
  {:name => 'PRODUCT CATEGORY KIV'},
  {:name => 'PRODUCT CATEGORY PRINTABLE'},
  {:name => 'PRODUCT ID MENU'},
  {:name => 'PRODUCT ID NEW'},
  {:name => 'PRODUCT ID SHOW'},
  {:name => 'PRODUCT ID EDIT'},
  {:name => 'PRODUCT ID KIV'},
  {:name => 'PRODUCT ID PRINTABLE'}
  
    
#  {:name => 'INCOMING REJECT MENU'},
#  {:name => 'INCOMING REJECT TRANSACTION'},
#  {:name => 'INCOMING REJECT NEW'},
#  {:name => 'INCOMING REJECT SHOW'},
#  {:name => 'INCOMING REJECT EDIT'},
#  {:name => 'INCOMING REJECT DELETE'},
#  {:name => 'INCOMING REJECT PRINTABLE'},
])