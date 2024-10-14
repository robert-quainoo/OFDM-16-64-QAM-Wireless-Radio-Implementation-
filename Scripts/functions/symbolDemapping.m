function bits = symbolDemapping(symbols, M, modScheme)
    %SYMBOLDEMAPPING Demodulates the symbols to bits (ML Detection).
    % It finds what of the possible M symbols has the minimum distance to the received symbol,
    % and obtains the corresponding bits (with gray coding).
    %
    % Input:
    %   symbols      Complex value symbols.
    %   M            Modulation order.
    %   modScheme    "psk" or "qam".
    %
    % Output:
    %   bits         Data bits vector.

    if strcmp(modScheme, "psk")
        bits = pskdemod(symbols, M, OutputType="bit");
    elseif strcmp(modScheme, "qam")
        bits = qamdemod(symbols, M, OutputType="bit", UnitAveragePower=true);
    else
        error("Choose a valid modulation scheme.");
    end
end
