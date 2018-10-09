## Copyright (C) 2018 Talha Hanif Butt
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} main (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Talha Hanif Butt <talha@talha-Inspiron-15-7000-Gaming>
## Created: 2018-10-06

## Main function reads the training data and builds a regression model.  
## Next it gets predictions from the regression model using the training set as
## well as the test set.

function main

## loading training data
	X_train = load("ocr3_7train.txt");
	Y_train = load("ocr3_7trainLabels.txt");

## loading test data
	X_test = load("ocr3_7test.txt");
	Y_test = load("ocr3_7testLabels.txt");
	
## learning regression coefficients	
	regressionCoefficients = trainRegression (X_train,Y_train,0.2);
	
## testing model on training data	
	train_predictions = testRegression (X_train,regressionCoefficients);
	
## testing model on test data
	test_predictions = testRegression (X_test,regressionCoefficients);

## for lambda 0.1
	regressionCoefficients = trainRegression (X_train,Y_train,0.1);
	train_predictions = testRegression (X_train,regressionCoefficients);
	test_predictions = testRegression (X_test,regressionCoefficients);
	[train_TP train_FP train_TN train_FN] = confusionMatrix (train_predictions,Y_train);
	[test_TP test_FP test_TN test_FN] = confusionMatrix (test_predictions,Y_test);
	
endfunction
