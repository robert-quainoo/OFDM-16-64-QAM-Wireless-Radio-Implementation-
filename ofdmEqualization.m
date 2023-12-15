function rDataEqualized = ofdmEqualization(rData, r, s)
    %EQUALIZATION Applies a FIR filter to equalize the channel impulse response.
    %
    % Input:
    %   rData             Received data.
    %   r                 Received pilot.
    %   s                 Original pilot.
    %
    % Output:
    %   rDataEqualized    Equalized data.

    % Channel Frequency Estimation
    H = sum(conj(s) .* r, 2) ./ sum(abs(s) .^ 2, 2);

    % Channel Frequency Equalization
    rDataEqualized = rData ./H;
    rDataEqualized = rDataEqualized(:);
end
