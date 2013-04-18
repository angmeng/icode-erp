class DeliveryOrderItemsController < ApplicationController
  before_filter :authenticate_user!
end