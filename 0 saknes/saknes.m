clc, clearvars,format compact
syms x
f = 4+cos(2.*x+1) - 0.5.*x;
vpasolve(f, x)
roots(f)
FindBeta(f, -9999, 999999, 8)

function Bet = FindBeta(FrequencyEquation, StartAt, EndAt, NumberOfBetas)
    
    Bet = zeros(NumberOfBetas,1);
    syms B
    incStrt = 1e-9; % increment from previous root to start search for next root
    incEnd = 1e-2; % increment to add to upper bound of search range each time
    StrtRg = StartAt; % initial lower bound of search range
    for i = 1:NumberOfBetas
        EndRg = StrtRg + incEnd; % set initial upper bound of search range
        NoRoot = true;  % = true when we still haven't found the i-th root
        while NoRoot
            % try to get a root:
            Beti = vpasolve(FrequencyEquation,B, [StrtRg; EndRg]);
            
            if isempty(Beti)    % if we didn't find a root
                if EndRg > EndAt    % if we've already exceeded EndAt
                    Beti = NaN;         % indicate no such root exists using NaN
                    NoRoot = false;     % stop searching
                end
                
                EndRg = EndRg + incEnd; % increase upper bound of search range
                                        %   and then try again
            else                % if we found a root
                if Beti > EndRg     % if the root exceeds EndAt
                    Beti = NaN;         % indicate no such root exists using NaN
                end
                NoRoot = false;     % flag that a root has been found
            end
        end
        
        if isnan(Beti)  % if the upper bound has been exceeded
            Bet(i:end) = NaN;   % set all remaining roots to NaN
            return;             % and then exit function
        else            % otherwise
            Bet(i) = Beti;              % store found root
            StrtRg = Beti + incStrt;    % increase the start range and repeat
        end
    end
end