shader_type canvas_item;

#include "res://shaders/debug_utils.gdshaderinc"
#include "res://shaders/character.gdshaderinc"

uniform sampler2D zebra_simpler2d;

group_uniforms examples_bool;
uniform bool b_visualable;
uniform bvec2 bv_visuals;
group_uniforms;

void apply_zombie_zebra_tex(inout vec3 c, vec2 uv, sampler2D tex, sampler2D second_tex) {
	vec4 original_tex = texture(tex, uv);
	vec4 zebra_tex = texture(second_tex, uv);
	original_tex.rgb *= vec3(.7, .8, .7);
	vec3 mixed_zombie_zebra = mix(original_tex.rgb, zebra_tex.rgb, .1);
	c.rgb = mixed_zombie_zebra;
}

void vertex() {
	breath(VERTEX, 4.0);
}

void fragment() {
	if (!b_visualable) {
		discard;
	}
	if (bv_visuals.x) {
		COLOR.r *= .5;
	}
	if (bv_visuals.y) {
		COLOR.g *= .5;
	}

	#ifdef DEBUG_MODE_ON
	debug_draw_dots_at_vertices(UV, COLOR, TEXTURE);
	#endif

	apply_zombie_zebra_tex(COLOR.rgb, UV, TEXTURE, zebra_simpler2d);
}



//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
