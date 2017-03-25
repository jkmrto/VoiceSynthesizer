datos_difonemas=['_rr' 'err' 'rre' '_a' '_b' '_d' '_e' '_f' '_g' '_i' '_j' '_k' '_l' '_m' '_n' '_o' '_p' '_s' '_t' '_u' '_y' '_z' '_ñ' 'a_' 'ab' 'ad' 'ae' 'af' 'ag' 'ai' 'aj' 'ak' 'al' 'am' 'an' 'ao' 'ap' 'ar' 'as' 'at' 'au' 'ay' 'az' 'añ' 'ba' 'be' 'bi' 'bl' 'bo' 'br' 'bu' 'co' 'da' 'db' 'de' 'di' 'do' 'du' 'e_' 'eb' 'ed' 'ef' 'eg' 'ei' 'ek' 'el' 'em' 'en' 'eo' 'ep' 'er' 'es' 'et' 'ey' 'ez' 'fa' 'fe' 'fi' 'fo' 'fu' 'ga' 'gi' 'go' 'gu' 'i_' 'ia' 'ib' 'id' 'ie' 'if' 'ij' 'ik' 'il' 'im' 'in' 'io' 'ip' 'is' 'it' 'iy' 'iz' 'iñ' 'ja' 'je' 'ji' 'jn' 'jo' 'ju' 'ka' 'ke' 'ki' 'kn' 'ko' 'ks' 'kt' 'ku' 'l_' 'la' 'le' 'li' 'lo' 'lt' 'lu' 'ma' 'mb' 'me' 'mi' 'mo' 'mp' 'mu' 'n_' 'na' 'nd' 'ne' 'ni' 'nj' 'nk' 'no' 'ns' 'nt' 'nu' 'nz' 'o_' 'ob' 'od' 'oe' 'of' 'og' 'oi' 'oj' 'ok' 'ol' 'om' 'on' 'op' 'or' 'os' 'ot' 'oy' 'oñ' 'pa' 'pe' 'pi' 'po' 'pr' 'pu' 'r_' 'ra' 'rd' 're' 'ri' 'rj' 'rl' 'rn' 'ro' 'rt' 'ru' 's_' 'sa' 'se' 'si' 'so' 'sp' 'st' 'su' 'ta' 'te' 'ti' 'to' 'tr' 'tu' 'u_' 'ua' 'ub' 'uc' 'ue' 'ui' 'uj' 'uk' 'ul' 'um' 'un' 'ur' 'us' 'ut' 'uy' 'uz' 'uñ' 'ya' 'ye' 'yo' 'yu' 'z_' 'za' 'ze' 'zi' 'zo' 'zu' 'ñe' 'ño' 'ñu'];
datos_difonemas2=['_a_2' '_e_2' '_t_2' 'an_2' 'e__2' 'en_2' 'es_2' 'im_2' 'la_2' 'n__2' 'ne_2' 'ni_2' 'os_2' 'po_2' 's__2' 's__3' 'si_2' 'te_2'];
datos_trifonemas=['_rro' 'erro' 'perr' 'rro_' '_ap' '_co' '_de' '_el' '_es' '_im' '_la' '_no' '_op' '_pe' '_sa' '_te' '_ti' 'ame' 'an_' 'apr' 'ar_' 'bar' 'ble' 'ekn' 'ene' 'ent' 'es_' 'ibl' 'ien' 'ika' 'imp' 'ion' 'izi' 'kam' 'ke_' 'kni' 'kol' 'la_' 'las' 'le_' 'men' 'mpo' 'ne_' 'nes' 'nik' 'nte' 'oba' 'oke' 'ola' 'one' 'opo' 'osi' 'pos' 'pro' 'rob' 'san' 'sib' 'siz' 'te_' 'tek' 'tie' 'zio'];
palabras1=['i'];
palabras2=['ai' 'de' 'di' 'el' 'en' 'es' 'la' 'no' 'oi' 'su' 'un'];
palabras3=['era' 'fue' 'las' 'los' 'mas' 'san' 'sin'];
palabras4=['aora' 'atun' 'ayer' 'gana' 'kola' 'olor' 'para' 'roke'];
palabras5=['perro' 'saeta' 'tiene'];
palabras6=['animal' 'asijno' 'blanka' 'dinero' 'juebes' 'komida' 'sebiya' 'taurus'];
palabras7=['apodado' 'aprobar' 'biernes' 'bijilar' 'español' 'gorilas' 'intenso'];
palabras8=['abandona' 'estefano' 'profesor' 'trabajos' ];
palabras9=['arjentino' 'demasiado' 'imposible' 'zoolojiko'];
palabras10=['ipopotamos' 'libremente'];
palabras11=['oposiziones'];
palabras12=['konsultarles' 'teknikamente'];

datos_difonemas=modificar_erre(datos_difonemas);
datos_difonemas2=modificar_erre(datos_difonemas2);
datos_trifonemas=modificar_erre(datos_trifonemas);

datos_difonemas=redistribuir(datos_difonemas,2);
datos_difonemas2=redistribuir(datos_difonemas2,4);
datos_trifonemas=redistribuir(datos_trifonemas,3);
datos_palabras=redistribuir_espacios(palabras12,[],12);
datos_palabras=redistribuir_espacios(palabras11,datos_palabras,11);
datos_palabras=redistribuir_espacios(palabras10,datos_palabras,10);
datos_palabras=redistribuir_espacios(palabras9,datos_palabras,9);
datos_palabras=redistribuir_espacios(palabras8,datos_palabras,8);
datos_palabras=redistribuir_espacios(palabras7,datos_palabras,7);
datos_palabras=redistribuir_espacios(palabras6,datos_palabras,6);
datos_palabras=redistribuir_espacios(palabras5,datos_palabras,5);
datos_palabras=redistribuir_espacios(palabras4,datos_palabras,4);
datos_palabras=redistribuir_espacios(palabras3,datos_palabras,3);
datos_palabras=redistribuir_espacios(palabras2,datos_palabras,2);
datos_palabras=redistribuir_espacios(palabras1,datos_palabras,1);

vector_orden=[' ';'a';'b';'c';'d';'e';'f';'g';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'r';'R';'s';'t';'u';'x';'y';'z';'_'];

datos_valor_trifonemas=hallar_valor(datos_trifonemas,vector_orden);
datos_valor_difonemas=hallar_valor(datos_difonemas,vector_orden);
datos_valor_difonemas2=hallar_valor(datos_difonemas2,vector_orden);
datos_valor_palabras=hallar_valor(datos_palabras,vector_orden);

