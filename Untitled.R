library("tidyverse")
library('dplyr')
library("sf")
library(leaflet)
library(viridis)

leaflet() %>% addTiles()

FSA <- read_sf("/Users/BOYA/Desktop/Ivey Term 4/tableau/DataVizArt/DVA_Finals_Datasets/Spatial Data/FSA/AGSI_FSA.shp")
POI <- read_sf("/Users/BOYA/Desktop/Ivey Term 4/tableau/DataVizArt/DVA_Finals_Datasets/Spatial Data/Points_of_Interest/Points_of_Interest.shp")

#coor <- st_coordinates(POI) retrieve coordiante information 

pal <- colorFactor(
  palette = viridis_pal(begin = .4, end = .95, option = 'A')(3),
  domain = POI$Category
)


p <-leaflet() %>% 
  addTiles() %>% 
  addPolygons(data = FSA,
              color = 'green',
              weight = 1.5,
              opacity = 1,
              fillColor = 'black',
              fillOpacity = .8,
              highlightOptions = highlightOptions(color = "#FFF1BE", 
                                                  weight = 5),
              popup = ~FSA) %>%
  addCircleMarkers(data = POI,
                   popup = ~Category,
                   stroke = F,
                   radius = 2,
                   fillColor = ~pal(Category),
                   fillOpacity = 1) %>%
  addLegend(data = POI,
            pal = pal,
            values = ~Category,
            title = "Public Facilities Across Canada")
p
