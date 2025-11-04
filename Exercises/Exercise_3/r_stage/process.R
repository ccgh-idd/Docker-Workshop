library(dplyr)
library(readr)

input <- read_csv("/data/input.csv", show_col_types = FALSE)

summary <- input %>%
  group_by(category) %>%
  summarise(mean_value = mean(value))

write_csv(summary, "/data/stage1_out/summary.csv")
message("R stage complete: wrote /data/stage1_out/summary.csv")
