module Manufacture

  def set_company(company)
    self.company = company
  end

  def get_company
    self.company
  end

  protected

  attr_accessor :company
end

