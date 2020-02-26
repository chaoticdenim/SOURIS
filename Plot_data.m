% Example usage:
% was_cell_activated(2, 'Data_for_test.xlsx')
% make_plot_for(2, 0, 'Data_for_test.xlsx')

function Plot_data(roi, withThreshold, file)
    [time, data] = load_and_process(roi, file);
    %plot F as a function of time
    plot(time, data)
    hold on
    if withThreshold == true
        threshold=3*std(data);
        plot(time,ones(size(time)) * threshold)
    end
    hold off
end

function [time, data] = load_and_process(col, file)
    [v,T,vT]=xlsread(file);
    %v: Double
    %T and vT : cell
    %use v containing numbers
    t=v(:,1);
    y=v(:,col);
    %find index of 3 seconds
    lowerBound=3000;
    higherBound=4500;
    [ ~, ilx ] = min(abs(t-lowerBound));
    [ ~, ihx ] = min(abs(t-higherBound));
    %get baseline
    baseline=y(ilx:ihx);
    F0=mean(baseline);
    data_norm=(y-F0)/F0;
    time=t/1000;
    data=data_norm;
end

function res = was_cell_activated(cell, file)
    [t, data] = load_and_process(cell, file);
    %Only look between 5 and 5.5 seconds
    threshold=3*std(data);
    [ ~, ilx ] = min(abs(t-5));
    [ ~, ihx ] = min(abs(t-5.5));
    data=data(ilx:ihx)
    bools=data >= threshold;
    if any(bools)
        res=1;
    else
        res=0;
    end
end

