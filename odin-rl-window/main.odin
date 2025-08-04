package main

import "core:fmt"
import rl "vendor:raylib"

main :: proc() {
	rl.SetConfigFlags({.VSYNC_HINT, .WINDOW_RESIZABLE, .WINDOW_HIGHDPI})
	rl.InitWindow(1280, 720, "Raylib Window")

	rl.SetTargetFPS(500)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.DARKBLUE)
		rl.DrawRectangleV(rl.Vector2{ 200, 200 }, rl.Vector2{ 200, 200 }, rl.WHITE)
		rl.DrawFPS(rl.GetScreenWidth() - 100, 20);
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
