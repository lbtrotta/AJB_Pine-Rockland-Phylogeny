####################################################################
# Plotting Pine Rockland Community Phylogeny
####################################################################

##To use diversitree you need to have your data set up for that the species names (which perfectly match your tree) are the actual row names (ie. import with row = 1)


#Here's My Beast Tree
beasttr <- read.nexus("Data/4RunMCC.nex")
beasttr

# Here's my plotting data
key <- read.csv("Data/AJB_divtree.csv", header = T, row =1)


# Need to drop a few tips
#   Hedyotis procumbens == Houstonia procumbens
#   Psidium longipies == Mosiera longipes

btree <- drop.tip(beasttr, tip = c("Hedyotis_procumbens", "Psidium_longipes")) #538 Tips



# Rotating Nodes ----------------------------------------------------------
# We will want to flip nodes to make the tip clade label easy read

v.large <- rainbow(9)
colz <- list(Very_large = v.large)


legend(1, 300,legend=c("0 = Lycophyte",
                       "1 = Gymnosperm",
                       "2 = Monilophyte",
                       "3 = Magnolids",
                       "4 = Monocots",
                       "5 = Eudicots",
                       "6 = Superasterids",
                       "7 = Superrosids"),
       fill = v.large,
       xpd=NA,
       title='Taxonomic Grouping',bty='n', 
       title.adj = 0, 
       cex = .9)


#Turned node #1
findMRCA(btree, tips=c("Ximenia_americana", "Polygonella_ciliata"), type=c("node","height"))
xtree <-rotateNodes(btree, 1047)

findMRCA(btree, tips=c("Manilkara_jaimiqui"  , "Polygonella_ciliata"), type=c("node","height"))
xxtree <-rotateNodes(xtree, 861)

xxxtree <-rotateNodes(xxtree, 1047)

findMRCA(btree, tips=c("Iresine_diffusa", "Polygonella_ciliata"), type=c("node","height"))
xxxxtree <-rotateNodes(xxxtree, 1048)
trait.plot(xxxxtree, key, type = 'p', cols = colz, cex.lab = .3, 
           legend = F, w = .035)

fintree <- xxxxtree
tips <-fintree$tip.label
tips[order(tips)]

tip1 <- gsub("_v._", "_var._", tips)
tip2 <- gsub("ssp.", "subsp.", tip1)
tip3 <- gsub("Anemia_adiantifolia_A01", "Anemia_adiantifolia", tip2)
tip4 <- gsub("Argythamnia_blodgetti", "Argythamnia_argothamnoides", tip3)
tip5 <- gsub("Polygala_violacea", "Asemeia_violacea", tip4)
tip6 <- gsub("Bucida_buceras", "Terminalia_buceras", tip5)
tip7 <- gsub("Cenchrus_incertus", "Cenchrus_spinifex", tip6)
tip8 <- gsub("Chamaesyce", "Euphorbia", tip7)
tip9 <- gsub("Panicum_tenerum", "Coleataenia_tenera", tip8)
tip10 <- gsub("Cordia_bahamensis", "Varronia_bahamensis", tip9)
tip11 <- gsub("Helianthemum_corymbosum", "Crocanthemum_corymbosum", tip10)
tip12 <- gsub("Croton_glandulosus", "Croton glandulosus_var._septentrionalis", tip11)
tip13 <- gsub("Cynanchum_blodgetti", "Metastelma_blodgettii", tip12)
tip14 <- gsub("Desmodium_incanum_A02", "Desmodium_incanum", tip13)
tip15 <- gsub("Syntherisma_gracillimum", "Digitaria_gracillima", tip14)
tip16 <- gsub("Dodonaea_viscosa_var._angustifolia", "Dodonaea_viscosa", tip15)
tip17 <- gsub("Elytraria_caroliniensis_var._angustifolia", "Elytraria_caroliniensis", tip16)
tip18 <- gsub("Heliotropium_polyphyllum", "Euploca_polyphylla", tip17)
tip19 <- gsub("Indigofera_miniata_var._floridana", "Indigofera_miniata", tip18)
tip20 <- gsub("Jacquemontia_curtisii_F08", "Jacquemontia_curtisii", tip19)
tip21 <- gsub("Jacquemontia_pentathos", "Jacquemontia pentanthos", tip20)
tip22 <- gsub("Kigelia_pinnata", "Kigelia_africana", tip21)
tip23 <- gsub("Linum_medium", "Linum_medium_var._texanum", tip22)
tip24 <- gsub("Phyla_stoechadifolia", "Lippia_stoechadifolia", tip23)
tip25 <- gsub("Manilkara_jaimiqui", "Manilkara jaimiqui_subsp._emarginata", tip24)
tip26 <- gsub("Merremia_dissecta", "Distimake_dissectus", tip25)
tip27 <- gsub("Tetrazygia_bicolor", "Miconia_bicolor", tip26)
tip28 <- gsub("Mimosa_quadrivalvis", "Mimosa_quadrivalvis_var._angustata", tip27)
tip29 <- gsub("Muhlenbergia_capillaris_B06", "Muhlenbergia_capillaris", tip28)
tip30 <- gsub("Panicum_maximum", "Urochloa_maxima", tip29)
tip31 <- gsub("Phaseolus_polystachios", "Phaseolus_polystachios_var._sinuatus", tip30)
tip32 <- gsub("Phyllanthus_pentaphyllus_var._floridana", "Phyllanthus_pentaphyllus", tip31)
tip33 <- gsub("Polygonella_polygama", "Polygonella_polygama_var._brachystachya", tip32)
tip34 <- gsub("Pongamia_pinnata", "Millettia_pinnata", tip33)
tip35 <- gsub("Sida_acuta", "Sida_ulmifolia", tip34)
tip36 <- gsub("Sporobolus_pyramidatus", "Sporobolus_indicus_var._pyramidalis", tip35)
tip37 <- gsub("Tillandsia_faciculata_v_denispicata", "Tillandsia_fasciculata", tip36)
tip38 <- gsub("Vachellia_farnesiana_var._pinetorum_A05", "Vachellia_farnesiana_var._pinetorum", tip37)
tip39 <- gsub("Euphorbia_deltoidea_subsp._pinetorum_F10", "Euphorbia_deltoidea_subsp._pinetorum", tip38)
tip40 <- gsub("Russelia_equisetiformes", "Russelia_equisetiformis" , tip39)
tip41 <- gsub("Schinus_terebinthifolius", "Schinus_terebinthifolia", tip40)
tip42 <- gsub("Quercus_virginianus", "Quercus_virginiana", tip41)
tip43 <- gsub("Poinsettia_", "Euphorbia_", tip42)
tip44 <- gsub("Crotalaria_pulmila", "Crotalaria_pumila", tip43)


tips_renamed <- tip44

namedtree <- fintree
namedtree$tip.label <- tips_renamed


# Huge Tree with Names (Appendix S3)----------------------------------------------------
par(mar = c(0,0,0,0))
plot.phylo(namedtree, edge.width = 1, show.tip.label=T, cex = .75, label.offset = .5)
#Save the pdf Width:11in Length:70in make sure to strech the plotting area LARGE

# Tree with Biogeographic Regions (Figure 4)__________________________________________________
# This is for AJB_divtree.csv

#There will be three blocks of codes that go on this figure
key
# 1. Taxonomic rank information (Called Tax_)
#    These have multiple levels 
#       Very_large (7) - Superclades APGIV
#             0 = Lycophyte
#             1 = Gymnosperm
#             2 = Monilophyte
#             3 = Magnolids
#             4 = Monocots
#             5 = Eudicots
#             6 = Superasterids
#             7 = Superrosids
#       Large (7) - Don't use
#       Medium (10) - Don't use
#       Order (40) - Orders, don't use
#       Full Tree - has 1 for every speices - use for white columns

# 2. Species Status information (Called Stat_)
#    These are all 0 or 1
#       PR_endemic
#       FLEPPCall_2017 _ Invasive
#       NonNative (inverse is Native)

# 3. Biogeographic Origin information (Called Biogeo_)
#    These are all 0 or 1
#       Florida
#       USCan_notFL
#       Caribbean
#       Central_America
#       South_America
#       Europe
#       Africa
#       Asia
#       Australasia
#       Oceania



# Species Status Colors
endemic <- c("aliceblue", "blue3" )
invasive <- c("mistyrose", "#FC032C")

# Biogeographic Region Colors
FL <- c("navajowhite3", "white")
US <- c("white", "#645CEB")
Carib <- c("white", "#B0DFE8")
C_Am <- c("white", "#14A4D2")
S_Am <- c("white", "#8CCF34")
Europe <- c("white", "#D12A36")
Africa <- c("white", "#F27660")
Asia <- c("white", "#F7C59F")
Australasia <- c("white", "#FCE301")
Oceania <- c("white", "#F9A02B")

# Spacers
blanks <- c("white")


#Assign colors to the lists
colors <- list(PR_endemic = endemic, 
               FLEPPCall_2017 = invasive, 
               Full_Tree = blanks, 
               Full_Tree = blanks,
               NonNative= FL,
               USCan_notFL = US, 
               Caribbean = Carib, 
               Central_America = C_Am, 
               South_America = S_Am, 
               Europe = Europe, 
               Africa = Africa, 
               Asia = Asia, 
               Australasia = Australasia, 
               Oceania = Oceania )



par(oma=c(0,0,0,0))
trait.plot(fintree, key, type = 'p', cols = colors, 
           cex.lab = .01, legend = F)

text(x = c(471, 481), y = 550, c("E", "I"), cex =.75, xpd = TRUE)


legend(1, 300,legend=c('Florida',
                       'North America', 
                       'Caribbean',
                       'Central America', 
                       'South America', 
                       'Europe', 
                       'Africa', 
                       'Asia', 
                       'Australasia', 
                       'Oceania', 
                       "E - Endemic", 
                       "I - Invasive"),
       fill = c("#BFAC77","#645CEB", "#B0DFE8", "#14A4D2", "#8CCF34" , 
                "#D12A36", "#F27660", "#F7C59F","#FCE301", "#F9A02B", 
                "blue3", "#FC032C"),
       xpd=NA,
       title='Biogeographic Regions\nSpecies Status',bty='n', 
       title.adj = 0, 
       cex = .9)

## From here the Legend was reordered and the taxonomic grouping was added in Adobe Illustrator



