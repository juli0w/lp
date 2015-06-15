class Report::Coupon
  class << self
    def by_coupons
      report = []
      
      Coupon.all.each do |coupon|
        hash = { name: coupon.name, id: coupon.id, active?: coupon.active? }
        
        hash[:purchases] = []
        
        discount = 0
        total    = 0
        
        coupon.purchases.each do |purchase|
          hash[:purchases] << { id: purchase.id }
          discount += purchase.discount
          total    += purchase.subtotal
        end
        
        hash[:total_discount] = discount
        hash[:total_value]    = total
        
        report << OpenStruct.new(hash)
      end
      
      report
    end
    
    def by_coupon id
      coupon = Coupon.find(id)
      
      report = { name: coupon.name, id: coupon.id, active?: coupon.active?, inherit: coupon }
      report[:purchases] = []
      
      coupon.purchases.each do |purchase|
        report[:purchases] << purchase
      end
      
      OpenStruct.new(report)
    end
  end
end