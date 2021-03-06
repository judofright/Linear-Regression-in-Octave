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
## @deftypefn {Function File} {@var{retval} =} trainRegression (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Talha Hanif Butt <talha@talha-Inspiron-15-7000-Gaming>
## Created: 2018-10-06

## The function returns the regression co-efficients when given the training data X,
## target values Y and the ridge constant lambda.

function [regressionCoefficients] = trainRegression (X,Y,lambda)

	X = [ones(rows(X),1) X];
	I = eye(size(X)(2));
	I = I*lambda;
	regressionCoefficients = inv((transpose(X)*X)+I)*(transpose(X)*Y);
	
endfunction
