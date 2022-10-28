<?php

	// Integre le fichier de log d'erreurs
	include 'log/errors_log.php';

	// Integre le fichier d'include de twig
	include 'inc.twig.php';

	// Initialise le template twig
	$template_index = $twig->loadTemplate('index.tpl');

	// Initialise le nombre de jour de prévision
	$n_jours_previsions = 3;
	
	// Initialise la ville
	$ville = "Limoges"; 

	//~ Clé API
	//~ Si besoin, vous pouvez générer votre propre clé d'API gratuitement, en créant 
	//~ votre propre compte ici : https://home.openweathermap.org/users/sign_up
	$apikey = "10eb2d60d4f267c79acb4814e95bc7dc";

	// Requete à l'API incluant les données initialisées ci-dessus
	$data_url = 'http://api.openweathermap.org/data/2.5/forecast/daily?APPID='.$apikey.'&q='.$ville.',fr&lang=fr&units=metric&cnt='.$n_jours_previsions;

	// Recupération du contenu de la requete
	$data_contenu = file_get_contents($data_url);

	// Création du tableau des données de la requete
	$_data_array = json_decode($data_contenu, true);

	// Déclaration de la ville avec l'entré du tableau "city"
	$_ville = $_data_array['city'];

	// Déclaration des données meteorologique du jour avec l'entré du tableau "list"
	$_journees_meteo = $_data_array['list'];

	// Boucle pour parcourir le tableau obtenu avec $_data_array['list']
	for ($i = 0; $i < count($_journees_meteo); $i++) {

		// Obtention de l'image de la météo du jour
		$_meteo = getMeteoImage($_journees_meteo[$i]['weather'][0]['icon']);
		
		// Obtention des données de la météo du jour
		$_journees_meteo[$i]['meteo'] = $_meteo;
	}

	// Rendu du tableau des données
	echo $template_index->render(array(
		'_journees_meteo'	=> $_journees_meteo,
		'_ville'			=> $_ville,
		'n_jours_previsions'=> $n_jours_previsions
	));

	// Fonction pour obtenir l'image de la météo
	function getMeteoImage($code){
		if(strpos($code, 'n'))
			return 'entypo-moon';
		

		$_icones_meteo =array(
			'01d' => 'entypo-light-up',
			'02d' => 'entypo-light-up','03d' => 'entypo-cloud',
			'04d' => 'entypo-cloud','09d' => 'entypo-water', 
			'10d' => 'entypo-water',
			'11d' => 'entypo-flash',
			'13d' => 'entypo-star', 
			'50d' => 'entypo-air'
		);

		if(array_key_exists($code, $_icones_meteo)){
			return $_icones_meteo[$code];
		}else{
			return 'entypo-help';
		}
	}
?>