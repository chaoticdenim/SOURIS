function histogramme
    voltages = {300, 400, 500,600};
    NoActiveCell = {0, 0, 0, 0};
    for i = 1:length(voltages)
        voltage = voltages{i};
        [~, DATA, ~] = average5(voltage);
        DATA(:,229)
        for j = 1:229
            voltage
            j
            res = check_activ(DATA, j);
            if res == 1
                NoActiveCell{i} = NoActiveCell{i} + 1;
            end
        end
    end
    histogram(NoActiveCell)
end