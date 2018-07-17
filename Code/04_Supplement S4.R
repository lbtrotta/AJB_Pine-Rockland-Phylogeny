###################################################################
# Test of Brownian Motion Assumption, Appendix S4
#Trotta et al., American Jounral of Botany 2018
####################################################################

#Start with 03_Phylogenetic Signal.R

phyloD = list(SoFla_endemic = caper::phylo.d(data = dat, phy = phy, names.col = Names, binvar = 					SoFla_endemic, permut = 5000),
              PR_endemic = caper::phylo.d(data = dat, phy = phy, names.col = Names, binvar = 					PR_endemic, permut = 5000), 
              FLEPPCall_2017 = caper::phylo.d(data = dat, phy = phy, names.col = Names, binvar = 					FLEPPCall_2017, permut = 5000),
              Native = caper::phylo.d(data = dat, phy = phy, names.col = Names, binvar = Native, 		permut = 5000)
)
