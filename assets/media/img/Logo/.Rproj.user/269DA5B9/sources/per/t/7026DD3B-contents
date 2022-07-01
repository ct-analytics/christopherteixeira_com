library(ggplot2)
library(dplyr)
library(patchwork)

library(showtext)
font_add_google(name = "Montserrat", family = "montserrat")

set.seed(123)

n <- 1000
alpha <- 2
phi <- (sqrt(5)+1)/2

colors <- data.frame(
  dots="#212529",
  letters="#0088CC",
  background="#000000"
)

radius <- function(k,n,b){
  if (k>n-b) r <- 1 # put on the boundary
  else r <- sqrt(k-1/2)/sqrt(n-(b+1)/2) # apply square root
  return(r)
}

logo.dots <- sapply(seq(1,n), function(k) {
  r <- radius(k,n,round(alpha*sqrt(n)))
  theta <- 2*pi*k/phi^2
  return(data.frame(x=r*cos(theta),y=r*sin(theta),color=colors$dots))
},simplify = FALSE) %>% bind_rows()

logo.c <- logo.dots %>%
  mutate(dist = sqrt((x+.25)^2+(y-0)^2),
         color.c=colors$letters) %>% 
  filter(.43 < dist & dist < .55,
         x < -.15) %>%
  select(-dist)

logo.t <- logo.dots %>%
  filter(((.05<x & x<.65) & (.40<y & y<.55)) | # horizontal part
           ((.275<x & x<.425) & (-.55<y & y<.60))) %>% # vertical part
  mutate(color.t=colors$letters)

logo.df <- logo.dots %>% 
  left_join(logo.c) %>%
  left_join(logo.t) %>%
  mutate(color=coalesce(color.t,color.c,color)) %>%
  select(-color.t,-color.c)

logo <- ggplot(logo.df,aes(x=x,y=y,color=color)) + 
  geom_point() +
  # ylab("") + xlab("") +
  scale_color_manual(values=c("#CCCCCC","#212529")) +
  theme(
    # Blue
    panel.background = element_rect(fill="#0088CC",
                                    color="#0088CC"),
    plot.background = element_rect(fill="#0088CC",
                                   color="#0088CC"),
    # tranparent
    # panel.background = element_rect(fill="transparent",
    #                                 color=NA),
    # plot.background = element_rect(fill="transparent",
    #                                color=NA),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = 'none')

title <- "Christopher Teixeira"
subtitle <- "christopherteixeira.com"
text <- ggplot() + 
  annotate("text", x = 4, y = 30, size=8, label = title, family="montserrat", fontface="bold") + 
  annotate("text", x = 4, y = 15, size=6, label = subtitle, family="montserrat") + 
  ylim(10,40) +
  theme(
    # Blue
    panel.background = element_rect(fill="#0088CC",
                                    color="#0088CC"),
    plot.background = element_rect(fill="#0088CC",
                                   color="#0088CC"),
    # tranparent
    # panel.background = element_rect(fill="transparent",
    #                                 color=NA),
    # plot.background = element_rect(fill="transparent",
    #                                color=NA),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = 'none',
    plot.margin = unit(c(0,0,0,50), "pt")
    )

showtext_auto()
# plot_spacer() + text + logo + plot_layout(ncol=3, widths=c(1,2,1))
text + logo + plot_layout(ncol=2, widths=c(2.5,1))
# ggsave("logo-high-transparent.png", dpi=320, width=6, height = 6, units="in")
# 1128 (w) x 191 (h)
# 1192 (w) x 220 (h) pixels

ggsave("banner-test.png", dpi=200, width=8.92, height = 2.20)

showtext_auto(FALSE)
