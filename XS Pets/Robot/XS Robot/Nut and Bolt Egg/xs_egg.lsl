// xs_egg

// Version 0.33  2-13-2011
// modified the order of the globals for clarity


/////////////////////////////////////////////////////////////////////
// This code is licensed as Creative Commons Attribution/NonCommercial/Share Alike

// See http://creativecommons.org/licenses/by-nc-sa/3.0/
// Noncommercial -- You may not use this work for commercial purposes
// If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.
// This means that you cannot sell this code but you may share this code.
// You must attribute authorship to me and leave this notice intact.
//
// Exception: I am allowing this script to be sold inside an original build.
// You are not selling the script, you are selling the build.
// Ferd Frederix


// Based on code from Xundra Snowpaw
// New BSD License: http://www.opensource.org/licenses/bsd-license.php
// Copyright (c) 2010, Xundra Snowpaw
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

//* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
// in the documentationand/or other materials provided with the distribution.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
// BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////
// COPY FROM GLOBAL CONSTANTS FILE LOCATED IN Debug Folder
// INCLUDE THESE IN ALL SCRIPTS //
// This first section is general tuneable numbers that should be changed for any new pet

key YOUR_UUID = "";        // if you add a UUID for your avatar here, you can change it later
                              // and other alts or friends can change it too, and make these pets
                              // If you leave it blank, only the creator can work on these pets

string  SECRET_PASSWORD = "top secret string";    // must use a password unique to any animal with enctryption on
integer SECRET_NUMBER = 99999;             		  // any number thats a secret

string Animal = "Troubot";        // was 'Quail', must be the name of your animal
string Egg = "Nut and Bolt";      // was 'XS Egg', must be the name of your egg
string Crate = "Transport UFO";   // was XS-Cryocrate, must be the name of the crate
string HomeObject = "Home Flag"; // was "XS Home Object", must be the name of your Home Post
string sound = "robot_sound";	// a basic sound, one needed, You can also use xs_sound, a plugin for more sounds


// optional changeble numbers



// global prim animation linkmessages on channel 1
// these are the prim animations played for each type of possible animation, no need to change them unless you want to change names of the animations when you run the prim animator

string ANI_STAND = "stand";             // default standing animation
string  ANI_WALKL   = "left";           // triggers Left foot and righrt arm walk animation
string  ANI_WALKR   = "right";          // triggers Right foot and left arm walk animation
string  ANI_SLEEP  = "sleep";           // Sleeping
string  ANI_WAVE = "wave";              // Calling for sex, needs help with food, etc.

float GROWTH_AMOUNT = 0.10; 			// 10% size increase each day for MaxAge days
integer MaxAge = 7;              		// can get pregnant in 7 days
integer UNITS_OF_FOOD = 168;     		// food bowl food qty, used by food bowl only
float secs_to_grow = 86400;      		// grow daily = 86400
float   FOOD_BOWL_SCAN_INTERVAL = 1800.0;	// look for food every 3 hours
float fPregnancy = 172800.0; 			// how many seconds to lay an egg  = 2 days or 48 hours.
float fDaysToAdult = 7;     			// 7 days to become old enough to breed.
integer SECONDS_BETWEEN_FOOD_NORMAL = 14400;	// this number of seconds to get hungry
integer SECONDS_BETWEEN_FOOD_HUNGRY = 3600;		// this number of seconds before hunger count increases
integer MAXIMUM_HUNGER = 30;			// not used, just displayed





// Security - recommended that you leave this TRUE
integer ENCRYPT = TRUE;    // set to TRUE to encrypt all data, My Opensim prefers FALSE, TRUE is the most secure

// the following are global constants and do not need to be changed

float VERSION = 0.28;        // This is the Protocol version.  If you change this, then all pets older than this will not be compatible   

///// GLOBAL CONSTANTS extracted from original source //////
//
// if you change any of these constants, change it everywhere and in a list in XS_Debug so it can print them
//
integer FOOD_CHANNEL = -999191;
integer ANIMAL_CHANNEL = -999192;
integer EGG_CHANNEL = -999193;
integer HOME_CHANNEL = -999194;
integer BOX_CHANNEL = -999195;
integer ACC_CHANNEL = -999196;
integer UPDATE_CHANNEL = -999197;
integer API_CHANNEL = -999198;



// global link messages to control the animal 
integer LINK_AGE_START = 800;      // when quail is rezzed and secret_number, is sent by brain to breeder, eater and informatic get booted up
integer LINK_FOOD_CONSUME = 900;   // from movement to brain when close to food, brain then consumes a random amount up to 10000
integer LINK_FOODMINUS = 901;    // xs_brain  receives FOOD_CONSUME, decrement hunger (eat)
integer LINK_HUNGRY = 903;        // sent by eater (string)hunger_amount, checks each hour
integer LINK_HAMOUNT = 904;       // hunger_amount = (integer)str,m updates the hunger amount in scripts
integer LINK_SET_HOME = 910;      // loc ^ dist
integer LINK_MOVER = 911;         // tell mover to rest for str seconds
integer LINK_FOODIE_CLR = 920;    // clear all food_bowl_keys and contents
integer LINK_FOODIE = 921;        // send FOOD_LOCATION coordinates to movement
integer LINK_COLOR1 = 930;             // colour1
integer LINK_COLOR2 = 931;             // colour2
integer LINK_SEX = 932;                // sex
integer LINK_SHINE = 933;              // shine
integer LINK_GLOW = 934;               // glow
integer LINK_GEN = 935;                // generation
integer LINK_RESET_SIZE = 936;          // reset size to 1
integer LINK_MAGE = 940;                // xs_brain sends, xs_ager consumes, adds str to age, if older than 7 days, will grow the animal
integer LINK_DAYTIME = 941;             // xs_ager consumes, starts a timer of 86,400 seconds in xs_ager
integer LINK_GET_AGE = 942;             // get age from xs_ager and sent it on channel 943
integer LINK_PUT_AGE = 943;             // print age from xs_ager
integer LINK_PACKAGE = 950;             // look for a cryo_crate
integer LINK_SEEK_FEMALE = 960;         // MALE_BREED_CALL
integer LINK_MALE_BREED_CALL = 961;     // triggered by LINK_SEEK_FEMALE
integer LINK_SIGNAL_ELIGIBLE = 962;     // sent by female when hears LINK_MALE_BREED_CALL
integer LINK_FEMALE_ELIGIBLE = 963;     // sent when it hears in chat FEMALE_ELIGIBLE
integer LINK_CALL_MALE = 964;           // if LINK_FEMALE_ELIGIBLE && looking_for_female
integer LINK_MALE_ON_THE_WAY = 965;     // triggered by LINK_CALL_MALE
integer LINK_FEMALE_LOCATION = 966;     // female location, sends coordinates of a female
integer LINK_RQST_BREED  = 967;         // sent when close enough to male/female
integer LINK_CALL_MALE_INFO = 968;      // sent by xs_breeding, this line of code was in error in v.24 of xs_breeding see line 557 and 636 of xs_brain which make calls and also xs_breeding which receives LINK_MALE_INFO.
integer LINK_MALE_INFO = 969;
integer LINK_LAY_EGG = 970;             // llRezObject("XS Egg"
integer LINK_BREED_FAIL = 971;          // key = father, failed, timed out
integer LINK_PREGNANT = 972;            // chick is preggers
integer LINK_SOUND_OFF= 974;             // sound is off
integer LINK_SOUND_ON= 973;             // sound is on
integer LINK_SLEEPING = 990;            // close eyes 
integer LINK_UNSLEEPING = 991;          // open eyes
integer LINK_SOUND = 1001;              // plays a sound if enabled
integer LINK_SPECIAL = 1010;            // xs_special, is str = "Normal", removes script
integer LINK_PREGNANCY_TIME = 5000;    // in seconds as str
integer LINK_SLEEP = 7999;              // disable sleep by parameter
integer LINK_TIMER = 8000;              // scan for food bowl about every 1800 seconds
integer LINK_DIE = 9999;                // death


///////// end global Link constants ////////


///////////// END OF COPIED CODE ////////////

////////////////////////////////////////////////////////////////////

// DON'T CHANGE THE FOLLOWING! (Unless you know what you are doing!)

integer XTEA_DELTA      = 0x9E3779B9; // (sqrt(5) - 1) * 2^31
integer xtea_num_rounds = 6;
list    xtea_key        = [0, 0, 0, 0];

integer hex2int(string hex) {
	if(llGetSubString(hex,0,1) == "0x")
		return (integer)hex;
	if(llGetSubString(hex,0,0) == "x")
		return (integer)("0"+hex);
	return(integer)("0x"+hex);
}


// Convers any string to a 32 char MD5 string and then to a list of
// 4 * 32 bit integers = 128 bit Key. MD5 ensures always a specific
// 128 bit key is generated for any string passed.
list xtea_key_from_string( string str )
{
	str = llMD5String(str,0); // Use Nonce = 0
	return [    hex2int(llGetSubString(  str,  0,  7)),
		hex2int(llGetSubString(  str,  8,  15)),
		hex2int(llGetSubString(  str,  16,  23)),
		hex2int(llGetSubString(  str,  24,  31))];
}

// Encipher two integers and return the result as a 12-byte string
// containing two base64-encoded integers.
string xtea_encipher( integer v0, integer v1 )
{
	integer num_rounds = xtea_num_rounds;
	integer sum = 0;
	do {
		// LSL does not have unsigned integers, so when shifting right we
		// have to mask out sign-extension bits.
		v0  += (((v1 << 4) ^ ((v1 >> 5) & 0x07FFFFFF)) + v1) ^ (sum + llList2Integer(xtea_key, sum & 3));
		sum +=  XTEA_DELTA;
		v1  += (((v0 << 4) ^ ((v0 >> 5) & 0x07FFFFFF)) + v0) ^ (sum + llList2Integer(xtea_key, (sum >> 11) & 3));

	} while( num_rounds = ~-num_rounds );
	//return only first 6 chars to remove "=="'s and compact encrypted text.
	return llGetSubString(llIntegerToBase64(v0),0,5) +
		llGetSubString(llIntegerToBase64(v1),0,5);
}

// Decipher two base64-encoded integers and return the FIRST 30 BITS of
// each as one 10-byte base64-encoded string.
string xtea_decipher( integer v0, integer v1 )
{
	integer num_rounds = xtea_num_rounds;
	integer sum = XTEA_DELTA*xtea_num_rounds;
	do {
		// LSL does not have unsigned integers, so when shifting right we
		// have to mask out sign-extension bits.
		v1  -= (((v0 << 4) ^ ((v0 >> 5) & 0x07FFFFFF)) + v0) ^ (sum + llList2Integer(xtea_key, (sum>>11) & 3));
		sum -= XTEA_DELTA;
		v0  -= (((v1 << 4) ^ ((v1 >> 5) & 0x07FFFFFF)) + v1) ^ (sum + llList2Integer(xtea_key, sum  & 3));
	} while ( num_rounds = ~-num_rounds );

	return llGetSubString(llIntegerToBase64(v0), 0, 4) +
		llGetSubString(llIntegerToBase64(v1), 0, 4);
}

// Encrypt a full string using XTEA.
string xtea_encrypt_string( string str )
{
	if (! ENCRYPT)
		return str;
	// encode string
	str = llStringToBase64(str);
	// remove trailing =s so we can do our own 0 padding
	integer i = llSubStringIndex( str, "=" );
	if ( i != -1 )
		str = llDeleteSubString( str, i, -1 );

	// we don't want to process padding, so get length before adding it
	integer len = llStringLength(str);

	// zero pad
	str += "AAAAAAAAAA=";

	string result;
	i = 0;

	do {
		// encipher 30 (5*6) bits at a time.
		result += xtea_encipher(llBase64ToInteger(llGetSubString(str,   i, i + 4) + "A="), llBase64ToInteger(llGetSubString(str, i+5, i + 9) + "A="));
		i+=10;
	} while ( i < len );

	return result;
}

// Decrypt a full string using XTEA
string xtea_decrypt_string( string str ) {
	if (! ENCRYPT)
		return str;
	integer len = llStringLength(str);
	integer i=0;
	string result;
	//llOwnerSay(str);
	do {
		integer v0;
		integer v1;

		v0 = llBase64ToInteger(llGetSubString(str,   i, i + 5) + "==");
		i+= 6;
		v1 = llBase64ToInteger(llGetSubString(str,   i, i + 5) + "==");
		i+= 6;

		result += xtea_decipher(v0, v1);
	} while ( i < len );

	// Replace multiple trailing zeroes with a single one

	i = llStringLength(result) - 1;
	while ( llGetSubString(result, i - 1, i) == "AA" ){
		result = llDeleteSubString(result, i, i);
		i--;
	}
	i = llStringLength(result) - 1;
	//    while (llGetSubString(result, i, i + 1) == "A" ) {
	//        i--;
	//    }
	result = llGetSubString(result, 0, i+1);
	i = llStringLength(result);
	integer mod = i%4; //Depending on encoded length diffrent appends are needed
	if(mod == 1) result += "A==";
	else if(mod == 2 ) result += "==";
	else if(mod == 3) result += "=";

	return llBase64ToString(result);
}

string base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";


// code begins

string SPECIAL = "Normal";

/// tunables:
vector  Position = <0.0, 0.0, 0.25>; // how far above the egg to rez the Animal.
vector  Rot = <0,0,0>;   // the rotation of the animal when rezzed

// breedable params
vector colour1;
vector colour2;
integer sex;
integer gen;
integer shine;
float glow;

// globals
integer api_listener;        // holds the API listener id so we can remove it
integer locked;              // only hear 1 PONG from a crate
integer born_hatched;        // currently unused
integer owner_touch;         // flag set when ower has touched the prim

integer menu_listener;

// allow either a UUID to be entered, or not, and still maintain security
integer CheckPerms()
{
	if (YOUR_UUID != "" && llGetOwner() != YOUR_UUID)
		return 1;

	if (llGetOwner() != llGetCreator())
		return 1;

	return 0;
}


set_colours(vector c1, vector c2, integer shine, float glow)
{
	// set the root prim ( the egg top), skip the base, and then do the egg bottom half
	// Link order is top Egg half, Base, then bottom of the egg half
	llSetPrimitiveParams([PRIM_COLOR, ALL_SIDES, c2, 1.0, PRIM_BUMP_SHINY, ALL_SIDES, shine, PRIM_BUMP_NONE, PRIM_GLOW, ALL_SIDES, glow]);
	llSetLinkPrimitiveParams(2, [PRIM_COLOR, ALL_SIDES, c1, 1.0, PRIM_BUMP_SHINY, ALL_SIDES, shine, PRIM_BUMP_NONE, PRIM_GLOW, ALL_SIDES, glow]);
}

say_details()
{

	string myshine;

	if (shine == 0) {
		myshine = "None";
	} else
	if (shine == 1) {
		myshine = "Low";
	} else
	if (shine == 2) {
		myshine = "Medium";
	} else
	if (shine == 3) {
		myshine = "High";
	}

	llWhisper(0, "Color: " + (string)colour1);
	llWhisper(0, "Color: " + (string)colour2);
	llWhisper(0, "Shine: " + myshine);
	llWhisper(0, "Glow: " + (string)((integer)(glow * 100)) + "%");
	llWhisper(0, "Special: " + SPECIAL);
	llWhisper(0, "Generation: " + (string)gen);
	llSay(API_CHANNEL, "XSQuail^" + (string)llGetKey() + "^" + (string)colour1 + "^" + (string)colour2 + "^" + (string)shine + "^" + (string)glow + "^" + SPECIAL + "^" + (string)gen + "^XSQuailEnd");
}

default
{
	state_entry()
	{
		llSetText("", <1,1,1>, 1.0);
		llSetColor(<1,1,1>, ALL_SIDES);
		llSetLinkColor(2, <1,1,1>, ALL_SIDES);        // white egg
		llParticleSystem([]);
		xtea_key = xtea_key_from_string(SECRET_PASSWORD);
	}

	changed(integer change) {
		if (change & CHANGED_ALLOWED_DROP) {
			if (llGetInventoryType(Animal) != INVENTORY_NONE && llGetInventoryType(Egg) != INVENTORY_NONE) {
				llAllowInventoryDrop(FALSE);
			}
		}
	}

	on_rez(integer param)
	{
		llSetText("Rezzing...", <1,0,0>, 1.0);

		llSleep(5.0);

		if (param == 0) {
			if (! CheckPerms() ) {
				integer colour = (integer)llFrand(9.0) + 1;
				if (colour == 1) {
					colour1 = <1,0,0>;
					colour2 = <1,0,0>;
				} else
				if (colour == 2) {
					colour1 = <1,0,0>;
					colour2 = <0,1,0>;
				} else
				if (colour == 3) {
					colour1 = <1,0,0>;
					colour2 = <0,0,1>;
				} else
				if (colour == 4) {
					colour1 = <0,1,0>;
					colour2 = <1,0,0>;
				} else
				if (colour == 5) {
					colour1 = <0,1,0>;
					colour2 = <0,1,0>;
				} else
				if (colour == 6) {
					colour1 = <0,1,0>;
					colour2 = <0,0,1>;
				} else
				if (colour == 7) {
					colour1 = <0,0,1>;
					colour2 = <1,0,0>;
				} else
				if (colour == 8) {
					colour1 = <0,0,1>;
					colour2 = <0,1,0>;
				} else
				if (colour == 9) {
					colour1 = <0,0,1>;
					colour2 = <0,0,1>;
				}


				set_colours(colour1, colour2, shine, glow);
				state rezzed;
			} else {
					llWhisper(0, "Oh no! This " + Egg + " was broken in your inventory! Please use an " + Egg + " container next time.");
				state dead;
			}
		} else
		if (param == SECRET_NUMBER) {
			menu_listener = llListen(EGG_CHANNEL, "", "", "");
			if ( CheckPerms() ) {
				llAllowInventoryDrop(TRUE);
			}
			llSay(ANIMAL_CHANNEL, xtea_encrypt_string("XSPET^EGG_READY^" + (string)llGetKey() + "^SMILE"));
			llSay(BOX_CHANNEL, xtea_encrypt_string("XSPET^" + (string)llGetKey() + "^EGG_READY^SMILE"));
		}
	}
	listen(integer channel, string sender, key id, string msg) {
		list data = llParseString2List(xtea_decrypt_string(msg), ["^"], []);
		if (llList2String(data, 0) == "XSPET" && llList2Key(data, 1) == llGetKey()) {
			if (llList2String(data, 2) == "UNBOX") {
				colour1 = (vector)llList2String(data, 3);
				colour2 = (vector)llList2String(data, 4);

				gen = llList2Integer(data,5);
				shine = llList2Integer(data, 6);
				glow = llList2Float(data, 7);
				SPECIAL = llList2String(data, 8);

				llListenRemove(menu_listener);

				set_colours(colour1, colour2, shine, glow);

				state rezzed;
			} else
			if (llList2String(data, 2) == "BORN") {
				vector fcolour1 = (vector)llList2String(data, 3);
				vector fcolour2 = (vector)llList2String(data, 4);

				integer fgen = llList2Integer(data,5);
				integer fshine = llList2Integer(data, 6);
				float fglow = llList2Float(data, 7);
				integer fglow_gene = llList2Integer(data, 8);

				vector mcolour1 = (vector)llList2String(data, 9);
				vector mcolour2 = (vector)llList2String(data, 10);

				integer mgen = llList2Integer(data, 11);
				integer mshine = llList2Integer(data, 12);
				float mglow = llList2Float(data, 13);
				integer mglow_gene = llList2Integer(data, 14);

				integer mix = (integer)llFrand(2) + 1;

				float deviation1 = (llFrand(10) - 5) / 100;
				float deviation2 = (llFrand(10) - 5) / 100;

				if (mix == 1) {
					colour1.x = (fcolour1.x / 2 + mcolour1.x / 2) + deviation1;
					colour1.y = (fcolour1.y / 2 + mcolour1.y / 2) + deviation1;
					colour1.z = (fcolour1.z / 2 + mcolour1.z / 2) + deviation1;

					colour2.x = (fcolour2.x / 2 + mcolour2.x / 2) + deviation2;
					colour2.y = (fcolour2.y / 2 + mcolour2.y / 2) + deviation2;
					colour2.z = (fcolour2.z / 2 + mcolour2.z / 2) + deviation2;

				} else {
						colour1.x = (fcolour1.x / 2 + mcolour2.x / 2) + deviation1;
					colour1.y = (fcolour1.y / 2 + mcolour2.y / 2) + deviation1;
					colour1.z = (fcolour1.z / 2 + mcolour2.z / 2) + deviation1;

					colour2.x = (fcolour2.x / 2 + mcolour1.x / 2) + deviation2;
					colour2.y = (fcolour2.y / 2 + mcolour1.y / 2) + deviation2;
					colour2.z = (fcolour2.z / 2 + mcolour1.z / 2) + deviation2;
				}

				if (colour1.x < 0)
					colour1.x = 0;

				if (colour1.x > 1)
					colour1.x = 1;

				if (colour1.y < 0)
					colour1.y = 0;

				if (colour1.y > 1)
					colour1.y = 1;

				if (colour1.z < 0)
					colour1.z = 0;

				if (colour1.z > 1)
					colour1.z = 1;

				if (colour2.x < 0)
					colour2.x = 0;

				if (colour2.x > 1)
					colour2.x = 1;

				if (colour2.y < 0)
					colour2.y = 0;

				if (colour2.y > 1)
					colour2.y = 1;

				if (colour2.z < 0)
					colour2.z = 0;

				if (colour2.z > 1)
					colour2.z = 1;


				if (mgen > fgen) {
					gen = mgen + 1;
				} else {
						gen = fgen + 1;
				}

				// TODO: shine / glow
				shine = 0;
				if (gen > 2) {
					integer pos = (integer)llFrand(100) + 1;
					if (fshine == mshine && fshine > 0) {
						if (pos < 25) {
							shine = fshine + 1;
							if (shine > 3) {
								shine = 3;
							}
						}
					} else {
							if (pos < 10) {
								// increase shine
								if (mshine > fshine) {
									shine = mshine + 1;
								} else
								if (fshine > mshine) {
									shine = fshine + 1;
								} else {
										shine = 1;
								}
								if (shine > 3) {
									shine = 3;
								}
							}
					}
				}
				glow = 0.0;

				if (mglow <= 0.3 && fglow <= 0.3) {
					if (mglow > fglow) {
						glow = mglow - 0.1;
					} else if (fglow > mglow) {
							glow = fglow - 0.1;
					}
				}

				if (fglow_gene >= 10 && mglow_gene >= 10) {
					integer poss = (integer)llFrand(100) + 1;
					if (poss < 25) {
						glow = 0.3;
					}
				} else if (fglow_gene >= 10 || mglow_gene >= 10) {
						integer poss = (integer)llFrand(100) + 1;
					if (poss < 10) {
						glow = 0.3;
					}
				}

				llListenRemove(menu_listener);
				born_hatched = 1;
				set_colours(colour1, colour2, shine, glow);
				llSetTimerEvent(1.0);
			}
		}
	}
	timer() {
		if (llGetInventoryType(Animal) != INVENTORY_NONE && llGetInventoryType(Egg) != INVENTORY_NONE) {
			state rezzed;
		}
	}
}

state rezzed
{
	on_rez(integer param)
	{
		if (CheckPerms()) {
			llWhisper(0, "Oh no! This " + Egg + " was broken in your inventory! Please use an " + Egg + " cotainer next time.");
			state dead;
		}
	}

	state_entry()
	{
		if (SPECIAL == "Normal") {
			llSetText("", <1,1,1>, 1.0);
		} else {
				llSetText(SPECIAL, <1,1,1>, 1.0);
		}
		api_listener = llListen(API_CHANNEL, "", "", "");
	}

	touch_start(integer num)
	{
		owner_touch = 0;
		say_details();

		if (llDetectedKey(0) == llGetOwner()) {
			owner_touch = 1;
			integer chan = (integer)llFrand(100000.0) + 1000;
			menu_listener = llListen(chan, "", llGetOwner(), "");
			llDialog(llGetOwner(), "I'm a " + Egg + ". What would you like to do with me?", ["Hatch", "Package", "Nothing"], chan);
		}
		llSetTimerEvent(30.0);
	}

	timer()
	{
		llSetTimerEvent(0);

		if (owner_touch == 1) {
			llOwnerSay("Menu timeout.");
			llListenRemove(menu_listener);
			owner_touch = 0;
		}
	}

	listen(integer channel, string sender, key id, string msg)
	{
		if (channel == API_CHANNEL) {
			list data = llParseString2List(msg, ["^"], []);
			if (llList2String(data, 0) == Animal && llList2Key(data, 1) == llGetKey()) {
				say_details();
			}
		} else {
				if (id == llGetOwner()) {
					llSetTimerEvent(0);
					llListenRemove(menu_listener);

					if (msg == "Hatch") {
						state hatching;
					} else
					if (msg == "Package") {
						state package;
					}
				}
		}
	}

	state_exit() {
		llListenRemove(api_listener);
	}
}

state hatching
{

	state_entry()
	{
		llRezObject(Animal, llGetPos() + Position, ZERO_VECTOR, llGetRot() * llEuler2Rot(Rot * DEG_TO_RAD) , SECRET_NUMBER);
	}

	object_rez(key id)
	{
		menu_listener = llListen(EGG_CHANNEL, "", id, "");
	}

	listen(integer channel, string sender, key id, string msg)
	{
		list decrypted = llParseString2List(xtea_decrypt_string(msg), ["^"], []);

		if (llList2String(decrypted, 0) == "XSPET" && llList2String(decrypted, 1) == "READY" && llList2String(decrypted, 2) == (string)id) {
			llGiveInventory(id, Animal);
			llGiveInventory(id, Egg);

			sex = (integer)llFrand(2) + 1;

			llSay(ANIMAL_CHANNEL, xtea_encrypt_string("XSPET^CONFIG^" + (string)id + "^" + (string)colour1 + "^" + (string)colour2 + "^" + (string)sex + "^" + (string)shine + "^" + (string)glow + "^" + (string)gen + "^0^0^" + Animal+ "^0^" + SPECIAL));
			llDie();
		}
	}
}

state package
{
	state_entry() {
		llSetTimerEvent(20.0);
		llWhisper(0, "Looking for an " + Egg + "  container...");
		menu_listener = llListen(EGG_CHANNEL, "", "", "");
		llSay(BOX_CHANNEL, xtea_encrypt_string("XSPET^" + (string)llGetKey() + "^CUP_PING^" + (string)VERSION));
	}
	timer()
	{
		llListenRemove(menu_listener);
		llSetTimerEvent(0);

		llWhisper(0, "No " + Egg + " container found.");
		state rezzed;
	}

	listen(integer channel, string sender, key id, string msg)
	{
		list data = llParseString2List(xtea_decrypt_string(msg), ["^"], []);
		if (llList2String(data, 0) == "XSPET" && llList2Key(data, 1) == llGetKey() && llList2String(data, 2) == "CUP_PONG" && llList2Float(data, 3) >= VERSION && locked == 0) {
			llSay(BOX_CHANNEL, xtea_encrypt_string("XSPET^" + (string)id + "^" + (string)colour1 + "^" + (string)colour2 + "^" + (string)shine + "^" + (string)glow + "^" + (string)gen + "^" + SPECIAL));
			locked = 1;
		} else
		if (llList2String(data, 0) == "XSPET" && llList2Key(data, 1) == llGetKey() && llList2String(data, 2) == "CUP_DIE") {
			llDie();
		}
	}
}

state dead
{
	state_entry()
	{
		llSetText("Broken " + Egg, <1,0,0>, 1.0);
	}
}

