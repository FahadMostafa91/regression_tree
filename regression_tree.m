%Fuel Economy Analysis - Tree
%Instructions are in the task pane to the left. Complete and submit each task one at a time.

%This code loads the data.
load carEcon
whos carData carTrain carTest

%Tasks 1,2,3 - Fit the model
%Fit a model and evaluate at test values.
%TASK
%Create a decision tree regression model with the training data and name it mdl. 
%Calculate the loss of the model and name it mdlLoss.

%Use the model to predict the test values and store the predictions in a variable named econPred.

mdl = fitrtree(carTrain,"FuelEcon")
mdlLoss = loss(mdl,carTest)
econPred = predict(mdl,carTest)

%Plot the results.
evaluateFit(carTest.FuelEcon,econPred,"Tree")

% The prune function can be used to reduce overfitting.
% e.g. treeMdl = prune(treeMdl,"Level",n)


treeMdl = fitrtree(carTrain,"FuelEcon")
mdl = prune(treeMdl,"Level",10)
mdlLoss = loss(mdl,carTest)
econPred = predict(mdl,carTest)

%Modify your code again. Remove the pruning step, 
%and instead update mdl to set the "MinLeafSize" property to 5.
treeMdl = fitrtree(carTrain,"FuelEcon","MinLeafSize",5)
mdl = prune(treeMdl,"Level",10)
mdlLoss = loss(mdl,carTest)
econPred = predict(mdl,carTest)
