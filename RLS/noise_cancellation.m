% Load signals
external_noise = load('external_noise.txt');
noisy_speech = load('noisy_speech.txt');
clean_speech = load('clean_speech.txt');
Fs = 44100;

% Play the output
while true
    cmd = lower(input('\nType Press "1" to play clean speech, "2" to play full suppression, "3" to play partial suppression or "exit" to quit: ', 's'));    
    if strcmp(cmd, '1')
        fprintf('Playing clean speech...\n');
        soundsc(clean_speech, Fs);
    elseif strcmp(cmd, '2')
        y_rls = RLS(external_noise, noisy_speech, clean_speech, Fs);
        fprintf('Playing RLS full suppression mode...\n');
        audiowrite('filtered_voice_RLS.wav', y_rls, Fs); %saving audioo file
        soundsc(y_rls, Fs);
    elseif strcmp(cmd, '3')
        retain_freqs = input('Enter the array values in square brackets (e.g. [1.2, 3.4, 5]): ');
        y_rls_partial = RLS_partial(noisy_speech, external_noise, retain_freqs, Fs, clean_speech);
        fprintf('Playing RLS partial suppression mode... \n');
        audiowrite('practical_voice_RLS.wav', y_rls_partial, Fs); 
        soundsc(y_rls_partial, Fs)
    elseif strcmp(cmd, 'exit')
        fprintf('Exiting playback.\n');
        break;
    else
        fprintf('Unknown command. Try "1", "2", "3" or "exit".\n');
    end
end