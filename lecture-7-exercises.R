
#Making Functions
function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}

#shrub vol example
calc_shrub_vol <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

shrub_vol <- calc_shrub_vol(0.8, 1.6, 2.0)

#Exercise 1

lb_to_g <- function(pounds) {
  grams <- pounds*453.592
  return(grams)
}

(hedgehog_weight <- lb_to_g(3.75))

