class ReceiptItemsController < ApplicationController
  before_filter :authenticate_user!
end