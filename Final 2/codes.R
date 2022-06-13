######Informatique pour sciences sociales 
######devoir final 2

######Preparer par John Pascal Belande (Be172850)

library('openxlsx')            #lancement du package permetant d'importer le fichier excel
library(tidyverse)

data<-read.xlsx("Data.xlsx")   #importation du fichier excel
data

PIB<-data[48,7:67]             #extraction des colones 7 à 67 de la ligne 48 et son enregistrement dans un objet.
PIB                            #Lancement de l'objet
summary(PIB)                   #l'objet est constate du type caractere
PIB<-as.numeric(PIB)             #conversion du type de l'objet en numeric 
PIB

année<-data[2,7:67]            #extraction des colones 7 à 67 de la ligne 2 et son enregistrement dans un objet.
année                          #Lancement de l'objet
summary(année)                 #l'objet est constate du type caractere
année<-as.numeric(année)           #conversion du type de l'objet en numeric
année

base<-data.frame(année,PIB)       #creation d'un data frame avec les données extraites
base                             


#graphe en ligne
ggplot(base,aes(x=année,y=PIB,colour=line))+
  geom_line(color="blue")+
  ggtitle("Epargne brut en %du PIB")+
  xlab("Année")+ylab("% PIB")+
  theme_classic()

#graphe nuage de points
ggplot(base,aes(x=année,y=PIB,colour=line))+
  geom_point(size=3,shape=4,color="red")+
  ggtitle("Epargne brut en %du PIB")+
  xlab("Année")+ylab("% PIB")+
  theme_dark()

#graphe en batton

ttype<-table(base$PIB)
ptype<-prop.table(ttype)*100 # en pourcentage

ptype
#verifier le type d'objet
classe(ptype)
# convertir en data frame
ptype<-data.frame(ptype)
ptype

ggplot(data=ptype,aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", fill="orange")+
  ggtitle("Epargne brut en %du PIB")+
  xlab("Valeur PIB")+ ylab("Pourcentage")+
  theme_light()

