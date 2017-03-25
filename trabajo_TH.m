clear all
p=10;
%difonemas

%N_datos=218;
%N_datos=3;
%N_datos=18;
%datos=['_a' '_b' '_d' '_e' '_f' '_g' '_i' '_j' '_k' '_l' '_m' '_n' '_o' '_p' '_s' '_t' '_u' '_Y' '_z' '_ñ' 'a_' 'ab' 'ad' 'ae' 'af' 'ag' 'ai' 'aj' 'ak' 'al' 'am' 'an' 'ao' 'ap' 'ar' 'as' 'at' 'au' 'ay' 'az' 'añ' 'ba' 'be' 'bi' 'bl' 'bo' 'br' 'bu' 'co' 'da' 'db' 'de' 'di' 'do' 'du' 'e_' 'eb' 'ed' 'ef' 'eg' 'ei' 'ek' 'el' 'em' 'en' 'eo' 'ep' 'er' 'es' 'et' 'ey' 'ez' 'fa' 'fe' 'fi' 'fo' 'fu' 'ga' 'gi' 'go' 'gu' 'i_' 'ia' 'ib' 'id' 'ie' 'if' 'ij' 'ik' 'il' 'im' 'in' 'io' 'ip' 'is' 'it' 'iy' 'iz' 'iñ' 'ja' 'je' 'ji' 'jn' 'jo' 'ju' 'ka' 'ke' 'ki' 'kn' 'ko' 'ks' 'kt' 'ku' 'l_' 'la' 'le' 'li' 'lo' 'lt' 'lu' 'ma' 'mb' 'me' 'mi' 'mo' 'mp' 'mu' 'n_' 'na' 'nd' 'ne' 'ni' 'nj' 'nk' 'no' 'ns' 'nt' 'nu' 'nz' 'o_' 'ob' 'od' 'oe' 'of' 'og' 'oi' 'oj' 'ok' 'ol' 'om' 'on' 'op' 'or' 'os' 'ot' 'oy' 'oñ' 'pa' 'pe' 'pi' 'po' 'pr' 'pu' 'r_' 'ra' 'rd' 're' 'ri' 'rj' 'rl' 'rn' 'ro' 'rt' 'ru' 's_' 'sa' 'se' 'si' 'so' 'sp' 'st' 'su' 'ta' 'te' 'ti' 'to' 'tr' 'tu' 'u_' 'ua' 'ub' 'uc' 'ue' 'ui' 'uj' 'uk' 'ul' 'um' 'un' 'ur' 'us' 'ut' 'uy' 'uz' 'uñ' 'ya' 'ye' 'yo' 'yu' 'z_' 'za' 'ze' 'zi' 'zo' 'zu' 'ñe' 'ño' 'ñu'];
%datos=['_rr' 'err' 'rre'];
%datos=['_a_2' '_e_2' '_t_2' 'an_2' 'e__2' 'en_2' 'es_2' 'im_2' 'la_2' 'n__2' 'ne_2' 'ni_2' 'os_2' 'po_2' 's__2' 's__3' 'si_2' 'te_2'];

%trifonemas

%N_datos=58;
%N_datos=4;
%datos=['_ap' '_co' '_de' '_el' '_es' '_im' '_la' '_no' '_op' '_pe' '_sa' '_te' '_ti' 'ame' 'an_' 'apr' 'ar_' 'bar' 'ble' 'ekn' 'ene' 'ent' 'es_' 'ibl' 'ien' 'ika' 'imp' 'ion' 'izi' 'kam' 'ke_' 'kni' 'kol' 'la_' 'las' 'le_' 'men' 'mpo' 'ne_' 'nes' 'nik' 'nte' 'oba' 'oke' 'ola' 'one' 'opo' 'osi' 'pos' 'pro' 'rob' 'san' 'sib' 'siz' 'te_' 'tek' 'tie' 'zio'];
%datos=['_rro' 'erro' 'perr' 'rro_'];


%palabras
N_datos=2;
%datos=['i'];
%datos=['ai' 'de' 'di' 'el' 'en' 'es' 'la' 'no' 'oi' 'su' 'un'];
%datos=['era' 'fue' 'las' 'los' 'mas' 'san' 'sin'];
%datos=['aora' 'atun' 'ayer' 'gana' 'kola' 'olor' 'para' 'roke'];
%datos=['perro' 'saeta' 'tiene'];
%datos=['animal' 'asijno' 'blanka' 'dinero' 'juebes' 'komida' 'sebiya' 'taurus'];
%datos=['apodado' 'aprobar' 'biernes' 'bijilar' 'español' 'gorilas' 'intenso'];
%datos=['abandona' 'estefano' 'profesor' 'trabajos' ];
%datos=['arjentino' 'demasiado' 'imposible' 'zoolojiko'];
%datos=['ipopotamos' 'libremente'];
%datos=['oposiziones'];
datos=['konsultarles' 'teknikamente'];

%ruta1=sprintf('C:\\Users\\nacho\\Desktop\\ignacio\\cuarto\\primer cuatrimestre\\tecnologias del habla\\practicas\\trabajo_TH\\difonemas');
%ruta2=sprintf('C:\\Users\\nacho\\Desktop\\ignacio\\cuarto\\primer cuatrimestre\\tecnologias del habla\\practicas\\trabajo_TH\\trifonemas');
ruta3=sprintf('C:\\Users\\nacho\\Desktop\\ignacio\\cuarto\\primer cuatrimestre\\tecnologias del habla\\practicas\\trabajo_TH\\palabras');
cd(ruta3);
%for i=1:2:2*N_datos
%for i=1:2:2*N_datos
for i=1:12:12*N_datos
    %[signal Fs]=wavread(strcat(char(datos(i)),'.wav'));
    %[signal Fs]=wavread(strcat(char(datos(i:i+1)),'.wav'));
    %[signal Fs]=wavread(strcat(char(datos(i:i+2)),'.wav'));
    [signal Fs]=wavread(strcat(char(datos(i:i+11)),'.wav'));
    clear coeficientes
    clear ganancias
    N_muestras=floor(Fs*10*10^-3);
    Total_muestras=length(signal);
    coeficientes=[]; 
    ganancias=[]; 
    for j=1:N_muestras:Total_muestras
        if j+N_muestras-1<=Total_muestras
            trama=signal(j:j+N_muestras-1);
        elseif Total_muestras-(j+N_muestras-1)>1
            trama=signal(j:end);
        end
        [a,g]=lpc(trama,p);
        coeficientes=[coeficientes a];
        ganancias=[ganancias g];
        
    end
    archivo_coeficientes=['coeficientes_LPC' datos(i:i+11)];
    savefile=strcat(char(archivo_coeficientes),'.mat');
    save(savefile,'coeficientes')
    archivo_coeficientes=['Ganancia_LPC' datos(i:i+11)];
    savefile=strcat(char(archivo_coeficientes),'.mat');
    save(savefile,'ganancias')
    
end