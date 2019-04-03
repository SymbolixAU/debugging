
library(shiny)
library(shinydashboard)
library(mapdeck)
library(sf)
library(spatialwidget)

sf <- spatialwidget::widget_melbourne
sf$elev <- sf$AREASQKM * 1000

#writeLines(text = geojsonsf::sf_geojson(sf), con = "~/Documents/github/debugging/widget_melbourne.json")

server <- function( input, output ) {

	set_token(read.dcf(".mapbox", fields = "MAPBOX"))

	output$map1 <- mapdeck::renderMapdeck({
		mapdeck() %>%
			add_polygon(
				data = sf
				, elevation = "elev"
				, fill_colour = "SA2_NAME"
				, layer_id = "map1"
				, transitions = list( elevation = 0 )
			)
	})


	output$map2 <- mapdeck::renderMapdeck({
		mapdeck() %>%
			add_polygon(
				data = sf
				, elevation = "elev"
				, fill_colour = "SA2_NAME"
				, layer_id = "map2"
				, transitions = list( elevation = 600 )
			)
	})
}

