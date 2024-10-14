function waveformFormatConversion(sFrame, filename)
    %WAVEFORMFORMATCONVERSION Converts and saves complex baseband samples to the N5172B Signal Generator format.
    % The waveform is saved in the file named by the 'filename' string.

    waveform = zeros(2 * numel(sFrame), 1);

    % Interleave the I/Q samples.
    waveform(1 : 2 : end) = real(sFrame);
    waveform(2 : 2 : end) = imag(sFrame);

    waveform = waveform / max(abs(waveform)); % Normalize the waveform.
    waveform = int16(waveform * 32767); % Convert the waveform to 16-bit signed integers.

    % Create new file for writing bytes with big-endian ordering.
    fileID = fopen(strcat(filename, ".WAVEFORM"), "w", "b");

    fwrite(fileID, waveform, "int16"); % Write int16 data to the binary file.
    fclose(fileID); % Close the file.
end
