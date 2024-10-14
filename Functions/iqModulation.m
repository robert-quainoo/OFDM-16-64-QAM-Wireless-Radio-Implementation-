function x = iqModulation(s, Fc)
    %IQMODULATION Generates the samples of the modulated RF signal.
    %
    % Input:
    %   s     Complex baseband samples.
    %   Fc    Normalized carrier frequency (RF or IF).
    %
    % Output:
    %   x     Samples of the IF signal.

    n = (0 : numel(s) - 1).';                 % Sample vector.
    x = real(s .* exp(1j * 2 * pi * Fc * n)); % IQ modulation.
end
