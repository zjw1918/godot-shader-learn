shader_type canvas_item;

uniform sampler2D anim_graph;
uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 noise_tex = texture(noise, UV);

	float columns = 2.0;
	float x = mod(TIME, 1.0);
	float easing = texture(anim_graph, vec2(x, 1.0)).r;

	vec2 tiled_uv = mod(UV * columns + easing + noise_tex.r *.1, 1.0);
	vec4 mapped_tex = texture(TEXTURE, tiled_uv);

	COLOR = mix(noise_tex, mapped_tex, .9);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
