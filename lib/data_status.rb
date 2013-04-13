class DataStatus
  #PR - 1
  #PO - 2
  #RN - 3
  #QR - 4
  #SO - 5
  #DO - 6
  
  ACTIVE        = 1
  KEEP_IN_VIEW  = 2
  
  # It is PRI Status
  PENDING           = 3
  IN_PROCESSING     = 4
  APPROVED          = 5
  REJECT            = 6
  PURCHASE_ORDER    = 7   # Pending PO
  RECEIVE_NOTE      = 8  # PO issued
  RECEIVED_PARTIAL  = 9
  RECEIVED_FULL     = 10
  
  # It is PR Status
  LEVEL_ONE     = 11   # Staff
  LEVEL_TWO     = 12   # Supervisor
  LEVEL_THREE   = 13   # General Manager
  LEVEL_FIVE    = 15   # Director
  SUBMIT_PO     = 16
  SUBMIT_RN     = 17
  COMPLETED     = 18
  
#  INCOMING_REJECT = 12
#  CANCEL          = 13

  
  #Delivery Order Status and Delivery Order Items Status
  DOI_PENDING    = 601
  DOI_PROCESSING = 602
  DOI_COMPLETED  = 603
  
end