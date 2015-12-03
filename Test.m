%Accuracy
%a seperate set of data will be used for obtaining the accuracy
load('ANN3');
n = 50; %Adjust Number of Test inputs
testoutput = zeros(n,1);
count = 0;
for i = 1:n
    %Predict Values
        a = testinput(i,:);
    %Roundoff answer to 1 or 0
        testoutput(i,1) = round(net(a'));
    
    %Compare predicted from expected output
        z = testoutput(i,1) - testtarget(i,1);
    %Count the number of correct outputs
    if(z==0)
       count = count + 1;
    end
end

accuracy = (count/n)*100

%Confusion Matrix
p1a1 = 0;
p1a0 = 0;
p0a1 = 0;
p0a0 = 0;
for l = 1:n
    %Compare predicted from expected output
    if(testoutput(l,1) == 1)
        y = testoutput(l,1) - testtarget(l,1);
        if(y == 0) %if prediction is correct
            p1a1 = p1a1 + 1;
        else
            p1a0 = p1a0 + 1;
        end
    else
        y = testoutput(l,1) - testtarget(l,1);
        if(y == 0) %if prediction is correct
            p0a0 = p0a0 + 1;
        else
            p0a1 = p0a1 + 1;
        end
    end
    
end

fprintf('Confusion Matrix\n')
disp('           |Predicted 1 | Predicted 0|')
fprintf('| Actual 1 |    %d            %d\n', p1a1, p0a1)
fprintf('| Actual 0 |    %d            %d\n', p1a0, p0a0)