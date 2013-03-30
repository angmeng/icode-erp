class InventoryManagementSystem < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, :uniqueness => true
  
  has_many :roles, :dependent => :destroy
  has_many :users, :through => :roles
  
  #MODULE
  PR_MENU                                     = 1  #ok

  #SUB MODULE
  PR_NEW                                      = 2  #ok
  PR_SIGNATURE                                = 131
  PR_TRANSACTION                              = 3  #ok
  PR_KIV_VIEW                                 = 4  #ok
  PR_ITEMS_KIV_VIEW                           = 5  #ok
  
  #PR NEW
  PR_NEW_ADD_ITEMS                            = 6  #ok
  PR_NEW_SHOW                                 = 7  #ok
  PR_NEW_EDIT                                 = 8  #ok
  PR_NEW_KIV                                  = 9  #ok
  PR_NEW_PRINTABLE                            = 10  #ok
  
  #PR SIGNATURE
  PR_SIGNATURE_SHOW                           = 132
  PR_SIGNATURE_EDIT                           = 133
  PR_SIGNATURE_PRINTABLE                      = 134
  
  #PR TRANSACTION
  PR_TRANSACTION_SHOW                         = 11  #ok
  PR_TRANSACTION_EDIT                         = 12  #ok
  PR_TRANSACTION_KIV                          = 13  #ok
  PR_TRANSACTION_PRINTABLE                    = 14  #ok
  
  PR_DETAILS_SHOW                             = 136
  PR_DETAILS_EDIT                             = 137
  PR_DETAILS_PRINTABLE                        = 138
  
  #PR KIV VIEW
  PR_KIV_SHOW                                 = 15
  PR_KIV_RECOVER                              = 16
  
  #PR ITEMS KIV VIEW
  PR_ITEMS_KIV_SHOW                           = 17
  PR_ITEMS_KIV_RECOVER                        = 18
  
#  =============================================================================
  
  #MODULE
  PURCHASE_ORDER_MENU                          = 19 #ok
  
  #SUB MODULE
  PURCHASE_ORDER_APPROVED_FROM_PR              = 20 #ok
  PURCHASE_ORDER_PR_REPAIR                     = 21 #ok
  PURCHASE_ORDER_PROPOSED_VENDOR               = 22 #ok
  PURCHASE_ORDER_VENDOR_SELECTION              = 23 #ok
  PURCHASE_ORDER_VENDOR_REGISTRATION           = 24 #ok
  PURCHASE_ORDER_PRODUCT_ID_REGISTRATION       = 271
  PURCHASE_ORDER_ENTRY                         = 25 #ok
  PURCHASE_ORDER_TRANSACTION                   = 26 #ok
  PURCHASE_ORDER_KIV_VIEW                      = 27
  
  #approved from pr
  PURCHASE_ORDER_APPROVED_FROM_PR_SHOW         = 129 #ok
  
  #PR-repair
  PURCHASE_ORDER_PR_REPAIR_APPLY               = 28 #ok
  PURCHASE_ORDER_PR_REPAIR_SUBMIT_TO           = 29 #ok
  PURCHASE_ORDER_PR_REPAIR_KIV                 = 30
  
  #proposed vendor
  PURCHASE_ORDER_PROPOSED_VENDOR_APPLY         = 31 #ok
  PURCHASE_ORDER_PROPOSED_VENDOR_SUBMIT_TO     = 32 #ok
  PURCHASE_ORDER_PROPOSED_VENDOR_KIV           = 33
  
  #vendor selection
  PURCHASE_ORDER_VENDOR_SELECTION_APPLY        = 34 #ok
#  PURCHASE_ORDER_VENDOR_SELECTION_SUBMIT_TO    = 35
  PURCHASE_ORDER_VENDOR_SELECTION_KIV          = 36
  
  #vendor registration
  PURCHASE_ORDER_VENDOR_REGISTRATION_APPLY     = 37 #ok
  #PURCHASE_ORDER_VENDOR_REGISTRATION_SUBMIT_TO = 38 
  PURCHASE_ORDER_VENDOR_REGISTRATION_KIV       = 39
  
  PURCHASE_ORDER_PRODUCT_ID_REGISTRATION_APPLY = 272
  
  #po entry
  PURCHASE_ORDER_ENTRY_APPLY                   = 40 #ok
#  PURCHASE_ORDER_ENTRY_SUBMIT_TO               = 41
  PURCHASE_ORDER_ENTRY_KIV                     = 42
  
  #transaction
  PURCHASE_ORDER_TRANSACTION_SHOW              = 43
  PURCHASE_ORDER_TRANSACTION_EDIT              = 44
  PURCHASE_ORDER_TRANSACTION_KIV               = 45
  PURCHASE_ORDER_TRANSACTION_PRINTABLE         = 46
  
  PO_KIV_SHOW                                  = 47
  PO_KIV_RECOVER                               = 48
  
  #module
  RECEIVE_NOTE_MENU                     = 49
  
  #sub module
  RECEIVE_NOTE_NEW                      = 50
  RECEIVE_NOTE_TRANSACTION              = 51
  RECEIVE_NOTE_COMPLETED_VIEW           = 52
  RECEIVE_NOTE_KIV_VIEW                 = 53
  
  #action new
  RECEIVE_NOTE_NEW_ADD                  = 54
  RECEIVE_NOTE_SAVE                     = 262
  
  #action transaction
  RECEIVE_NOTE_TRANSACTION_SHOW         = 55
  RECEIVE_NOTE_TRANSACTION_EDIT         = 56
  RECEIVE_NOTE_TRANSACTION_KIV          = 57
  RECEIVE_NOTE_TRANSACTION_PRINTABLE    = 58
  
  #action completed view
  RECEIVE_NOTE_COMPLETED_VIEW_SHOW      = 130
  
  #action kiv
  RN_KIV_SHOW                           = 59
  RN_KIV_RECOVER                        = 60
  
  
#===================================== Quotation =====================================================
  QR_MENU                               = 153
  QR_NEW_N_PENDING                      = 156
  QR_APPROVED_REJECT                    = 158
  QR_TRANSACTION                        = 159
  QR_KIV                                = 160
  QR_CUSTOMER_FEEDBACK                  = 174
  
  QR_NEW_ADD                            = 161
  QR_NEW_SHOW                           = 162
  QR_NEW_EDIT                           = 163
  QR_NEW_KIV_ITEM                       = 164
  QR_NEW_PRINTABLE                      = 165
  
  QR_SIGNATURE_COSTING                  = 198
  QR_SIGNATURE_COSTING_ADD              = 199
  QR_SIGNATURE_COSTING_SHOW             = 200
  QR_SIGNATURE_COSTING_EDIT             = 201
  QR_SIGNATURE_COSTING_KIV              = 202
  QR_SIGNATURE_COSTING_PRINTABLE        = 203
  
  QR_SIGNATURE_COSTING_KIV_MENU         = 206
  QR_SIGNATURE_COSTING_KIV_SHOW         = 204
  QR_SIGNATURE_COSTING_KIV_RECOVER      = 205
  
  QR_SIGNATURE_SHOW                     = 166
  QR_SIGNATURE_EDIT                     = 167
  QR_SIGNATURE_PRINTABLE                = 168
  
  QR_TRANSACTION_SHOW                   = 169
  QR_TRANSACTION_EDIT                   = 170
  QR_TRANSACTION_KIV                    = 171
  QR_TRANSACTION_PRINTABLE              = 172   
  QR_TRANSACTION_MAIL                   = 173
  
  QR_FEEDBACK_COSTING                   = 211
  QR_FEEDBACK_SHOW                      = 175
  QR_FEEDBACK_EDIT                      = 176
  QR_FEEDBACK_KIV                       = 177
  QR_FEEDBACK_PRINTABLE                 = 178
  
  QR_KIV_SHOW                           = 179
  QR_KIV_RECOVER                        = 180
 
#===================================== SALES ORDER (START) =====================================================
  SO_MENU                               = 154
  
  SO_TRANSACTION                        = 193
  SO_TRANSACTION_SHOW                   = 194
  SO_TRANSACTION_EDIT                   = 195
  SO_TRANSACTION_KIV                    = 196
  SO_TRANSACTION_PRINTABLE              = 197
  
  SO_ENTRY                              = 185
  
  SO_CUSTOMER_REGISTRATION              = 181
  SO_CUSTOMER_REGISTRATION_ADD          = 182
  SO_PRODUCT_ID_REGISTRATION            = 183
  SO_PRODUCT_ID_REGISTRATION_ADD        = 184
  
  SO_KIV_ITEM                           = 190
  SO_KIV_ITEM_SHOW                      = 191
  SO_KIV_ITEM_RECOVER                   = 192
  
  DO_MENU                               = 155
  DO_TRANSACTION                        = 273
  DO_ENTRY                              = 274
  DO_TRANSACTION_SHOW                   = 275
  DO_TRANSACTION_EDIT                   = 276
  DO_TRANSACTION_KIV                    = 277
  DO_TRANSACTION_PRINTABLE              = 278
  
  
#===================================== SALES ORDER (END) =====================================================
  
#===================================== SALES TAX EXEMPTION (START) ===========================================
  #MODULE
  SALES_TAX_EXEMPTION_MENU                          = 61

  #sub module 
#  SALES_TAX_EXEMPTION_NEW                           = 62
  
  SALES_TAX_EXEMPTION_SUPPLIER_VALID                = 63
  SALES_TAX_EXEMPTION_CUSTOMER_VALID                = 225
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID              = 64
#  SALES_TAX_EXEMPTION_CUSTOMER_UNVALID              = 226
  SALES_TAX_EXEMPTION_KIV_SUPPLIER                  = 65
  SALES_TAX_EXEMPTION_KIV_CUSTOMER                  = 227
  
  #action new
  SALES_TAX_EXEMPTION_NEW_SUPPLIER                  = 66
  SALES_TAX_EXEMPTION_NEW_CUSTOMER                  = 224
  
  #transaction valid
  SALES_TAX_EXEMPTION_SUPPLIER_VALID_SHOW        = 67
  SALES_TAX_EXEMPTION_CUSTOMER_VALID_SHOW        = 228
  SALES_TAX_EXEMPTION_SUPPLIER_VALID_EDIT        = 68
  SALES_TAX_EXEMPTION_CUSTOMER_VALID_EDIT        = 229
  SALES_TAX_EXEMPTION_SUPPLIER_VALID_KIV         = 69
  SALES_TAX_EXEMPTION_CUSTOMER_VALID_KIV         = 230
  SALES_TAX_EXEMPTION_SUPPLIER_VALID_PRINTABLE   = 70
  SALES_TAX_EXEMPTION_CUSTOMER_VALID_PRINTABLE   = 231
  
  SALES_TAX_EXEMPTION_SUPPLIER_SHOW_HISTORIES   = 135
  SALES_TAX_EXEMPTION_CUSTOMER_SHOW_HISTORIES   = 232
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID_SHOW_HISTORIES = 152
  
  #transaction unvalid
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID_SHOW      = 71
#  SALES_TAX_EXEMPTION_CUSTOMER_UNVALID_SHOW      = 233
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID_EDIT      = 72
#  SALES_TAX_EXEMPTION_CUSTOMER_UNVALID_EDIT      = 234
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID_KIV       = 73
#  SALES_TAX_EXEMPTION_CUSTOMER_UNVALID_KIV       = 235
#  SALES_TAX_EXEMPTION_SUPPLIER_UNVALID_PRINTABLE = 74
#  SALES_TAX_EXEMPTION_CUSTOMER_UNVALID_PRINTABLE = 236
  
  #kiv
  STE_KIV_SUPPLIER_SHOW                                = 75
  STE_KIV_CUSTOMER_SHOW                                = 237
  STE_KIV_SUPPLIER_RECOVER                             = 76
  STE_KIV_CUSTOMER_RECOVER                             = 238
  
#===================================== SALES TAX EXEMPTION (END) ===========================================

#===================================== FORMULATION FOR ALL (START) ===========================================  
  FORMULATION_FOR_ALL_MODULE      = 239
#  FORMULATION_FOR_ALL_SUB_MODULE  = 240
  FORMULATION_FOR_ALL_INDEX       = 241
  FORMULATION_FOR_ALL_NEW         = 242
  FORMULATION_FOR_ALL_EDIT        = 243
  FORMULATION_FOR_ALL_SHOW        = 244
  FORMULATION_FOR_ALL_DROP_KIV    = 245
  FORMULATION_FOR_ALL_PRINTABLE   = 246
#===================================== FORMULATION FOR ALL (END) ===========================================  

#===================================== COSTING SHEET (START) ===========================================  
  FORMULATION_FOR_COSTING_MENU                = 208
  FORMULATION_FOR_COSTING                     = 209
  FORMULATION_FOR_COSTING_SHOW                = 210
#===================================== COSTING SHEET (END) ===========================================  
  
  INVENTORY_MENU                          = 77
  
  INVENTORY_NEW                           = 78
  INVENTORY_TRANSACTION                   = 79
  INVENTORY_KIV_VIEW                      = 80
  
  INVENTORY_NEW_ADD                      = 81
  
  INVENTORY_TRANSACTION_SHOW              = 82
  INVENTORY_TRANSACTION_EDIT              = 83
  INVENTORY_TRANSACTION_KIV               = 84
  INVENTORY_TRANSACTION_PRINTABLE         = 85  
  
  INVENTORY_TRANSACTION_KIV_SHOW          = 86
  INVENTORY_TRANSACTION_KIV_RECOVER       = 87
  
  COMPANY_PROFILE_MENU                    = 88
  
  COMPANY_PROFILE_VIEW                    = 89
  
  COMPANY_PROFILE_SHOW                    = 90
  COMPANY_PROFILE_EDIT                    = 91
  COMPANY_PROFILE_KIV                     = 92
  COMPANY_PROFILE_PRINTABLE               = 93
  
  TRADE_COMPANY_MENU                      = 94
  
#  VENDOR_MENU                             = 95
#  CUSTOMER_MENU                           = 96
  
  
  VENDOR_LISTING                          = 98
  VENDOR_KIV                              = 99
  
  VENDOR_NEW                              = 97
  
#  VENDOR_NEW_ADD                          = 100  # JC confirm this would be remove in the future.. (20/3/2013)
  
  VENDOR_SHOW                             = 101
  VENDOR_EDIT                             = 102
  VENDOR_ACTION_KIV                       = 127
  VENDOR_PRINTABLE                        = 103
  
  VENDOR_KIV_SHOW                         = 104
  VENDOR_KIV_RECOVER                      = 105
  
  
  CUSTOMER_LISTING                        = 107
  CUSTOMER_KIV                            = 108
  
  CUSTOMER_NEW                            = 106
  
#  CUSTOMER_NEW_ADD                        = 109  # JC confirm this would be remove in the future.. (20/3/2013)
  
  CUSTOMER_SHOW                           = 110
  CUSTOMER_EDIT                           = 111
  CUSTOMER_ACTION_KIV                     = 128                     
  CUSTOMER_PRINTABLE                      = 112
  
  CUSTOMER_KIV_SHOW                       = 113
  CUSTOMER_KIV_RECOVER                    = 114
  
#  PRODUCT_CATEGORY_MENU                   = 115
#  PRODUCT_CATEGORY_NEW                    = 116
#  PRODUCT_CATEGORY_SHOW                   = 117
#  PRODUCT_CATEGORY_EDIT                   = 118
#  PRODUCT_CATEGORY_KIV                    = 119
#  PRODUCT_CATEGORY_PRINTABLE              = 120
  
  
  
  
  PRODUCT_MENU                                       = 121
  
  PRODUCT_NON_OPERATION                              = 139
  KIV_PRODUCT_NON_OPERATION                          = 212 
  PRODUCT_OPERATION                                  = 140
  KIV_PRODUCT_OPERATION                              = 213
  PRODUCT_FINISH_GOOD                                = 141
  KIV_PRODUCT_FINISH_GOOD                            = 214
  
  PRODUCT_NON_OPERATION_GROUP                        = 122
  PRODUCT_NON_OPERATION_GROUP_EDIT                   = 123 #add
  PRODUCT_NON_OPERATION_SUB_GROUP                    = 124
  PRODUCT_NON_OPERATION_SUB_GROUP_EDIT               = 125
  PRODUCT_NON_OPERATION_FILE                         = 126
  PRODUCT_NON_OPERATION_FILE_EDIT                    = 215
  PRODUCT_NON_OPERATION_DELETE                       = 259
  PRODUCT_NON_OPERATION_KIV                          = 216
  PRODUCT_NON_OPERATION_RECOVER                      = 217
  PRODUCT_NON_OPERATION_COMMON                       = 268
  
  PRODUCT_OPERATION_GROUP                            = 142
  PRODUCT_OPERATION_GROUP_EDIT                       = 143 #add
  PRODUCT_OPERATION_SUB_GROUP                        = 144
  PRODUCT_OPERATION_SUB_GROUP_EDIT                   = 145
  PRODUCT_OPERATION_FILE                             = 146
  PRODUCT_OPERATION_FILE_EDIT                        = 218
  PRODUCT_OPERATION_DELETE                           = 260
  PRODUCT_OPERATION_KIV                              = 219
  PRODUCT_OPERATION_RECOVER                          = 220
  PRODUCT_OPERATION_COMMON                           = 269
  
  PRODUCT_FINISH_GOOD_GROUP                          = 147
  PRODUCT_FINISH_GOOD_GROUP_EDIT                     = 148 #add
  PRODUCT_FINISH_GOOD_SUB_GROUP                      = 149
  PRODUCT_FINISH_GOOD_SUB_GROUP_EDIT                 = 150
  PRODUCT_FINISH_GOOD_FILE                           = 151
  PRODUCT_FINISH_GOOD_FILE_EDIT                      = 221
  PRODUCT_FINISH_GOOD_DELETE                         = 261
  PRODUCT_FINISH_GOOD_KIV                            = 222
  PRODUCT_FINISH_GOOD_RECOVER                        = 223
  PRODUCT_FINISH_GOOD_COMMON                         = 270
  
  
 ########## Price Control ########## 
  PRICE_CONTROL_MENU                                 = 258
  
#  PRICE_CONTROL_ADD                                  = 252
#  PRICE_CONTROL_SAVE                                 = 253
  
  PRICE_CONTROL_LISTING                              = 254
  PRICE_CONTROL_NEW                                  = 251
  PRICE_CONTROL_SHOW                                 = 247
  PRICE_CONTROL_EDIT                                 = 248
  PRICE_CONTROL_KIV                                  = 249
  PRICE_CONTROL_PRINTABLE                            = 250
  
  PRICE_CONTROL_LISTING_KIV                          = 255
  PRICE_CONTROL_SHOW_KIV                             = 256
  PRICE_CONTROL_RECOVER                              = 257
  
  #===== ===== Accounts ===== =====
  
  ACCOUNT_RECEIPT_ENTRY                             = 263
  ACCOUNT_RECEIPT_SHOW                              = 264
  ACCOUNT_RECEIPT_EDIT                              = 265
  ACCOUNT_RECEIPT_KIV                               = 266
  ACCOUNT_RECEIPT_PRINTABLE                         = 267
  
  
 
  #start at 279

  #====== ====== report ===== =====
  PURCHASE_REQUISITION_REPORT                       = 300

  PURCHASE_ORDER_REPORT                             = 301

  PRODUCT_REPORT                                    = 302
  
  INVENTORY_REPORT                                  = 303

  RECEIVE_NOTE_REPORT                               = 304

  DELIVERY_ORDER_REPORT                             = 305

  SALES_ORDER_REPORT                                = 306

  ACCOUNT_REPORT                                    = 307

  SALES_TAX_EXEMPTION_REPORT                        = 308

  LISTING_REPORT                                    = 309


  #kai kean use 300-500
end
