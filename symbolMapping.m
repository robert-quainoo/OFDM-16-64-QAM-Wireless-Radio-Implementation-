function symbols = symbolMapping(bits, M, modScheme)
    %SYMBOLMAPPING Maps the array of bits into complex value symbols.
    %
    % Inputs:
    %   bits         Bits array.
    %   M            Modulation order.
    %   modScheme    "psk" or "qam".
    %
    % Outputs:
    %   symbols      Complex value symbols.

    if strcmp(modScheme, "psk")
        symbols = pskmod(bits, M, InputType="bit");
    elseif strcmp(modScheme, "qam")
        symbols = qammod(bits, M, InputType="bit", UnitAveragePower=true);
    else
        error("Choose a valid modulation scheme.");
    end
end
