Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
  :name => 'add_interakt_code_to_spree',
  :insert_after => "div#wrapper",
  :text => "<%= render :partial => 'spree/interakt_code/interakt_code' %>")
