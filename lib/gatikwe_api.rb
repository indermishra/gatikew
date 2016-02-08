require "gatikwe_api/version"
require "builder"
require "httparty"

module GatikweApi
  class Gati
    def self.create_gati_config(cust_ship_details, gati_credentials)
      xm = Builder::XmlMarkup.new;false
      xm.gati{
        xm.pickuprequest(cust_ship_details["pickuprequest"])
        xm.custcode(gati_credentials["custcode"])
        xm.details{
          xm.req{
            xm.DOCKET_NO(cust_ship_details["docket_no"])
            xm.DELIVERY_STN(cust_ship_details["delivery_stn"])
            xm.GOODS_CODE(cust_ship_details["goods_code"])
            xm.DECL_CARGO_VAL(cust_ship_details["decl_cargo_val"])
            xm.ACTUAL_WT(cust_ship_details["actual_wt"])
            xm.CHARGED_WT(cust_ship_details["charged_wt"])
            xm.SHIPPER_CODE(gati_credentials["custcode"])
            xm.ORDER_NO(cust_ship_details["order_number"])
            xm.COD_AMT(cust_ship_details["cod_amt"])
            xm.COD_IN_FAVOUR_OF(cust_ship_details["cod_in_favour_of"])
            xm.RECEIVER_CODE(cust_ship_details["recevier_code"])
            xm.RECEIVER_NAME(cust_ship_details["recevier_name"])
            xm.RECEIVER_ADD1(cust_ship_details["recevier_add1"])
            xm.RECEIVER_ADD2(cust_ship_details["recevier_add2"])
            xm.RECEIVER_ADD3(cust_ship_details["recevier_add3"])
            xm.RECEIVER_CITY(cust_ship_details["recevier_city"])
            xm.RECEIVER_PHONE_NO(cust_ship_details["receiver_phone"])
            xm.RECEIVER_EMAIL(cust_ship_details["receiver_email"])
            xm.RECEIVER_PINCODE(cust_ship_details["receiver_pincode"])
            xm.NO_OF_PKGS(cust_ship_details["number_of_pkgs"])
            xm.RECEIVER_MOBILE_NO(cust_ship_details["receiver_mob"])
            xm.Cust_Date_Delivery(cust_ship_details["receiver_del_date"])
            xm.SPL_Instruction(cust_ship_details["special_instruction"])
            xm.CUST_VEND_CODE(cust_ship_details["vendor_code"])
            xm.PROD_SERV_CODE(cust_ship_details["prod_ser_code"])
          }
        }
      }
      options = {:body => xm.target!, :headers => {'Content-Type' => 'application/xml'}}
      response_data = HTTParty.post(gati_credentials["url"], options)
    end

    def self.track_gati_shipments(url, awb_number, tracking_code)
      response_data = "#{url}#{awb_number}&p2=#{tracking_code}"
    end
  end
end
