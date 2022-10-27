{# Inclusion du fichier top.tpl #}
{{ include('top.tpl') }}
<div class="preloader">
	<div class="preloader-top">
		<div class="preloader-top-sun">
			<div class="preloader-top-sun-bg"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-0"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-45"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-90"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-135"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-180"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-225"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-270"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-315"></div>
		</div>
	</div>
	<div class="preloader-bottom">
		<div class="preloader-bottom-line preloader-bottom-line-lg"></div>
		<div class="preloader-bottom-line preloader-bottom-line-md"></div>
		<div class="preloader-bottom-line preloader-bottom-line-sm"></div>
		<div class="preloader-bottom-line preloader-bottom-line-xs"></div>
	</div> 
</div>
<div class="wrapper">
	<section class="bordure">
	    <p>Météo</p>
	</section>

	<section class="contenu">
	    <h1>
			{# 
			 # On affiche le nom de la ville et le pays.
			 # 
			 # capitalize => met le premier caractère de la valeur en majuscule
			 # upper => convertit la valeur en majuscule
			 #}
	    	{{_ville.name|capitalize}},&nbsp{{ _ville.country|upper }}

			{# 
			 # {{_ville.coord.lat}} intègre la latitude de la ville dans l'URL
			 # {{_ville.coord.lon}} intègre la longitude de la ville dans l'URL
			 #}
	    	<a href="http://maps.google.com/maps?q={{_ville.coord.lat}},{{_ville.coord.lon}}" class="lk" target="_blank" title="Voir sur une carte">
	    		Voir sur une carte
	    	</a>
	    </h1>

		{# On parcourt les lignes du tableau #}
	    {% for journee in _journees_meteo %}
	    	<div class="jour">
	    		<div class="numero_jour">
					{# 
					 # Affiche la date sous le format d/m/Y 
					 # 
					 # &nbsp => entité de caractère qui désigne un espace
					 #}
	    			<h2>Météo du&nbsp{{journee.dt|date('d/m/Y')}}</h2>
	    		</div>
				
				{# 
				 # Intègre la class CSS correspondant à l'image de la météo actuel
				 # 
				 # {{ " " }} => permet de séparer les deux class CSS déclaré
				 #}
			    <div class="temperature {{ " " }} {{journee.meteo}}">
					{# Affiche la température #}
			      	<h2>{{journee.temp.day}}<span class="degree-symbol">°</span>C</h2>
			    </div>

			    <ul>
					<li class="fontawesome-leaf left">
						{# Affiche la vitesse du vent #}
						<span>{{journee.speed}} km/h</span>
					</li>
					<li class="fontawesome-tint center">
						{# Affiche le pourcentage d'humidité #}
						<span>{{journee.humidity}}%</span>
					</li>
					<li class="fontawesome-dashboard right">
						{# Affiche la pression atmosphérique #}
						<span>{{journee.pressure}}</span>
					</li>
			    </ul> 
			    <div class="description">
					{# 
					 # Affiche le temps 

					 # first => renvoie le premier "élément"
					#}
			    	Description :&nbsp{{journee.weather|first.description|capitalize}}
			    </div>
			</div>
	    {% endfor %}
		{# Fin de la boucle for #}

	    <div class="bullets">
			{# 
			 # Boucle allant de 1 à n_jours_previsions 
			 #
			 # .. => permet l'itération de la boucle sur une séquence de nombres
			 #}
	    	{% for i in 1..n_jours_previsions %}
				{# On cible le jour i-1 #}
	    		<span class="entypo-record" data-cible="{{i-1}}"></span>
	    	{% endfor %}
			{# Fin de la boucle for #}
	    </div>

	</section>
</div>
{# Inclusion du fichier bottom.tpl #}
{{ include('bottom.tpl') }}