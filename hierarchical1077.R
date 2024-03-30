# Reading the dataset
data <- read.csv("C:\\Users\\subasinikesavan\\OneDrive\\Documents\\ass\\Data Mining\\Mall_Customers.csv")

# Selecting columns for clustering
selected_data <- data[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Perform hierarchical clustering
hierarchical_result <- hclust(dist(selected_data))

# Cut the dendrogram to get clusters
k <- 3
cluster_cut <- cutree(hierarchical_result, k)

# Adding cluster assignments to the original data
data$Cluster <- cluster_cut

# Plotting the clusters
library(ggplot2)
ggplot(data, aes(x = Age, y = Annual.Income..k.., color = factor(Cluster), size = Spending.Score..1.100.)) +
  geom_point() +
  labs(title = "Hierarchical Clustering for Spending Score", x = "Age", y = "Annual Income (k$)")
