#include "raylib.h"
#include "raylib_colors_plus.h" //Optional

int main(){
    InitWindow(900, 600, "Window");

    SetTargetFPS(60);

    while(!WindowShouldClose()){
        BeginDrawing();

            ClearBackground(OFFWHITE); // replace with RAYWHITE if not using raylib_colors_plus.h

            #ifdef _DEBUG
            DrawFPS(10, 10);
            #endif

        EndDrawing();
    }

    CloseWindow();

    return 0;
}