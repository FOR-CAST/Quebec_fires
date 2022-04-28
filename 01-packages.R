source("01-packages-libPath.R")

if (!require("Require", quietly = TRUE)) {
  install.packages("Require")
  library(Require)
}

.spatialPkgs <- c("lwgeom", "rgdal", "rgeos", "sf", "sp", "raster", "terra")

Require("PredictiveEcology/SpaDES.install@development")

installSpaDES(dontUpdate = .spatialPkgs)

if (FALSE) {
  installSpatialPackages()
  #install.packages(c("raster", "terra"), repos = "https://rspatial.r-universe.dev")
  sf::sf_extSoftVersion() ## want at least GEOS 3.9.0, GDAL 3.2.1, PROJ 7.2.1
}

## gdalUtils is N/A on CRAN as of April 2022; dependency of pemisc, LandR, etc.
if (!("gdalUtils" %in% rownames(installed.packages()))) {
  install.packages("https://cran.r-project.org/src/contrib/Archive/gdalUtils/gdalUtils_2.0.3.2.tar.gz",
                   repos = NULL)
}

#out <- makeSureAllPackagesInstalled(modulePath = "modules")

Require(c("config", "RCurl", "RPostgres", "XML"), require = FALSE)

## NOTE: always load packages LAST, after installation above;
##       ensure plyr loaded before dplyr or there will be problems
Require(c("data.table", "plyr", "pryr",
          "PredictiveEcology/reproducible@development (>= 1.2.8.9040)",
          "PredictiveEcology/LandR@development", ## TODO: workaround weird raster/sf method problem
          "PredictiveEcology/SpaDES.core@development (>= 1.0.10.9003)",
          "archive", "googledrive", "httr", "slackr"), upgrade = FALSE)
