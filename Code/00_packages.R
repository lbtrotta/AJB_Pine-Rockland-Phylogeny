###################################################################
# Packages used
# Trotta et al., American Jounral of Botany 2018
####################################################################
install.packages("ape")
library(ape)
install.packages("phytools")
library(phytools)

#For phylogeny plotting
install.packages("diversitree")
library(diversitree)

#For graphics
install.packages("scales")
library(scales)
install.packages("viridis")
library(viridis)

#For Intersection Plots
install.packages("UpSetR")
library(UpSetR)

#Latest Development Updates
install.packages("devtools")
devtools::install_github("hms-dbmi/UpSetR")
