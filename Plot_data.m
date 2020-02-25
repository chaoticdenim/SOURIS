was_cell_activated(2)
make_plot_for(2, 0)

function res = make_plot_for(col, withThreshold, file)
    [time, data] = load_and_process(col, file);
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

function res = was_cell_activated(col)
    [~, data] = load_and_process(col);
    threshold=3*std(data);
    bools=data >= threshold;
    if any(bools)
        res=1;
    else
        res=0;
    end
end

