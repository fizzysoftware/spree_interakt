Spree::Order.class_eval do

  register_update_hook :notify_interakt

  def notify_interakt
    SpreeInterakt::Import.handle_new_order_event(self) if completed?
  end

end