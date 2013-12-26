module NavigationHelpers
 def path_to(page_name)
   case page_name
   when /homepage/
    root_path
   when /the project page for "([^\"]*)"/
     project_path(Project.find_by_name!($1))
   else
    begin
     page_name =~ /the (.*) page/
     path_components = $1.split(/\s+/)
     self.send(path_components.push('path').join('_').to_sym)
    rescue Object => e
     raise "can't find mapping from \"#{page_name}\" to a path. \n" + "Now, go and add a mapping in #{__FILE__}" 
    end
   end
 end
end


World(NavigationHelpers)
