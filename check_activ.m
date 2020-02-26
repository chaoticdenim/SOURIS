function [res, bools] = check_activ(voltage, roi)
    [time, avg, ~] = average5(voltage, roi);
    %Only look between 5 and 5.5 seconds
    threshold=3*std(avg);
    [ ~, ilx ] = min(abs(time-5));
    [ ~, ihx ] = min(abs(time-5.5));
    avg=avg(ilx:ihx);
    bools=avg >= threshold;
    if any(bools)  %If at any time in the interval we cross the threshold, then it is activated
        res=1;
    else
        res=0;
    end
end