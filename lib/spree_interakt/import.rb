require "spree_interakt/user_validator"

module SpreeInterakt
  class Import
    include UserValidator

    attr_reader   :uri, :http, :max_batch_size
    attr_accessor :members_sent, :response_verified

    def self.start
      new.start
    end

    def self.uri
      host = (Rails.env.production? ? "https://interakt.co" : "http://localhost:4000")
      URI.parse(host + "/api/v1/members/import_data")
    end

    def initialize
      @uri            = Import.uri
      @http           = Net::HTTP.new(@uri.host, @uri.port)
      @max_batch_size = 100
      @members_sent   = 0
    end

    def start
      check_basic_validation
      start_sending_in_batches
    end

    def start_sending_in_batches
      puts "Ready to go..."
      Spree::Order.find_in_batches batch_size: max_batch_size do |orders|
        members_json  = create_member_json_from_order(orders)
        send_members( members_json)

        @members_sent += members_json.length
        puts "#{members_sent} users sent."
      end
    end

    def send_members( members)
      http.use_ssl = true if uri.scheme == 'https'
      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(SpreeInterakt.config.app_id, SpreeInterakt.config.api_key)
      request["Content-Type"] = "application/json"
      request.body = {members: members}.to_json

      response = http.request(request)
      verify_reponse( response) unless response_verified
    end

    def json_collection_of_members( members)
      members.map do |member|
        member_hash = {}
        availabe_model_attributes.each do |attribute|
          member_hash[attribute] = member.send( attribute)
        end
        member_hash.merge( custom_data_attributes_for_member(member))
      end.compact
    end

    def create_member_json_from_order(orders)
      orders.map do |order|
        member_hash = {}
        member_hash['email'] = order.email
        address = Spree::Address.find(order.bill_address_id) rescue nil
        member_hash.merge!(address.attributes.except('id')) if address.present?
        member_hash.merge!('orders' => create_importable_order(order))
        # puts "Member generated is : #{member_hash.to_json}"
      end.compact
    end

    def create_importable_order(order)
      new_order = order.attributes.except('email', 'id')
      new_order['unique_id'] = order.attributes.delete('id')
      new_order
    end

  end
end
