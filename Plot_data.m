[v,T,vT]=xlsread('Data_for_test.xlsx');
%v: Double
%T and vT : cell
%use v containing numbers
t=v(:,1);
y=v(:,2);
%find index of 3 seconds
lowerBound=3000;
higherBound=4500;
[ startBaseline, ilx ] = min(abs(t-lowerBound));
[ endBaseline, ihx ] = min(abs(t-higherBound));
%get baseline
baseline=y(ilx:ihx);
F0=mean(baseline);
data_norm=(y-F0)/F0;
threshold=3*std(data_norm);

%plot F as a function of time
plot(t/1000, data_norm)
hold on
plot(t/1000,ones(size(t)) * threshold)
hold off