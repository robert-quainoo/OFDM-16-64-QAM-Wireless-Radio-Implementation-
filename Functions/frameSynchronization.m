function yFrame = frameSynchronization(yFiltered, xHeader, nFrameSamples)
    %FRAMESYNCHRONIZATION Calculates the Generalized Maximum Likelihood (GML) Estimator of the delay,
    % i.e., it finds the argmax of the absolute value of the cross-correlation between the received signal and the
    % known header.
    %
    % Input:
    %   yFiltered        [samples] Received filtered signal.
    %   xHeader          [samples] Header.
    %   nFrameSamples    Number of frame samples.
    %
    % Output:
    %   yFrame           [samples] Received frame.

    y = abs(xcorr(yFiltered, xHeader)); % Compute the absolute value of the cross-correlation.

    [~, ind] = max(y); % Argmax of it.

    ini = ind - numel(yFiltered) + 1; % Index of when the frame starts.

    if ini + nFrameSamples - 1 > numel(yFiltered) % If the detected frame is incomplete (last one).
        [~, ind] = max(y(1 : ind - nFrameSamples + 1)); % Find the second maximum.
        ini = ind - numel(yFiltered) + 1; % Index of when the frame starts.
    end

    yFrame = yFiltered(ini + (0 : nFrameSamples - 1)); % Return the frame.
end
