/**
 * Big iris Layout
 *
 * @summary it's a layout with a big iris! Artwork used (cabinet,3Dboxes,2Dboxes,flyer)
 * @version 0.0.1 2025-5-1
 * @author Tankman3737
 * @url https://github.com/Tankman3737
 *
 * @requires
 * @module config 1.1 https://github.com/oomek/attract-extra
 * @module inertia 2.46 https://github.com/oomek/attract-extra
 * @module mask 0.3.1 https://github.com/Chadnaut/Attract-Mode-Modules
 * @module math 1.15 https://github.com/oomek/attract-extra
 * @module wheel 1.28 https://github.com/oomek/attract-extra
 */


class UserConfig {
    </ label="Iris colour", help="Select the color of the left blade. ", options="RED,BLUE,GREY", order=1, per_display="false" />
    Iris_colour = "RED";

    </ label="Iris artwork", help="turn on/off red glow ", options="wheel,cabinet,3Dboxes,2Dboxes", order=2, per_display="false" />
    iris_artwork = "cabinet";

    </ label="BG colour", help="Select the color of the left blade. ", options="RED,BLUE,GREY", order=3, per_display="false" />
    BG_colour = "RED";

    </ label="FG colour", help="Select the color of the left blade. ", options="RED,BLUE,GREY,DARKGREY", order=4, per_display="false" />
    FG_colour = "RED";

    </ label="Left tray artwork", help="turn on/off red glow ", options="cabinet,3Dboxes,2Dboxes,flyer", order=5, per_display="false" />
    LT_artwork = "3Dboxes";

    </ label="Red glow", help="turn on/off red glow ", options="yes,no", order=6, per_display="false" />
    red_glow = "yes";
}
cfg <- fe.get_config();

fe.layout.width = 1920;
fe.layout.height = 1080;

fe.load_module("wheel");
fe.load_module("mask");

local MainBG = fe.add_image("art/BG/BG" + cfg["BG_colour"] + ".png", 0, 0, 1920, 1080);

// local wheelbg = fe.add_image("BLUE.png");
// wheelbg.zorder = 0;

local wheelsurf = fe.add_surface(600, 357, 250, 695);
wheelsurf.zorder = 20;

local rect = wheelsurf.add_rectangle(0, 0, 1920, 1080);
rect.set_rgb(82, 79, 79);

local tab = {
    init = function () {
        slots <- 11;
        speed <- 500;
        artwork_label <- "tab" + cfg["FG_colour"];
        video_flags <- Vid.ImagesOnly;
        x <- -833;
        y <- -192;
        layout.y <- [ 40, 140, 240, 340, 440, 540, 640, 740, 840, 940, 1040 ];
        layout.x <- [ 960, 960, 960, 960, 960, 960, 960, 960, 960, 960, 960 ];
        layout.width <- [ 244, 244, 244, 244, 244, 244, 244, 244, 244, 244, 244 ];
        layout.height <- [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ];
        layout.alpha <- [ 255, 255, 255, 255, 255, 0, 255, 255, 255, 255, 255 ];

        zorder <- 2;
        anchor <- Wheel.Anchor.Centre;
    }
};

local wheeltab = fe.add_wheel(tab, wheelsurf);

local tab = {
    init = function () {
        slots <- 11;
        speed <- 500;
        artwork_label <- "tabH" + cfg["FG_colour"];
        video_flags <- Vid.ImagesOnly;
        x <- -833;
        y <- -192;
        layout.y <- [ 40, 140, 240, 340, 440, 540, 640, 740, 840, 940, 1040 ];
        layout.x <- [ 960, 960, 960, 960, 960, 960, 960, 960, 960, 960, 960 ];
        layout.width <- [ 244, 244, 244, 244, 244, 244, 244, 244, 244, 244, 244 ];
        layout.height <- [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ];
        layout.alpha <- [ 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0 ];

        zorder <- 2;
        anchor <- Wheel.Anchor.Centre;
    }
};

local wheeltab = fe.add_wheel(tab, wheelsurf);

local retro = {
    init = function () {
        slots <- 11;
        speed <- 500;
        artwork_label <- "wheel";
        video_flags <- Vid.ImagesOnly;
        x <- -833;
        y <- -192;
        layout.y <- [ 40, 140, 240, 340, 440, 540, 640, 740, 840, 940, 1040 ];
        layout.x <- [ 960, 960, 960, 960, 960, 960, 960, 960, 960, 960, 960 ];
        layout.width <- [ 200, 200, 200, 200, 200, 232, 200, 200, 200, 200, 200 ];
        layout.height <- [ 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90 ];
        layout.alpha <- [ 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255 ];

        zorder <- 2;
        anchor <- Wheel.Anchor.Centre;
    }
};

local wheel = fe.add_wheel(retro, wheelsurf);

local mainfor = fe.add_image("art/FG/FG" + cfg["FG_colour"] + ".png");
mainfor.zorder = 20;

local mask = ::fe.add_image("art/masks/maskC.png");
mask.visible = false;
local master = Mask(fe.add_surface(0, 0, 1920, 1080));
master.mask = mask;
master.mask_mirror_y = 1;




local snapSurf = master.add_surface(1280, 1280);
snapSurf.x = 1368;
snapSurf.y = 555;
snapSurf.anchor = Anchor.Centre;
//snapSurf.zorder = 80;
//snapSurf.alpha=128
snapSurf.shader = fe.add_shader(Shader.Fragment, "cubemap.frag");
snapSurf.shader.set_param("strength", 1.0);
snapSurf.shader.set_param("center", 0.5, 0.5);

local snap = snapSurf.add_artwork("snap", 640, 640, 1200, 1200);
snap.anchor = Anchor.Centre;
//snap.zorder = 80;





// local snap = master.add_artwork("snap", 1368, 555, 915, 915);
// snap.anchor = Anchor.Centre;
// snap.video_flags = Vid.NoAudio;
//snap.visible=false










local mask = ::fe.add_image("art/masks/F1m.png");
mask.visible = false;
local F11 = Mask(master.add_surface(1368, 555, 1200, 1200));
F11.mask = mask;
F11.anchor = Anchor.Centre;
F11.rotation_origin_x = 0.498;
F11.rotation_origin_y = 0.107;
F11.rotation = 0; ////////////////rotates this
F11.mask_mirror_y = 1;

local F1 = F11.add_image("art/iris/F1" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F1.anchor = Anchor.Centre;

local biglogo = F11.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;

local mask = ::fe.add_image("art/masks/F2m.png");
mask.visible = false;
local F22 = Mask(master.add_surface(1368, 555, 1200, 1200));
F22.mask = mask;
F22.anchor = Anchor.Centre;
F22.rotation_origin_x = 0.837;
F22.rotation_origin_y = 0.304;
F22.rotation = 0; ////////////////rotates this
F22.mask_mirror_y = 1;

local F2 = F22.add_image("art/iris/F2" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F2.anchor = Anchor.Centre;

local biglogo = F22.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;

local mask = ::fe.add_image("art/masks/F3m.png");
mask.visible = false;
local F33 = Mask(master.add_surface(1368, 555, 1200, 1200));
F33.mask = mask;
F33.anchor = Anchor.Centre;
F33.rotation_origin_x = 0.837;
F33.rotation_origin_y = 0.695;
F33.rotation = 0; ////////////////rotates this
F33.mask_mirror_y = 1;

local F3 = F33.add_image("art/iris/F3" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F3.anchor = Anchor.Centre;

local biglogo = F33.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;

local mask = ::fe.add_image("art/masks/F4m.png");
mask.visible = false;
local F44 = Mask(master.add_surface(1368, 555, 1200, 1200));
F44.mask = mask;
F44.anchor = Anchor.Centre;
F44.rotation_origin_x = 0.498;
F44.rotation_origin_y = 0.890;
F44.rotation = 0; ////////////////rotates this
F44.mask_mirror_y = 1;

local F4 = F44.add_image("art/iris/F4" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F4.anchor = Anchor.Centre;

local biglogo = F44.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;

local mask = ::fe.add_image("art/masks/F5m.png");
mask.visible = false;
local F55 = Mask(master.add_surface(1368, 555, 1200, 1200));
F55.mask = mask;
F55.anchor = Anchor.Centre;
F55.rotation_origin_x = 0.161;
F55.rotation_origin_y = 0.695;
F55.rotation = 0; ////////////////rotates this
F55.mask_mirror_y = 1;

local F5 = F55.add_image("art/iris/F5" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F5.anchor = Anchor.Centre;

local biglogo = F55.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;

local mask = ::fe.add_image("art/masks/F6m.png");
mask.visible = false;
local F66 = Mask(master.add_surface(1368, 555, 1200, 1200));
F66.mask = mask;
F66.anchor = Anchor.Centre;
F66.rotation_origin_x = 0.161;
F66.rotation_origin_y = 0.304;
F66.rotation = 0; ////////////////rotates this
F66.mask_mirror_y = 1;

local F6 = F66.add_image("art/iris/F6" + cfg["Iris_colour"] + ".png", 600, 600, 1200, 1200);
F6.anchor = Anchor.Centre;

local biglogo = F66.add_artwork(cfg["iris_artwork"], 600, 600, 800, 800);
biglogo.preserve_aspect_ratio = true;
biglogo.anchor = Anchor.Centre;




local surf = fe.add_surface(0, 0, 1024, 1080);
surf.visible = false;
surf.repeat = true;

local mask = surf.add_image("art/masks/mask.png", 500, 500, 1000, 1000);
mask.anchor = Anchor.Centre;
mask.rotation_origin_x = 0.5;
mask.rotation_origin_y = 0.5;

if (cfg["red_glow"] == "no") {
    local guide = fe.add_image("art/BG/rr.png", 1368, 540, 1024, 1080);
    guide.anchor = Anchor.Centre;
}
if (cfg["red_glow"] == "yes") {
    local art2 = Mask(fe.add_image("art/BG/rrglow.png", 1368, 540, 1024, 1080));
    art2.mask = surf;
    art2.mask_mirror_y = 1; //////if mask on a surface///////////
    art2.anchor = Anchor.Centre;
}

local last_time = fe.layout.time;
local rotation_speed = 45; // degrees per second

function glow_rotate(ttime) {
    local now = fe.layout.time;
    local delta = (now - last_time) / 1000.0;
    last_time = now;

    mask.rotation += rotation_speed * delta;
}

fe.add_ticks_callback("glow_rotate");

F11 = Inertia(F11, 1000, "rotation");
F22 = Inertia(F22, 1000, "rotation");
F33 = Inertia(F33, 1000, "rotation");
F44 = Inertia(F44, 1000, "rotation");
F55 = Inertia(F55, 1000, "rotation");
F66 = Inertia(F66, 1000, "rotation");

local blades = [ F11, F22, F33, F44, F55, F66 ];

snap = Inertia(snap, 1000, "alpha", "y");

function iris(ttype, var, ttime) {
    if (ttype == Transition.ToNewSelection || ttype == Transition.StartLayout) {
        foreach (b in blades) {
            b.delay_rotation = 1000;
            b.rotation = 0;
            b.to_rotation = -60;
        }

        snap.video_flags = Vid.NoAudio;
       
        snap.delay_alpha = 700;
        snap.alpha = 0;
        snap.to_alpha = 255;
        snap.delay_y = 500;
    }
}

fe.add_transition_callback("iris");

fe.add_ticks_callback("ticks_img");

function ticks_img(tick_time) {
    if (snap.running == false) {
        snap.video_flags = Vid.Default;
    }
}

local retro = {
    init = function () {
        slots <- 5;
        speed <- 1500;
        artwork_label <- "toptray" + cfg["FG_colour"];
        video_flags <- Vid.ImagesOnly;
        x <- 102;
        y <- -20;
        layout.y <- [ 160, 160, 160, -760, -760 ];
        layout.x <- [ -1700, -1700, 300, 300, 300 ];
        layout.width <- [ 781, 781, 781, 781, 781 ];
        layout.height <- [ 272, 272, 272, 272, 272 ];
        layout.alpha <- [ 255, 255, 255, 255, 255 ];
        layout.rotation <- [ 0, 0, 0, 0, 0 ];
        //layout.zorder <- [ 1, 1, 1, 1, 1];

        anchor <- Wheel.Anchor.Centre;
    }
};

local wheel = fe.add_wheel(retro);
wheel.zorder = 50;

local retro = {
    init = function () {
        slots <- 5;
        speed <- 1500;
        artwork_label <- "marquee";
        video_flags <- Vid.ImagesOnly;
        x <- 100;
        y <- -20;
        layout.y <- [ 160, 160, 160, -760, -760 ];
        layout.x <- [ -1700, -1700, 300, 300, 300 ];
        layout.width <- [ 752, 752, 752, 752, 752 ];
        layout.height <- [ 222, 222, 222, 222, 222 ];
        layout.alpha <- [ 255, 255, 255, 255, 255 ];
        layout.rotation <- [ 0, 0, 0, 0, 0 ];
        //layout.zorder <- [ 1, 1, 1, 1, 1];

        anchor <- Wheel.Anchor.Centre;
    }
};

local wheel = fe.add_wheel(retro);
wheel.zorder = 50;
//wheel.preserve_aspect_ratio=true

local retro = {
    init = function () {
        slots <- 5;
        speed <- 1500;
        artwork_label <- "tray" + cfg["FG_colour"];
        video_flags <- Vid.ImagesOnly;
        x <- -20;
        y <- 0;
        layout.y <- [ 1700, 1700, 700, 700, 700 ];
        layout.x <- [ 300, 300, 300, -1200, -1200 ];
        layout.width <- [ 542, 542, 542, 542, 542 ];
        layout.height <- [ 737, 737, 737, 737, 737 ];
        layout.alpha <- [ 255, 255, 255, 255, 255 ];
        layout.rotation <- [ 0, 0, 0, 0, 0 ];

        anchor <- Wheel.Anchor.Centre;
    }
};

local wheel = fe.add_wheel(retro);
wheel.zorder = 50;
wheel.preserve_aspect_ratio = true;

local retro = {
    init = function () {
        slots <- 5;
        speed <- 1500;
        artwork_label <- cfg["LT_artwork"];
        video_flags <- Vid.ImagesOnly;
        x <- -20;
        y <- 0;
        layout.y <- [ 1700, 1700, 700, 700, 700 ];
        layout.x <- [ 300, 300, 300, -1200, -1200 ];
        layout.width <- [ 600, 600, 600, 600, 600 ];
        layout.height <- [ 600, 600, 600, 600, 600 ];
        layout.alpha <- [ 255, 255, 255, 255, 255 ];
        layout.rotation <- [ 0, 0, 0, 0, 0 ];

        anchor <- Wheel.Anchor.Centre;
    }
};

local wheel = fe.add_wheel(retro);
wheel.zorder = 50;
wheel.preserve_aspect_ratio = true;
