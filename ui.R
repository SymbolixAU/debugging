library(shiny)
library(shinydashboard)
library(mapdeck)
library(sf)
library(spatialwidget)

ui <- dashboardPage(
	dashboardHeader()
	, dashboardSidebar()
	, dashboardBody(
		box(
			width = 6
			, title = "map2"
			, mapdeckOutput(
				outputId = "map1"
				, height = "600"
			)
		)
		, box(
			width = 6
			, title = "map2"
			, mapdeckOutput(
				outputId = "map2"
				, height = "600"
			)
		)
	)
)
