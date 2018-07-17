###################################################################
# Calcualting Phylogenetic Signal of Invasion, Endemicity
#Trotta et al., American Jounral of Botany 2018
####################################################################
install.packages("https://raw.githubusercontent.com/daijiang/phyr/master/phyr_0.1.1.tgz", repos = NULL)
library(ape)
source("https://bioconductor.org/biocLite.R")
biocLite("ggtree")
library(ggtree)

dat = read.csv("AJB_PhyloSignal.csv")
unique(dat$Native * dat$NonNative) # exclusive
names(dat)
row.names(dat) = dat$Names
dat$SoFla_endemic = as.logical(dat$SoFla_endemic)
dat$PR_endemic = as.logical(dat$PR_endemic)
dat$FLEPPCall_2017 = as.logical(dat$FLEPPCall_2017)
dat$Native = as.logical(dat$Native)
dat$NonNative = as.logical(dat$NonNative)

phy = read.nexus("Data/4RunMCC.nex")
phy

#Need to drop a few tips
phy_s <- drop.tip(phy, tip = c("Hedyotis_procumbens", "Psidium_longipes"))

#Need to also drop those rows from dat
#These are the row numbers
dat[dat$Names=="Hedyotis_procumbens", ] #226
dat[dat$Names=="Psidium_longipes", ] #384

#Now remove them
dat_s <- dat[-c(226, 384), ]


#This is checking for unions in the data
setdiff(phy_s$tip.label, dat_s$Names)
setdiff(phy_s$Names, phy_s$tip.label) # all in

all(dat_s$Names == phy_s$tip.label) # same order 
# Should be true
# plot
p = ggtree(phy)
setNames(dat[,2:5], c("a", "b", "c", "d"))
gheatmap(p, dat[, c(2:4, 6)], width = 0.3, colnames_position = "top", 
         colnames_angle = 90, font.size = 3, hjust = 0) +
  scale_fill_manual(values = c("lightblue", "darkred")) +
  theme(legend.position = c(0.3, 0.7))
ggsave(filename = "tree.pdf", width = 6, height = 10)


#Set up dataframe for output
sigs = data.frame(trt = names(dat_s)[2:5], sigma.glmm = NA, sigma.pvalue = NA, 
                  stringsAsFactors = F)
count = 1
for(i in names(dat_s)[2:5]){
  print(i)
  fm = as.formula(paste0(i, " ~ 1"))
  z = phyr::binaryPGLMM(fm, data = dat_s, phy = phy_s, maxit.pql = 1000, maxit.reml = 1000)
  # this function is from ape package, but it has a small bug there
  sigs$sigma.glmm[count] = z$s2
  sigs$sigma.pvalue[count] = as.vector(z$P.H0.s2)
  count = count + 1
}

#write.csv(sigs, "PhyloSig.csv" )