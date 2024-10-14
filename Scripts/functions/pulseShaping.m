function s = pulseShaping(symbols, sps)
    %PULSESHAPING Generates the complex baseband samples after pulse shaping.
    %
    % Input:
    %   symbols    [symbols] Complex-valued symbols.
    %   sps        [Sa/symbol] Number of samples per symbol.
    %
    % Output:
    %   s          [samples] Complex baseband samples with pulse shaping.

    pulse = rcosdesign(0.75, 10, sps).'; % [samples] Design a square root raised cosine filter.

    s = conv(upsample(symbols, sps), pulse); % Upsample the symbols and then convolve with the pulse for pulse shaping.
end
