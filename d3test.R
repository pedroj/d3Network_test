# A test of Christopher Gandrud code for d3Network.
# Pedro Jordano. Sevilla. 8-11 Sept 2014l.
devtools::install_github("d3Network", "christophergandrud", ref = "sankey")

# Load energy projection data
library(RCurl)
# Path to the json data file.
# I converted the initial weighted adjacency matrix for HR to a json 
# data file. First I vectorized the matrix; then I re-labelled the 
# node names and links to match a json input file format.
# This needs to be imporved by implementing a function to auto re-code
# the input matrix.
URL<- "file:///Users/pedro/Documents/Working/~RCode/MyRCode/networks/d3Network/hr.json"

hr<- getURL(URL, ssl.verifypeer = FALSE)
hrLinks <- JSONtoDF(jsonStr = hr, array = "links")
hrNodes <- JSONtoDF(jsonStr = hr, array = "nodes")
# Plot
# Open the TestHR.html in the browser.
d3Sankey(Links = hrLinks, Nodes = hrNodes, Source = "source",
         Target = "target", Value = "value", NodeID = "name"
         , fontsize = 12, nodeWidth = 30, file = "TestHR.html")

