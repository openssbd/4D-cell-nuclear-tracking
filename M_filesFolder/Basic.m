% Author: Kenneth H.L. Ho
% Copyright 2019 RIKEN BDR
% License: GPL v3 https://www.gnu.org/licenses/gpl-3.0.txt 
%% Basic - vairables, conditions, loops, functions
% <https://www.mathworks.com/help/matlab/learn_matlab/desktop.html https://www.mathworks.com/help/matlab/learn_matlab/desktop.html>

a = 1
%%
b = 2
%%
c = a + b
%%
d = cos(a)
%%
sin(a)
%%
% if you end a statement with a semicolon, it will suppress displaying the
% answer
e = a*b;
%%
e
%%
% a variable can also be used to represent array or matrix
f = [1 2 3 4]
%%
% re-use the variable a
a = [1 2 3; 4 5 6; 7 8 10]
%%
sin(a)
%%
a
%%
% addressing the specific element in the matrix, row 1, column 2
a(1,2)
%%
% row 3 column 3
a(3,3)
%%
% row 2
a(2,:)
%%
% column 3
a(:,3)
%%
%% Workspace variables do not persist after you exit MATLAB. Save your data for later use with the save command,

save basic.mat
%%
% clear the variables in workspace
clearvars
%%
% display vairable a - it does not exist anymore and you will get a error message.
a
%%
% reload all the variables
load basic.mat
%%
% display variable a again
a

%%
s = 'GCTAGAATCC'
%%
s2 = [s 'ATTAGAAACC']
%%
s3 = [s2 s]
%% Relation Expression

a = 3
%%
a == 3
%%
a == 4
%% Conditions If then else

% Syntax
% if expression
%    statements
% elseif expression
%    statements
% else
%    statements
% end
%%

a = 1;
if a > 5
    "yes"
else
    "no"
end
%%
a = 10
if a > 5
    "yes"
else
    "no"
end
%% For Loop

% https://www.mathworks.com/help/matlab/ref/for.html
%
% for index = initVal:endVal
%   statements
%  end
%
% Increment the index variable from initVal to endVal by 1, and repeat execution of statements until index is greater than endVal.

% Clear the variables in workspace
clearvars;
% reload basic.mat variables into workspace
load basic.mat
% show variable a
a

for i = 1:3
    % print out the a matrix from row 1 till row 3
    a(i,:)
end
%% Function

% calling function multiply_two_nums

multiply_two_nums(2, 4)