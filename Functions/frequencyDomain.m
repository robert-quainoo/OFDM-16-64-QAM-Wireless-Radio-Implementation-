function [Px, f] = frequencyDomain(x, Fs, type)
    %FREQUENCYDOMAIN Calculates the power spectrum.
    %
    % Input:
    %   x       Time domain signal.
    %   Fs      [Sa/s] Sampling frequency.
    %   type    "single" (single-sided power) or "double" (double-sided power).
    %
    % Output:
    %   Px      Power spectrum.
    %   f       [Hz] Frequency vector.

    L = numel(x);
    NFFT = 2 ^ nextpow2(L);
    X = fft(x, NFFT) / L;

    if strcmp(type, "double")
        f = Fs / 2 * linspace(-1, 1, NFFT);
        Px = fftshift(abs(X) .^ 2);
    elseif strcmp(type, "single")
        f = Fs / 2 * linspace(0, 1, NFFT / 2 + 1);
        Px = abs(X(1 : NFFT / 2 + 1)) .^ 2;
        Px(2 : end - 1) = 2 * Px(2 : end - 1);
    else
        error("Error: Invalid type. Use ''single'' or ''double''.");
    end
end
