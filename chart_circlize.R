# Load library
library(circlize)

# Create data
data = data.frame(
  factor = sample(letters[1:8], 1000, replace = TRUE),
  x = rnorm(1000),
  y = runif(1000)
)

# General parameters
circos.par("track.height" = 0.4)

# Initialize chart
circos.initialize(factors = data$factor, x = data$x )

# Build the regions.
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
  circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
})


# ----- Chose a type ---- #


# 1: scatter plot
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)

# 2: lines
circos.trackLines(data$factor, data$x[order(data$x)], data$y[order(data$x)], col = rgb(0.1,0.5,0.8,0.3), lwd=2)

# 3: abline (vertical lines)
circos.trackLines(data$factor, data$x[order(data$x)], data$y[order(data$x)], col = rgb(0.1,0.5,0.8,0.3), lwd=2, type="h")

# 4: text
circos.trackText(data$factor, data$x[order(data$x)], data$y[order(data$x)], labels=data$factor, col = rgb(0.9,0.2,0.8,0.3), cex=1)

dev.off()
