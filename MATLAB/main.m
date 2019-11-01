function []= main()
    clc
    clear
    close all
    disp('Proyecto: Asistente de voz');
    disp(' ');
    pause(0.5);
    disp('CARGANDO ');
    pause(1);
    disp('... ');
    vocabulary = Vocabulary;
    prediction = '';
    ch=0;
    poss=4;
    while ch~=poss
        ch=menu('Sistema de Reconocimiento','1: Entrenar',...
            '2: Detección','3: Abrir programa','4: Salir');
        disp('                                                              ');
        %% 1: Entrenar...
        if ch==1
            [audio_signals, word_labels] = load_audio_from_folder('audio');
            display(sprintf('Loaded a total of %d audio signals for the following words:', length(audio_signals)))
            display(unique(word_labels))
            predicted_word_labels = vocabulary.train_test(audio_signals', word_labels', audio_signals');
            disp('End training');
        end
        %% 2: Detección
        if ch==2
            disp('Iniciando detección');
            recObj = audiorecorder;
            Fs = 8000;
            disp('Grabando...');
            recordblocking(recObj, 0.80);
            disp('Fin de la grabación');
            recGrabacion = getaudiodata(recObj);
            plot(recGrabacion);
            audiowrite('BDVoz\voz\muestra.wav',recGrabacion,Fs);
            [miGrabacion,Fs] = audioread('BDVoz\voz\muestra.wav');
            [audio_signalsF word_labelsF] = load_audio_from_folder('BDVoz');
            disp('Calculando...');
            prediction = vocabulary.recognize(audio_signalsF');
            display(prediction);
        end
        %% 3: Abrir programa
        if ch==3
            disp('Abriendo programa...');
            if (strcmp(prediction,'calculadora'))
                open('');
            end
            if (strcmp(prediction,'musica'))
                open('');
            end
            if (strcmp(prediction,'paint'))
                open('');
            end
            if (strcmp(prediction,'recortes'))
                open('');
            end
        end
    end
    close all;
    msgbox('Gracias por su atención.',':)','help');
end
