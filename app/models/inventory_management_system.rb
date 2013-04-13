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
  
  SO_KIV                                = 287
  SO_KIV_SHOW                           = 285
  SO_KIV_RECOVER                        = 286
  
  SO_ENTRY                              = 185
  
  SO_CUSTOMER_REGISTRATION              = 181
  SO_CUSTOMER_REGISTRATION_ADD          = 182
  SO_PRODUCT_ID_REGISTRATION            = 183
  SO_PRODUCT_ID_REGISTRATION_ADD        = 184
  
#  SO_KIV_ITEM                           = 190
#  SO_KIV_ITEM_SHOW                      = 191
#  SO_KIV_ITEM_RECOVER                   = 192
  
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

  
  SALES_TAX_EXEMPTION_SUPPLIER_VALID                = 63
  SALES_TAX_EXEMPTION_CUSTOMER_VALID                = 225

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
  
#===================================== INVENTORY (START) ===========================================  
  INVENTORY_MENU                          = 77
  
  INVENTORY_TRANSACTION                   = 79
  INVENTORY_NEW                           = 78
  INVENTORY_TRANSACTION_SHOW              = 82
  INVENTORY_TRANSACTION_EDIT              = 83
  INVENTORY_TRANSACTION_KIV               = 84
  INVENTORY_TRANSACTION_PRINTABLE         = 85  
  
  INVENTORY_KIV_VIEW                      = 80
  INVENTORY_TRANSACTION_KIV_SHOW          = 86
  INVENTORY_TRANSACTION_KIV_RECOVER       = 87
  
#  INVENTORY_NEW_ADD                      = 81  // JC decide remove, 5/4/2013

  TRANSFER_NOTES                          = 288
  TRANSFER_NOTES_NEW                      = 289
  TRANSFER_NOTES_SHOW                     = 290
#  TRANSFER_NOTES_EDIT                     = 291 // JC said it is history, history can't edit anymore.
  TRANSFER_NOTES_KIV                      = 292
  TRANSFER_NOTES_PRINTABLE                = 293
  
  TRANSFER_NOTES_KIV_LISTING              = 294
  TRANSFER_NOTES_KIV_SHOW                 = 295
  TRANSFER_NOTES_KIV_RECOVER              = 296
  
  #===================================== INVENTORY (END) ===========================================  

  

  
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
  
  PRICE_CONTROL_CUSTOMER_LISTING                     = 254
  PRICE_CONTROL_CUSTOMER_NEW                         = 251
  PRICE_CONTROL_CUSTOMER_HISTORY                     = 247  # Change SHOW to HISTORY, 3/4/2013

#  PRICE_CONTROL_CUSTOMER_KIV                         = 249
#  PRICE_CONTROL_CUSTOMER_PRINTABLE                   = 250
  
  PRICE_CONTROL_VENDOR_LISTING                       = 279
  PRICE_CONTROL_VENDOR_NEW                           = 280
  PRICE_CONTROL_VENDOR_HISTORY                       = 281  # Change SHOW to HISTORY, 3/4/2013

#  PRICE_CONTROL_VENDOR_KIV                           = 283
#  PRICE_CONTROL_VENDOR_PRINTABLE                     = 284
  
  PRICE_CONTROL_LISTING_KIV                          = 255
  PRICE_CONTROL_SHOW_KIV                             = 256
  PRICE_CONTROL_RECOVER                              = 257
  
  #===== ===== Accounts ===== =====
  
  AC_RECEIVABLE                                     = 297
  
  #===== ===== Credit Note ===== =====
  CREDIT_NOTE_INDEX                                 = 506
  CREDIT_NOTE_ADD                                   = 298
  CREDIT_NOTE_SHOW                                  = 299
  CREDIT_NOTE_EDIT                                  = 501
  CREDIT_NOTE_KIV                                   = 502
  CREDIT_NOTE_PRINTABLE                             = 503
  
  CREDIT_NOTE_KIV_INDEX                             = 515
  CREDIT_NOTE_KIV_SHOW                              = 504
  CREDIT_NOTE_KIV_RECOVER                           = 505
  
  
  #===== ===== Debit Note ===== =====
  DEBIT_NOTE_INDEX                                  = 507
  DEBIT_NOTE_ADD                                    = 508
  DEBIT_NOTE_SHOW                                   = 509
  DEBIT_NOTE_EDIT                                   = 510
  DEBIT_NOTE_KIV                                    = 511
  DEBIT_NOTE_PRINTABLE                              = 512
  
  DEBIT_NOTE_KIV_INDEX                              = 516
  DEBIT_NOTE_KIV_SHOW                               = 513
  DEBIT_NOTE_KIV_RECOVER                            = 514
  
  #===== ===== Receipt ===== =====
  RECEIPT_INDEX                                     = 517
  RECEIPT_ADD                                       = 518
  RECEIPT_SHOW                                      = 519
  RECEIPT_EDIT                                      = 520
  RECEIPT_KIV                                       = 521
  RECEIPT_PRINTABLE                                 = 522
  
  RECEIPT_KIV_INDEX                                 = 523
  RECEIPT_KIV_SHOW                                  = 524
  RECEIPT_KIV_RECOVER                               = 525
  
  #===== ===== Payment Received ===== =====
  PAYMENT_RECEIVED_INDEX                            = 526
  PAYMENT_RECEIVED_ADD                              = 527
  PAYMENT_RECEIVED_SHOW                             = 528
  PAYMENT_RECEIVED_EDIT                             = 529
  PAYMENT_RECEIVED_KIV                              = 530
  PAYMENT_RECEIVED_PRINTABLE                        = 531
  
  PAYMENT_RECEIVED_KIV_INDEX                        = 532
  PAYMENT_RECEIVED_KIV_SHOW                         = 533
  PAYMENT_RECEIVED_KIV_RECOVER                      = 534
  
  PAYMENT_RECEIVED_BY_DEBTOR                        = 535
  PAYMENT_RECEIVED_BY_PERIOD                        = 536
  
  PAYMENT_RECEIVED_BY_DEBTOR_PRINTABLE              = 537
  PAYMENT_RECEIVED_BY_PERIOD_PRINTABLE              = 538
  
  AC_GENERAL                                        = 263
  AC_GENERAL_JV_DEBTOR_INDEX                        = 264
  AC_GENERAL_JV_DEBTOR_ADD                          = 265
  AC_GENERAL_JV_DEBTOR_SHOW                         = 266
  AC_GENERAL_JV_DEBTOR_EDIT                         = 267
  AC_GENERAL_JV_DEBTOR_KIV                          = 252
  AC_GENERAL_JV_DEBTOR_PRINTABLE                    = 253 
  
  AC_GENERAL_JV_DEBTOR_KIV_INDEX                    = 539
  AC_GENERAL_JV_DEBTOR_KIV_SHOW                     = 248
  AC_GENERAL_JV_DEBTOR_KIV_RECOVER                  = 282
  
  AC_GENERAL_JV_CREDITOR_INDEX                      = 115
  AC_GENERAL_JV_CREDITOR_ADD                        = 116
  AC_GENERAL_JV_CREDITOR_SHOW                       = 117
  AC_GENERAL_JV_CREDITOR_EDIT                       = 118
  AC_GENERAL_JV_CREDITOR_KIV                        = 119
  AC_GENERAL_JV_CREDITOR_PRINTABLE                  = 120 
  
  AC_GENERAL_JV_CREDITOR_KIV_INDEX                  = 64
  AC_GENERAL_JV_CREDITOR_KIV_SHOW                   = 226
  AC_GENERAL_JV_CREDITOR_KIV_RECOVER                = 62
  
  AC_GENERAL_JV_INDEX                               = 71
  AC_GENERAL_JV_ADD                                 = 233
  AC_GENERAL_JV_SHOW                                = 72
  AC_GENERAL_JV_EDIT                                = 234
  AC_GENERAL_JV_KIV                                 = 73
  AC_GENERAL_JV_PRINTABLE                           = 235
  
  AC_GENERAL_JV_KIV_INDEX                           = 74
  AC_GENERAL_JV_KIV_SHOW                            = 236
  AC_GENERAL_JV_KIV_RECOVER                         = 540
  
    

    
  #start at 299, jump to 541
  
  


  #====== ====== report ======= =======
  PURCHASE_REQUISITION_REPORT_MENU                  = 300

  #====== SUB MODULE REPORT ===== ======
  PURCHASE_REQUISITION_REPORT                       = 301
  PR_PURCHASE_BY_CREDITORS_REPORT                   = 302
  PR_MONTHLY_PURCHASE_ANALYSIS                      = 303
  PR_PURCHASE_PART_TRANSACTION                      = 304
  PR_PROD_TYPE_PURC_BY_VENDOR                       = 305


  #==== ACTION ======
  PURCHASE_REQUISITION_REPORT_SHOW                  = 306
  PURCHASE_REQUISITION_REPORT_PRINT                 = 307
  PURCHASE_REQUISITION_REPORT_EXCEL                 = 308
  PR_PURCHASE_BY_CREDITORS_REPORT_SHOW              = 309
  PR_PURCHASE_BY_CREDITORS_REPORT_PRINT             = 310
  PR_PURCHASE_BY_CREDITORS_REPORT_EXCEL             = 311
  PR_MONTHLY_PURCHASE_ANALYSIS_SHOW                 = 312
  PR_MONTHLY_PURCHASE_ANALYSIS_PRINT                = 313
  PR_MONTHLY_PURCHASE_ANALYSIS_EXCEL                = 314
  PR_PURCHASE_PART_TRANSACTION_SHOW                 = 315
  PR_PURCHASE_PART_TRANSACTION_PRINT                = 316
  PR_PURCHASE_PART_TRANSACTION_EXCEL                = 317
  PR_PROD_TYPE_PURC_BY_VENDOR_SHOW                  = 318
  PR_PROD_TYPE_PURC_BY_VENDOR_PRINT                 = 319
  PR_PROD_TYPE_PURC_BY_VENDOR_EXCEL                 = 320

  #===== ====== PO REPORT ====== =======
  PURCHASE_ORDER_REPORT_MENU                        = 321

  #===== ====== SUB MODULE REPORT===== ======
  PURCHASE_ORDER_REPORT                             = 322
  PO_PURCHASE_RECEIVED_PARTS_REPORT                 = 323
  PO_PURCHASE_PART_ETA_INQUIRE_REPORT               = 324
  PO_VENDOR_REPORT                                  = 325
  PO_DEPARTMENT_REPORT                              = 326
  PO_OUTSTANDING_VENDOR_REPORT                      = 327
  PO_OUTSTANDING_OVERALL_REPORT                     = 328
  PO_PRICE_HISTORY_REPORT                           = 329
  PO_PRODUCT_INFORMATION_REPORT                     = 330
  PO_DAILY_ETA_INQUIRE_REPORT                       = 331

  #==== ACTION ======                                         #=====IGNOE PO EXCEL
  PURCHASE_ORDER_REPORT_SHOW                        = 332
  PURCHASE_ORDER_REPORT_PRINT                       = 333
  PURCHASE_ORDER_REPORT_EXCEL                       = 334

  PO_PURCHASE_RECEIVED_PARTS_REPORT_SHOW            = 335
  PO_PURCHASE_RECEIVED_PARTS_REPORT_PRINT           = 336
  PO_PURCHASE_RECEIVED_PARTS_REPORT_EXCEL           = 337

  PO_PURCHASE_PART_ETA_INQUIRE_REPORT_SHOW          = 338
  PO_PURCHASE_PART_ETA_INQUIRE_REPORT_PRINT         = 339
  PO_PURCHASE_PART_ETA_INQUIRE_REPORT_EXCEL         = 340

  PO_VENDOR_REPORT_SHOW                             = 341
  PO_VENDOR_REPORT_PRINT                            = 342
  PO_VENDOR_REPORT_EXCEL                            = 343

  PO_DEPARTMENT_REPORT_SHOW                         = 344
  PO_DEPARTMENT_REPORT_PRINT                        = 345
  PO_DEPARTMENT_REPORT_EXCEL                        = 346

  PO_OUTSTANDING_VENDOR_REPORT_SHOW                 = 347
  PO_OUTSTANDING_VENDOR_REPORT_PRINT                = 348
  PO_OUTSTANDING_VENDOR_REPORT_EXCEL                = 349

  PO_OUTSTANDING_OVERALL_REPORT_SHOW                = 350
  PO_OUTSTANDING_OVERALL_REPORT_PRINT               = 351
  PO_OUTSTANDING_OVERALL_REPORT_EXCEL               = 352

  PO_PRICE_HISTORY_REPORT_SHOW                      = 353
  PO_PRICE_HISTORY_REPORT_PRINT                     = 354
  PO_PRICE_HISTORY_REPORT_EXCEL                     = 355

  PO_PRODUCT_INFORMATION_REPORT_SHOW                = 356
  PO_PRODUCT_INFORMATION_REPORT_PRINT               = 357
  PO_PRODUCT_INFORMATION_REPORT_EXCEL               = 358

  PO_DAILY_ETA_INQUIRE_REPORT_SHOW                  = 359
  PO_DAILY_ETA_INQUIRE_REPORT_PRINT                 = 360
  PO_DAILY_ETA_INQUIRE_REPORT_EXCEL                 = 361


# PRINT SHOW EXCEL DO UNTIL HERE 

  #===== ====== CUSTOM REPORT ====== ======
  CUSTOM_SALES_TAX_EXEMPTION_REPORT_MENU            = 362

  #==== ====== SUB MODULE REPORT ====== ========
  CUSTOM_EXEMPTION_SUMMARY_REPORT                   = 363
  CUSTOM_LIST_SALES_TAX_EXEMPTION_REPORT            = 364
  CUSTOM_SALES_CJ5_SUMMARY_CO_REPORT                = 365
  CUSTOM_SALES_CJ5_SUMMARY_PERIOD_REPORT            = 366
  CUSTOM_SALES_CJ5_SUMMARY_CJ5_REPORT               = 367
  CUSTOM_SALES_CJ5_SUMMARY_ITEM_REPORT              = 368
  CUSTOM_PURE_CJ5_SUMMARY_PERIOD_REPORT             = 369
  CUSTOM_PURE_CJ5_SUMMARY_CJ5_REPOT                 = 370

  #===== ACTION =============
  CUSTOM_EXEMPTION_SUMMARY_REPORT_SHOW              = 371
  CUSTOM_EXEMPTION_SUMMARY_REPORT_PRINT             = 372
  CUSTOM_EXEMPTION_SUMMARY_REPORT_EXCEL             = 373

  CUSTOM_LIST_STE_REPORT_SHOW                       = 374
  CUSTOM_LIST_STE_REPORT_PRINT                      = 375
  
  CUSTOM_SALES_CJ5_SUMMARY_CO_REPORT_SHOW           = 376
  CUSTOM_SALES_CJ5_SUMMARY_CO_REPORT_PRINT          = 377
  
  CUSTOM_SALES_CJ5_SUMMARY_PERIOD_REPORT_SHOW       = 378
  CUSTOM_SALES_CJ5_SUMMARY_PERIOD_REPORT_PRINT      = 379

  CUSTOM_SALES_CJ5_SUMMARY_CJ5_REPORT_SHOW          = 380
  CUSTOM_SALES_CJ5_SUMMARY_CJ5_REPORT_PRINT         = 381

  CUSTOM_SALES_CJ5_SUMMARY_ITEM_REPORT_SHOW         = 382
  CUSTOM_SALES_CJ5_SUMMARY_ITEM_REPORT_PRINT        = 383

  CUSTOM_PURE_CJ5_SUMMARY_PERIOD_REPORT_SHOW        = 384
  CUSTOM_PURE_CJ5_SUMMARY_PERIOD_REPORT_PRINT       = 385

  CUSTOM_PURE_CJ5_SUMMARY_CJ5_REPOT_SHOW            = 386
  CUSTOM_PURE_CJ5_SUMMARY_CJ5_REPOT_PRINT           = 387

  #==== ===== INVENTORY REPORT ===== ======
  RECEIVE_NOTE_REPORT_MENU                          = 388

  #==== ==== SUB MODULE REPORT ====== =====
  RECEIVE_NOTE_REPORT                               = 389
  RN_COMPANY_SUMMARY_REPORT_REPORT                  = 390
  RN_PART_SUMMARY_REPORT                            = 391

  #==== ==== ACTION ==== ====
  RECEIVE_NOTE_REPORT_SHOW                          = 392
  RECEIVE_NOTE_REPORT_PRINT                         = 393
  RECEIVE_NOTE_REPORT_EXCEL                         = 394

  RN_COMPANY_SUMMARY_REPORT_REPORT_SHOW             = 395
  RN_COMPANY_SUMMARY_REPORT_REPORT_PRINT            = 396
  RN_PART_SUMMARY_REPORT_SHOW                       = 397
  RN_PART_SUMMARY_REPORT_PRINT                      = 398

  
    #==== ==== DELIVERY ORDER REPORT ==== ====
  DELIVERY_ORDER_REPORT_MENU                        = 399

  #==== ==== SUB MODULE REPORT ==== ====
  DO_INVOICE_DOCUMENTATION_REPORT                   = 400
  DO_SUMMARY_REPORT                                 = 401
  DO_UNKNOW_REPORT                                  = 402  #============ UNKNOW NAME REPORT

  #==== ==== ACTION ==== ====
  DO_SUMMARY_REPORT_SHOW                            = 403
  DO_SUMMARY_REPORT_PRINT                           = 404  
  DO_SUMMARY_REPORT_EXCEL                           = 405

  DO_UNKNOW_REPORT_SHOW                             = 406
  DO_UNKNOW_REPORT_PRINT                            = 407

  DO_INVOICE_DOCUMENTATION_REPORT_SHOW              = 408
  DO_INVOICE_DOCUMENTATION_REPORT_PRINT             = 409
  
  INVOICE_DOCUMENTATION_REPORT_PRINT                = 410
 
  #==== ==== SALES ORDER REPORT ======= ======
  SALES_ORDER_REPORT_MENU                           = 411

  #==== ==== SUB MODULE REPORT ==== ====
  SALES_ORDER_REPORT                                = 453  
  SO_LISTING_REPORT                                 = 412
  SO_SALES_ANALYSIS_REPORT                          = 413
  SO_CUS_SUMMARY_REPORT                             = 414
  SO_CUSTOMER_PO_DETAIL_REPORT                      = 415
  SO_SALES_REPLENISHMENT_REPORT                     = 416

  #==== ==== ACTION ==== ====
  SO_REPORT_SHOW                                    = 454
  SO_REPORT_PRINT                                   = 455 

  SO_LISTING_REPORT_SHOW                            = 417
  SO_LISTING_REPORT_PRINT                           = 418

  SO_SALES_ANALYSIS_REPORT_SHOW                     = 419
  SO_SALES_ANALYSIS_REPORT_PRINT                    = 420

  SO_CUS_SUMMARY_REPORT_SHOW                        = 421
  SO_CUS_SUMMARY_REPORT_PRINT                       = 422

  SO_CUSTOMER_PO_DETAIL_REPORT_SHOW                 = 423
  SO_CUSTOMER_PO_DETAIL_REPORT_PRINT                = 424

  SO_SALES_REPLENISHMENT_REPORT_SHOW                = 425
  SO_SALES_REPLENISHMENT_REPORT_PRINT               = 426

  #==== ==== ACCOUNT REPORT MENU ==== ====
  ACCOUNT_REPORT_MENU                               = 427

  #==== ==== ACCOUNT REPORT ==== ====
  
  ACCOUNT_AC_RECEIVABLE_SALES_JOURNAL_REPORT         = 428
  ACCOUNT_DEBTOR_SALES_JOURNAL_REPORT                = 429
  ACCOUNT_INVOICE_SUMMARY_REPORT                     = 430
  ACCOUNT_CN_DN_OR_PERIOD_REPORT                     = 431

  #==== ==== ACTION ==== ==== 
  ACCOUNT_AC_RECEIVABLE_SALES_JOURNAL_REPORT_SHOW    = 432
  ACCOUNT_AC_RECEIVABLE_SALES_JOURNAL_REPORT_PRINT   = 433

  ACCOUNT_DEBTOR_SALES_JOURNAL_REPORT_SHOW           = 434
  ACCOUNT_DEBTOR_SALES_JOURNAL_REPORT_PRINT          = 435

  ACCOUNT_INVOICE_SUMMARY_REPORT_SHOW                = 436
  ACCOUNT_INVOICE_SUMMARY_REPORT_PRINT               = 437

  ACCOUNT_CN_DN_OR_PERIOD_REPORT_SHOW                = 438
  ACCOUNT_CN_DN_OR_PERIOD_REPORT_PRINT               = 439
  

  #==== ==== LISTING REPORT ==== ====
  LISTING_REPORT_MENU                               = 440

  #==== ==== SUB MODULE REPORT ==== ====
  LISTING_PRODUCT_ID_REPORT                         = 441
  LISTING_COMPANY_REPORT                            = 442
  LISTING_CATEGORY_SUB_CATEGORY_REPORT              = 443
  LISTING_PRICE_REPORT                              = 456 
  LISTING_PRODUCT_CUSTOMER_REPORT                   = 444

  #==== ==== ACTION ==== ====
  LISTING_PRODUCT_ID_REPORT_SHOW                    = 445
  LISTING_PRODUCT_ID_REPORT_PRINT                   = 446

  LISTING_COMPANY_REPORT_SHOW                       = 447
  LISTING_COMPANY_REPORT_PRINT                      = 448

  LISTING_CATEGORY_SUB_CATEGORY_REPORT_SHOW         = 449
  LISTING_CATEGORY_SUB_CATEGORY_REPORT_PRINT        = 450

  LISTING_PRICE_REPORT_SHOW                         = 457
  LISTING_PRICE_REPORT_PRINT                        = 458 

  LISTING_PRODUCT_CUSTOMER_REPORT_SHOW              = 451
  LISTING_PRODUCT_CUSTOMER_REPORT_PRINT             = 452

#===== INVENTORY REPORT ==== ====
  INVENTORY_REPORT_MENU                             = 459

#==== ==== SUB MODULE REPORT ==== ====
  INVENTORY_REPORT                                  = 460

#==== ==== ACTION ==== ====
  INVENTORY_REPORT_SHOW                             = 461
  INVENTORY_REPORT_PRINT                            = 462
  INVENTORY_REPORT_EXCEL                            = 463  # UNTIL THIS NUMBER ***************
  #kai kean use 300-500
end
