// 50 - 11.2 = 38.8
// .9 * 5 + .4 = 4.9
// 38.8 - 4.9 = 33.9
// 33.9 / 6 = 5.65
// 5.65 * 1.618 = 9.1417

// 100 - 11.2 = 88.8
// .9 * 12 + .4 = 11.2
// 88.8 - 11.2 = 77.6

// 73.45 / 6 = 5.65
// 4.15?

height = 5;
rotateangle = 0;
edge = 2;
width = 10.2;
render_cut_stone_wall_end = false;

column_width = 2;
sides = [[27,74,51, 3,75,50, 99,123,147,171, 17,181,134, 22], 
         [28,76,36,52,12, 4, 65,100, 92,124,148,172,157,182],
         [53,29,77,60,84, 5,149,173, 41,133,158, 21,101,125],
         [13, 6,54,30,78,61,159,174,102,126, 89,109, 44,150],
         [ 7,79,31,37,85,55,108, 66,127,151,175, 20,135,103],
         [32,56,80, 8,38,62, 90,152,176,132, 43,104,128,160],
         [ 9,57,81,33,14,86, 19,105,129,156, 67,183,153,177],
         [15,34,58,82,39,10,106,130,110, 91, 68,154,178,180],
         [11,35,83,63,59,87,107,131,155,179, 18, 42,111,136]]; 
render_cut_stone_wall_column = false;

/*
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22
24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44
48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68
72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92
96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111
120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136
144,145,146,147,148,149,150,151,152,153,154,155,156,157,159,160
168,169,170,171,172,173,174,175,175,177,178,179,180,181,182,183
*/

/*
0
24
48
72

96
120
144
168
*/

module wall_block_load(f, path="../") {
    //x,y,z
    //0,0,0
    //0,1,0
    //0,2,0
    //0,3,0
    //1,0,0
    //-1,0,0
    transform = f % 24;
    side = floor(transform % 6);
    angle = floor(transform / 6);
    block = floor(f / 24);
    echo(str("block_medium_pitting-block.", block, "-side.", side, "-angle.", angle));
    //echo(str("selection: ", floor(f), " side: ", side, " angle: ", angle, " block: ", block));
    
    if (side < 4) {
        x = side;
        y = 0;
    } else {
        x = 0;
        if (side == 4) {
            y = 1;
        } else {
            y = -1;
        }
    }
    color("Grey") rotate([side < 4 ? side*90:0,side == 4 ? -90 : side == 5 ? 90:0,angle*90]) import(str(path, "/block_medium_pitting_", block < 10 ? "0":"", block, ".stl"));
}

num = 0;
wall_block_load(num);
