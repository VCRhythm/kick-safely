class StaticPagesController < ApplicationController
  def home
	  @ksprojs = Kickstarter.by_list(:popular, :page=>1, :pages=>1)
  end

  def about
  end
end
