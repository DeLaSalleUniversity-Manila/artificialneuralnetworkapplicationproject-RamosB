%Accuracy
load('ANN3');
n = 100; %Adjust Number of Test inputs
testoutput = zeros(n,1);
count = 0;
for i = 1:n
    %Predict Values
    a = input(i,:);
    testoutput(i,1) = round(net(a'));
    
    %Count the number of correct outputs
    z = testoutput(i,1) - target(i,1); 
    if(z==0)
       count = count + 1;
    end
end

accuracy = (count/n)*100