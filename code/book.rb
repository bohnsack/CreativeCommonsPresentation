require 'cc_licensed.rb'

class Book
  include CCLicensed
  attr_accessor :title, :author
  def initialize(title, author)
    @title  = title
    @author = author
  end
end
