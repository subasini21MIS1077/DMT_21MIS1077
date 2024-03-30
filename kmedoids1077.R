# Installing necessary packages for K-medoids Clustering
library(cluster)

# Reading the dataset
data <- read.csv("C:\\Users\\subasinikesavan\\OneDrive\\Documents\\ass\Data Mining\\Mall_Customers.csv")

# Selecting columns for clustering
selected_data <- data[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Choosing number of clusters
k <- 3
kmedoids_result <- pam(selected_data, k)

# Adding cluster assignments to the original data
data$Cluster <- kmedoids_result$clustering

# Printing the cluster medoids
print(kmedoids_result$medoids)

# Printing the cluster assignments for each data point
print(kmedoids_result$clustering)

# Plotting the clusters
library(ggplot2)
ggplot(data, aes(x = Age, y = Annual.Income..k.., color = factor(Cluster), size = Spending.Score..1.100.)) +
  geom_point() +
  labs(title = "K-medoids Clustering for Spending Score", x = "Age", y = "Annual Income (k$)")
