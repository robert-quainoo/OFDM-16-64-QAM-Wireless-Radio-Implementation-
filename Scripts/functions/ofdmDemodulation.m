function symbols = ofdmDemodulation(rOFDM, nFFT, nOFDMsymbols, nCP, osf)
    %OFDMDEMODULATION Performs OFDM demodulation on the input signal.
    %
    % Input:
    %   rOFDM           Complex baseband OFDM signal.
    %   nFFT            Number of subcarriers (FFT length).
    %   nOFDMsymbols    Number of OFDM symbols.
    %   nCP             Cyclic prefix length.
    %   osf             Oversampling factor.
    %
    % Output:
    %   symbols         Complex-valued symbols.

    nFFTosf = nFFT * osf;
    nCPosf = nCP * osf;

    % Serial-to-Parallel Converter (S/P).
    ofdmGridTimeCP = reshape(rOFDM,nFFTosf + nCPosf, nOFDMsymbols);

    % Remove cyclic prefix.
    ofdmGridTime = ofdmGridTimeCP(nCPosf + 1:end, :);

    % Perform FFT.
    x = fft(ofdmGridTime, [], 1);
    ofdmGridFreqOversampled = fftshift(x, 1);

    % Downsampling is achieved by removing the null subcarriers.
    numGuardBandSub = (osf - 1)*nFFT/2;
    ofdmGridFreq  = ofdmGridFreqOversampled(numGuardBandSub + 1 : end - numGuardBandSub, :);

    % Remove DC null.
    symbols = ofdmGridFreq;
    symbols(nFFT / 2 + 1, :) = []; % remove the DC subcarrier

end
