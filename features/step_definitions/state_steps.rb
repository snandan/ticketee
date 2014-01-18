Given /^there is a state called "(.*?)"$/ do |name|
  if name == "New"
    background = "#85FF00"
  elsif name == "Open"
    background = "#00CFFD"
  elsif name == "Closed"
    background = "black"
  end
  
  State.create!(:name => name, :background => background, :color => "white")
end
