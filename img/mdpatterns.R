# env
library(ggmice)
library(ggplot2)
# data
dat <- data.frame(
  Y = c(1, 1, NA, 1, NA),
  X = rep(1, 5)
)
R <- data.frame(apply(!is.na(dat), 2, as.numeric))
long_R <- data.frame(row = 1:5, vrb = c(rep("Y", 5), rep("X", 5)), ind = as.numeric(!is.na(dat)))
# plot
ggplot(long_R, aes(x = vrb, y = row, fill = as.factor(ind))) +
  geom_tile(color = "black") +
  scale_y_reverse() +
  scale_fill_manual(values = c(
    "1" = "#006CC2B3",
    "0" = "#B61A51B3"
  )) +
  scale_x_discrete(position = "top") +
  coord_fixed(expand = FALSE) +
  ggmice:::theme_minimice() +
  labs(x = NULL, y = NULL, fill = "R")
ggsave("./mdpattern_XY.png", height = 1200, width = 800, units = "px")

# data plot 2
dat <- data.frame(
  Y1 = c(1, 1, NA, 1, 1),
  Y2 = c(1, 1, NA, 1, NA),
  ... = c(1, NA, 1, 1, NA),
  Yp = c(1, 1, 1, 1, NA)
)
x_labs <- names(dat)
y_labs <- c(1:3, "...", "n")
R <- data.frame(apply(!is.na(dat), 2, as.numeric))
long_R <- data.frame(row = factor(y_labs, ordered = TRUE), vrb = rep(x_labs, each = 5), ind = as.numeric(!is.na(dat)))
ggplot(long_R, aes(x = vrb, y = row, fill = as.factor(ind))) +
  geom_tile(color = "black") +
  # scale_y_reverse() +
  scale_fill_manual(values = c(
    "1" = "#006CC2B3",
    "0" = "#B61A51B3"
  )) +
  scale_x_discrete(position = "top", limits = names(dat)) +
  scale_y_discrete(limits = rev(c(1:3, "...", "n"))) +
  coord_fixed(expand = FALSE) +
  ggmice:::theme_minimice() +
  labs(x = NULL, y = NULL, fill = "R")
ggsave("./mdpattern_Yp.png", height = 1200, width = 800, units = "px")


#
# expression(X[1]),
# expression(X[2]),
# expression(X[3]),
# "...",
# expression(X[p])


# ## Fully conditional specification (FCS)
# plot_md <- function(data) {
#   ggplot(data, aes(y = rec, x = var, fill = as.factor(r))) +
#   geom_tile(color = "black", show.legend = FALSE) +
#   scale_fill_manual(values = c(
#     "1" = "#006CC2B3",
#     "2" = "#B61A51B3",
#     "3" = "lightgrey",
#     "4" = alpha("#B61A51B3", 0.3)
#   )) +
#   coord_fixed(expand = FALSE) +
#   ggmice:::theme_minimice() +
#   labs(x = NULL, y = NULL, fill = NULL) +
#   theme(axis.title=element_blank(),
#         axis.text=element_blank(),
#         axis.ticks=element_blank())
# }
#
# # monotone
# dat_mono <- expand.grid(rec = 1:8, var = 1:3)
# # grey
# dat_mono$r <- c(rep(3, 2), rep(1, 6), rep(3, 3), rep(1, 5), rep(3, 5), rep(1, 3))
# plot_md(dat_mono)
# # V1
# dat_mono$r <- c(rep(2, 2), rep(1, 6), rep(3, 3), rep(1, 5), rep(3, 5), rep(1, 3))
# plot_md(dat_mono)
# # V2
# dat_mono$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(3, 5), rep(1, 3))
# plot_md(dat_mono)
# # V3
# dat_mono$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(2, 5), rep(1, 3))
# plot_md(dat_mono)
#
#
# # FSC
# dat_fcs <- expand.grid(rec = 1:8, var = 1:3)
# # grey
# dat_fcs$r <- c(rep(3, 2), rep(1, 6), rep(3, 3), rep(1, 5), rep(1, 3), rep(3, 5))
# plot_md(dat_fcs)
# # V1
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(3, 3), rep(1, 5), rep(1, 3), rep(3, 5))
# plot_md(dat_fcs)
# # V2
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(1, 3), rep(3, 5))
# plot_md(dat_fcs)
# # V3
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(1, 3), rep(2, 5))
# plot_md(dat_fcs)
# # V1
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(4, 3), rep(1, 5), rep(1, 3), rep(4, 5))
# plot_md(dat_fcs)
# # V2
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(1, 3), rep(4, 5))
# plot_md(dat_fcs)
# # V3
# dat_fcs$r <- c(rep(2, 2), rep(1, 6), rep(2, 3), rep(1, 5), rep(1, 3), rep(2, 5))
# plot_md(dat_fcs)
# # light red
# dat_fcs$r <- c(rep(4, 2), rep(1, 6), rep(4, 3), rep(1, 5), rep(1, 3), rep(4, 5))
# plot_md(dat_fcs)



