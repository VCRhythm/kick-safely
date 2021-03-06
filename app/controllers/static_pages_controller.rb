class StaticPagesController < ApplicationController
  def home
    @projects=[]
    localproject=nil
    @ksprojs = Kickstarter.by_list(:popular, page: 1, pages: 1)
    @recprojs = Kickstarter.by_list(:recommended, page: 1, pages: 1)
    @ksprojs.each do |project|
		hasvid=false
     if !localproject=Project.where(handle: project.handle).first
       doc=Nokogiri::HTML(open("http://www.kickstarter.com/projects/#{project.handle}"))
       cat=doc.css('.category')
       subcat=cat.text
	   video=doc.css('#video-section')
	   if video[0]["data-has-video"]=="true"
		   hasvid=true
	   end
       localproject=Project.create(name: project.name, description: project.description, thumbnail_url: project.thumbnail_url, owner:project.owner, pledge_percent: project.pledge_percent, handle: project.handle, category: cat[0]["data-project-parent-category"], video:hasvid)
	 else
	   if !localproject.video 
		   doc=Nokogiri::HTML(open("http://www.kickstarter.com/projects/#{project.handle}"))
		   video=doc.css('#video-section')
		   if video[0]["data-has-video"]=="true"
	           hasvid=true
			   localproject.video=true
			   localproject.save
	       end   
	   end
	 end 
     localproject.score=0
     Factor.all.each do |factor|
       case factor.name
	   when "budget"
		   if project.pledge_percent<Kicksafely::BUDGET_CONCERN
			   localproject.score+=factor.effect
		   end
	   when "video"
		   if localproject.video
			   localproject.score+=factor.effect
		   end 
	   when "featured"
		   if @recprojs.select{|x| x.handle==project.handle}
			   localproject.featured=true
			   localproject.score+=factor.effect
		   end
	   end
     end
     localproject.save
     @projects << localproject
    end
	@projects.sort! {|a,b| b.score <=> a.score }
	# @projects=@projects[0..9]
  end
  
  def bp
  end

  def about
  end
end
