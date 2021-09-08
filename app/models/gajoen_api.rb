class GajoenApi
    def self.get_tickets(brand_id, item_id)
        request_code = SecureRandom.urlsafe_base64(30)
        params = {
            :brand_id => brand_id,
            :item_id => item_id,
            :request_code => request_code
        }

        uri = URI.parse("https://channel-api.stg.e-gift.giftee-saas.co/brands/" + brand_id.to_s + "/tickets")
        req = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
        req['Authorization'] = ENV['GAJOEN_AUTHORIZATION']
        req['X-Giftee'] = 1
        req['Content-Type'] = "application/json"
        req.set_form_data(params)
    
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        https.verify_mode = OpenSSL::SSL::VERIFY_NONE
        res = https.request(req)
    
        result = JSON.parse(res.body)
        result['request_code'] = request_code
        result
    end
end
