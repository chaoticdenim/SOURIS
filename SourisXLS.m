%% Import data from spreadsheet
function C = SourisXLS(filename)
[NUM,TXT,~]= xlsread(filename);
[NoOfRows,NoOfColumn]= size(NUM);

for i = 2:NoOfColumn
    if (uint8(TXT{1,i}(3))>47 && uint8(TXT{1,i}(3))<57)
        TXT{1,i}=(uint8(TXT{1,i}(1))-48)*100 +(uint8(TXT{1,i}(2))-48)*10 +(uint8(TXT{1,i}(3))-48) ; %The number is bigger than 100
    else if (uint8(TXT{1,i}(2))>47 && uint8(TXT{1,i}(2))<57)                    
            TXT{1,i}=(uint8(TXT{1,i}(1))-48)*10 +(uint8(TXT{1,i}(2))-48);                           %The number is bigger than 10
        else
            TXT{1,i}=uint8(TXT{1,i}(1))-48;
        end
    end
end
C={TXT;NUM};
