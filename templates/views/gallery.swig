{% extends "../layouts/default.swig" %}
{% import "../mixins/panel_title.swig" as PanelTitle%}

{% block content %}
	<div class="container">

		{{ PanelTitle.renderTitle('Albums') }}

		<div  class="occ-album">		
			{% if galleries.length %}
				<div class="row">
					{% for gallery in galleries %}
						{% if gallery.images.length %}
							{% set defaultImg = gallery.images[0] %}
							{% if gallery.heroImage.exists %}
								{% set defaultImg = gallery.heroImage %}
							{% endif %}
							<a href="/gallery/{{ gallery.key }}" class="col-md-4 ">
								{{ gallery.name }}
								{% if defaultImg %}
								<img src="{{ defaultImg._.limit(300,300) }}" class="occ-hero-img" />
								{% endif %}
							</a>
						{% endif %}			
					{% endfor %}
				</div>
			{% else %}
				<h3 class="text-muted">Aucun album photos pour le moment.</h3>
			{% endif %}
		</div>
	</div>
{% endblock %}