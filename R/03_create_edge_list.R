#' Create an edge list for network analysis from coupon data
#'
#' This function takes a dataframe of coupon data and creates an edge list
#' suitable for network analysis. It extracts information about participant
#' recruitment and coupon exchanges, making it a crucial step in analyzing
#' Respondent-Driven Sampling (RDS) data.
#'
#' @param coupon_check A dataframe containing participant IDs and coupon
#'                     information.
#'
#' @return A matrix representing the edge list for network analysis.
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.

### edge list ####
# coupon_check is a dataframe with pid, screen1_coupno_visit1, net5_coup1_visit1, net5_coup2_visit1
## screen1_coupno_visit1 = coupon the participant was recruited with
## net5_coup1_visit1, net5_coup2_visit1 = coupons participant received
create_edge_list <- function(coupon_check) {
    library(dplyr)

    # Create the screen and coupon1 data frames
    screen <- coupon_check %>%
        dplyr::select(pid, screen1_coupno_visit1) %>%
        dplyr::rename(coup = screen1_coupno_visit1)

    coupon1 <- coupon_check %>%
        dplyr::select(pid, net5_coup1_visit1) %>%
        dplyr::rename(coup = net5_coup1_visit1)

    # Merge screen and coupon1 data frames to get screen_coup1
    screen_coup1 <- dplyr::left_join(screen, coupon1, by = "coup") %>%
        dplyr::rename(pid = pid.x, recruit = pid.y)

    # Set "SEED" as the recruit for rows where coup is "SEED"
    screen_coup1$recruit[screen_coup1$coup == "SEED"] <- "SEED"

    # Filter out rows where recruit is NA and remove the coup column
    screen_coup1 <- screen_coup1 %>%
        dplyr::filter(!is.na(recruit)) %>%
        dplyr::select(-coup)

    # Create the coupon2 data frame
    coupon2 <- coupon_check %>%
        dplyr::select(pid, net5_coup2_visit1) %>%
        dplyr::rename(coup = net5_coup2_visit1)

    # Merge screen and coupon2 data frames to get screen_coup2
    screen_coup2 <- left_join(screen, coupon2, by = "coup") %>%
        dplyr::rename(pid = pid.x, recruit = pid.y) %>%
        dplyr::filter(!is.na(recruit)) %>%
        dplyr::select(-coup)

    # Combine screen_coup1 and screen_coup2 to create the edge_list
    edge_list <- rbind(screen_coup1, screen_coup2) %>%
        dplyr::filter(recruit != "SEED") %>%
        dplyr::arrange(pid, recruit) %>%
        dplyr::select(recruit, pid)

    # Convert edge_list to a matrix
    edges <- as.matrix(edge_list)

    return(edges)
}
