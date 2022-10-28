<?php
	// Inclusion du fichier Autoloader.php 
	include_once('lib/Twig/Autoloader.php');

	Twig_Autoloader::register(); // On Charge automatiquement les classes Twig

	// On déclare les variables templates et twig
	$templates = new Twig_Loader_Filesystem('templates');
	$twig      = new Twig_Environment($templates);
 ?>