#' Calculate the proportion of overlap between two spatial polygons
#'
#' This function calculates the proportion of overlap between two spatial polygons
#' specified as dataframes. It can be used to assess the spatial concordance between
#' two sets of geographic data.
#'
#' @param a A dataframe representing the first spatial polygon.
#' @param b A dataframe representing the second spatial polygon.
#'
#' @return A numeric value representing the proportion of overlap.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.
#'
### proportion overlap = area(overlap A & B)/(area(A)+area(B))
olp <- function(a,b){
    cd1<-a[chull(a),]
    cd2<-b[chull(b),]
    cd1<-st_as_sf(data.frame(cd1),coords = c("lng", "lat"),crs=4326)
    cd2<-st_as_sf(data.frame(cd2),coords = c("lng", "lat"),crs=4326)

    cd1 %>% dplyr::summarise(geometry = st_combine(geometry)) %>%
        st_cast("POLYGON") -> cd1
    cd2 %>% dplyr::summarise(geometry = st_combine(geometry)) %>%
        st_cast("POLYGON") -> cd2

    overlap_pro <- as.numeric(st_area(st_intersection(cd1,cd2))/(st_area(cd1)+st_area(cd2)))
    overlap_prop <- ifelse(length(overlap_pro) == 0, 0, overlap_pro)
    return(overlap_prop)
}
