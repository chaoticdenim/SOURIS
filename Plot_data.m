[v,T,vT]=xlsread('Data_for_test.xlsx');
% 'xlsx' for excel 2007
%v: Double
%T and vT : cell
%use v containing numbers
t=v(:,1);
y=v(:,6);
%find index of 3 seconds
lowerBound=3000;
higherBound=4500;
[ d, ilx ] = min( abs( t-lowerBound ) );
[ d, ihx ] = min( abs( t-higherBound ) );
%get values to average
vals=y(ilx:ihx);
F0=mean(vals);
%if u have to plot second colon depending on first:
plot(t/1000,(y-F0)/F0)