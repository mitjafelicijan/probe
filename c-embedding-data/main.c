#include <stdio.h>
#include "raylib.h"

#include "data/armor.h"
#include "data/dejavusans-mono.h"

#define FONT_SIZE 24

int main(void) {
	SetConfigFlags(FLAG_WINDOW_RESIZABLE | FLAG_VSYNC_HINT | FLAG_WINDOW_HIGHDPI);
	InitWindow(900, 400, "Embedding assets");
	SetTargetFPS(60);
	
	// Load font from memory.
	Font font = LoadFontFromMemory(".ttf", data_dejavusans_mono_ttf, data_dejavusans_mono_ttf_len, FONT_SIZE, NULL, 0);
	SetTextureFilter(font.texture, TEXTURE_FILTER_TRILINEAR); // Font antialising.
	
	// Load image from memory and create texture from it.
	Image armor = LoadImageFromMemory(".png", data_armor_png, data_armor_png_len);
	Texture2D armor_texture = LoadTextureFromImage(armor);
	UnloadImage(armor);

	while (!WindowShouldClose()) {
		BeginDrawing();
		ClearBackground(BLACK);
		
		// Draw the armor texture.
		DrawTexture(armor_texture, 20, 20, WHITE);
		
		// Draw some text on the screen.
		DrawTextEx(font, "Hello embedded assets.", (Vector2){ 400, 20 }, FONT_SIZE, 0, WHITE);
		DrawTextEx(font, "This is example how we can use embedded fonts.", (Vector2){ 400, 50 }, FONT_SIZE - 4, 0, WHITE);
		
		EndDrawing();
	}
        
        UnloadTexture(armor_texture);
	CloseWindow();
	return 0;
}
