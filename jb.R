library(tidyverse)
library(ggplot2)
df <- tibble(
  scenario = c(
    "Baseline",
    "Irrigation system",
    "Irrigation system",
    rep("Electric pumping", 6)
  ),
  sub_scenario = factor(
    c(
      "Current",
      "Drip",
      "Sprinkler",
      "2000-2010 mix",
      "Solar",
      "Wind",
      "Nuclear",
      "Hydropower",
      "Electricity mix 2050"
    ),
    levels = c(
      "Current",
      "Drip",
      "Sprinkler",
      "2000-2010 mix",
      "Solar",
      "Wind",
      "Nuclear",
      "Hydropower",
      "Electricity mix 2050"
    )
  ),
  energy_pj = c(1896, 894, 2639, 930, 930, 930, 930, 930, 930),
  co2_mt = c(216, 100, 295, 175, 11, 3, 3, 6, 6)
)
p_a <- ggplot(df, aes(x = sub_scenario, y = energy_pj, fill = scenario)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = energy_pj), vjust = -0.3, size = 3.5) +
  geom_vline(xintercept = c(1.5, 3.5), linetype = "dashed") +
  scale_fill_manual(
    values = c(
      "Baseline" = "gray70",
      "Irrigation system" = "#66c2a5",
      "Electric pumping" = "#66c2a5"
    )
  ) +
  labs(
    y = "Energy consumption\n(PJ per year)",
    x = NULL,
    title = "a"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0, size = 14, face = "bold"),
    legend.position = "top"
  ) +
  ylim(0, 4500)
p_b <- ggplot(df, aes(x = sub_scenario, y = co2_mt, fill = scenario)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = co2_mt), vjust = -0.3, size = 3.5) +
  geom_vline(xintercept = c(1.5, 3.5), linetype = "dashed") +
  scale_fill_manual(
    values = c(
      "Baseline" = "gray70",
      "Irrigation system" = "#fc8d62",
      "Electric pumping" = "#fc8d62"
    )
  ) +
  labs(
    y = "CO₂ emissions\n(Mt CO₂ per year)",
    x = NULL,
    title = "b"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0, size = 14, face = "bold"),
    legend.position = "none"
  ) +
  ylim(0, 500)
library(patchwork)

p_a + p_b + plot_layout(ncol = 1, heights = c(1, 1))
ggsave("energy_co2_plot.png", width = 10, height = 8, dpi = 300)
