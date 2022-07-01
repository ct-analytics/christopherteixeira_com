library(ggplot2)
library(dplyr)

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

logo <- logo.dots %>% 
  left_join(logo.c) %>%
  left_join(logo.t) %>%
  mutate(color=coalesce(color.t,color.c,color)) %>%
  select(-color.t,-color.c)

# transparent logo
  
ggplot(logo,aes(x=x,y=y,color=color)) + 
  geom_point() +
  scale_color_manual(values=c("#CCCCCC","#212529")) +
  theme(
        panel.background = element_rect(fill="transparent",
                                        color=NA),
        plot.background = element_rect(fill="transparent",
                                       color=NA),
        panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        legend.position = 'none')

ggsave("logo-high-transparent.png", dpi=320, width=6, height = 6, units="in")
ggsave("logo-print-transparent.png", dpi=300, width=6, height = 6, units="in")
ggsave("logo-low-transparent.png", dpi=72, width=6, height = 6, units="in")

# blue background

ggplot(logo,aes(x=x,y=y,color=color)) + 
  geom_point() +
  scale_color_manual(values=c("#CCCCCC","#212529")) +
  theme(
    panel.background = element_rect(fill="#0088CC",
                                    color="#0088CC"),
    plot.background = element_rect(fill="#0088CC",
                                   color="#0088CC"),

    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = 'none')

ggsave("logo-high-blue.png", dpi=320, width=6, height = 6, units="in")
ggsave("logo-print-blue.png", dpi=300, width=6, height = 6, units="in")
ggsave("logo-low-blue.png", dpi=72, width=6, height = 6, units="in")

# dark logo

ggplot(logo,aes(x=x,y=y,color=color)) + 
  geom_point() +
  scale_color_manual(values=c("#CCCCCC","#0088CC")) +
  theme(
    
    panel.background = element_rect(fill="#212529",
                                    color="#212529"),
    plot.background = element_rect(fill="#212529",
                                   color="#212529"),
    panel.grid = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = 'none')

ggsave("logo-high-dark.png", dpi=320, width=6, height = 6, units="in")
ggsave("logo-print-dark.png", dpi=300, width=6, height = 6, units="in")
ggsave("logo-low-dark.png", dpi=72, width=6, height = 6, units="in")
