class NokogiriController < ApplicationController
  def index
    require 'json'
    require 'open-uri'
    require 'nokogiri'
    no =1
    @name = []
    @address=[]
    @phone =[]
   
    while true
      url = "http://www.justdial.com/functions/ajxsearch.php?national_search=0&act=pagination&city=Delhi+%2F+NCR&search=Pandits&where=Delhi+Cantt&catid=1195&psearch=&prid=&page=#{no}"
      json = JSON.parse(open(url).read) # make sure you check http errors here
      html = json['markup'] # can this field be empty? check for the json['error'] field
      doc = Nokogiri::HTML(html) # parse as you like
      c=  doc.css('span.jcn').collect {|node| node.text.strip}
      d=  doc.css('.jaid').collect {|node| node.text.strip}
      e=  doc.css('.jrcw').collect {|node| node.text.strip}
     break if no==10
      no+=1
      puts "==========#{@name}"
      c.each do |temp|
       @name << temp 
      end
      
      d.each do |temp|
       @address << temp 
      end
      
      e.each do |temp|
       @phone << temp 
       
      end
#       
      # @name << c
      # @address[no] << d
      # @phone[no] << e

    end
   
   respond_to do |format|
    format.html
    format.csv { send_data @name.to_csv(col_sep: "\t") }
     format.csv { send_data @address.to_csv(col_sep: "\t") }
    format.csv { send_data @phone.to_csv(col_sep: "\t") }
    format.xls

    end
   
# Define the css selectors to be used for extractions, most
end
 
end

