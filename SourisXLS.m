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
LABEL=cell2mat(TXT(:,2:end));
LABELF=zeros(1,NoOfColumn-1);
DATA=NUM(:,2:end);
DATAF=zeros(NoOfRows,NoOfColumn-1);
if LABEL(1,1)>LABEL(1,uint8(NoOfColumn/2))
        k=1;
        for i = 1:NoOfColumn-1
            LABELF(:,i)=LABEL(:,NoOfColumn-k);
            DATAF(:,i)=DATA(:,NoOfColumn-k);
            k=k+1;
        end
end
LABELT=zeros(1,NoOfColumn);
LABELT(:,:)=[NaN, LABELF];
DATAT=zeros(NoOfRows,NoOfColumn);
DATAT(:,:)=[NUM(:,1),DATAF];
C=[LABELT;DATAT];

end
