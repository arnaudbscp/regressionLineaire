# PROJET

station <- read.table("/Users/arnaudbascop/Desktop/station.txt", header=TRUE)

# Statistiques descriptives
#attach(station)
head(station)
dim(station)
summary(station)
colnames(station)
plot(station)

#----------------------------------------
# Chargement du package PCAmixdata
#----------------------------------------
require(PCAmixdata) # permet de charger le package "PCAmixdata" 

#--------------------------------------------------------------
# Mise en oeuvre de l'ACP - variables quantitatives seulement
#--------------------------------------------------------------
res<-PCAmix(station, graph=FALSE) 

res

# On choisit dimension 1 et 2 car représente 99.65% des valeurs
# comme on est en ACP centrée réduite, on peut utiliser le critère de Kaiser qui
# nous dit que seuls les axes factoriels associés à une valeur propre (eigenvalue) plus grande que 1
# sont des axes intéressants à retenir.
# NB 4 : la troisième et quatrième valeur propre est très inférieure à 1. Donc ne portent donc pas d'information 
# pertinente, ils correspondent plutôt à du bruit (fluctuation aléatoire).
round(res$eig,digit=2)

?plot.PCAmix # permet d'afficher la fenetre d'aide de la commande "plot.PCA"

plot(res,axes=c(1,2),choice="cor")

# Commentaires du cercle des corrélations du plan 1-2 :
# 1) Les 4 variables sont bien représentées dans ce plan 1-2 (ce qui n'est pas une surprise) car leurs projections sont proches de la circonférence du cercle.
# 2) Sur l'axe 1 (horizontal), on a une ventes, nbpompes et nbconc projeté vers la meme direction. Cela signifie que ces trois variables sont corrélées
# linéairement et positivement entre elles.
# globalement ; a contrario, moins les eaux les plus appréciées seront celles qui ont une faible saveur salée.
# 3) L'axe 2 (vertical) est essentiellement caractérisé par la variable "trafic" qui est
# projetée vers le haut. Cette variable (en projection) est orthogonale aux trois autres variables. Cela signifie
# qu'il n'y a pas a priori des liaisons linéaires entre la variable "trafic" et les autres variables 
# ventes, nbpompes et nbconc.
#
# Il convient maintenant de projeter les individus sur le plan factoriel 1-2 associé : 
# sous-espace de dimension 2 de R^3 (espace des individus) qui apportent le plus d'information (maximisation de l'inertie
# du nuage projeté). Ceci nous permettra alors de caractériser les individus en fonction des variables.

plot(res,axes=c(1,2),choice="ind")


