fileID = fopen ('Cammino_4.txt');
datinexus = textscan (fileID, '%s %s %s %s');
fclose (fileID); 
celldisp (datinexus);
%I dati acquisiti sono ordinati in una matrice cella nX4 
%rispettivamente x y z e distanza temporale in millisecondi 
%tra un campionamento ed il successivo 
%E' necessario estrarre le singole componenti creando delle matrici cella nX1  
% successivamente i dati classificati come celle 
%devono essere trasformati in valori numerici

% Estrazione delle singole componenti attraverso la creazione di tre
% vettori
x = datinexus {1};
y = datinexus {2}; 
z = datinexus {3}; 
%Trasformazione in valori numerici
xx=cellfun(@str2num,x);
yy=cellfun(@str2num,y);
zz=cellfun(@str2num,z);
% Determinazione delmodulo dell'acelerazione nell'i-esimo istante
Xx = xx.^2;
Yy = yy.^2;
Zz = zz.^2;
Aa= Xx+Yy+Zz; 
Asqr = Aa.^0.5;
% determiniamo il valore medio e la varianza dell'accelerazione sull'asse 
%X Y Z e la norma delle tre componenti
m = length(xx);
xmedio4= sum(xx)/m;
ymedio4= sum(yy)/m;
zmedio4= sum(zz)/m;
Asqrmedio4=sum(Asqr)/m;
Xmediomatrice= xmedio4*(ones(m,1));
Ymediomatrice= ymedio4*(ones(m,1));
Zmediomatrice= zmedio4*(ones(m,1));
Asqrmatrice=  Asqrmedio4*(ones(m,1));
VarX4= (sum((xx-Xmediomatrice).^2))/m;
VarY4= (sum((yy-Ymediomatrice).^2))/m;
VarZ4= (sum((zz-Zmediomatrice).^2))/m;
VarAsqr4 = (sum((Asqr-Asqrmatrice).^2))/m;


