void breath(inout vec2 v, float f) {
	float m = 0.1;
	float breath_anim = sin(TIME * f) * m;
	v *= 1.0 + breath_anim;
}

group_uniforms flash;
uniform float flash: hint_range(0.0, .8);
uniform vec3 flash_color: source_color;
group_uniforms;

void flash_on_hit(inout vec3 c) {
	c = mix(c, flash_color, flash);
}