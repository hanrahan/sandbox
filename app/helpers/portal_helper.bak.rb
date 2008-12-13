module PortalHelper
  def portal(&block)
     portal = Portal.new

     yield portal

     concat('size:'+portal.columns.size.to_s,block.binding)
  end

  class Portal
    def initialize
      @columns = Array.new
    end

    def column(&block)
     column = Column.new
     @columns << column
     yield column
    end

    def columns
      @columns
    end
  end

  class Column

    def portlet
      'hello'
    end
    
  end

end
