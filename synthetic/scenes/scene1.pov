// Scene template

#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "woods.inc"
#include "pprocess.inc"


#declare mat_texture = Brown_Agate;
#declare camera_location = <4.839245698476298e-16, 1.3, -7.903087979073753>;
#declare depth_output = "output/depth000002_090.png";
#declare head_size = 0.7213934868089823;
#declare skin_color = <0.9132104204663959, 0.7447120538200548, 0.5761885052067561>;
#declare shorts_color = <0.22141950612252304, 0.350578629942947, 0.625458256033064>;
#declare right_arm_end = <1.3084243666593909, 2.733502335873562, 0.0>;
#declare left_arm_end = <-1.4983498495003302, 2.070340091714028, 0.0>;
#declare left_leg_end = <-0.24525586214393352, 0.0014995846919261258, 0.0>;
#declare right_leg_end = <0.2625581803535514, 0.0007011907634619785, 0.0>;
#declare body_height = 2.49886431001015;
#declare light1 = 0.8733118050973327;
#declare light2 = 0.16670176217279864;
#declare backcolor1 = 0.5594970496566003;
#declare backcolor2 = 0.7987607339054601;
#declare backcolor3 = 0.7989509628782856;
#declare background_texture = pigment {color rgb <backcolor1, backcolor2, backcolor3>};
#declare head_height = 3.0399094251168868;

#version unofficial MegaPov 1.21;

global_settings{
  post_process { PP_Depth(6.0, 9.2)
  save_file depth_output }
}

// Camera setup
camera {
  location camera_location
  look_at  <0, 1.3,  0>
  angle 80
}

// Lights
 light_source { <0, 10, -10> color rgb <light1, light1, light1> }
 light_source { <5, 10, 5> color rgb <light2, light2, light2> }
 light_source {
    <0.5, 6, -3.6>
    color White
    spotlight
    radius 3
    falloff 20
    tightness 12
    point_at <0, 2, 0>
  }

// Ground
plane {
  z, 0.55
  texture {
    background_texture
    scale 0.3
  }
}

// Head (Sphere)
sphere {
  <0, head_height, 0>, head_size // Center and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}

// left eye
sphere {
  <-0.2, head_height + 0.1, -head_size + 0.03>, 0.06
  texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}

// right eye
sphere {
  <0.2, head_height + 0.1, -head_size + 0.03>, 0.06
  texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}

// mouth
cylinder
{
    <-0.05, head_height - 0.2, -head_size + 0.01>, <0.05, head_height - 0.2, -head_size + 0.01>, 0.01
 texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}


// Body (Box)
box {
  <-0.5, 1.6, -0.3>, <0.5, body_height, 0.3> // Corners
  texture {
    pigment { color skin_color } // Skin color
  }
}

// shorts part
box {
  <-0.51, 1.0, -0.31>, <0.51, 1.6, 0.31> // Corners
  texture {
    pigment { color shorts_color } // Shorts color
  }
}


// Right Arm (Cylinder)
cylinder {
  <0.5, 2, 0>, right_arm_end, 0.16 // Base, cap, and radius
  texture {
    pigment { color rgb skin_color } // Skin color
  }
}

sphere {
 right_arm_end, 0.16
texture {
    pigment { color rgb skin_color } // Skin color
  }
  }

 sphere {
 right_arm_end, 0.16
texture {
    pigment { color rgb skin_color } // Skin color
  }
 }



// Left Arm (Cylinder)
cylinder {
  <-0.5, 2, 0>, left_arm_end, 0.16 // Base, cap, and radius
  texture {
    pigment { color rgb skin_color } // Skin color
  }
}

 sphere {
 left_arm_end, 0.16
texture {
    pigment { color rgb skin_color } // Skin color
  }
 }


// Right Leg (Cylinder) Shorts
cylinder {
  <0.3, 1.0, 0>, <0.3, 0.7, 0>, 0.23 // Base, cap, and radius
  texture {
    pigment { color shorts_color } // Shorts
  }
}

// Right Leg Skin
cylinder {
  <0.3, 0.7, 0>, right_leg_end, 0.20 // Base, cap, and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}

 sphere {
 right_leg_end, 0.22
texture {
    pigment { color rgb skin_color } // Skin color
  }
 }


// Left Leg (Cylinder) Shorts
cylinder {
  <-0.3, 1.0, 0>, <-0.35, 0.7, 0>, 0.23 // Base, cap, and radius
  texture {
    pigment { color shorts_color } // Skin color
  }
}

// Left Leg Skin
cylinder {
  <-0.35, 0.7, .2>, left_leg_end, 0.20 // Base, cap, and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}

 sphere {
 left_leg_end, 0.22
texture {
    pigment { color rgb skin_color } // Skin color
  }
 }

// Mat
box {
  <-3, -2, 0.31>, <3, 5, 0.5> // Corners
  texture {
    mat_texture
    scale 0.2  // Adjust the scale to control the size of the checkers
  }
}



cylinder {
    <0, head_height, 0>, <0.18579066434613173,3.8553356621211603,0.1194553455476185>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.01166692886461848,3.916849353481085,0.02075885933774203>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4478435313184108,3.764722248330002,0.08673225903254483>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.034657015181210664,3.88010070841283,-0.17850004261689592>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.144424637200709,3.906128740833014,0.11786123090210575>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7425899786145472,3.489341360720717,-0.04335401380039622>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0019450462843746633,3.929541631765803,0.0038143769080928405>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3133294646971867,3.860999021611369,0.06392188015420422>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5959413258243946,3.6461645684216606,-0.09876052777761211>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.29618707495538577,3.8777944613171966,0.09980465901962965>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09173647204124011,3.8643731852854337,-0.1763951625854788>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0237044036597178,3.687835938359028,-0.5616382804334958>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1452330704750907,3.8768309363805113,-0.28052113042101157>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.25647924275388895,3.893713595155708,-0.057394049582288574>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17951301627002778,3.8663681117962634,-0.015495578969702346>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3289559599640868,3.823889698270826,-0.05699423801395417>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02551349054041131,3.9068708413188826,-0.04302352087130583>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17974084204989862,3.865724181378433,-0.010892158488130818>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22062367679251035,3.7801536538338856,-0.4022245117795184>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05683253599926315,3.922131555817915,-0.0910437235303315>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13080305826681526,3.906152852804872,0.09890039046448505>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15625399830874892,3.8649988533827155,0.22334300352002126>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.10275097433839978,3.902786925980438,-0.05158860935226008>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1525764902658654,3.807821926009097,-0.3732930000551856>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28272262479748705,3.6345095046155964,0.5708004925420799>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.38437590671101146,3.7317514755501415,0.289568119341391>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.24932215101967226,3.5768815956057867,-0.6680792271179741>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3545403116940757,3.7594041744568587,0.2771575541763027>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6110220254302965,3.5578183629849587,-0.2774855578682121>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.029876507068943285,3.909785877101659,-0.1043860585651489>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18018875768982404,3.864955287723805,0.19450897631654315>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4565661719954788,3.796748458448573,0.043261377030804495>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23375674599706459,3.785073992386096,0.329885379875033>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2794738909086989,3.8177441495713365,-0.25577701194122227>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5869384808863188,3.6265668440670265,-0.32150014466461957>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3020304631636566,3.7309509936372187,0.48664321918597875>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2118765973614379,3.752149261746525,0.48977944007324714>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22744654226747504,3.779723407956092,0.4456865162584976>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.057205888073454,3.8901460465569597,-0.2660576924680053>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3022112599483009,3.7690285084556447,-0.3867547649679968>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06955442375698959,3.786059574961859,-0.3865338199134206>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.15509842804864682,3.913087231892113,-0.03954351753210085>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11077126564902867,3.9107850737097873,0.06659521808494279>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13263497020900644,3.9069512125578854,0.1925342762979183>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07838668296523403,3.7673379897829586,0.4733569362567864>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7063469087473745,3.5177376194787,-0.02863736995983784>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08597742050307527,3.8706938852457164,0.12015295553187694>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14395653168294067,3.833961060783199,0.24720583455698256>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2849207083492282,3.826171788749316,-0.31146469183119074>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17117982696013817,3.838392869704549,0.23905048380433647>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0010096400007475687,3.9296480206039996,-0.027743193252016015>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1260257941217038,3.8348087619272393,0.37619827184053145>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4420704168237051,3.7963074112711874,0.03537234702864346>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.31626235237750255,3.6765938161060876,0.5166769096036877>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03466410258332392,3.813147054270572,0.3769517001201636>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.026544059140417763,3.645876225342069,-0.6389316141301179>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5643920093882627,3.6747876677032942,0.07966759421042563>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.30487913070437966,3.7762918610701286,-0.2993432123941993>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19756570077183838,3.800767910817539,-0.3460007080410361>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2996422643715383,3.6574799106782985,0.5739493872555252>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.012923030977648154,3.930651268271387,0.039925985888229605>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.004912246575449624,3.885376154995582,-0.21776176647186016>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.18340553060932643,3.871908596076138,0.039925090668783296>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2678653000212964,3.5241636572844,-0.6833861726969658>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07234202886913195,3.8787618241063173,-0.12317437891389357>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2833623577195283,3.6819762342053757,0.4853919003065919>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7048033102432938,3.531649491660358,-0.14291915829152754>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.13171367229357434,3.577399041530393,-0.6390868688595446>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5489998285111614,3.7254540499506392,-0.04095419647830959>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5561639136789955,3.5860872751243655,0.38107303860782715>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.20361417807576065,3.639102667263047,-0.6053195851400408>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.07915131288439596,3.9013478255513427,-0.0734492536400223>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6078006839961237,3.646243078320634,0.0153115218320531>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6057228172898877,3.6435872802486156,0.2560613660668217>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6796832277832303,3.5477204525615114,0.1488081183866432>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26917722026009244,3.8796731131507682,-0.1283489642204499>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3274175513613295,3.828225708753947,0.21612745298968652>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3743551465418719,3.7679610608630303,0.27750143176576864>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2730945225634226,3.832214071706399,0.24740836372123068>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19489575793377975,3.815761196195385,-0.2764156222456172>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.14170764057700044,3.904138347422469,-0.11525889712993706>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5599378221515687,3.524654434468241,-0.432778444186729>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02842477233259606,3.913839185664754,0.05035019521781017>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1468313713093488,3.5966375919661733,-0.6817917018264175>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.31790722414184697,3.735658640905002,0.38945477229686415>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4344764000101005,3.513651956381688,-0.5474657092883404>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5648014252252066,3.63870516175152,-0.3592976169610865>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.039478540136597205,3.731134647661576,0.5377272114874708>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05523684605150001,3.815218101968935,0.3537472133916648>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.24503689588178015,3.717688779615848,0.46180322062891105>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03202495629689521,3.890949644186609,-0.01731572575306848>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6673657800182103,3.5236712644493298,0.24222111403662447>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16606881387835984,3.8875909213301387,-0.14543119933954543>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5721925014065469,3.672974637391215,-0.15393786328096248>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.031721039170385434,3.922879926703316,-0.15701428317473928>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.32268741569531145,3.8113356721483784,-0.13599020751313812>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.21854031229083806,3.8880525210897843,0.07090592081978808>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2833556166332849,3.722510188628884,0.5033102188628722>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2061091878327075,3.8439231647540524,0.2560498233801265>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0670245347104871,3.646890356637336,0.6361720246253787>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3710008564222809,3.5752035157709123,-0.6025162163275977>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04961830392872808,3.9100432831086045,-0.03872096445699214>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4351257664331369,3.7055768025833062,-0.41933175252463956>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2957949477346213,3.59303033971185,-0.6101046499094772>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4259197631498809,3.786719104199015,0.05220722332482327>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7213588853211937,3.5622348565570108,-0.03279209915903059>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.26603931028997646,3.8434768509923116,0.0541315074749222>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.31569021940252506,3.4952983160832405,-0.6894465245190227>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.35648376689504685,3.855733271925782,0.02884321044449635>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.33893507663564976,3.7381541508469938,0.40068624412033804>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2871890365730708,3.857014992653498,-0.19365342741566946>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.34927868480468477,3.7474912283230433,-0.3237774686616449>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22538449123745266,3.848671487698688,-0.11304916436628151>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23321249444165876,3.8788111471711555,0.06347289801447117>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5759443920673958,3.69732052790791,0.04592287908359869>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.008514741899187847,3.8740505924568582,-0.2632970315390968>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22121682289217068,3.794832518262029,0.3618937099694423>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1760723079746354,3.858531345671088,-0.2866329955509296>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.07109478076137442,3.894564901404107,0.07126994273480514>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1840688184907855,3.8582403838826247,-0.2881121152798059>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14715514706455654,3.8434374121243997,0.23833927475291017>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3838838240558044,3.803329501888872,0.2117476375360317>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.49307751358905555,3.6924229534550586,0.2148867578586486>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5204570138068428,3.6160277237526,-0.42240494446989807>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.050268709898291235,3.577011764635478,-0.6710281462861134>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2540464784207116,3.612241546981583,-0.59953251389735>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11574077012898397,3.898409015044774,0.05854271355519799>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15918588193645886,3.8171122023981625,0.3839667124883667>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.48442137597887097,3.7953866611393665,-0.06318961129677218>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.42391768899162535,3.6236956518052965,-0.5376247874805625>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3732445754210863,3.8589141209991356,0.03553343260400523>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09827306673137241,3.915425116414947,0.015570278034988538>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3369130331830912,3.8336532191450763,-0.06799568741408413>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4637260111008268,3.686090226091983,-0.3485617152705483>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11116964567874746,3.7459323838446115,0.4738133128821735>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1904616758887894,3.8143397283082288,-0.31726920711875684>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0302388122503001,3.8819424635015034,-0.09741550055549829>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.35544297892040316,3.767628806422618,-0.3073598933312064>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7125240758091993,3.523790941370252,-0.2027670400557801>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1025717113405536,3.8997499905200743,0.07171890604969004>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04573767853525805,3.8964813115958807,0.06982933041409695>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16589506796450398,3.9005071926372232,-0.026082176011448608>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.34439803449014655,3.555074507646347,0.5895349652907831>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2282490767924699,3.75704337585303,0.4142856969696225>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23799550546199347,3.8748546159930255,0.1607087108680467>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.24261813486543782,3.725311114852194,0.5201839587105261>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19182963689081525,3.800303971257283,0.4178247851410138>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5437014987303118,3.672893215644098,-0.1526493581453943>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03446828805865521,3.8738416390951653,0.19603154094752986>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6860100792629017,3.609598099579288,-0.1268282285913779>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5870567736627504,3.675875433496777,0.007238339671178231>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02374652392295822,3.902908846441386,-0.00657610858267097>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1955804750093023,3.7569267641491084,-0.4627083239258145>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.41612927592896815,3.77538063702004,0.1294667419438621>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1764132514507993,3.8758479659228917,-0.1475355705940737>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.018569914147184244,3.8849673305161025,-0.21322158512130335>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17952005660531153,3.899648791313013,0.151373596038995>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.44201489365845487,3.768703879994024,0.02301472336829272>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2734774036988376,3.6118972484350857,0.6123623630703899>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.586209328170632,3.5222795906173743,0.4230026528614617>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04754518699935377,3.9304554615875884,-0.019912540022052425>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13813715444329472,3.6485833235515894,-0.604369333527948>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08159095487067904,3.8964540058279318,-0.06818911962493657>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09420229022597273,3.8794400195112737,0.03541600492366589>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08784202014529975,3.8659261769466924,0.17965789489645173>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.008187663927571634,3.8989901878446576,-0.023224588896390317>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5879372141105456,3.5831280099807157,0.373221381219548>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08810489849872669,3.529090546821186,0.7384228966108858>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02380357107761438,3.879410493844862,-0.06084657717814709>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02203147729976738,3.92373876781795,0.03131498005682135>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.24186738576232011,3.7046951797404932,0.4571704158475675>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.16515856474886634,3.804037155566092,-0.3648233760354008>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4585131560749688,3.753242416398084,-0.2562825402493307>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1914489307718948,3.6917165188146916,-0.5184099171850436>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.35772854183696534,3.753087532821989,0.27276416116216495>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1212690266507909,3.9116785014732676,-0.006623253397987402>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18243215167529164,3.6070731354689514,0.5979087384233459>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05160475104415213,3.774928662099446,-0.4217791891549748>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03915345545327032,3.9076430478483046,0.041870791671300533>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0862808723890899,3.910690909651049,0.2059435017243373>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30475799822377597,3.822225453703642,-0.09562347554029464>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.43757169163034965,3.5992399858901414,0.47792743053048115>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.13915728490958457,3.5811172550384365,0.6800030674634255>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.004202720725892959,3.7227389018054042,-0.5714274204801755>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6493152183369607,3.552302408472844,0.3332524119205841>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6166102078549174,3.635846468456132,0.1142854877582988>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11901990409722027,3.9238465652615497,0.04062142219035936>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3835042040465533,3.6551750417768765,0.4462797062986907>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3683700507768162,3.583777639977109,0.5866984842778953>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20002543230442768,3.8554317603598225,0.1255936303016402>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5905432142248871,3.6143486698051963,-0.20488356396303756>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.15745265094598362,3.650049707674646,0.6034042887349279>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.038072981295945996,3.4984576190143097,0.769513765466712>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5575407788884638,3.699992162204019,-0.17670219922793254>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30200301260375256,3.843395936462234,-0.05602058163852929>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17379616070422202,3.879607483268816,0.25502430182246705>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10628497408043538,3.5195202557471754,-0.6850029817491059>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08175388709903289,3.88374689887048,-0.08935044039676072>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5409978638982462,3.75177832891742,0.09438090620867515>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.044064919715084826,3.9104698295168534,0.006939200127476414>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.06442231569516299,3.527825721083954,0.7486182433608974>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03796157922818739,3.8307379146715013,-0.37450952159709205>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.011893244243619906,3.8918107768208605,-0.1993461115265409>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4744135387047748,3.6459655321914717,0.4505254707052249>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.21030268430692411,3.8624736523328163,0.23405419642268788>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3972221666092978,3.733246557925661,-0.31796055764949577>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11459512749729606,3.8903620599341187,0.050813061791608674>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6552404865854229,3.6103405033621208,-0.04079455769074416>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19240490167542434,3.8609041323354902,-0.15019021487641007>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05426609779704333,3.5549475502166286,-0.7000943437630718>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11864682583161554,3.8378280644779172,-0.36006487934301085>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23784211102329322,3.904701926077914,0.01732563307870157>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.10813952347433566,3.817755703333122,0.38140103882102605>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.26303252014385814,3.8482224495548216,0.12065909448878781>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.36790078869944554,3.636297908674285,0.5022143601878376>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11478056169866974,3.9255365043761365,0.024939335215782125>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23788571044881845,3.698880837126251,0.5100290267587153>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22461106336799955,3.8537274945782922,0.2771767210396274>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23089862926705484,3.594129177775881,-0.6071468437942297>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.013665861690461217,3.7567152699532396,0.4430674189258313>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.196092684334838,3.8419114841528654,0.1968002595246759>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5106406500919742,3.5554847675750736,0.43323379518470384>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17928703578663693,3.8649793540958273,-0.021725970821426913>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5526523136369751,3.583895244146244,-0.43073057752058685>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.023681655811121943,3.504241897187586,-0.7418341780400495>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3172820587836862,3.489551007036833,-0.7031209812803902>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1452352583918407,3.8864131421120938,0.03864081869070904>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.007254764415825866,3.9232944540623436,0.004983578631959078>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3908731119142925,3.75596322942997,0.3270351477881023>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17739660139901467,3.8738105295591465,-0.054072386223082025>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5397280246896107,3.72807840524803,-0.09845732812753297>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2138187249749926,3.5575033835931986,-0.6553657073923268>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5023421183667636,3.7283897034099627,-0.1648905469820217>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03142803117121198,3.8822519505856006,-0.20060339161557825>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23927745852796306,3.848913201602105,-0.2980780695729754>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.003509828742789531,3.892082814870551,0.0034144161328331394>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0025426508345272932,3.8831688287749677,-0.0013121351658955881>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.37498714396431665,3.6788755318287727,0.4108297442917843>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6079869355557078,3.495543011285515,-0.379608639100048>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2273303123767318,3.875982620468392,0.18872273823725072>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5073221515744232,3.571514697458936,-0.4872718907719995>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02293564862362916,3.8813057398222695,0.27638546479607534>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.017678755745158058,3.7180713678317754,0.5702953278699584>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.12716505363124123,3.74916935714485,-0.5310369333482282>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.002230889365935245,3.8941698456588987,-0.0005717863269824813>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23638649308660617,3.8308501460752575,-0.2473459407754754>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4836821728839216,3.7613793215471705,0.004802538915701298>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.028433644579176895,3.8914727435263705,0.008064772911244062>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5065723259096601,3.556989155993485,0.508711510940054>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.44955761308551323,3.6905345351786014,-0.2939245753854282>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10926764023097695,3.6261980805238823,0.6183535110365683>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4163381743280365,3.7309768994105945,0.3645556624091657>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3399839669642126,3.742568495441712,0.3815093708439176>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.14804552018204095,3.92870146627395,0.0032387342171592785>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21260766767588699,3.845324163344489,-0.27277719495404323>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6073146795822572,3.5880240954884544,-0.21403818984638187>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30537276357536514,3.8082212911257893,0.2413941157270765>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.39935991361980366,3.8439958938655887,0.019061350020180237>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5542132821927694,3.7400605650575836,0.03486682305526564>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2014264968632438,3.901426196866639,-0.000566883522025458>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5657461173272963,3.4906186934987478,-0.44532588530087935>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03240328815603009,3.8995835912710692,0.036936477415455214>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.048436810574883735,3.814253374762286,-0.38795920875273504>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10742523588084217,3.8814524159664567,0.12451068929805592>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7384505505051857,3.4969739942570786,-0.046903750901634164>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17069550015212226,3.887752628895192,0.050023902174204174>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22992906535304092,3.881243101179155,-0.057023789016925286>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.585688561270793,3.6307024160266987,0.18938675386551207>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3486889647184533,3.851297796904941,-0.1548065233128193>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.29009455816063334,3.660826878532174,-0.5170262580832563>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11175031737742173,3.8867034591041594,0.08266075339205223>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0050365751358426875,3.793265222383994,0.49180911847199266>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.33668401485411403,3.8477469236750492,-0.11582595812978168>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.048819986257201166,3.763229059453563,0.5193750248468298>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06267243889487423,3.873480134624666,0.11842034068924132>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06602354569003777,3.8914592040172025,0.1515971626994875>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20558970415383113,3.854438568790796,0.19351234757179164>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.000594173708918491,3.887609907623994,-2.1709202140412565e-05>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1257174989195943,3.8778380832395194,0.15356409697425827>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.15895011029260056,3.909948230212312,0.02635257117162834>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3933302852740116,3.7834217425555012,-0.20140628106668002>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0969002064689911,3.899549599315976,-0.24162057610878424>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.012997413785201941,3.9106424358308125,0.025030456316575276>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0042523305572000365,3.939174630171121,-0.010956309041025661>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2556024715630183,3.844989753309042,0.02597874072939652>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06427495351770009,3.8970504768548437,-0.22619188094455414>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11155890028318462,3.9089270999171317,0.056368902658294084>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.01744906650280952,3.93292171257048,-0.012467709516088858>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.44256086358396174,3.7056846714425307,0.2832293712028836>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13602689725423958,3.7336169259529846,0.47558310176621515>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.09830792857741667,3.896927866498109,-0.06175741089133707>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.25114151583643163,3.861310595191538,0.07761893032171567>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03482673294502595,3.9293090610117996,-0.035071995920122855>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6427634806043263,3.63610852621879,-0.1456345445955373>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.443076514477777,3.6387072675228858,0.4378573759039605>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09011345972850075,3.715039083107366,-0.5392121452308433>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1205502395017006,3.8382743745470322,-0.37058812548406>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2561726248397407,3.8798427365315526,-0.12104639095065448>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07367201924780421,3.9047270897345316,-0.03871041986150761>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5796482758956865,3.6954890285220987,-0.11158512551980586>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4986718450635803,3.7293172890479758,0.010201514334079445>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22775628543246867,3.8228031647193124,-0.30768215833523804>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04366301953524527,3.858182393037591,-0.2411503386515494>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.09471213998024859,3.5654690740140027,-0.7203986253305392>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1846912236930073,3.651520070598739,-0.5840177211303348>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.12964784959880726,3.846645132167416,-0.29000066835533483>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4711066030243196,3.730797074421918,-0.2535513509498061>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1884925239688219,3.693570709006739,-0.5476231819821834>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11841373553898678,3.909648148027407,0.1084397939242895>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2765875015724469,3.7296419628352204,-0.5018744027762653>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.7106343829838342,3.5495034577363813,-0.05797311667727515>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5619374791991495,3.7182822327959135,-0.08322810021992125>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.31341085125703216,3.8330601958571817,-0.13979690818167603>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.24786125317649446,3.6268637265261265,-0.620907871971124>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1770145226398585,3.824398628691846,-0.3811741622196875>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03815550727101355,3.836705985343864,-0.36366001556486366>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2647224572030368,3.819338343799395,0.2553248012267618>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03627099929240865,3.9047870221733207,-0.1962775261538285>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26562083646791146,3.857025823771259,-0.14612032927874805>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1765724128583202,3.8684994642005357,-0.14360761416030138>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3277238858346332,3.8131867965439197,0.09050259063154609>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.542781628386838,3.6391456207880495,-0.23500544792148026>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.07694441359311958,3.789425435066228,0.4345790502286993>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6738001295113514,3.567004632720562,-0.20592620918378166>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.052612833639988595,3.9214020696734937,0.020509808803401582>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6101565295387849,3.550445773678187,0.3659072836380094>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6308436285748484,3.603373604739776,-0.2284462966450645>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6130190939732963,3.4915994991254675,-0.386005557033345>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6294122787043259,3.52473637438959,0.2963640278989513>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02139117381295386,3.765459686482891,0.42907331318265013>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.04027612162142256,3.8978645813210764,0.04133726476303845>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.011277984374809827,3.8539090322189815,-0.38672306732669876>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02543980055893039,3.8909173150394047,0.032214927978164914>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14406982548624475,3.8818101497390636,0.011873983091140497>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.49150208292832887,3.74267009326568,0.2143819285476976>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3458182953232507,3.7158682971809456,0.3644465865726652>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08139136045767577,3.632106295415402,-0.6469711260622361>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1112736637946644,3.8386751342280663,0.38563762151208675>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.011849755387316963,3.8253503126097956,-0.3194289491354503>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02944709828040553,3.9376603688057115,0.05946061854477213>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22798325131483035,3.624375005124206,0.5843538067413074>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.09006195613753935,3.8112130394562005,0.41503211354131125>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14900681806059046,3.8454932450779733,0.3092979108072264>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.011925155847108323,3.9324580287811757,0.014417586255829269>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2339487666615136,3.8943519123049555,-0.05832921211052087>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16801915819056562,3.554394161901211,0.7132088696930685>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03829456648631093,3.911947011261905,0.200343827325867>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.16475531968263366,3.877988639657179,0.039780649191829415>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20897536254474233,3.8799463596276627,-0.1439437676248722>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3548508235780069,3.6292193102528003,0.5801376826336798>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.38308171573582506,3.5214539627518633,0.5885333483693804>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30010758009344757,3.844064871184308,0.08166264259662193>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5164870691453536,3.6441279041787165,-0.3521396503995436>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2048970614811423,3.598617368345681,0.6430435641429283>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.012083504389142791,3.8423642876342194,-0.3200785042164567>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6584096792607728,3.5232744444580577,-0.2081797029565624>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.42300448331974544,3.7931748382632247,0.2093412237907968>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2884388104406611,3.5969534877291607,0.6131410213258506>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.002856201088673156,3.6366486156283893,-0.6301157787560614>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.41919729769714786,3.7415580014615952,-0.33610052036722127>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2789025229684613,3.8012915348929566,-0.3669053394234444>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3627136385265853,3.571463779506122,0.5549409905931583>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.40365071722124507,3.5467738306707917,0.6009423518265999>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.36024415364063556,3.800310615518569,0.044825411835852674>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.46520293965352416,3.6833141452017943,0.3732017779099492>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3695986369573743,3.5442245669886296,-0.598930145700797>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6062705464776208,3.613794634504399,-0.27203691624396337>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22777549833852276,3.6669200450602055,-0.576600833474377>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6079663766219917,3.668924881077426,-0.03433957464088991>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.48283278970456367,3.6606461591715465,-0.3831311573231456>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5509625092791832,3.7365776808664273,0.050583134134308635>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05740552101596593,3.8732001101750355,-0.23151579167740077>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04866938398456252,3.9003962719104726,-0.05384537979451158>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17929762134057073,3.481241321838411,0.6976211481425254>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03957245613157089,3.8821373746409686,0.19282091613079774>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5886997828886352,3.5960111458699258,0.3078987595599252>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.06159551065516568,3.895627947654952,-0.02797136969446226>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.10046165539183685,3.865248185983911,0.1337631589993381>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3442140770765023,3.8102211664147525,0.08199586648872065>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2902472819851477,3.843117682017025,0.03455737544690662>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11917018113446562,3.618446281196269,0.6127963896362597>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5400997515200171,3.655681007232374,0.2027967432902663>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.14430031199948293,3.92100333005735,-0.06255890933281397>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13097113500417662,3.877469293067537,-0.0894266315602825>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04366178715244981,3.8415251274367037,-0.3626394474361024>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5733787331431386,3.728074768682535,0.011531624014487889>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2768504972338906,3.8230762297823864,-0.2739477715006608>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5646134169652475,3.6941728540640137,0.14568304729040504>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.23705168399538348,3.8575410181605547,-0.06273823413028462>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5585225890631651,3.644866357034871,0.2793888671822497>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1961806357408539,3.8304697169272024,0.2518333085074131>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19841931889802442,3.793801328071054,-0.33219152401156293>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.18523635101575586,3.7482986359913997,0.4911050403208689>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.10827199291063513,3.863076514512891,0.2761883718936012>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4662693724310404,3.7291094960766458,0.22602053931652955>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0044414457066268296,3.8640271422859414,-0.31386548409212944>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3628920298464407,3.771354623396364,-0.21447133725565182>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6797195585714807,3.4825985191205175,-0.2783252906734565>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4782486169474583,3.774730668376718,0.14730283594755308>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5234138939756972,3.6870499614068546,-0.17529701822456803>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05420570137722865,3.619648425111076,0.6353664164893744>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.27175486000903715,3.6213135211259506,0.5863492818684031>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6769786730451244,3.544979311825803,-0.2421815733441497>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03907115104690064,3.8122325216104267,-0.4393217555146026>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22987887391824477,3.8835615631697085,-0.05644790505662828>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1138835964710821,3.800013038498509,0.3492463147950242>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5097785706540284,3.697672731997649,0.13542956273303908>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09972578223614012,3.864582606541815,0.28157500245463063>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.42630729470332057,3.738523600351453,0.27120723925817813>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08710692233081331,3.835700929199211,0.3752676130610219>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.35643801443558554,3.81504725282549,0.21434197134659413>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3635914610264729,3.534856251365957,0.5937642519734896>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2689233779471983,3.8716217613073223,0.1317887862743694>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.023764344289574187,3.8737710159004775,-0.13718891889285662>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3995482155613479,3.6116961078147685,0.5705631212680087>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2835634452948506,3.84277949710674,-0.06991571151515592>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.12105130442495995,3.6885472558078662,0.5525174276541946>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20138596097769618,3.5694030899129707,-0.631114816464886>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4148339961109718,3.7400474125700853,0.24528146366009648>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23251581142381716,3.778073186895909,-0.43334597759879667>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5134848753634119,3.5649095487267672,0.4707638297946665>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22449265758252934,3.888811133551449,-0.16236296165831068>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04760064568885026,3.6420293757813287,0.6333715791324184>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03163029207445133,3.937521510180116,-0.0487687983552779>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.12367612467537885,3.9005377118697497,-0.22107981288589088>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6815476238278656,3.5361275037777258,-0.3152142131170001>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04078801512207598,3.7993161209152255,-0.3769712624720451>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05799888015736193,3.8672340948376798,0.2471462996817973>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23477211122472302,3.8545091533978786,0.0033856823405306272>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.43738891017061593,3.77040903443106,-0.2907498825609784>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.004815807124260881,3.9101851270509504,-0.16611942517558184>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02559090739508821,3.895422732531854,-0.0033517839042189767>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.691200145496776,3.5532321673361977,-0.23238382986370001>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15208858196312036,3.892350375356582,0.0986437780801567>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.06976125671794062,3.8644554036574825,0.22891208176593508>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.015611286880174486,3.9180887366545973,-0.03549388032588409>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5247602838794074,3.720239899926074,0.19257545893392575>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6202579111157054,3.5440304254513864,-0.36064885369293387>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.43017853373306375,3.777534623984312,-0.09988147647710721>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02646278524499694,3.8956017749447156,-0.013284461954592455>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.008309947454079309,3.871469588973965,0.27359186941363695>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6780276199545648,3.493816409005684,0.2950751085919599>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3341479521982193,3.858760733953451,-0.010330318192834212>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.32628114362104876,3.761181131606057,-0.40973873195142213>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1268055460972738,3.7657257387490364,0.47620647023177737>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5288209937264641,3.5365969955130048,-0.48929723217878524>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22633213234555355,3.8668859349157927,-0.27016263069123697>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.022506672595038957,3.8643060507721727,-0.21298623899973873>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.36813135326944996,3.796350349867968,0.1885450889749276>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3963783970710123,3.7661267089933084,-0.32429804255435973>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.43436689183853455,3.726633466611304,0.24959111805761625>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4317604833086586,3.7101139851274203,0.33513134488214374>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.7152716087936972,3.5683225575625324,0.0815587084561277>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.33979694437904817,3.7312098419756357,-0.3453225318274436>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05016296035673259,3.8582918888362885,0.2597156835167627>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.007387566562183853,3.912887448520058,-0.00393623665167556>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03542962225224444,3.910635551273975,-0.21940018476904075>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.13137790702913787,3.9049624040285043,-0.07374584585810978>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11255840999016188,3.920730833819089,0.14334314350975572>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5653595141455965,3.6935646868102925,-0.1519529511089142>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.24033954307850522,3.819429672113886,-0.35430717078243273>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17786126151962714,3.7813698063262984,-0.4170244586858015>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1125941357005207,3.520194119597078,0.7412858230722904>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17353267225300037,3.878997574603612,0.1433883637777652>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28399078772925485,3.7963861245387287,0.336062243045714>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.026663274042940655,3.9221655635601715,0.07807192224434752>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16689927553732026,3.891843747422817,0.21300639012884037>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11539052849812764,3.8786363306329297,0.2365515582269027>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3686411820036928,3.613336463673721,-0.5662199684975906>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4354927946703676,3.563721046234007,-0.5510662401620473>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0203521322916553,3.9343720129924176,-0.018070541915381336>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20762007350202039,3.803700020853654,0.34372297717765476>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15230705973585673,3.8558227636552305,-0.14139537369676494>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05019056438923381,3.5685127130987273,0.7086130917179796>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26435132750873575,3.8340509702672017,-0.2613267827743839>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4877329743548588,3.675682587499265,0.28146387297720216>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18645893865792582,3.644994620804166,0.6069692813598092>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03755589829351088,3.8839827555531903,0.00022965035413458992>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0902117369043266,3.9162644669288245,0.049491409665538014>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.006753958160627248,3.742970133048845,-0.49070951209911434>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4090242511258501,3.78933971980498,-0.11493283648573586>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.31547572283556885,3.63891179067574,-0.5306896978863215>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14142517316000194,3.8976603871538655,-0.05982531335546544>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06720273630770207,3.877166596560543,-0.2780466303581079>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.656293662995586,3.6039543895160233,-0.21279196036316556>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13765796913051645,3.889925036972284,-0.0020373174571768388>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5232792236536419,3.7078115051936846,-0.2368026845069942>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.012324795489139314,3.9180957285038223,-0.03169437813591501>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.18245127674865946,3.858273876751989,0.2546945969415933>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6945356900097434,3.5470479460213395,0.2217787578345757>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13199229183501693,3.8040058713022544,0.37911122359373733>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.043496952637282496,3.9232728688750793,-0.0032150744383489583>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05943757411807499,3.9255362323887026,-0.027063783611234304>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22679485011331724,3.867764887106426,-0.14495905353572394>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4923813291123612,3.7337202917190133,-0.11742119262385119>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.197785361616224,3.6583282133480433,-0.5890279793241059>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.061068922897747874,3.907185469570445,-0.14733643683479716>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.13010760092445423,3.8796971098542605,-0.09161210146534793>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.033907360858583944,3.8864161979642233,0.15548909956266868>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.00659236728287964,3.915583522469179,0.054196129171766375>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5666265166956387,3.6732699201547847,0.035015914211457964>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07673189021467823,3.8781632856175827,-0.01630715131953904>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03146168508425013,3.922282931811417,0.021929911172849304>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.37327150316127455,3.8077691932040434,0.1185680780806084>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4657772539541909,3.7308492664490176,0.24884921967357881>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07380996599552203,3.8994443421644975,-0.0027090522099116245>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.37158083109730605,3.8265446123826496,0.16306629885490184>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02082371029290439,3.9101015221806517,-0.05673403607157252>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21806117780623424,3.7025656316830324,-0.5554020009276268>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17657291256921812,3.8914680864737807,-0.05841762684370834>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4011435140660203,3.7983052566869544,0.050944114753559144>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.15786585711595572,3.4925181045092657,0.6962909598244204>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28978489209748653,3.8223969218517775,-0.2177715299164598>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10518139957360684,3.8831149230972675,-0.011585148056926361>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.27838032288925474,3.8631292296001063,-0.1946745078499004>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.595634452875879,3.62286162525345,-0.13168744866922777>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.028405668125501486,3.7107439599032146,-0.5249491143478923>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3363527437823747,3.7687000709535545,0.30367227635660715>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.44847440701599695,3.7255108893222397,-0.33607675207416204>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5096136173178637,3.7216587186303807,-0.09554984109213162>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09674925786924633,3.839601522876907,-0.4000958353500606>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.40114100707077094,3.7680900059217692,-0.27999725284321175>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2837962474061966,3.798719303074316,-0.3437862996860112>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2309766359862496,3.8271462419507554,0.2223678296187222>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.003650643001497365,3.8866130859809056,0.003858624927515719>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.29848307792681655,3.6193335428391133,0.5523127243433675>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.18560372713610884,3.8926716973863904,-0.12659019945406982>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02735869531511467,3.9116224683526273,0.05869291048441475>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07630660800660347,3.903275035679364,0.20458302528217473>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.40314436006501486,3.782279583789518,-0.12830581827582188>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.044589436823048965,3.8916506934063713,0.0926947165028635>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4398812810262444,3.526659497709889,0.5288241697553646>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17177837641829313,3.874210894537068,-0.09849821513404997>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4481653226042001,3.6937259986936413,0.4192180001788945>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06650799056136672,3.8779938568536356,-0.12020285049020639>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.26223684275179615,3.8321445382471646,0.1252006388075955>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.12017665679348856,3.6789954268835854,0.564885589222916>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1301259169073918,3.86417427263396,-0.13038158886896606>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14645985400214406,3.8134217846233605,-0.30085075813033824>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.022783806327520518,3.9022924272195985,0.11215886915453245>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.059121692172204796,3.91481423281852,0.07980235810878455>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2709725248423643,3.866892459364516,-0.09111597032639875>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06895229339733937,3.866798795842584,-0.28066237658234333>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1305783717934613,3.83360864977774,-0.35510834991431545>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.026639992422192473,3.848298468605064,0.2629946913176252>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2236692134602,3.8804932755839396,0.1438303935793426>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.035965688381629404,3.90169711970477,0.056065136736263316>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.313356768217409,3.5335061495013846,0.6189213784908156>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.21185376762049624,3.834498088423051,0.3116784899451231>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6139151191372412,3.638996383639897,-0.07337263932045253>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.09444265174791212,3.910090707346855,-0.0862751149357286>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3074540324413811,3.8821564040637244,-0.00823334660267257>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3024883998778591,3.7886495544332908,-0.29873037011260734>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.004091351196056121,3.507916649238939,0.7332004301859285>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28579454845399127,3.6979666602882677,0.5398398407455497>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6453007911296704,3.6145892507558264,0.04668486863556108>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.487134966654666,3.592791827805531,0.45608281235429815>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3296400955782989,3.6009945529752208,-0.6230868419318518>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6086808823600118,3.5581896320097286,0.29898000499307514>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22809653446762837,3.864735491279343,-0.07515873806859841>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4241513588862367,3.745920175492206,-0.3319136043119472>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5830635207033076,3.6996967995716092,0.05935763863560837>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.17554240784091157,3.8709856274162946,0.11623960792789977>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28319404602555226,3.762063848630781,-0.3273536648604773>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.04046048471706965,3.9075305022488926,0.03936440028085672>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.47223334666576033,3.5103707158124675,0.5921590461036782>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17129262895351197,3.877131622896797,-0.035208252945757613>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19696779241194473,3.78331511742609,0.40383416068580114>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.46972964596596994,3.7373748955785695,0.13978605998301732>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.021857760491438304,3.5955415635143,-0.6726520704402154>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0211979431891479,3.925807285480758,0.05016268144936775>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.34784574887034503,3.8331318359911153,-0.18468977517754342>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2394830032078548,3.7058873710610625,0.5216854720894492>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4133454307535007,3.8092066706048655,0.07748761996105889>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.016785832391923088,3.628600891413388,0.6139642659698694>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26119847724872686,3.7326192151522344,-0.5069274068776287>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.631768204406322,3.5944634049982187,0.2861459176691541>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08897569864002053,3.880907282455751,0.19122076286554962>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4562598718381894,3.6594014057196236,0.39834075169520444>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6020909844393737,3.657342996480831,0.23922065311919818>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.027664638978113876,3.860495240362029,-0.23300609599292624>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.004261125973152479,3.85478612836896,-0.24973798787321305>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.603117913808765,3.6586263557765624,-0.06612019723437612>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26581392530466214,3.5292956111758955,0.6658447666161946>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.28331701723801955,3.8334120731223105,0.23678020119140103>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6935872528854539,3.509026586011858,-0.15939160860491366>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4747709427356329,3.7277861810002126,-0.15492755491513055>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4980895661009325,3.7198134959594955,-0.037358282843011584>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2935900802577432,3.816515286413345,-0.27911536151456845>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2978726286497008,3.638098243900272,0.5459693472946187>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5751576247953324,3.6528918048595376,0.0696992665456139>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6835166019994792,3.4775775926155617,0.3142195418517066>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20892257420176125,3.5693642945995676,0.6882246175855853>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.22751428529956147,3.902285691026767,0.04993325691812661>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15465157355948345,3.662884806860614,0.5901870898585246>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.24039703409205035,3.6367156706052994,0.564280886234857>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30553939031636707,3.8337324040021477,-0.2511309263906193>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4845988199658492,3.752272703889242,0.2034008715637104>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06803665329911805,3.907630863571313,0.09172614528558183>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3631202641910865,3.7592727029302626,0.31183998669897245>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1508988472589274,3.511650975211249,0.737596175279843>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.03361155038954614,3.9010862037144656,-0.0757548132105582>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5855862924731877,3.649923139742507,0.1281225388706878>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2342303457470168,3.5133268250581313,-0.7085506508213374>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2105334988129266,3.8902514789733047,-0.07061886799391877>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5480111281515722,3.677438102580426,0.2837905069340546>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2179695630179553,3.82696561159654,0.36286476454613437>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.020181336470359544,3.8832118427570452,0.051354000477020614>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.064528519457925,3.876014894178474,0.13954274316677573>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19860895786173247,3.8571068361898613,0.0392620267247396>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08337973711231546,3.8387273777431923,0.40443067827567974>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05831527431159548,3.926637826518409,0.1310788027587445>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0821555149460794,3.9201819982717847,-0.135144107751794>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.005488256665227141,3.9099251769958934,-0.06228777824774831>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.35048417468428017,3.4796711034535543,0.641123195679794>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3561854531479998,3.8063900938701645,0.24408523571533086>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3902137810814412,3.829561364720629,-0.09056472703634978>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.27196341767169036,3.88612113994738,0.054889753858121136>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.038510159149410986,3.9110203350588186,0.1239301599572889>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.013510796610028988,3.919337108033326,0.0033395605116524024>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19260126879944256,3.8867456367710216,-0.21864864662733263>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5058049682470479,3.7493744411027112,0.03172236487374489>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.24797152774190653,3.5619111352829584,0.6893422197765317>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.023922451654285252,3.8847989493197885,0.06794789226052635>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19089702866627548,3.9143239344737686,-0.026724040066841245>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.18518211041207217,3.5904267310008726,-0.6319057536492402>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.022953379962875897,3.5669710828141477,-0.7185460434022783>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.40425311682047194,3.7419254075951183,0.2671811955858219>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22852343295248198,3.669638566279806,-0.5340636931851551>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.01771823391129087,3.544191209836388,-0.7252356908070274>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1261982715554056,3.6100579417481438,0.6524641689649064>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.15948639884274055,3.8744625566054935,0.24576855838811157>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.00041206893585382653,3.9158556058055813,-0.00024588101190333085>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5399818911401266,3.5109159272594868,0.5424524842974869>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08116639587468538,3.787539892488686,0.4075086795690408>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1478746615134854,3.5369623544858957,0.677680871359023>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1264194785368228,3.8012739515144105,-0.3677942837178408>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21655298982214272,3.8778721633600233,0.1944995896397557>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4962116489936481,3.6860553599949317,-0.26145677284302266>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.014293293772815656,3.9351865597543645,0.06223080935646358>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.24931774141639532,3.8239348451667,-0.21036840241529994>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18718228397409453,3.8748235889630633,-0.012322076411820378>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5390915407934184,3.6811359174313814,0.2937699866673671>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0791423353106449,3.8826579085861024,-0.07669548740836186>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3262105159008612,3.7147903533958577,0.4649416379343986>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.48804254563804367,3.7690025391683344,-0.09903800129454934>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3217651460727977,3.787021299190005,0.23345774211351433>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18935956344357005,3.6585096371673527,0.6270727975304707>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6909748919593397,3.5280082219972675,0.1287171615416225>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3239906879447666,3.7861614336570755,-0.38314163727951983>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.37072391083354955,3.727356143272352,-0.3334107215545621>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5854451409952572,3.700230586874227,0.024547941658785266>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6852502340815572,3.6157283434929792,0.09637375166871755>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5317203819585926,3.695659948732069,0.1564017014320191>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.058086329303022266,3.9342024098531265,0.015363231027803478>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5443400550078942,3.5348021813685886,-0.48602495636335086>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2697556462156833,3.8617904795730724,0.24893024514602283>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.39580379424938544,3.77091680396189,-0.16486604912999428>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2179481431757236,3.903010893180138,0.11223631253409913>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4729312026042115,3.74525724576901,-0.22072614001381805>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3097245386996202,3.6902234543221977,0.5346986044018784>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2660515357126329,3.5180405017426177,0.6783315951456189>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6649567264082431,3.619943420618901,-0.0945785455816497>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.36866442942460237,3.671243272618698,0.5029945762804441>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.01901238826071415,3.925393218303151,0.06604778513423096>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.46910606691416495,3.7575511487461,0.11833967093558505>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3684489617901763,3.8356838109355404,-0.20618407890529403>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2211892939414075,3.8612009477127476,0.08269997899198601>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3324113578482587,3.6334564639003872,0.5805729669850962>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21328724303363825,3.901722989432428,-0.018006783679885157>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03008819616001687,3.8838438006653266,0.06689822990739266>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26785869180719085,3.8823052181540088,-0.000989394495449728>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08300628301380773,3.912435540580302,-0.009170776531238252>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.12085726587659285,3.9212393615794623,0.08899832028788707>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5645934308216612,3.596815643179309,0.3945262597070499>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.046681239709736255,3.775146661522762,-0.5083890243541127>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5673011336984101,3.6697765749639357,-0.16378428224360897>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3594552797824224,3.795938779184441,0.2942488805148587>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.4721749590065463,3.799425232967688,0.07550387239978777>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06658010334819024,3.9080917039742014,-0.16418659346865805>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11646046272327669,3.879319983468081,0.015590156748979971>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06363274998460344,3.887304090354955,-0.06407461942339338>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.31598016517246513,3.824345542220496,-0.06490796349217405>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19390982687800706,3.670630733524322,-0.591316425315916>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19829116769694466,3.811312068396411,-0.348637668441642>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3330111309554163,3.689887132767917,0.4761146894513965>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1852175810156408,3.6398930367067823,0.5824682765730861>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.07946682619158923,3.8800644092983667,0.16917893778632728>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5291029311009595,3.5702315924607335,-0.45923491007217015>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.224577370820278,3.841399088549209,-0.23381078935155536>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5018755010367566,3.4660874960232766,0.529988709084345>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.334790000848616,3.784914049168127,0.24594616632861035>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.29260093860485803,3.7240734606346972,-0.43273232525261895>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.48302818892584926,3.732132777985007,0.028414113165310204>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.45894585002624505,3.796147117495954,0.0014438432433677001>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.005003245535945327,3.8851122057166787,0.11198293002708169>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10568843297356571,3.880060798543991,0.08992127368016659>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.07915314691360605,3.9299718604331204,0.07989894679900239>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4669974543084609,3.6091697557263624,0.451851277176695>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.003540847191700531,3.9104993934868975,0.007742483138729625>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.06689742766764152,3.8988996410102112,0.011928025423481625>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5653338532401563,3.604733289399584,-0.3856313014658865>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0295877602215211,3.8806152044710487,0.23414885840563956>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10370197716987335,3.871433714305058,0.19162409622183404>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30570322771886665,3.862502920362184,0.09339758971370675>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05903838828268262,3.9012227393005445,0.17601840681529232>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2966099677312264,3.8240757957632123,0.12027223994589975>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.14671243001013187,3.8638265917131758,-0.18907551717991564>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4808790667593552,3.5802219125684442,-0.47273962992894675>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2859382047622656,3.8576573360941118,-0.02146473499649693>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5148441718995902,3.642665497839277,0.2891272435442968>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6237827605954666,3.6486394165335687,0.08375506917691271>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.1800817940564747,3.7881336827669227,0.37249680189176887>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5482224166162475,3.6426913745786647,-0.2337048332182166>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13954412343989306,3.8960063582513422,0.047275623115148796>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.02450145750124847,3.930411343368819,0.008057717265745263>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.10286247335462963,3.8945199285690446,0.2228489619334447>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.012827806733310621,3.830147878762502,0.41843425358094766>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.07992895968607548,3.8863084729575257,-0.04595214886519137>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3039374903265134,3.8238800396719,-0.08282279800004548>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.48101207948793967,3.6524484207652685,-0.3508761368357413>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3079033692507943,3.68494102598703,0.5168181070111633>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.11545371708251187,3.5201457859361693,-0.7256791326283005>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.26168761276098135,3.846709666965757,0.2781214505493391>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18428057277194768,3.908786033867552,0.13784467914875947>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3856952662112514,3.51579706670245,-0.584184079293658>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.3493910224794976,3.6102114415300033,-0.5791314722436958>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13441193568028037,3.892383355207228,-0.12155442333635522>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.39415962310857094,3.5726564514741903,-0.5716869019691594>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4808050930130637,3.7609276283245956,-0.13792143525183925>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5472388734163328,3.7140510041367403,0.15243973493968632>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6240668532301846,3.6453108421396117,-0.14475284875005726>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.037776783575896915,3.8628602533922445,-0.3500408647617036>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.20260924025884283,3.783393940833686,0.44278542355762956>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.009400330982968153,3.8906685564596772,-0.1905669963662818>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.7304908032343891,3.493477429755882,0.04448388879324833>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6031027078272998,3.7070900441709322,0.05951482036337418>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.17741742608928748,3.5399293499428834,0.7187932016350032>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.039787345479098776,3.929661457569308,-0.09288516823991078>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.025308333399917678,3.9007548379114696,-0.23577809857121618>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2762613612838861,3.711673162567491,-0.5248795272617057>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3336507894995107,3.821791435878499,-0.0013179556987121188>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.006918059066727925,3.8210237425377076,-0.3205699440830829>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2908895648567172,3.7718939363055886,-0.41342277976190256>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6759900083803495,3.476807771727374,-0.27302078580051137>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6133177084348129,3.6661949105878993,-0.0446195019439653>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05546721007510242,3.895237379831513,-0.0813459185552506>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.503131926096209,3.5945666097799034,0.3989469645146632>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.026316178556853295,3.9225721878849873,-0.030012394552955585>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5623140453012009,3.55074781766098,0.3981247468350823>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13835560136943664,3.910357399620904,0.10810865815659311>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5115384143107474,3.758053082214203,-0.039106167514736286>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.02841096702865576,3.9034087958157415,0.041117842432565097>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.33002245822328286,3.6345276741291035,-0.5080111013185199>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.005927571219244001,3.909740659303736,-0.18557525067643943>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.12158760058986516,3.8735304690431804,-0.16612571758412303>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.13441979643284355,3.8760170358153885,0.21712315644799612>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.22424499813232324,3.675289324187273,-0.5398570867392459>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21732625172583453,3.5360140750867615,-0.6883851504661752>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.19414612736057757,3.878405946466171,-0.16970456997284966>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19819553825054145,3.8113954129762377,0.3724524087885165>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.11549783592863684,3.905519186780541,-0.03904823182489396>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5941198424999476,3.67841498896773,-0.15603577020651616>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.01586060388506253,3.9134242087650195,-0.01774053841107074>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06672313842531938,3.7931553860085,0.4623221738643292>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6348774736396254,3.5576973671312517,0.34589638934193456>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.15584611463620981,3.8409819461006434,0.2078270516733723>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5852360959343286,3.647583702452024,0.23110831791484776>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.05863777931383349,3.9104963265976647,0.1394629494986149>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3746307713163353,3.5122554215374895,-0.597729375259779>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0038354928726299126,3.9077662178261567,-0.003293629443853385>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.26445916854391405,3.8678243263681624,0.05905575129160371>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.10495378805251687,3.7772735897547496,0.47531617930354475>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.05635151161885293,3.721924665356567,-0.5535296229587491>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.42515177484286354,3.644518866016946,0.4649101412900897>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.551567249028132,3.492117004789651,-0.5092924476119647>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.36492552353529867,3.650507003116618,-0.45474941300895866>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16590738464194735,3.776970587500141,-0.3838607183746389>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.375574779283288,3.8433546979588935,-0.01908223679011267>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.21231860803295752,3.89637711356535,0.03179339669203864>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5666792760435795,3.7365744274017896,-0.002775879259355481>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.06868512012676295,3.786947608018136,-0.49593447712021194>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.014675064584254837,3.910033536878274,0.1546591165454245>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2801972906626792,3.7188102630927515,-0.4974157587339873>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5934190408284105,3.638975845057921,-0.16519807327035363>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.45992025765994465,3.7508673575042635,0.1975228721023922>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.21059813701495123,3.7642674635272884,0.39228823141197533>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.7340700649837103,3.5080074574261,-0.13257317439986158>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.004044299831043487,3.8441189066098147,0.4029881175886232>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.09350447120862504,3.8007348977970876,0.3775028418111302>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5078565123811424,3.710874988947099,-0.24952669606894504>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.23733024116370677,3.860871501912854,-0.06541049212866029>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1881794616328842,3.5999748986412734,0.6102345907417512>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.03364627691313043,3.8489449766457646,0.30439350891420347>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.13099914995665937,3.538124021796233,0.7341555791384863>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.029297323272569228,3.8836313608237267,-0.033019635056008356>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2703867852880655,3.8475167198061793,-0.02042987445623795>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.006908200453687294,3.9067075206818256,0.019766045571779474>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.30130316481995073,3.6991391262099893,0.44472859271062604>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0050006820959577055,3.87031022170042,0.31201204857263826>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.67076461920844,3.466277199602484,0.30357813911838>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0022341259014911296,3.9336275511191863,0.011706448619573552>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.36273517686868345,3.777079807843702,-0.2975675335827041>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2629542167753097,3.4763352563808994,-0.7071196231496482>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5222389733106405,3.7115186831498863,-0.08181233503148057>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.7075415933765591,3.4984755779033616,0.009978602073544231>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2598303916788291,3.884732447940077,-0.1680660335775377>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6207418504888211,3.689719926562194,-0.04677019676669334>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.026810680069732112,3.9028134442116142,0.014345679243371724>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.37309578733771454,3.5366617536328926,-0.6092529763740203>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.18007113954249282,3.8852759934330137,-0.18521566139985005>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5857472383594137,3.673226776261895,0.06477389633774498>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.35562620525888433,3.755604621209817,0.3537309351706652>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6293835207396294,3.6347869869816014,0.12548538021202343>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.001986801228942488,3.79360892678645,0.41296721777419054>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.2695721580177533,3.545362740539189,0.655958562037778>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.044483447226945326,3.851788518529234,-0.22037109865332144>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.028064219578717266,3.688587148590072,-0.5591281756527136>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.002095206488535463,3.9115971500643885,0.0014938665599956462>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.08494205650690573,3.86026293136095,0.3084682666610038>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.32068480783345615,3.8131784558812285,0.139489159897879>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.41629079550604464,3.8172109107085985,0.0932098777175538>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19875373647513964,3.845412677194574,-0.1897304577169119>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0011688253692073367,3.9066453109965313,-0.006566949772969611>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.12800068332757306,3.8033187721665374,-0.35029912314657446>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.7037106500470104,3.4822317721908713,-0.14452625869042066>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5793711994221856,3.5480171358484656,0.34880805767745526>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.20292243668392732,3.899647701471318,0.03304419035250369>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.3853863430818135,3.7768205331297295,0.3261519594910613>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.4410984958025147,3.5716956797621773,0.4906035211887633>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.42048140409749635,3.6378454857658458,-0.48981790318625335>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.035395507491459255,3.9173977874936208,-0.029381916773854086>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.08170384115752927,3.9070113533759345,0.0439854907473901>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.12942674553322644,3.915957499551992,-0.13962395818924953>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.188693911307427,3.862460857327722,9.091832411606678e-05>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.0014374071464812379,3.8948280965527378,0.01966013368556856>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.19578585245886201,3.5782804124406047,-0.6252210658201937>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.008950116411668648,3.93201888180825,0.00940998536990415>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.047810068915365204,3.593203047651044,0.6757807267977065>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.16548246222622987,3.8432501981385636,0.22795638667861562>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.256838465891151,3.5961435272076008,0.5867492832110005>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.2094764218445784,3.874081256668409,0.010147328753309552>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.011235600367811975,3.9282906462662717,-0.05880643429388504>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.27320091782965217,3.8308854405718873,-0.18707591702567805>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.25102946104576407,3.85466418046464,0.26261532253452263>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.06316591416864682,3.9262248720156676,-0.11977201274658922>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.0182172415786458,3.8699555833813166,-0.14046482369395763>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.686080860800633,3.5671130668179036,-0.11123852845015854>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.48858746088934357,3.6778790844856735,-0.26732382666428983>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.1674897321351723,3.879172499577959,-0.007808250954639507>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.6354764410626685,3.5593040174593797,-0.2581003887959417>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.35736698361962715,3.7373351628004943,-0.36296995395474735>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.04951488245698752,3.8477367388980865,-0.3877867046247976>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.29551112353410575,3.4815829814410213,0.6569755346654085>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.44673613668200024,3.584346872453408,0.4635299880908254>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5387956545433977,3.6760397938429157,0.2968099320225558>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5403637835212081,3.7448864394726664,-0.09751383216082912>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.01016628727704127,3.821744025627482,-0.43382200599858334>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.21522287720968564,3.82005338545369,0.2672017852572112>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.6712478553905746,3.5987609123700097,-0.049105412330867224>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.5929652110418291,3.6360899927405783,-0.14154228487017873>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <-0.34490030674559397,3.7999300128551825,0.11297199762682025>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }

cylinder {
    <0, head_height, 0>, <0.5682585273262017,3.674977020142027,0.12126179126833998>, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }
