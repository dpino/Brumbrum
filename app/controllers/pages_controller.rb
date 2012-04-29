class PagesController < ApplicationController
  def about_us
  end

  def terms_and_cons
  end

  def home
      @provinces = Spareyard.select("province as name, count(*) as count").group("province")
  end
end
