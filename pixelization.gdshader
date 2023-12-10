shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform int pixel_size = 4;

void fragment()
{
	ivec2 texture_size = textureSize(screen_texture , 0);
	float x_factor = float(texture_size.x) / float(pixel_size);
	float y_factor = float(texture_size.y) / float(pixel_size);
	float uv_x = round(SCREEN_UV.x * x_factor) / x_factor;
	float uv_y = round(SCREEN_UV.y * y_factor) / y_factor;
	vec4 pixelized_texture = texture(screen_texture , vec2(uv_x, uv_y));
	COLOR = pixelized_texture;
}
