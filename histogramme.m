function histogramme
    voltages = {300, 400, 500,600};
    NoActiveCell = {0, 0, 0, 0};
    for i = 1:length(voltages)
        voltage = voltages{i};
        [time,~, DATAF] = Average5(voltage);
        for roi = 1:229
            res = check_activ(DATAF, time, roi);
            if res == 1
                NoActiveCell{i} = NoActiveCell{i} + 1;
            end
        end
    end
    histogram(NoActiveCell)
end