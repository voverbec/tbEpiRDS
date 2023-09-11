#' Convert units to days for symptom screening
#'
#' @param value Numeric value to be converted
#' @param unit Numeric unit to determine conversion (1, 2, or 3)
#'
#' @return Numeric value converted to days
#'
#' @export
#'
#' This function is part of the tbEpiRDS package, which is distributed under the
#' MIT License. See the LICENSE file for details.
#'
### Convert units to days for symptom screening
convert_to_day.fn = function(value, unit) {
    unit <- recode(unit, `1` = 1L, `2` = 7L, `3` = 30L)
    return(unit * value)
}

