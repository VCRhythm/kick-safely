class StaticPagesController < ApplicationController
  def home
    @ksprojs = Kickstarter.by_list(:popular, :page=>1, :pages=>1)
    @projects = Project.all
    @ksprojs.each do |project|
     if !Project.exists?(handle: project.handle)
       doc=Nokogiri::HTML(open("http://www.kickstarter.com/projects/#{project.handle}"))
       cat=doc.css('.category')
       subcat=cat.text
       Project.create(name: project.name, description: project.description, thumbnail_url: project.thumbnail_url, owner:project.owner, pledge_percent: project.pledge_percent, handle: project.handle, category: cat[0]["data-project-parent-category"])
     end 
    end
  end

  def about
  end
end
