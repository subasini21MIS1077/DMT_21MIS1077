#Installing necessary packages for K Means Clustering
install.packages("cluster")
library(cluster)

# Reading the dataset
data <- read.csv("C:\\Users\\subasinikesavan\\OneDrive\\Documents\\ass\\Data Mining\\Mall_Customers.csv")

# Selecting Spending Score column for clustering
selected_data <- data$Spending.Score..1.100.

# Choosing number of clusters
k <- 3
kmeans_result <- kmeans(selected_data, centers = k)

# Adding cluster assignments to the original data
data$Cluster <- kmeans_result$cluster

# Printing the cluster centers
print(kmeans_result$centers)

# Printing the cluster assignments for each data point
print(kmeans_result$cluster)

#Plotting the clusters
library(ggplot2)
ggplot(data, aes(x = data$Age, y = data$Annual.Income..k.., color = factor(Cluster), size = data$Spending.Score..1.100.)) +
  geom_point() +
  labs(title = "K-means Clustering for Spending Score", x = "Age", y = "Annual Income (k$)")
