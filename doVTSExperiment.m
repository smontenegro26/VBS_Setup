function quitProg = doVTSExperiment(params, VTSOptions)

% quitProg = doExperiment(params)

% Set screen params
params = setScreenParams(params);

% Set fixation params

% params.display.fixX = 960;
% params.display.fixY = 540;
params.dstRect = [592 172 1328 908]; %for NYU3T
params         = setFixationParamsVTS(params);

% WARNING! ListChar(2) enables Matlab to record keypresses while disabling
% output to the command window or editor window. This is good for running
% experiments because it prevents buttonpresses from accidentally
% overwriting text in scripts. But it is dangerous because if the code
% quits prematurely, the user may be left unable to type in the command
% window. Command window access can be restored by control-C.
% ListenChar(2);

% loading mex functions for the first time can be
% extremely slow (seconds!), so we want to make sure that
% the ones we are using are loaded.
KbCheck;GetSecs;WaitSecs(0.001);


% Turn off screen warnings
Screen('Preference','VisualDebugLevel', 50);

% check for OpenGL
AssertOpenGL;

Screen('Preference','SkipSyncTests', params.skipSyncTests);

% Open the screen
%params.display = openScreen(params.display);

% to allow blending
%Screen('BlendFunction', params.display.windowPtr, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% set priority
Priority(params.runPriority);

% wait for go signal
% [~, quitProg] = VTS_pressKey2Begin(params);
% 
% if ~quitProg
    % Do the experiment!
    
    runVibrotactileTest ([],[],[],[],[], VTSOptions);
    
    % After experiment
    
    % Reset priority
    Priority(0);
    
    % Save (eventually TSV file)
    
% end

% Close the one on-screen and many off-screen windows
%closeScreen(params.display);
%ListenChar(1)

return;

