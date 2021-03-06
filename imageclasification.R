# Load Packages
library(EBImage)
library(keras)

# Read images
setwd('---')
pics <- c('p1.jpg', 'p2.jpg', 'p3.jpg', 'p4.jpg', 'p5.jpg', 'p6.jpg',
          'c1.jpg', 'c2.jpg', 'c3.jpg', 'c4.jpg', 'c5.jpg', 'c6.jpg')
mypic <- list()
for (i in 1:12) {mypic[[i]] <- readImage(pics[i])}

# Explore
print(mypic[[1]])
display(mypic[[8]])
summary(mypic[[1]])
hist(mypic[[2]])
str(mypic)

# Resize
for (i in 1:12) {mypic[[i]] <- resize(mypic[[i]], ---, ---)}

# Reshape
for (i in 1:12) {mypic[[i]] <- array_reshape(mypic[[i]], c(---, ---,---))}

# Row Bind
trainx <- NULL
for (i in 7:11) {trainx <- rbind(trainx, mypic[[i]])}
str(trainx)
testx <- ---(mypic[[6]], mypic[[12]])
trainy <- c(0,0,0,0,0,1,1,1,1,1 )
testy <- c(---, ---)

# One Hot Encoding
trainLabels <- ---(trainy)
testLabels <- ---(testy)

# Model
model <- keras_model_sequential()
model %>%
         layer_dense(units = 256, activation = ---, input_shape = c(2352)) %>%
         layer_dense(units = 128, activation = 'relu') %>%
         layer_dense(units = 2, activation = ---)
summary(model)

# Compile
model %>%
         compile(loss = ---,
                 optimizer = optimizer_rmsprop(),
                 metrics = c('accuracy'))

# Fit Model
history <- model %>%
         fit(trainx,
             ---,
             epochs = 30,
             batch_size = 32,
             validation_split = 0.2)

# Evaluation & Prediction - train data
model %>% evaluate(---, ---)
pred <- model %>% predict_classes(trainx)
table(Predicted = pred, Actual = trainy)
prob <- model %>% predict_proba(trainx)
cbind(prob, Prected = pred, Actual= trainy)
