###################################################################
# Using UpSetR to make Intersection Plots
#Trotta et al., American Jounral of Botany 2018
####################################################################

biogeo_full <- read.csv("Data/540_taxa_areas.csv", header = T, row = 2)
head(biogeo_full)
dim(biogeo_full)

data <- biogeo_full[c(2, 10:18)]
head(data)
colnames(data) <- c("Native","N America", "Caribbean", "C America", "S America", 
                    "Europe", "Africa", "Asia", "Australasia", "Oceania")
head(data)
rownames(data)


reg_col <- c("navajowhite3", "#645CEB", "#B0DFE8", "#14A4D2", "#8CCF34", "#F7C59F",  "#F27660","#FCE301", "#F9A02B", "#D12A36")


col_scal <- alpha(c("navajowhite3", "#645CEB", "#B0DFE8", "#14A4D2", "#8CCF34", "#F7C59F",  "#F27660","#FCE301", "#F9A02B", "#D12A36"), alpha = 0)

#If include Europe - need nintersect = NULL
# If intersect = 23, Europe has no overlaps
install.packages('grid')
library(grid) #This is incase you get an error about "Error in grid.newpage() : could not find function "grid.newpage"

upset(data, nsets = 40, 
      nintersects = 60, #leave empty for all intersections
      keep.order = FALSE, 
      matrix.color = "grey23", 
      matrix.dot.alpha = .6,
      sets.bar.color = reg_col,
      mainbar.y.label = "Intersection Size",
      order.by = c("freq" ), # Null= order.by = c("freq", "degree")
      decreasing = c(T,F), 
      sets.x.label = "Total No. Species", 
      line.size = 0.5, 
      queries = list(list(query = intersects, params = list("N America"), color = col_scal[2]), 
                     list(query = intersects, params = list("Caribbean"), color = col_scal[3]), 
                     list(query = intersects, params = list("C America"), color = col_scal[4]),
                     list(query = intersects, params = list("S America"), color = col_scal[5]),
                     list(query = intersects, params = list("Asia"), color = col_scal[6]),
                     list(query = intersects, params = list("Africa"), color = col_scal[7]),
                     list(query = intersects, params = list("Australasia"), color =col_scal[8]), 
                     list(query = intersects, params = list("Oceania"), color = col_scal[9]),
                     list(query = intersects, params = list("Native"), color = col_scal[1])
      ))





# For Exotic Species ----------------------------------------------------
head(biogeo_full)
exotic <- biogeo_full[c(3,5, 10:18)]

colnames(exotic) <- c("Non-native", "Invasive", "N America", "Caribbean", "C America", "S America", 
                      "Europe", "Africa", "Asia", "Australasia", "Oceania")


head(exotic)



# With only Invasives -----------------------------------------------------
upset(exotic[exotic$Invasive==1,], 
      sets = c("Oceania", "Australasia", "Asia", "Africa",
               "Europe", "S America", "C America",
               "Caribbean","N America"))


#Invasive intersection plot was merged with biogeographic intersection lpot and final touches/coloring was added in Adobe Illustrator. 

