recObj = audiorecorder;
Fs = 8000;
disp('Grabando...')
recordblocking(recObj, 0.80);
disp('Fin de la grabación');
recGrabacion = getaudiodata(recObj);
plot(recGrabacion);
audiowrite('audio\recortes\recorte15.wav',recGrabacion,Fs);
[miGrabacion,Fs] = audioread('audio\recortes\recorte15.wav');
sound(miGrabacion,Fs);
%plot(miGrabacion);
%normalizar
%nGrabacion = normalizar(miGrabacion);
%plot(nGrabacion);
%tfMiGrabacion = abs(fft(miGrabacion));
%(tfMiGrabacion);

%Reconocimiento
% -- Internet Explorer
%[gIE,Fs] = audioread('BDVoz\IE.wav');
%tfIE = abs(fft(gIE));

% -- Word 2013
%[gWord,Fs] = audioread('BDVoz\word.wav');
%tfWord = abs(fft(gWord));

%eleccion
%error(1)=mean(abs(tfIE-tfMiGrabacion));
%error(2)=mean(abs(tfWord-tfMiGrabacion));

% --min_error= min(error);
%if min_error == error(1)
%   open('C:\Program Files (x86)\Internet Explorer/iexplore.exe');
%end
%if min_error == error(2)
  % open('C:\Program Files\Microsoft Office 15\root\office15\WINWORD.EXE');
%end
