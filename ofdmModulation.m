function sOFDM = ofdmModulation(symbols, nFFT, nOFDMsymbols, nCP, osf)
    % OFDMMODULATION Performs OFDM modulation on the input symbols.
    %
    % Input:
    %   symbols         Complex-valued symbols.
    %   nFFT            Number of subcarriers (FFT length).
    %   nOFDMsymbols    Number of OFDM symbols.
    %   nCP             Cyclic prefix length.
    %   osf             Oversampling factor.
    %
    % Output:
    %   sOFDM           Complex baseband OFDM signal.

    nFFTosf = nFFT * osf;
    nCPosf = nCP * osf;

    % Serial-to-Parallel Converter (S/P).
    ofdmGridFreq = reshape(symbols,[nFFT-1,nOFDMsymbols]);

    % Allocate null at the DC subcarrier.
    ofdmGridFreqDCNull = [ofdmGridFreq(1:nFFT/2, 1:nOFDMsymbols); zeros(1, nOFDMsymbols); ofdmGridFreq(nFFT/2 + 1:nFFT-1, 1: nOFDMsymbols)];
   % ofdmGridFreqDCNull = [ofdmGridFreq(1:nFFT/2-1, :); zeros(1, size(ofdmGridFreq, 2)); ofdmGridFreq(nFFT/2 + 1:nFFT-1, :)];


   % ofdmGridFreqDCNull = [ofdmGridFreq(1:nFFT/2-1, :); zeros(1, size(ofdmGridFreq, 2)); ofdmGridFreq(nFFT/2 + 1:nFFT-1, :)];


    % Oversampling is achieved by padding the null subcarriers.
    numGuardbandsub = (osf -1)*nFFT/2;
    ofdmGridFreqOversampled = [zeros(numGuardbandsub, nOFDMsymbols); ofdmGridFreqDCNull;  zeros(numGuardbandsub, nOFDMsymbols)];

    % Perform IFFT.
    X = ifftshift(ofdmGridFreqOversampled, 1);
    ofdmGridTime = ifft(X, [], 1);

    %we converted the oversampling data to time domain and at parallel to
    %serial converter we convert our matrix into a vector(ofdmGridTimeCP by 1)

    % Append cyclic prefix.
    ofdmGridTimeCP = [ofdmGridTime(end-nCPosf+1:end,:); ofdmGridTime];

    % Parallel-to-Serial Converter (P/S).
    sOFDM = reshape(ofdmGridTimeCP, [], 1);

    %serial converter we convert our matrix into a vector(ofdmGridTimeCP by 1)
end
