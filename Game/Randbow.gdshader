shader_type spatial;

uniform sampler2D gradient_img;
uniform float time_scaler = 0.1;
uniform float y_scaler = 0.1;

varying float texture_v;

void vertex()
{
	texture_v = VERTEX.y * y_scaler + TIME * time_scaler;
}

void fragment()
{
	ALBEDO = texture(gradient_img, vec2(texture_v, 0)).xyz;
}