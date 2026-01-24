
// raylib colors plus V0.5 - A small raylib addon made by Quack-Duck12 (Jevis)
// Licensed under MIT

/*
To use include after raylib
eg.
    #include "raylib.h"
    #include "raylib_colors_plus.h"
*/

#ifndef RAYLIB_H
#else

#ifndef RAYLIB_COLORS_PLUS_H
#define RAYLIB_COLORS_PLUS_H

// =============================================================================
// Extended colors – missing basics, pastels, neon-ish, useful alpha variants
// =============================================================================
#define CYAN           CLITERAL(Color){   0, 255, 255, 255 }
#define TEAL           CLITERAL(Color){   0, 128, 128, 255 }
#define INDIGO         CLITERAL(Color){  75,   0, 130, 255 }
#define NAVY           CLITERAL(Color){   0,   0, 128, 255 }
#define OLIVE          CLITERAL(Color){ 128, 128,   0, 255 }
#define TURQUOISE      CLITERAL(Color){  64, 224, 208, 255 }
#define CORAL          CLITERAL(Color){ 255, 127,  80, 255 }
#define SALMON         CLITERAL(Color){ 250, 128, 114, 255 }
#define TOMATO         CLITERAL(Color){ 255,  99,  71, 255 }
#define CRIMSON        CLITERAL(Color){ 220,  20,  60, 255 }
#define TAN            CLITERAL(Color){ 210, 180, 140, 255 }
#define SIENNA         CLITERAL(Color){ 160,  82,  45, 255 }
#define CHOCOLATE      CLITERAL(Color){ 210, 105,  30, 255 }
#define PERU           CLITERAL(Color){ 205, 133,  63, 255 }

#define PASTEL_PINK    CLITERAL(Color){ 255, 182, 193, 255 }
#define PASTEL_GREEN   CLITERAL(Color){ 152, 251, 152, 255 }
#define PASTEL_BLUE    CLITERAL(Color){ 173, 216, 230, 255 }
#define PASTEL_YELLOW  CLITERAL(Color){ 255, 255, 153, 255 }
#define PASTEL_PURPLE  CLITERAL(Color){ 216, 191, 216, 255 }
#define PASTEL_ORANGE  CLITERAL(Color){ 255, 218, 185, 255 }

#define NEON_CYAN      CLITERAL(Color){   0, 255, 240, 255 }
#define NEON_MAGENTA   CLITERAL(Color){ 255,   0, 255, 255 }
#define NEON_GREEN     CLITERAL(Color){  57, 255,  20, 255 }
#define NEON_PURPLE    CLITERAL(Color){ 200,   0, 255, 255 }
#define ELECTRIC_BLUE  CLITERAL(Color){   0, 255, 255, 255 }

#define WHITE_HALF     CLITERAL(Color){ 255, 255, 255, 128 }
#define BLACK_HALF     CLITERAL(Color){   0,   0,   0, 128 }
#define GRAY_HALF      CLITERAL(Color){ 130, 130, 130, 128 }
#define RED_HALF       CLITERAL(Color){ 230,  41,  55, 128 }
#define GREEN_HALF     CLITERAL(Color){   0, 228,  48, 128 }
#define BLUE_HALF      CLITERAL(Color){   0, 121, 241, 128 }
#define BLACK_ALPHA_32 CLITERAL(Color){   0,   0,   0,  32 }
#define WHITE_ALPHA_40 CLITERAL(Color){ 255, 255, 255,  40 }

#define INDIANRED          CLITERAL(Color){205,  92,  92, 255}
#define LIGHTCORAL         CLITERAL(Color){240, 128, 128, 255}
#define DARKSALMON         CLITERAL(Color){233, 150, 122, 255}
#define LIGHTSALMON        CLITERAL(Color){255, 160, 122, 255}
#define FIREBRICK          CLITERAL(Color){178,  34,  34, 255}
#define DARKRED            CLITERAL(Color){139,   0,   0, 255}
#define LIGHTPINK          CLITERAL(Color){255, 182, 193, 255}
#define HOTPINK            CLITERAL(Color){255, 105, 180, 255}
#define DEEPPINK           CLITERAL(Color){255,  20, 147, 255}
#define MEDIUMVIOLETRED    CLITERAL(Color){199,  21, 133, 255}
#define PALEVIOLETRED      CLITERAL(Color){219, 112, 147, 255}

#define ORANGERED          CLITERAL(Color){255,  69,   0, 255}
#define DARKORANGE         CLITERAL(Color){255, 140,   0, 255}

#define LIGHTYELLOW        CLITERAL(Color){255, 255, 224, 255}
#define LEMONCHIFFON       CLITERAL(Color){255, 250, 205, 255}
#define LIGHTGOLDENRODYELLOW CLITERAL(Color){250, 250, 210, 255}
#define PAPAYAWHIP         CLITERAL(Color){255, 239, 213, 255}
#define MOCCASIN           CLITERAL(Color){255, 228, 181, 255}
#define PEACHPUFF          CLITERAL(Color){255, 218, 185, 255}
#define PALEGOLDENROD      CLITERAL(Color){238, 232, 170, 255}
#define KHAKI              CLITERAL(Color){240, 230, 140, 255}
#define DARKKHAKI          CLITERAL(Color){189, 183, 107, 255}

#define CORNSILK           CLITERAL(Color){255, 248, 220, 255}
#define BLANCHEDALMOND     CLITERAL(Color){255, 235, 205, 255}
#define BISQUE             CLITERAL(Color){255, 228, 196, 255}
#define NAVAJOWHITE        CLITERAL(Color){255, 222, 173, 255}
#define WHEAT              CLITERAL(Color){245, 222, 179, 255}
#define BURLYWOOD          CLITERAL(Color){222, 184, 135, 255}
#define ROSYBROWN          CLITERAL(Color){188, 143, 143, 255}
#define SANDYBROWN         CLITERAL(Color){244, 164,  96, 255}
#define GOLDENROD          CLITERAL(Color){218, 165,  32, 255}
#define DARKGOLDENROD      CLITERAL(Color){184, 134,  11, 255}
#define SADDLEBROWN        CLITERAL(Color){139,  69,  19, 255}

#define DARKOLIVEGREEN     CLITERAL(Color){ 85, 107,  47, 255}
#define OLIVEDRAB          CLITERAL(Color){107, 142,  35, 255}
#define YELLOWGREEN        CLITERAL(Color){154, 205,  50, 255}
#define DARKSEAGREEN       CLITERAL(Color){143, 188, 143, 255}
#define MEDIUMSEAGREEN     CLITERAL(Color){ 60, 179, 113, 255}
#define SEAGREEN           CLITERAL(Color){ 46, 139,  87, 255}
#define LIGHTSEAGREEN      CLITERAL(Color){ 32, 178, 170, 255}
#define LAWNGREEN          CLITERAL(Color){124, 252,   0, 255}
#define CHARTREUSE         CLITERAL(Color){127, 255,   0, 255}
#define GREENYELLOW        CLITERAL(Color){173, 255,  47, 255}
#define MEDIUMSPRINGGREEN  CLITERAL(Color){  0, 250, 154, 255}
#define SPRINGGREEN        CLITERAL(Color){  0, 255, 127, 255}
#define PALEGREEN          CLITERAL(Color){152, 251, 152, 255}
#define LIGHTGREEN         CLITERAL(Color){144, 238, 144, 255}
#define MEDIUMAQUAMARINE   CLITERAL(Color){102, 205, 170, 255}

#define AQUA               CLITERAL(Color){  0, 255, 255, 255}
#define LIGHTCYAN          CLITERAL(Color){224, 255, 255, 255}
#define PALETURQUOISE      CLITERAL(Color){175, 238, 238, 255}
#define AQUAMARINE         CLITERAL(Color){127, 255, 212, 255}
#define MEDIUMTURQUOISE    CLITERAL(Color){ 72, 209, 204, 255}
#define DARKTURQUOISE      CLITERAL(Color){  0, 206, 209, 255}
#define CADETBLUE          CLITERAL(Color){ 95, 158, 160, 255}
#define STEELBLUE          CLITERAL(Color){ 70, 130, 180, 255}
#define LIGHTSTEELBLUE     CLITERAL(Color){176, 196, 222, 255}
#define POWDERBLUE         CLITERAL(Color){176, 224, 230, 255}
#define LIGHTBLUE          CLITERAL(Color){173, 216, 230, 255}
#define DEEPSKYBLUE        CLITERAL(Color){  0, 191, 255, 255}
#define DODGERBLUE         CLITERAL(Color){ 30, 144, 255, 255}
#define CORNFLOWERBLUE     CLITERAL(Color){100, 149, 237, 255}
#define MEDIUMSLATEBLUE    CLITERAL(Color){123, 104, 238, 255}
#define ROYALBLUE          CLITERAL(Color){ 65, 105, 225, 255}
#define MEDIUMBLUE         CLITERAL(Color){  0,   0, 205, 255}
#define MIDNIGHTBLUE       CLITERAL(Color){ 25,  25, 112, 255}

#define LAVENDER           CLITERAL(Color){230, 230, 250, 255}
#define THISTLE            CLITERAL(Color){216, 191, 216, 255}
#define PLUM               CLITERAL(Color){221, 160, 221, 255}
#define ORCHID             CLITERAL(Color){218, 112, 214, 255}
#define FUCHSIA            CLITERAL(Color){255,   0, 255, 255}
#define MEDIUMORCHID       CLITERAL(Color){186,  85, 211, 255}
#define MEDIUMPURPLE       CLITERAL(Color){147, 112, 219, 255}
#define REBECCAPURPLE      CLITERAL(Color){102,  51, 153, 255}
#define BLUEVIOLET         CLITERAL(Color){138,  43, 226, 255}
#define DARKVIOLET         CLITERAL(Color){148,   0, 211, 255}
#define DARKORCHID         CLITERAL(Color){153,  50, 204, 255}
#define DARKMAGENTA        CLITERAL(Color){139,   0, 139, 255}
#define DARKSLATEBLUE      CLITERAL(Color){ 72,  61, 139, 255}
#define SLATEBLUE          CLITERAL(Color){106,  90, 205, 255}

#define GAINSBORO          CLITERAL(Color){220, 220, 220, 255}
#define SILVER             CLITERAL(Color){192, 192, 192, 255}
#define DIMGRAY            CLITERAL(Color){105, 105, 105, 255}
#define LIGHTSLATEGRAY     CLITERAL(Color){119, 136, 153, 255}
#define SLATEGRAY          CLITERAL(Color){112, 128, 144, 255}
#define DARKSLATEGRAY      CLITERAL(Color){ 47,  79,  79, 255}

#define WHITESMOKE         CLITERAL(Color){245, 245, 245, 255}
#define FLORALWHITE        CLITERAL(Color){255, 250, 240, 255}
#define IVORY              CLITERAL(Color){255, 255, 240, 255}
#define MINTCREAM          CLITERAL(Color){245, 255, 250, 255}
#define AZURE              CLITERAL(Color){240, 255, 255, 255}
#define HONEYDEW           CLITERAL(Color){240, 255, 240, 255}
#define ALICEBLUE          CLITERAL(Color){240, 248, 255, 255}
#define GHOSTWHITE         CLITERAL(Color){248, 248, 255, 255}
#define SNOW               CLITERAL(Color){255, 250, 250, 255}
#define SEASHELL           CLITERAL(Color){255, 245, 238, 255}
#define OLDLACE            CLITERAL(Color){253, 245, 230, 255}
#define LINEN              CLITERAL(Color){250, 240, 230, 255}
#define LAVENDERBLUSH      CLITERAL(Color){255, 240, 245, 255}
#define MISTYROSE          CLITERAL(Color){255, 228, 225, 255}

#define OFFWHITE                CLITERAL(Color){ 250, 249, 246, 255 }
#define WARM_OFFWHITE           CLITERAL(Color){ 255, 251, 240, 255 }
#define CREAM                   CLITERAL(Color){ 255, 253, 208, 255 }
#define LIGHT_CREAM             CLITERAL(Color){ 254, 255, 237, 255 }
#define BEIGE                   CLITERAL(Color){ 245, 245, 220, 255 }
#define SOFT_BEIGE              CLITERAL(Color){ 250, 240, 230, 255 }
#define ANTIQUEWHITE            CLITERAL(Color){ 250, 235, 215, 255 }
#define LINEN                   CLITERAL(Color){ 250, 240, 230, 255 }
#define OLD_LACE                CLITERAL(Color){ 253, 245, 230, 255 }
#define PEARL                   CLITERAL(Color){ 240, 248, 255, 255 }
#define WHITESMOKE              CLITERAL(Color){ 245, 245, 245, 255 }

#define OFFWHITE_HALF           CLITERAL(Color){ 250, 249, 246, 128 }
#define OFFWHITE_ALPHA_64       CLITERAL(Color){ 250, 249, 246,  64 }
#define OFFWHITE_ALPHA_32       CLITERAL(Color){ 250, 249, 246,  32 }
#define CREAM_HALF              CLITERAL(Color){ 255, 253, 208, 128 }
#define BEIGE_HALF              CLITERAL(Color){ 245, 245, 220, 128 }
#define BEIGE_ALPHA_64          CLITERAL(Color){ 245, 245, 220,  64 }
#define ANTIQUEWHITE_HALF       CLITERAL(Color){ 250, 235, 215, 128 }
#define LINEN_HALF              CLITERAL(Color){ 250, 240, 230, 128 }

#define SOFT_GRAY               CLITERAL(Color){ 220, 220, 230, 255 }
#define WARM_GRAY               CLITERAL(Color){ 230, 220, 210, 255 }
#define COOL_GRAY               CLITERAL(Color){ 210, 215, 220, 255 }
#define SHADOW_BLACK            CLITERAL(Color){  20,  20,  30, 255 }
#define DEEP_CHARCOAL           CLITERAL(Color){  40,  40,  45, 255 }
#define MINT_LIGHT              CLITERAL(Color){ 220, 255, 240, 255 }
#define LAVENDER_TINT           CLITERAL(Color){ 240, 230, 255, 255 }
#define PEACH_TINT              CLITERAL(Color){ 255, 240, 230, 255 }

#define GRAY_LIGHT_HALF         CLITERAL(Color){ 220, 220, 220, 128 }
#define GRAY_MEDIUM_HALF        CLITERAL(Color){ 160, 160, 160, 128 }
#define GRAY_DARK_HALF          CLITERAL(Color){  80,  80,  80, 128 }
#define SOFT_GRAY_HALF          CLITERAL(Color){ 220, 220, 230, 128 }
#define PURPLE_TINT_HALF        CLITERAL(Color){ 200, 180, 255, 128 }
#define PEACH_TINT_HALF         CLITERAL(Color){ 255, 230, 220, 128 }
#define MINT_TINT_HALF          CLITERAL(Color){ 200, 255, 230, 128 }

#define WHITE_HALF_ALPHA   CLITERAL(Color){255, 255, 255, 128}
#define BLACK_HALF_ALPHA   CLITERAL(Color){  0,   0,   0, 128}
#define RED_HALF_ALPHA     CLITERAL(Color){255,   0,   0, 128}
#define GREEN_HALF_ALPHA   CLITERAL(Color){  0, 128,   0, 128}
#define BLUE_HALF_ALPHA    CLITERAL(Color){  0,   0, 255, 128}
#define YELLOW_HALF_ALPHA  CLITERAL(Color){255, 255,   0, 128}
#define CYAN_HALF_ALPHA    CLITERAL(Color){  0, 255, 255, 128}

#endif
#endif /* RAYLIB_COLORS_PLUS_H */